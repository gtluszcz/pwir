-module(zad).
-compile([export_all]).
-vsn(1.0).

% program
match(X)->X.

% wstaw({},I)-> {node,1,I,null,null};
% wstaw({node,N,V,L,P},I) when I<V,L/=null -> {node,N,V,wstaw(L,I),P};
% wstaw({node,N,V,L,P},I) when I>=V,P/=null -> {node,N,V,L,wstaw(P,I)};
% wstaw({node,N,V,null,P},I) when I<V -> {node,N,V,{node,N+1,I,null,null},P};
% wstaw({node,N,V,L,null},I) when I>=V -> {node,N,V,L,{node,N+1,I,null,null}}.

wstaw({},I)-> {node,I,null,null};
wstaw({node,V,L,P},I) when I<V -> {node,V,wstaw(L,I),P};
wstaw({node,V,L,P},I) when I>=V -> {node,V,L,wstaw(P,I)};
wstaw(null,I) -> {node,I,null,null}.