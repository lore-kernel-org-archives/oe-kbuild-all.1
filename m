Content-Type: multipart/mixed; boundary="===============1109153116372598574=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/scsi/ncr53c8xx.c:5306:9: sparse: sparse: cast truncates bits from constant value (58f becomes 8f)
Date: Sat, 16 May 2020 02:20:38 +0800
Message-ID: <202005160227.h6Ieqnmz%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1109153116372598574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   051e6b7e34b9bd24f46725f74994a4d3a653966e
commit: 06e85c7e9a1c1356038936566fc23f7c0d363b96 asm-generic: fix unistd_32=
.h generation format
date:   5 weeks ago
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 06e85c7e9a1c1356038936566fc23f7c0d363b96
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/scsi/ncr53c8xx.c:5306:9: sparse: sparse: cast truncates bits fro=
m constant value (58f becomes 8f)

vim +5306 drivers/scsi/ncr53c8xx.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  5243  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5244  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  5245  	**	Start at first entry.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5246  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  5247  	np->script0->done_pos[0] =
=3D cpu_to_scr(NCB_SCRIPTH_PHYS (np,done_queue));
^1da177e4c3f41 Linus Torvalds 2005-04-16  5248  	np->ccb_done_ic =3D MAX_DO=
NE-1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  5249  	np->scripth0->done_queue[5=
*(MAX_DONE-1) + 4] =3D
^1da177e4c3f41 Linus Torvalds 2005-04-16  5250  			cpu_to_scr(NCB_SCRIPT_PH=
YS (np, done_plug));
^1da177e4c3f41 Linus Torvalds 2005-04-16  5251  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5252  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  5253  	**	Wakeup all pending jobs.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5254  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  5255  	ncr_wakeup (np, code);
^1da177e4c3f41 Linus Torvalds 2005-04-16  5256  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5257  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  5258  	**	Init chip.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5259  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  5260  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5261  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  5262  	** Remove reset; big delay=
 because the 895 needs time for the
