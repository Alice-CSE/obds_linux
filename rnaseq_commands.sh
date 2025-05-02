#20250104 FastQC and MutliQC report of FastQC analysis on sample data from OBDS course Day 4 AM
load_mamba #alias for obds-rnaseq environment
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ fastqc --help 
#fastqc run on paired CD4 files
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ fastqc -t 2  cd4_rep1_read1.fastq.gz cd4_rep1_read2.fastq.gz --outdir /project/bras5846/linux/3_analysis/1_fastqc
#setup for multiqc reports
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ ls ../3_analysis/1_fastqc/
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ multiqc --help
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ ls ../3_analysis           
#new folder for reports
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ mkdir ../3_analysis/reports/
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ ls 
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ ls ../3_analysis
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/1_fastq$ cd ../3_analysis/1_fastqc 
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ pwd
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ ls .
#run multiqc on reports from fastqc
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ multiqc . --outdir ../reports
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ ls ../reports
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis/1_fastqc$ cd ..          
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis$ pwd
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis$ ls
#adding commands to this
(obds-rnaseq) bras5846@obds:/project/bras5846/linux/3_analysis$ nano rnaseq_commands.sh

#20250501 OBDS hisat2 via slurm commands
#/project/bras5846/linux/3_analysis$ mkdir 1_hisat2_slurm
#mv /project/bras5846/linux/3_analysis/1_hisat2_slurm/ /project/bras5846/linux/3_analysis/2_hisat2_slur
#bras5846@obds:/project/bras5846/linux/3_analysis/2_hisat2_slurm$
load_mamba
##contents of .sh file submitted to slurm
#!/bin/bash
#SBATCH --partition=cpu
#SBATCH --mail-type=END,FAIL
#SBATCH --mem=10G
#SBATCH --ntasks=8
#SBATCH --time=0-01:00:00
#SBATCH --output=%j_%x.out
#SBATCH --error=%j_%x.err
hisat2 --threads 8 \
   -x /project/shared/linux/5_rnaseq/hisat2_index/mm10 \
   -1 /project/bras5846/linux/1_fastq/cd4_rep1_read1.fastq.gz \
   -2 /project/bras5846/linux/1_fastq/cd4_rep1_read2.fastq.gz \
   --rna-strandness RF \
   --summary-file stats.txt \
   -S aln-pe.sam
##then submit to slurm
sbatch slurm_hisat.sh
#then watching
squeue
watch squeue --me
#once comepleted:
cat 132_slurm_hisat.sh.out
cat 132_slurm_hisat.sh.err 


##20250502 OBD linux day 5 Mapping QC and quantification (see slurm files for submitted jobs)
load_mamba
#set working direcotry to mapping QC
cd /project/bras5846/linux/3_analysis/3_MappingQC
#write  slurm mapping file
nano slurm_mappingqc.sh
#run converting SAM to BAM, indexing BAM, flagstat, idxstats
sbatch slurm_mappingqc.sh
#run multiqc to look at flagstat and idx stat outputs (could have also used picard)
multiqc.
#then switch to quantification directory
cd /project/bras5846/linux/3_analysis/4_Quantification
#write slurm  quantification file
nano slurm_quantification.sh
#then run the feature counts command
sbatch slurm_quantification.sh
#watch it 
squeue
watch squeue --me
#add it multiqc to check if has worked
multiqc .

#note as part of this we had to reload the gtf file as we indexed with grc38 not 39 and rerun the  quantification
cd /project/bras5846/linux/2_genome/GRC38
wget http://ftp.ensembl.org/pub/release-102/gtf/mus_musculus/Mus_musculus.GRCm38.102.gtf.gz

#then added slurm files and updated this rnaseq command files to git

#end of course!


