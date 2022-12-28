from Bio import SeqIO
import json
import random

def window_fuc(seq, window_size=6, move=1):
  start=0
  end=window_size
  length=len(seq)
  seq=str(seq)
  res=[]
  while length>= end:
      res.append(seq[start:end])
      start+=move
      end+=move
  return res
vocab=set()

with open("data.json") as f:
     recs = json.load(f)

for typ in ["train","test"]:
	out=open(typ+".txt","w")
	sample_ratio=recs[typ+"_sample_ratio"]
	for f_name in recs[typ]:
		for z,record in enumerate(SeqIO.parse(f_name[0],f_name[1])):
		  if random.random() < sample_ratio:
			  r=window_fuc(record.seq)
			  s=''
			  for i in r:
			    s=s+i+" "
			  s=s[:-1]
			  out.write(s+"\n")
	out.close()

