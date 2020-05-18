Content-Type: multipart/mixed; boundary="===============8110040249537622730=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/usb/cdns3/drd.c:332:17: sparse: sparse: too many warnings
Date: Mon, 18 May 2020 15:05:16 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E662495263DD2B@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <202005182134.F6Wme8zd%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8110040249537622730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: [kbuild-all] drivers/usb/cdns3/drd.c:332:17: sparse: sparse: too=
 many
> warnings
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
> commit: 70d8b9e5e63d212019ba3f6823c8ec3d2df87645 usb: cdns3: make signed
> 1 bit bitfields unsigned
> date:   8 weeks ago
> config: arc-randconfig-s001-20200518 (attached as .config)
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-193-gb8fad4bc-dirty
>         git checkout 70d8b9e5e63d212019ba3f6823c8ec3d2df87645
>         # save the attached .config to linux build tree
>         make C=3D1 ARCH=3Darc CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN_=
_'
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> =

> sparse warnings: (new ones prefixed by >>)
Sorry, kindly ignore this, which is a false positive.

> =

>    drivers/usb/cdns3/drd.c:182:23: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:182:23: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:182:23: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:182:23: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:195:17: sparse: sparse: incorrect type in argu=
ment 2
> (different address spaces) @@    expected void volatile [noderef] <asn:2>=
 *addr
> @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:195:17: sparse:    expected void volatile [nod=
eref]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:195:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:199:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:199:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:199:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:219:9: sparse: sparse: incorrect type in argum=
ent 2
> (different address spaces) @@    expected void volatile [noderef] <asn:2>=
 *addr
> @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:219:9: sparse:    expected void volatile [node=
ref] <asn:2>
> *addr
>    drivers/usb/cdns3/drd.c:219:9: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:284:15: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:284:15: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:284:15: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:303:9: sparse: sparse: incorrect type in argum=
ent 2
> (different address spaces) @@    expected void volatile [noderef] <asn:2>=
 *addr
> @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:303:9: sparse:    expected void volatile [node=
ref] <asn:2>
> *addr
>    drivers/usb/cdns3/drd.c:303:9: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:326:27: sparse: sparse: incorrect type in assi=
gnment
> (different address spaces) @@    expected struct cdns3_otg_legacy_regs
> *otg_v0_regs @@    got void struct cdns3_otg_legacy_regs *otg_v0_regs @@
>    drivers/usb/cdns3/drd.c:326:27: sparse:    expected struct
> cdns3_otg_legacy_regs *otg_v0_regs
>    drivers/usb/cdns3/drd.c:326:27: sparse:    got void [noderef] <asn:2> =
*[assigned]
> regs
>    drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:327:14: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:327:14: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:327:14: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:330:32: sparse: sparse: incorrect type in assi=
gnment
> (different address spaces) @@    expected struct cdns3_otg_common_regs
> *otg_regs @@    got void struct cdns3_otg_common_regs *otg_regs @@
>    drivers/usb/cdns3/drd.c:330:32: sparse:    expected struct
> cdns3_otg_common_regs *otg_regs
>    drivers/usb/cdns3/drd.c:330:32: sparse:    got void [noderef] <asn:2> =
*[assigned]
> regs
>    drivers/usb/cdns3/drd.c:331:17: sparse: sparse: incorrect type in argu=
ment 2
> (different address spaces) @@    expected void volatile [noderef] <asn:2>=
 *addr
> @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:331:17: sparse:    expected void volatile [nod=
eref]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:331:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:332:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:332:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:332:17: sparse:    got restricted __le32 *
>    drivers/usb/cdns3/drd.c:332:17: sparse: sparse: incorrect type in argu=
ment 1
> (different address spaces) @@    expected void const volatile [noderef] <=
asn:2>
> *addr @@    got [noderef] <asn:2> *addr @@
>    drivers/usb/cdns3/drd.c:332:17: sparse:    expected void const volatil=
e [noderef]
> <asn:2> *addr
>    drivers/usb/cdns3/drd.c:332:17: sparse:    got restricted __le32 *
> >> drivers/usb/cdns3/drd.c:332:17: sparse: sparse: too many warnings
> =

> vim +332 drivers/usb/cdns3/drd.c
> =

