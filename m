Content-Type: multipart/mixed; boundary="===============9204274074017392043=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers/usb/cdns3/drd.c:332:17: sparse: sparse: too many warnings
Date: Mon, 18 May 2020 21:22:37 +0800
Message-ID: <202005182134.F6Wme8zd%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9204274074017392043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
commit: 70d8b9e5e63d212019ba3f6823c8ec3d2df87645 usb: cdns3: make signed 1 =
bit bitfields unsigned
date:   8 weeks ago
config: arc-randconfig-s001-20200518 (attached as .config)
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-193-gb8fad4bc-dirty
        git checkout 70d8b9e5e63d212019ba3f6823c8ec3d2df87645
        # save the attached .config to linux build tree
        make C=3D1 ARCH=3Darc CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/usb/cdns3/drd.c:182:23: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:182:23: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:182:23: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:182:23: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:195:17: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@    expected void volatile [noderef] <asn=
:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:195:17: sparse:    expected void volatile [noder=
ef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:195:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:219:9: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@    expected void volatile [noderef] <asn:=
2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:219:9: sparse:    expected void volatile [nodere=
f] <asn:2> *addr
   drivers/usb/cdns3/drd.c:219:9: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:303:9: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@    expected void volatile [noderef] <asn:=
2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:303:9: sparse:    expected void volatile [nodere=
f] <asn:2> *addr
   drivers/usb/cdns3/drd.c:303:9: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:326:27: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@    expected struct cdns3_otg_legacy_regs=
 *otg_v0_regs @@    got void struct cdns3_otg_legacy_regs *otg_v0_regs @@
   drivers/usb/cdns3/drd.c:326:27: sparse:    expected struct cdns3_otg_leg=
acy_regs *otg_v0_regs
   drivers/usb/cdns3/drd.c:326:27: sparse:    got void [noderef] <asn:2> *[=
assigned] regs
   drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:330:32: sparse: sparse: incorrect type in assign=
ment (different address spaces) @@    expected struct cdns3_otg_common_regs=
 *otg_regs @@    got void struct cdns3_otg_common_regs *otg_regs @@
   drivers/usb/cdns3/drd.c:330:32: sparse:    expected struct cdns3_otg_com=
mon_regs *otg_regs
   drivers/usb/cdns3/drd.c:330:32: sparse:    got void [noderef] <asn:2> *[=
assigned] regs
   drivers/usb/cdns3/drd.c:331:17: sparse: sparse: incorrect type in argume=
nt 2 (different address spaces) @@    expected void volatile [noderef] <asn=
:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:331:17: sparse:    expected void volatile [noder=
ef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:331:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:332:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:332:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:332:17: sparse:    got restricted __le32 *
   drivers/usb/cdns3/drd.c:332:17: sparse: sparse: incorrect type in argume=
nt 1 (different address spaces) @@    expected void const volatile [noderef=
] <asn:2> *addr @@    got [noderef] <asn:2> *addr @@
   drivers/usb/cdns3/drd.c:332:17: sparse:    expected void const volatile =
[noderef] <asn:2> *addr
   drivers/usb/cdns3/drd.c:332:17: sparse:    got restricted __le32 *
>> drivers/usb/cdns3/drd.c:332:17: sparse: sparse: too many warnings

vim +332 drivers/usb/cdns3/drd.c

7733f6c32e36ff Pawel Laszczak 2019-08-26  306  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  307  int cdns3_drd_init(struct cd=
ns3 *cdns)
7733f6c32e36ff Pawel Laszczak 2019-08-26  308  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  309  	void __iomem *regs;
7733f6c32e36ff Pawel Laszczak 2019-08-26  310  	int ret =3D 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  311  	u32 state;
7733f6c32e36ff Pawel Laszczak 2019-08-26  312  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  313  	regs =3D devm_ioremap_resou=
rce(cdns->dev, &cdns->otg_res);
7733f6c32e36ff Pawel Laszczak 2019-08-26  314  	if (IS_ERR(regs))
7733f6c32e36ff Pawel Laszczak 2019-08-26  315  		return PTR_ERR(regs);
7733f6c32e36ff Pawel Laszczak 2019-08-26  316  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  317  	/* Detection of DRD version=
. Controller has been released
7733f6c32e36ff Pawel Laszczak 2019-08-26  318  	 * in two versions. Both ar=
e similar, but they have same changes
7733f6c32e36ff Pawel Laszczak 2019-08-26  319  	 * in register maps.
7733f6c32e36ff Pawel Laszczak 2019-08-26  320  	 * The first register in ol=
d version is command register and it's read
7733f6c32e36ff Pawel Laszczak 2019-08-26  321  	 * only, so driver should r=
ead 0 from it. On the other hand, in v1
7733f6c32e36ff Pawel Laszczak 2019-08-26  322  	 * the first register conta=
ins device ID number which is not set to 0.
7733f6c32e36ff Pawel Laszczak 2019-08-26  323  	 * Driver uses this fact to=
 detect the proper version of
7733f6c32e36ff Pawel Laszczak 2019-08-26  324  	 * controller.
7733f6c32e36ff Pawel Laszczak 2019-08-26  325  	 */
7733f6c32e36ff Pawel Laszczak 2019-08-26  326  	cdns->otg_v0_regs =3D regs;
7733f6c32e36ff Pawel Laszczak 2019-08-26  327  	if (!readl(&cdns->otg_v0_re=
gs->cmd)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  328  		cdns->version  =3D CDNS3_C=
ONTROLLER_V0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  329  		cdns->otg_v1_regs =3D NULL;
7733f6c32e36ff Pawel Laszczak 2019-08-26  330  		cdns->otg_regs =3D regs;
7733f6c32e36ff Pawel Laszczak 2019-08-26  331  		writel(1, &cdns->otg_v0_re=
gs->simulate);
7733f6c32e36ff Pawel Laszczak 2019-08-26 @332  		dev_info(cdns->dev, "DRD v=
ersion v0 (%08x)\n",
7733f6c32e36ff Pawel Laszczak 2019-08-26  333  			 readl(&cdns->otg_v0_regs=
->version));
7733f6c32e36ff Pawel Laszczak 2019-08-26  334  	} else {
7733f6c32e36ff Pawel Laszczak 2019-08-26  335  		cdns->otg_v0_regs =3D NULL;
7733f6c32e36ff Pawel Laszczak 2019-08-26  336  		cdns->otg_v1_regs =3D regs;
7733f6c32e36ff Pawel Laszczak 2019-08-26  337  		cdns->otg_regs =3D (void *=
)&cdns->otg_v1_regs->cmd;
7733f6c32e36ff Pawel Laszczak 2019-08-26  338  		cdns->version  =3D CDNS3_C=
ONTROLLER_V1;
7733f6c32e36ff Pawel Laszczak 2019-08-26  339  		writel(1, &cdns->otg_v1_re=
gs->simulate);
7733f6c32e36ff Pawel Laszczak 2019-08-26  340  		dev_info(cdns->dev, "DRD v=
ersion v1 (ID: %08x, rev: %08x)\n",
7733f6c32e36ff Pawel Laszczak 2019-08-26  341  			 readl(&cdns->otg_v1_regs=
->did),
7733f6c32e36ff Pawel Laszczak 2019-08-26  342  			 readl(&cdns->otg_v1_regs=
->rid));
7733f6c32e36ff Pawel Laszczak 2019-08-26  343  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  344  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  345  	state =3D OTGSTS_STRAP(read=
l(&cdns->otg_regs->sts));
7733f6c32e36ff Pawel Laszczak 2019-08-26  346  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  347  	/* Update dr_mode according=
 to STRAP configuration. */
7733f6c32e36ff Pawel Laszczak 2019-08-26  348  	cdns->dr_mode =3D USB_DR_MO=
DE_OTG;
7733f6c32e36ff Pawel Laszczak 2019-08-26  349  	if (state =3D=3D OTGSTS_STR=
AP_HOST) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  350  		dev_dbg(cdns->dev, "Contro=
ller strapped to HOST\n");
7733f6c32e36ff Pawel Laszczak 2019-08-26  351  		cdns->dr_mode =3D USB_DR_M=
ODE_HOST;
7733f6c32e36ff Pawel Laszczak 2019-08-26  352  	} else if (state =3D=3D OTG=
STS_STRAP_GADGET) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  353  		dev_dbg(cdns->dev, "Contro=
ller strapped to PERIPHERAL\n");
7733f6c32e36ff Pawel Laszczak 2019-08-26  354  		cdns->dr_mode =3D USB_DR_M=
ODE_PERIPHERAL;
7733f6c32e36ff Pawel Laszczak 2019-08-26  355  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  356  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  357  	ret =3D devm_request_thread=
ed_irq(cdns->dev, cdns->otg_irq,
7733f6c32e36ff Pawel Laszczak 2019-08-26  358  					cdns3_drd_irq,
7733f6c32e36ff Pawel Laszczak 2019-08-26  359  					cdns3_drd_thread_irq,
7733f6c32e36ff Pawel Laszczak 2019-08-26  360  					IRQF_SHARED,
7733f6c32e36ff Pawel Laszczak 2019-08-26  361  					dev_name(cdns->dev), cd=
ns);
7733f6c32e36ff Pawel Laszczak 2019-08-26  362  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  363  	if (ret) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  364  		dev_err(cdns->dev, "couldn=
't get otg_irq\n");
7733f6c32e36ff Pawel Laszczak 2019-08-26  365  		return ret;
7733f6c32e36ff Pawel Laszczak 2019-08-26  366  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  367  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  368  	state =3D readl(&cdns->otg_=
regs->sts);
7733f6c32e36ff Pawel Laszczak 2019-08-26  369  	if (OTGSTS_OTG_NRDY(state) =
!=3D 0) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  370  		dev_err(cdns->dev, "Cadenc=
e USB3 OTG device not ready\n");
7733f6c32e36ff Pawel Laszczak 2019-08-26  371  		return -ENODEV;
7733f6c32e36ff Pawel Laszczak 2019-08-26  372  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  373  =

7733f6c32e36ff Pawel Laszczak 2019-08-26  374  	return ret;
7733f6c32e36ff Pawel Laszczak 2019-08-26  375  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  376  =


:::::: The code at line 332 was first introduced by commit
:::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence USB=
3 DRD Driver

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============9204274074017392043==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============9204274074017392043==--

