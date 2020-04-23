import os,sys,csv
import numpy as np
from random import randint,choice,randrange
from collections import defaultdict

def get_products():
	products = []
	with open("fakea_produkter.txt","r",encoding="utf-8") as f:
		for line in f:
			prod = line.strip()
			products.append(prod)
	return products

def get_furniture():
	furniture = {}
	with open("furniture.txt","r",encoding="utf-8") as f:
		for line in f:
			line = line.strip("\n")
			(fur,typ) = line.split("\t")
			if "chair" in typ:
				furniture[fur] = (10,100,typ)
			elif "bed" in typ:
				furniture[fur] = (70,270,typ)
			elif "rack" in typ:
				furniture[fur] = (5,50,typ)
			else:
				furniture[fur] = (10, randrange(20,200,10),typ)
	return furniture

def make_fakea(outfile):
	products = get_products()
	furniture = get_furniture()
	furns = [fur for fur in furniture if furniture[fur][2].strip() not in ["sofa", "chair"]]
	places = [fur for fur in furniture if furniture[fur][2].strip() in ["sofa","chair"]]
	with open(outfile,"w",encoding="utf-8") as f:
		f.write("Product,Type,Price,Category\n")
		for prod in products:
			if len(prod)<12 and prod!="":
				furn = choice(furns)
				if prod[0].isupper():
					furn = choice(places)
				(mini,maxi,cat) = furniture[furn]
				price = randrange(mini,maxi,10)-1
				f.write(",".join([prod,furn[0].upper()+furn[1:],str(price),cat])+"\n")

def main():
	make_fakea(sys.argv[1])

if __name__=="__main__":
	main()