> 7733f6c32e36ff Pawel Laszczak 2019-08-26  306
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  307  int cdns3_drd_init(struct =
cdns3
> *cdns)
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  308  {
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  309  	void __iomem *regs;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  310  	int ret =3D 0;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  311  	u32 state;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  312
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  313  	regs =3D
> devm_ioremap_resource(cdns->dev, &cdns->otg_res);
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  314  	if (IS_ERR(regs))
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  315  		return
> PTR_ERR(regs);
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  316
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  317  	/* Detection of DRD
> version. Controller has been released
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  318  	 * in two versions. Both
> are similar, but they have same changes
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  319  	 * in register maps.
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  320  	 * The first register in =
old
> version is command register and it's read
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  321  	 * only, so driver should
> read 0 from it. On the other hand, in v1
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  322  	 * the first register
> contains device ID number which is not set to 0.
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  323  	 * Driver uses this fact =
to
> detect the proper version of
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  324  	 * controller.
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  325  	 */
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  326  	cdns->otg_v0_regs =3D
> regs;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  327  	if (!readl(&cdns-
> >otg_v0_regs->cmd)) {
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  328  		cdns->version  =3D
> CDNS3_CONTROLLER_V0;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  329  		cdns-
> >otg_v1_regs =3D NULL;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  330  		cdns->otg_regs =3D
> regs;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  331  		writel(1, &cdns-
> >otg_v0_regs->simulate);
> 7733f6c32e36ff Pawel Laszczak 2019-08-26 @332  		dev_info(cdns-
> >dev, "DRD version v0 (%08x)\n",
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  333
> readl(&cdns->otg_v0_regs->version));
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  334  	} else {
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  335  		cdns-
> >otg_v0_regs =3D NULL;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  336  		cdns-
> >otg_v1_regs =3D regs;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  337  		cdns->otg_regs =3D
> (void *)&cdns->otg_v1_regs->cmd;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  338  		cdns->version  =3D
> CDNS3_CONTROLLER_V1;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  339  		writel(1, &cdns-
> >otg_v1_regs->simulate);
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  340  		dev_info(cdns-
> >dev, "DRD version v1 (ID: %08x, rev: %08x)\n",
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  341
> readl(&cdns->otg_v1_regs->did),
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  342
> readl(&cdns->otg_v1_regs->rid));
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  343  	}
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  344
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  345  	state =3D
> OTGSTS_STRAP(readl(&cdns->otg_regs->sts));
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  346
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  347  	/* Update dr_mode
> according to STRAP configuration. */
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  348  	cdns->dr_mode =3D
> USB_DR_MODE_OTG;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  349  	if (state =3D=3D
> OTGSTS_STRAP_HOST) {
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  350  		dev_dbg(cdns-
> >dev, "Controller strapped to HOST\n");
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  351  		cdns->dr_mode =3D
> USB_DR_MODE_HOST;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  352  	} else if (state =3D=3D
> OTGSTS_STRAP_GADGET) {
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  353  		dev_dbg(cdns-
> >dev, "Controller strapped to PERIPHERAL\n");
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  354  		cdns->dr_mode =3D
> USB_DR_MODE_PERIPHERAL;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  355  	}
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  356
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  357  	ret =3D
> devm_request_threaded_irq(cdns->dev, cdns->otg_irq,
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  358
> 	cdns3_drd_irq,
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  359
> 	cdns3_drd_thread_irq,
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  360
> 	IRQF_SHARED,
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  361
> 	dev_name(cdns->dev), cdns);
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  362
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  363  	if (ret) {
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  364  		dev_err(cdns-
> >dev, "couldn't get otg_irq\n");
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  365  		return ret;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  366  	}
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  367
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  368  	state =3D readl(&cdns-
> >otg_regs->sts);
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  369  	if
> (OTGSTS_OTG_NRDY(state) !=3D 0) {
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  370  		dev_err(cdns-
> >dev, "Cadence USB3 OTG device not ready\n");
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  371  		return -ENODEV;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  372  	}
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  373
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  374  	return ret;
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  375  }
> 7733f6c32e36ff Pawel Laszczak 2019-08-26  376
> =

> :::::: The code at line 332 was first introduced by commit
> :::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence
> USB3 DRD Driver
> =

> :::::: TO: Pawel Laszczak <pawell@cadence.com>
> :::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8110040249537622730==--

