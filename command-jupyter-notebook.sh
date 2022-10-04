#estabulish connection to the server
ssh -p 22022 xxx@andromeda.bc.edu #bc username
#option1: request a node(cpu)
srun --job-name=MyGPUInteractiveJob --nodes=1 --ntasks-per-node=24 --time=6:00:00 --mem=64gb --pty bash -I
#option2: request a node(GPU)
srun --job-name=WeiInteractiveTest --nodes=1 --ntasks-per-node=1 --time=03:00:00 --mem=128gb --partition=gpuv100 --pty bash -I
module load cuda-dcgm/2.2.9.1
module load cuda11.2/toolkit/11.2.2
module load cudnn8.1-cuda11.2/8.1.1.33
#load modules for jupyter notebook
module load anaconda/2020.07-p3.8
#open jupyter notebook
jupyter lab --no-browser --port=5678 --ip=xxx #same as the node number
ssh -p 22022 -CNL 5678:xxx:5678 xxx@andromeda.bc.edu
##Open up your browser (hope you're using Chrome) then type 'http://localhost:5678/'
##Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).

#create new environment
conda activate py37_dev