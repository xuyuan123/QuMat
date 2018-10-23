function S = entropy(P, Q)
%% calculate the entropy of mutual entropy a two matrices;
% S = -Tr(P*log(P)
% or S = Tr(P*log(P)) - Tr(P*log(Q))

	% Get dimension
	n = length(P);
	
	% Set a number we think is close enough to 0
	thresh = 1e-10;
		
	% check for error in shape
	if ~(sum(size(P)) == 2*n)
		error('Square input required');
	end

	if nargin == 1
		% Just compute the regular entropy
		
		% Find the eigenvalues
		p = eig(P);
		
		% Throw out the non-positive ones
		p = p(p>thresh);
		
		% Calculate shannon entropy of the positive eigenvalues
		S = -1*sum(p.*log2(p));
		
	elseif nargin == 2
		% We want the relative entropy
		
		% Check for dimension mismatches
		if sum(size(P)-size(Q)) > 0
			error('Dimension mismatch between P and Q');
		end
		
		% Get dimension
		n = length(P);
		
		% Find the eigenvalues/vectors
		[UP, p] = eig(P);
		[UQ, q] = eig(Q);
		p = diag(p);
		q = diag(q);
		
		% Create masks for 0 values
		pp = p>thresh;
		qq = q>thresh;
		
		% remove non-positive values, keeping length the same
		p = p.*pp;
		q = q.*qq;
		
		% Calculate part of trace(P*logQ), and then mask it
		s = p.'*(abs(UQ'*UP).^2);
		ss = (s>thresh);
		
		% In this case, we will be multiplying log0 by a finite number,
		% so the output will be infinity. Otherwise, everything should be
		% fine
		if sum(ss' & ~qq)
			warning('The kernel of Q is not in the kernel of P; outputting infinity');
			S = Inf;
			return;
		end
			
		
		% Calculate shannon entropy of the positive eigenvalues
		% That s*log2(q) = trace(P*logQ) is just an exercise in index
		% gymnastics
		S = sum(p(pp).*log2(p(pp))) - s*log2(q);
	end
		
end