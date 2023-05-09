fib = [0 1];

for i = 3:20
    fib(i) = fib(i-1) + fib(i-2);
end

disp(fib)