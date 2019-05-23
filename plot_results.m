function plot_results(t, xPlot, name)

n = size(xPlot, 1);

for i = 1:n
    subplot(n, 1, i)
    plot(t, xPlot(i, :))
    title(name{i})
end
% subplot(n+1, 1, n+1)
% plot(t, xPlot([1, 3], :))