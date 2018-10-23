function bloch_addstates(input_list)
%% input_list can be a list of states;
%  input_list can be expectaion matrix [<X>,<Y>,<Z>], where <X>,<Y>,<Z> are a column vector;

if isa(input_list,'cell')
expectX = expect(sigmax(),input_list);
expectY = expect(sigmay(),input_list);
expectZ = expect(sigmaz(),input_list);
markerColors = redblue(length(expectX));
scatter3(expectX,expectY,expectZ,50,markerColors,'filled');
elseif isa(input_list,'numeric')
expectX=input_list(:,1);
expectY=input_list(:,2);
expectZ=input_list(:,3);
markerColors = redblue(length(expectX));
scatter3(expectX,expectY,expectZ,50,markerColors,'filled');
end


end