function [y, loc_filter]=getPeak(filtered_signal1,gate)
    [peaks, peak_locs] = findpeaks(filtered_signal1);
    
    mean_peaks=mean(peaks);
    loc_filter=[];
    for i=1:length(peak_locs)
        if(filtered_signal1(peak_locs(i))>gate*mean_peaks)
            loc_filter=[loc_filter;peak_locs(i)];
        end
    end
    
    y=filtered_signal1(loc_filter);
end