^1da177e4c3f41 Linus Torvalds 2005-04-16  5263  	** bus mode to settle
^1da177e4c3f41 Linus Torvalds 2005-04-16  5264  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  5265  	ncr_chip_reset(np, 2000);
^1da177e4c3f41 Linus Torvalds 2005-04-16  5266  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5267  	OUTB (nc_scntl0, np->rv_sc=
ntl0 | 0xc0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  5268  					/*  full arb., ena par=
ity, par->ATN  */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5269  	OUTB (nc_scntl1, 0x00);		/=
*  odd parity, and remove CRST!! */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5270  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5271  	ncr_selectclock(np, np->rv=
_scntl3);	/* Select SCSI clock */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5272  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5273  	OUTB (nc_scid  , RRE|np->m=
yaddr);	/* Adapter SCSI address */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5274  	OUTW (nc_respid, 1ul<<np->=
myaddr);	/* Id to respond to */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5275  	OUTB (nc_istat , SIGP	);		=
/*  Signal Process */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5276  	OUTB (nc_dmode , np->rv_dm=
ode);		/* Burst length, dma mode */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5277  	OUTB (nc_ctest5, np->rv_ct=
est5);	/* Large fifo + large burst */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5278  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5279  	OUTB (nc_dcntl , NOCOM|np-=
>rv_dcntl);	/* Protect SFBR */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5280  	OUTB (nc_ctest0, np->rv_ct=
est0);	/* 720: CDIS and EHP */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5281  	OUTB (nc_ctest3, np->rv_ct=
est3);	/* Write and invalidate */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5282  	OUTB (nc_ctest4, np->rv_ct=
est4);	/* Master parity checking */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5283  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5284  	OUTB (nc_stest2, EXT|np->r=
v_stest2);	/* Extended Sreq/Sack filtering */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5285  	OUTB (nc_stest3, TE);			/*=
 TolerANT enable */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5286  	OUTB (nc_stime0, 0x0c	);		=
/* HTH disabled  STO 0.25 sec */
^1da177e4c3f41 Linus Torvalds 2005-04-16  5287  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5288  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  5289  	**	Disable disconnects.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5290  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  5291  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5292  	np->disc =3D 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  5293  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5294  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  5295  	**    Enable GPIO0 pin for=
 writing if LED support.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5296  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  5297  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5298  	if (np->features & FE_LED0=
) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  5299  		OUTOFFB (nc_gpcntl, 0x01);
^1da177e4c3f41 Linus Torvalds 2005-04-16  5300  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  5301  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5302  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  5303  	**      enable ints
^1da177e4c3f41 Linus Torvalds 2005-04-16  5304  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  5305  =

^1da177e4c3f41 Linus Torvalds 2005-04-16 @5306  	OUTW (nc_sien , STO|HTH|MA=
|SGE|UDC|RST|PAR);
^1da177e4c3f41 Linus Torvalds 2005-04-16  5307  	OUTB (nc_dien , MDPE|BF|AB=
RT|SSI|SIR|IID);
^1da177e4c3f41 Linus Torvalds 2005-04-16  5308  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5309  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  5310  	**	Fill in target structur=
e.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5311  	**	Reinitialize usrsync.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5312  	**	Reinitialize usrwide.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5313  	**	Prepare sync negotiatio=
n according to actual SCSI bus mode.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5314  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  5315  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5316  	for (i=3D0;i<MAX_TARGET;i+=
+) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  5317  		struct tcb *tp =3D &np->t=
arget[i];
^1da177e4c3f41 Linus Torvalds 2005-04-16  5318  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5319  		tp->sval    =3D 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  5320  		tp->wval    =3D np->rv_sc=
ntl3;
^1da177e4c3f41 Linus Torvalds 2005-04-16  5321  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5322  		if (tp->usrsync !=3D 255)=
 {
^1da177e4c3f41 Linus Torvalds 2005-04-16  5323  			if (tp->usrsync <=3D np-=
>maxsync) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  5324  				if (tp->usrsync < np->m=
insync) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  5325  					tp->usrsync =3D np->mi=
nsync;
^1da177e4c3f41 Linus Torvalds 2005-04-16  5326  				}
^1da177e4c3f41 Linus Torvalds 2005-04-16  5327  			}
^1da177e4c3f41 Linus Torvalds 2005-04-16  5328  			else
^1da177e4c3f41 Linus Torvalds 2005-04-16  5329  				tp->usrsync =3D 255;
^1da177e4c3f41 Linus Torvalds 2005-04-16  5330  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  5331  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5332  		if (tp->usrwide > np->max=
wide)
^1da177e4c3f41 Linus Torvalds 2005-04-16  5333  			tp->usrwide =3D np->maxw=
ide;
^1da177e4c3f41 Linus Torvalds 2005-04-16  5334  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5335  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  5336  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  5337  	/*
^1da177e4c3f41 Linus Torvalds 2005-04-16  5338  	**    Start script process=
or.
^1da177e4c3f41 Linus Torvalds 2005-04-16  5339  	*/
^1da177e4c3f41 Linus Torvalds 2005-04-16  5340  	if (np->paddr2) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  5341  		if (bootverbose)
^1da177e4c3f41 Linus Torvalds 2005-04-16  5342  			printk ("%s: Downloading=
 SCSI SCRIPTS.\n",
^1da177e4c3f41 Linus Torvalds 2005-04-16  5343  				ncr_name(np));
^1da177e4c3f41 Linus Torvalds 2005-04-16  5344  		OUTL (nc_scratcha, vtobus=
(np->script0));
^1da177e4c3f41 Linus Torvalds 2005-04-16  5345  		OUTL_DSP (NCB_SCRIPTH_PHY=
S (np, start_ram));
^1da177e4c3f41 Linus Torvalds 2005-04-16  5346  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  5347  	else
^1da177e4c3f41 Linus Torvalds 2005-04-16  5348  		OUTL_DSP (NCB_SCRIPT_PHYS=
 (np, start));
^1da177e4c3f41 Linus Torvalds 2005-04-16  5349  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  5350  =


:::::: The code at line 5306 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1109153116372598574==--

