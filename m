Content-Type: multipart/mixed; boundary="===============1730158835680713605=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set but not used
Date: Tue, 27 Oct 2020 19:19:07 +0800
Message-ID: <202010271956.lOGjlakw-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1730158835680713605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4525c8781ec0701ce824e8bd379ae1b129e26568
commit: 57aadb46bd634c7889403220dcd110c7ff2c4868 usb: musb: jz4740: Add sup=
port for DMA
date:   7 months ago
config: mips-randconfig-r022-20201027 (attached as .config)
compiler: mips-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D57aadb46bd634c7889403220dcd110c7ff2c4868
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 57aadb46bd634c7889403220dcd110c7ff2c4868
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
>> drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set but n=
ot used [-Wunused-but-set-variable]
     324 |     u8 devctl;
         |        ^~~~~~

vim +/devctl +324 drivers/usb/musb/musbhsdma.c

550a7375fe72092 Felipe Balbi    2008-07-24  265  =

edce61776c7e212 Min Guo         2020-01-15  266  irqreturn_t dma_controller=
_irq(int irq, void *private_data)
550a7375fe72092 Felipe Balbi    2008-07-24  267  {
458e6a511f9dc91 Felipe Balbi    2008-09-11  268  	struct musb_dma_controlle=
r *controller =3D private_data;
458e6a511f9dc91 Felipe Balbi    2008-09-11  269  	struct musb *musb =3D con=
troller->private_data;
458e6a511f9dc91 Felipe Balbi    2008-09-11  270  	struct musb_dma_channel *=
musb_channel;
458e6a511f9dc91 Felipe Balbi    2008-09-11  271  	struct dma_channel *chann=
el;
458e6a511f9dc91 Felipe Balbi    2008-09-11  272  =

458e6a511f9dc91 Felipe Balbi    2008-09-11  273  	void __iomem *mbase =3D c=
ontroller->base;
458e6a511f9dc91 Felipe Balbi    2008-09-11  274  =

550a7375fe72092 Felipe Balbi    2008-07-24  275  	irqreturn_t retval =3D IR=
Q_NONE;
458e6a511f9dc91 Felipe Balbi    2008-09-11  276  =

550a7375fe72092 Felipe Balbi    2008-07-24  277  	unsigned long flags;
550a7375fe72092 Felipe Balbi    2008-07-24  278  =

458e6a511f9dc91 Felipe Balbi    2008-09-11  279  	u8 bchannel;
458e6a511f9dc91 Felipe Balbi    2008-09-11  280  	u8 int_hsdma;
458e6a511f9dc91 Felipe Balbi    2008-09-11  281  =

f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  282  	u32 addr, count;
458e6a511f9dc91 Felipe Balbi    2008-09-11  283  	u16 csr;
458e6a511f9dc91 Felipe Balbi    2008-09-11  284  =

550a7375fe72092 Felipe Balbi    2008-07-24  285  	spin_lock_irqsave(&musb->=
lock, flags);
550a7375fe72092 Felipe Balbi    2008-07-24  286  =

9c93d7fd464e7aa Min Guo         2020-01-15  287  	int_hsdma =3D musb_clearb=
(mbase, MUSB_HSDMA_INTR);
550a7375fe72092 Felipe Balbi    2008-07-24  288  =

f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  289  	if (!int_hsdma) {
b99d3659b309b35 Bin Liu         2016-06-30  290  		musb_dbg(musb, "spurious=
 DMA irq");
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  291  =

f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  292  		for (bchannel =3D 0; bch=
annel < MUSB_HSDMA_CHANNELS; bchannel++) {
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  293  			musb_channel =3D (struc=
t musb_dma_channel *)
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  294  					&(controller->channel=
[bchannel]);
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  295  			channel =3D &musb_chann=
el->channel;
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  296  			if (channel->status =3D=
=3D MUSB_DMA_STATUS_BUSY) {
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  297  				count =3D musb_read_hs=
dma_count(mbase, bchannel);
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  298  =

f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  299  				if (count =3D=3D 0)
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  300  					int_hsdma |=3D (1 << =
bchannel);
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  301  			}
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  302  		}
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  303  =

b99d3659b309b35 Bin Liu         2016-06-30  304  		musb_dbg(musb, "int_hsdm=
a =3D 0x%x", int_hsdma);
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  305  =

f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  306  		if (!int_hsdma)
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  307  			goto done;
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  308  	}
f933a0c0fe0ea5f Anand Gadiyar   2009-12-28  309  =

458e6a511f9dc91 Felipe Balbi    2008-09-11  310  	for (bchannel =3D 0; bcha=
nnel < MUSB_HSDMA_CHANNELS; bchannel++) {
458e6a511f9dc91 Felipe Balbi    2008-09-11  311  		if (int_hsdma & (1 << bc=
hannel)) {
458e6a511f9dc91 Felipe Balbi    2008-09-11  312  			musb_channel =3D (struc=
t musb_dma_channel *)
458e6a511f9dc91 Felipe Balbi    2008-09-11  313  					&(controller->channel=
[bchannel]);
458e6a511f9dc91 Felipe Balbi    2008-09-11  314  			channel =3D &musb_chann=
el->channel;
550a7375fe72092 Felipe Balbi    2008-07-24  315  =

550a7375fe72092 Felipe Balbi    2008-07-24  316  			csr =3D musb_readw(mbas=
e,
458e6a511f9dc91 Felipe Balbi    2008-09-11  317  					MUSB_HSDMA_CHANNEL_OF=
FSET(bchannel,
550a7375fe72092 Felipe Balbi    2008-07-24  318  							MUSB_HSDMA_CONTROL)=
);
550a7375fe72092 Felipe Balbi    2008-07-24  319  =

458e6a511f9dc91 Felipe Balbi    2008-09-11  320  			if (csr & (1 << MUSB_HS=
DMA_BUSERROR_SHIFT)) {
458e6a511f9dc91 Felipe Balbi    2008-09-11  321  				musb_channel->channel.=
status =3D
550a7375fe72092 Felipe Balbi    2008-07-24  322  					MUSB_DMA_STATUS_BUS_A=
BORT;
458e6a511f9dc91 Felipe Balbi    2008-09-11  323  			} else {
550a7375fe72092 Felipe Balbi    2008-07-24 @324  				u8 devctl;
550a7375fe72092 Felipe Balbi    2008-07-24  325  =

6995eb68aab70e7 Bryan Wu        2008-12-02  326  				addr =3D musb_read_hsd=
ma_addr(mbase,
6995eb68aab70e7 Bryan Wu        2008-12-02  327  						bchannel);
458e6a511f9dc91 Felipe Balbi    2008-09-11  328  				channel->actual_len =
=3D addr
458e6a511f9dc91 Felipe Balbi    2008-09-11  329  					- musb_channel->start=
_addr;
550a7375fe72092 Felipe Balbi    2008-07-24  330  =

b99d3659b309b35 Bin Liu         2016-06-30  331  				musb_dbg(musb, "ch %p,=
 0x%x -> 0x%x (%zu / %d) %s",
458e6a511f9dc91 Felipe Balbi    2008-09-11  332  					channel, musb_channel=
->start_addr,
458e6a511f9dc91 Felipe Balbi    2008-09-11  333  					addr, channel->actual=
_len,
458e6a511f9dc91 Felipe Balbi    2008-09-11  334  					musb_channel->len,
458e6a511f9dc91 Felipe Balbi    2008-09-11  335  					(channel->actual_len
458e6a511f9dc91 Felipe Balbi    2008-09-11  336  						< musb_channel->len)=
 ?
550a7375fe72092 Felipe Balbi    2008-07-24  337  					"=3D> reconfig 0" : "=
=3D> complete");
550a7375fe72092 Felipe Balbi    2008-07-24  338  =

550a7375fe72092 Felipe Balbi    2008-07-24  339  				devctl =3D musb_readb(=
mbase, MUSB_DEVCTL);
550a7375fe72092 Felipe Balbi    2008-07-24  340  =

458e6a511f9dc91 Felipe Balbi    2008-09-11  341  				channel->status =3D MU=
SB_DMA_STATUS_FREE;
550a7375fe72092 Felipe Balbi    2008-07-24  342  =

550a7375fe72092 Felipe Balbi    2008-07-24  343  				/* completed */
c418fd6c01fbc55 Paul Elder      2019-01-30  344  				if (musb_channel->tran=
smit &&
c418fd6c01fbc55 Paul Elder      2019-01-30  345  					(!channel->desired_mo=
de ||
c418fd6c01fbc55 Paul Elder      2019-01-30  346  					(channel->actual_len %
c418fd6c01fbc55 Paul Elder      2019-01-30  347  					    musb_channel->max=
_packet_sz))) {
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  348  					u8  epnum  =3D musb_c=
hannel->epnum;
d026e9c76aac363 Tony Lindgren   2014-11-24  349  					int offset =3D musb->=
io.ep_offset(epnum,
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  350  								    MUSB_TXCSR);
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  351  					u16 txcsr;
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  352  =

b6e434a5404b9ce Sergei Shtylyov 2009-03-26  353  					/*
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  354  					 * The programming gu=
ide says that we
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  355  					 * must clear DMAENAB=
 before DMAMODE.
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  356  					 */
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  357  					musb_ep_select(mbase,=
 epnum);
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  358  					txcsr =3D musb_readw(=
mbase, offset);
c418fd6c01fbc55 Paul Elder      2019-01-30  359  					if (channel->desired_=
mode =3D=3D 1) {
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  360  						txcsr &=3D ~(MUSB_TX=
CSR_DMAENAB
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  361  							| MUSB_TXCSR_AUTOSE=
T);
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  362  						musb_writew(mbase, o=
ffset, txcsr);
550a7375fe72092 Felipe Balbi    2008-07-24  363  						/* Send out the pack=
et */
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  364  						txcsr &=3D ~MUSB_TXC=
SR_DMAMODE;
c418fd6c01fbc55 Paul Elder      2019-01-30  365  						txcsr |=3D MUSB_TXCS=
R_DMAENAB;
c418fd6c01fbc55 Paul Elder      2019-01-30  366  					}
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  367  					txcsr |=3D  MUSB_TXCS=
R_TXPKTRDY;
b6e434a5404b9ce Sergei Shtylyov 2009-03-26  368  					musb_writew(mbase, of=
fset, txcsr);
458e6a511f9dc91 Felipe Balbi    2008-09-11  369  				}
c7bbc056a92476b Sergei Shtylyov 2009-03-26  370  				musb_dma_completion(mu=
sb, musb_channel->epnum,
c7bbc056a92476b Sergei Shtylyov 2009-03-26  371  						    musb_channel->tr=
ansmit);
550a7375fe72092 Felipe Balbi    2008-07-24  372  			}
550a7375fe72092 Felipe Balbi    2008-07-24  373  		}
550a7375fe72092 Felipe Balbi    2008-07-24  374  	}
6995eb68aab70e7 Bryan Wu        2008-12-02  375  =

550a7375fe72092 Felipe Balbi    2008-07-24  376  	retval =3D IRQ_HANDLED;
550a7375fe72092 Felipe Balbi    2008-07-24  377  done:
550a7375fe72092 Felipe Balbi    2008-07-24  378  	spin_unlock_irqrestore(&m=
usb->lock, flags);
550a7375fe72092 Felipe Balbi    2008-07-24  379  	return retval;
550a7375fe72092 Felipe Balbi    2008-07-24  380  }
edce61776c7e212 Min Guo         2020-01-15  381  EXPORT_SYMBOL_GPL(dma_cont=
roller_irq);
550a7375fe72092 Felipe Balbi    2008-07-24  382  =


:::::: The code at line 324 was first introduced by commit
:::::: 550a7375fe720924241f0eb76e4a5c1a3eb8c32f USB: Add MUSB and TUSB supp=
ort

:::::: TO: Felipe Balbi <felipe.balbi@nokia.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1730158835680713605==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
nDPWbQEA
--===============1730158835680713605==--

