
function xdata = knn(xdata, vdata,k)

numofxdata = size(xdata,1);
numofvdata = size(vdata,1);

    for n=1:numofxdata

       % repmat: returns an array containing n copies of xdata
       % eculdian distance 
      

        A = sum((repmat(xdata(n,:),numofvdata,1)-vdata).^2,2);

        [dist, position] = sort(eD,'ascend');
        neighborIds=position(1:k);
        neighborDistances=dist(1:k);


        
        for i=1:k
            A(i) = vdata(neighborIds(i),2);  
        end
% mode: returns the sample mode of A , which is the most frequently occurring value in A .
        M = mode(A);

        if (M~=1)
            xdata(n,2) = mode(A);
        else 
            xdata(n,2) = vdata(neighborIds(1),2);
        end
    end
end
