

function y = multi_gauss_pdf(x,mu,Sigma)
  %% x is a Dx1 vector
  %% mu is a Dx1 vector
  %% Sigma is a DxD matrix
  D = length(x)
  y = (1 / sqrt( (2*pi).^D * det(Sigma) ) * exp(-1/2 * mtimes( mtimes( transpose((x-mu)),inv(Sigma) ), (x-mu) )))

