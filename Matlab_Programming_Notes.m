% Alex Walczak's Cheat Sheet for MATLAB programming.

% Function handle creation (lambda function):
f1 = @(x) x - sin(x);

% Function declaration (must be at end of file)
function y = fib(n)
% computes the nth fibonacci number
if n == 1 | n == 2
    y = 1;
else
    prev = 1;
    cur = 1;
    for i = 3:n
        cur = cur + prev;
        prev = cur - prev;
    end
    y = cur;
end
end