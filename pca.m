function pca (numTruncated)
  subplot(2, 1, 1);
  img =  imread('cameraman.tif');
  imshow(img);
  img = double(img);

  xmean = mean(img, 2);

  covariance  = cov(img,1);
  
  [eigenVectors, eigenValues] = eig(covariance);
  
  eigenVectorsSorted = [];
  s =  size(eigenVectors,2);
  for x = 1 : size(eigenVectors,2)
      eigenVectorsSorted(:,x)=eigenVectors(:,s);
      s = s-1;     
  end
 
  newFv = bsxfun(@minus, img, xmean); 
  
  y = eigenVectorsSorted' * newFv;
 
  y((size(y,1) - numTruncated):size(y,1),  : ) = 0;
  
  fv2 = eigenVectorsSorted * y;
  
  x = bsxfun(@plus, fv2, xmean);

   subplot(2, 1, 2);

   imshow(uint8(x));



end