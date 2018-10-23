function U = rotation(theta,operator)
% rotate along operator axis by theta angle

U = expm(-1i*theta/2*operator);


end