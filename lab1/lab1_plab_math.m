cr2p = @(x) [abs(x) atan2d(imag(x),real(x))];

syms vout2 v2 r;
eqns = [vout2/(-12.2e6j) + vout2/1e6 + vout2/(-1.57e6j) + vout2/r + (vout2-v2)/r == 0, (v2-1)/50 + v2/(-1.57e6j) + (v2-vout2)/r == 0];
solution = solve(eqns, [vout2, v2], 'ReturnConditions', true);

% fprintf('vout2: ');
solution.vout2
solution.v2;

% sprintf('vout2 solution: %f + %fi\n', solution.vout2, solution.vout2/1i);
% sprintf('v2 solution: %f + %fi\n', solution.v2, solution.v2/1i);

% cr2p(double(subs(solution.vout2, r, 10)));

fprintf('r=10 ohms-vout= %f + %fj\n', subs(solution.vout2, r, 10), subs(solution.vout2, r, 10)/1i);
fprintf('r=10k ohms-vout= %f + %fj\n', subs(solution.vout2, r, 10e3), subs(solution.vout2, r, 10e3)/1i);
fprintf('r=1M ohms-vout= %f + %fj\n', subs(solution.vout2, r, 1e6), subs(solution.vout2, r, 1e6)/1i);