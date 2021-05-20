Content-Type: multipart/mixed; boundary="===============2169071759799168438=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [kbuild] [kees:kspp/memcpy/next-20210519/v0 49/53] drivers/scsi/aha1740.c:271:19: warning: argument to 'sizeof' in '__builtin_memcpy' call is the same expression as the destination; did you mean to provide an explicit length?
Date: Thu, 20 May 2021 19:10:04 +0300
Message-ID: <202105202302.gsrA5hH3-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2169071759799168438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git  ksp=
p/memcpy/next-20210519/v0
head:   48fff7f29af65f2ab9e56bc71a0ef652f91a68cd
commit: 431fe12213302a60466170edda968b1ce84c9c16 [49/53] fortify: Detect st=
ruct member overflows in mem{cpy,move,set}()
config: i386-randconfig-c001-20210519 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/co=
mmit/?id=3D431fe12213302a60466170edda968b1ce84c9c16 =

        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git=
/kees/linux.git =

        git fetch --no-tags kees kspp/memcpy/next-20210519/v0
        git checkout 431fe12213302a60466170edda968b1ce84c9c16
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/string.h:3,
                    from include/linux/string.h:21,
                    from arch/x86/include/asm/page_32.h:35,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/blkdev.h:5,
                    from drivers/scsi/aha1740.c:40:
   drivers/scsi/aha1740.c: In function 'aha1740_intr_handle':
>> drivers/scsi/aha1740.c:271:19: warning: argument to 'sizeof' in '__built=
in_memcpy' call is the same expression as the destination; did you mean to =
provide an explicit length? [-Wsizeof-pointer-memaccess]
     271 |             sizeof(SCtmp->sense_buffer),
         |                   ^
   arch/x86/include/asm/string_32.h:182:48: note: in definition of macro 'm=
emcpy'
     182 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                                ^
   drivers/scsi/aha1740.c:270:5: note: in expansion of macro 'memcpy_and_pa=
