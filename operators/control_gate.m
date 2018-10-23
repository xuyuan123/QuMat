function U = control_gate(gate)
%% return a 4X4 matrix represent the two qubit control-U gate;
U = blkdiag(qeye(2),gate);

end