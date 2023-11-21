function EEG = mybinica(EEG)

compicapath = which('run_compica.sh');

if isempty(compicapath)
    error('compica not found in MATLAB path!');
end

tempfile = [EEG.setname '_compica.mat'];
fprintf('Saving data to %s.\n',tempfile);
save(tempfile,'EEG');

disp('Running compica.');
system([compicapath ' ' matlabroot ' ' pwd '/' tempfile]);

fprintf('Loading ICA results from %s.\n',tempfile);
load(tempfile);

if exist('icaweights','var') && exist('icasphere','var')
    EEG.icaweights = icaweights;
    EEG.icasphere = icasphere;
    EEG.icawinv = pinv(EEG.icaweights*EEG.icasphere);
    EEG.icachansind = 1:EEG.nbchan;
else
    error('ICA results not found!');
end

delete(tempfile);
end