d'
     270 |     memcpy_and_pad(SCtmp->sense_buffer,
         |     ^~~~~~~~~~~~~~

vim +271 drivers/scsi/aha1740.c

7d12e780e003f93 David Howells      2006-10-05  208  static irqreturn_t aha1=
740_intr_handle(int irq, void *dev_id)
^1da177e4c3f415 Linus Torvalds     2005-04-16  209  {
^1da177e4c3f415 Linus Torvalds     2005-04-16  210  	struct Scsi_Host *host=
 =3D (struct Scsi_Host *) dev_id;
91ebc1facd7797d Johannes Thumshirn 2018-06-13  211          void (*my_done)=
(struct scsi_cmnd *);
^1da177e4c3f415 Linus Torvalds     2005-04-16  212  	int errstatus, adapsta=
t;
^1da177e4c3f415 Linus Torvalds     2005-04-16  213  	int number_serviced;
^1da177e4c3f415 Linus Torvalds     2005-04-16  214  	struct ecb *ecbptr;
91ebc1facd7797d Johannes Thumshirn 2018-06-13  215  	struct scsi_cmnd *SCtm=
p;
^1da177e4c3f415 Linus Torvalds     2005-04-16  216  	unsigned int base;
^1da177e4c3f415 Linus Torvalds     2005-04-16  217  	unsigned long flags;
^1da177e4c3f415 Linus Torvalds     2005-04-16  218  	int handled =3D 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  219  	struct aha1740_sg *sgp=
tr;
^1da177e4c3f415 Linus Torvalds     2005-04-16  220  	struct eisa_device *ed=
ev;
^1da177e4c3f415 Linus Torvalds     2005-04-16  221  	=

^1da177e4c3f415 Linus Torvalds     2005-04-16  222  	if (!host)
^1da177e4c3f415 Linus Torvalds     2005-04-16  223  		panic("aha1740.c: Irq=
 from unknown host!\n");
^1da177e4c3f415 Linus Torvalds     2005-04-16  224  	spin_lock_irqsave(host=
->host_lock, flags);
^1da177e4c3f415 Linus Torvalds     2005-04-16  225  	base =3D host->io_port;
^1da177e4c3f415 Linus Torvalds     2005-04-16  226  	number_serviced =3D 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  227  	edev =3D HOSTDATA(host=
)->edev;
^1da177e4c3f415 Linus Torvalds     2005-04-16  228  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  229  	while(inb(G2STAT(base)=
) & G2STAT_INTPEND) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  230  		handled =3D 1;
^1da177e4c3f415 Linus Torvalds     2005-04-16  231  		DEB(printk("aha1740_i=
ntr top of loop.\n"));
^1da177e4c3f415 Linus Torvalds     2005-04-16  232  		adapstat =3D inb(G2IN=
TST(base));
^1da177e4c3f415 Linus Torvalds     2005-04-16  233  		ecbptr =3D ecb_dma_to=
_cpu (host, inl(MBOXIN0(base)));
^1da177e4c3f415 Linus Torvalds     2005-04-16  234  		outb(G2CNTRL_IRST,G2C=
NTRL(base)); /* interrupt reset */
^1da177e4c3f415 Linus Torvalds     2005-04-16  235        =

^1da177e4c3f415 Linus Torvalds     2005-04-16  236  		switch ( adapstat & G=
2INTST_MASK ) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  237  		case	G2INTST_CCBRETRY:
^1da177e4c3f415 Linus Torvalds     2005-04-16  238  		case	G2INTST_CCBERROR:
^1da177e4c3f415 Linus Torvalds     2005-04-16  239  		case	G2INTST_CCBGOOD:
^1da177e4c3f415 Linus Torvalds     2005-04-16  240  			/* Host Ready -> Mai=
lbox in complete */
^1da177e4c3f415 Linus Torvalds     2005-04-16  241  			outb(G2CNTRL_HRDY,G2=
CNTRL(base));
^1da177e4c3f415 Linus Torvalds     2005-04-16  242  			if (!ecbptr) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  243  				printk("Aha1740 nul=
l ecbptr in interrupt (%x,%x,%x,%d)\n",
^1da177e4c3f415 Linus Torvalds     2005-04-16  244  				       inb(G2STAT(b=
ase)),adapstat,
^1da177e4c3f415 Linus Torvalds     2005-04-16  245  				       inb(G2INTST(=
base)), number_serviced++);
^1da177e4c3f415 Linus Torvalds     2005-04-16  246  				continue;
^1da177e4c3f415 Linus Torvalds     2005-04-16  247  			}
^1da177e4c3f415 Linus Torvalds     2005-04-16  248  			SCtmp =3D ecbptr->SC=
pnt;
^1da177e4c3f415 Linus Torvalds     2005-04-16  249  			if (!SCtmp) {
^1da177e4c3f415 Linus Torvalds     2005-04-16  250  				printk("Aha1740 nul=
l SCtmp in interrupt (%x,%x,%x,%d)\n",
^1da177e4c3f415 Linus Torvalds     2005-04-16  251  				       inb(G2STAT(b=
ase)),adapstat,
^1da177e4c3f415 Linus Torvalds     2005-04-16  252  				       inb(G2INTST(=
base)), number_serviced++);
^1da177e4c3f415 Linus Torvalds     2005-04-16  253  				continue;
^1da177e4c3f415 Linus Torvalds     2005-04-16  254  			}
^1da177e4c3f415 Linus Torvalds     2005-04-16  255  			sgptr =3D (struct ah=
a1740_sg *) SCtmp->host_scribble;
c66cc13c16377d1 FUJITA Tomonori    2007-05-14  256  			scsi_dma_unmap(SCtmp=
);
^1da177e4c3f415 Linus Torvalds     2005-04-16  257  =

^1da177e4c3f415 Linus Torvalds     2005-04-16  258  			/* Free the sg block=
 */
^1da177e4c3f415 Linus Torvalds     2005-04-16  259  			dma_free_coherent (&=
edev->dev,
^1da177e4c3f415 Linus Torvalds     2005-04-16  260  					   sizeof (struct =
aha1740_sg),
^1da177e4c3f415 Linus Torvalds     2005-04-16  261  					   SCtmp->host_scr=
ibble,
^1da177e4c3f415 Linus Torvalds     2005-04-16  262  					   sgptr->sg_dma_a=
ddr);
^1da177e4c3f415 Linus Torvalds     2005-04-16  263  	    =

^1da177e4c3f415 Linus Torvalds     2005-04-16  264  			/* Fetch the sense d=
ata, and tuck it away, in
^1da177e4c3f415 Linus Torvalds     2005-04-16  265  			   the required slot=
.  The Adaptec
^1da177e4c3f415 Linus Torvalds     2005-04-16  266  			   automatically fet=
ches it, and there is no
^1da177e4c3f415 Linus Torvalds     2005-04-16  267  			   guarantee that we=
 will still have it in the
^1da177e4c3f415 Linus Torvalds     2005-04-16  268  			   cdb when we come =
back */
^1da177e4c3f415 Linus Torvalds     2005-04-16  269  			if ( (adapstat & G2I=
NTST_MASK) =3D=3D G2INTST_CCBERROR ) {
123445f622832f3 Kees Cook          2021-04-14  270  				memcpy_and_pad(SCtm=
p->sense_buffer,
123445f622832f3 Kees Cook          2021-04-14 @271  					       sizeof(SCtm=
p->sense_buffer),

I don't understand this warning, but SCtmp->sense_buffer is char pointer
so this can't be right.  It should probably be SCSI_SENSE_BUFFERSIZE
still.

123445f622832f3 Kees Cook          2021-04-14  272  					       ecbptr->sen=
se,
123445f622832f3 Kees Cook          2021-04-14  273  					       min(sizeof(=
SCtmp->sense_buffer),
123445f622832f3 Kees Cook          2021-04-14  274  						   sizeof(ecbptr-=
>sense)),
123445f622832f3 Kees Cook          2021-04-14  275  					       0);
^1da177e4c3f415 Linus Torvalds     2005-04-16  276  				errstatus =3D aha17=
40_makecode(ecbptr->sense,ecbptr->status);
^1da177e4c3f415 Linus Torvalds     2005-04-16  277  			} else
^1da177e4c3f415 Linus Torvalds     2005-04-16  278  				errstatus =3D 0;
^1da177e4c3f415 Linus Torvalds     2005-04-16  279  			DEB(if (errstatus)

regards,
dan carpenter

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org =


_______________________________________________
kbuild mailing list -- kbuild(a)lists.01.org
To unsubscribe send an email to kbuild-leave(a)lists.01.org

--===============2169071759799168438==--

