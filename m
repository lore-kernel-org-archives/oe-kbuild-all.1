Content-Type: multipart/mixed; boundary="===============0694577186268393428=="
MIME-Version: 1.0
From: Julia Lawall <julia.lawall@inria.fr>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/1] i2c: imc: Add support for Intel iMC SMBus host controller. (fwd)
Date: Mon, 24 Feb 2020 10:13:52 +0100
Message-ID: <alpine.DEB.2.21.2002241012330.2936@hadrien>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0694577186268393428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

Devm-allocated data should not be kfreed.  The label probe_out_free does
not look necessary.

julia

---------- Forwarded message ----------
Date: Mon, 24 Feb 2020 11:49:07 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild(a)lists.01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 1/1] i2c: imc: Add support for Intel iMC SMBus host
    controller.

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1582498270-50674-2-git-send-email-schaecsn@gmx.net>
References: <1582498270-50674-2-git-send-email-schaecsn@gmx.net>
TO: Stefan Schaeckeler <schaecsn@gmx.net>
CC: linux-i2c(a)vger.kernel.org, linux-kernel(a)vger.kernel.org, Andy Lutom=
irski <luto@kernel.org>

Hi Stefan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linux/master linus/master v5.6-rc2 next-2020022=
1]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Stefan-Schaeckeler/i2c-imc=
-Add-support-for-Intel-iMC-SMBus-host-controller/20200224-065435
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

>> drivers/i2c/busses/i2c-imc.c:447:1-6: WARNING: invalid free of devm_ all=
ocated data

# https://github.com/0day-ci/linux/commit/d7855ea60367262eb4f8252da00de63a0=
b546234
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout d7855ea60367262eb4f8252da00de63a0b546234
vim +447 drivers/i2c/busses/i2c-imc.c

d7855ea6036726 Stefan Schaeckeler 2020-02-23  382
d7855ea6036726 Stefan Schaeckeler 2020-02-23  383  static int imc_probe(str=
uct pci_dev *dev, const struct pci_device_id *id)
d7855ea6036726 Stefan Schaeckeler 2020-02-23  384  {
d7855ea6036726 Stefan Schaeckeler 2020-02-23  385  	int i, j, err;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  386  	struct imc_priv *priv;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  387  	struct pci_dev *sad;  /=
* System Address Decoder */
d7855ea6036726 Stefan Schaeckeler 2020-02-23  388  	u32 sadcntl;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  389
d7855ea6036726 Stefan Schaeckeler 2020-02-23  390  	/* Sanity check. This d=
evice is always at 0x13.0 */
d7855ea6036726 Stefan Schaeckeler 2020-02-23  391  	if (dev->devfn !=3D PCI=
_DEVFN(0x13, 0))
d7855ea6036726 Stefan Schaeckeler 2020-02-23  392  		return -ENODEV;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  393
d7855ea6036726 Stefan Schaeckeler 2020-02-23  394  	priv =3D devm_kzalloc(&=
dev->dev, sizeof(*priv), GFP_KERNEL);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  395  	if (!priv)
d7855ea6036726 Stefan Schaeckeler 2020-02-23  396  		return -ENOMEM;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  397  	priv->pci_dev =3D dev;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  398  	pci_set_drvdata(dev, pr=
iv);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  399
d7855ea6036726 Stefan Schaeckeler 2020-02-23  400  	/*
d7855ea6036726 Stefan Schaeckeler 2020-02-23  401  	 * From sad, we learn t=
he local node id of the socket.
d7855ea6036726 Stefan Schaeckeler 2020-02-23  402  	 *
d7855ea6036726 Stefan Schaeckeler 2020-02-23  403  	 * The socket will not =
change at runtime and so we throw away sad.
d7855ea6036726 Stefan Schaeckeler 2020-02-23  404  	 */
d7855ea6036726 Stefan Schaeckeler 2020-02-23  405  	sad =3D imc_get_related=
_device(dev->bus, PCI_DEVFN(0x0f, 5),
d7855ea6036726 Stefan Schaeckeler 2020-02-23  406  				     PCI_DEVICE_ID_I=
NTEL_BROADWELL_IMC_SAD);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  407  	if (!sad) {
d7855ea6036726 Stefan Schaeckeler 2020-02-23  408  		err =3D -ENODEV;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  409  		goto probe_out_free;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  410  	}
d7855ea6036726 Stefan Schaeckeler 2020-02-23  411  	pci_read_config_dword(s=
ad, SADCNTL, &sadcntl);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  412  	pci_dev_put(sad);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  413
d7855ea6036726 Stefan Schaeckeler 2020-02-23  414  	/*
d7855ea6036726 Stefan Schaeckeler 2020-02-23  415  	 * From pcu, we access =
the CLTT polling interval.
d7855ea6036726 Stefan Schaeckeler 2020-02-23  416  	 *
d7855ea6036726 Stefan Schaeckeler 2020-02-23  417  	 * The polling interval=
 is set by BIOS. We assume it will not change at
d7855ea6036726 Stefan Schaeckeler 2020-02-23  418  	 * runtime and cache th=
e initial value.
d7855ea6036726 Stefan Schaeckeler 2020-02-23  419  	 */
d7855ea6036726 Stefan Schaeckeler 2020-02-23  420  	priv->pcu.pci_dev =3D i=
mc_get_related_device(dev->bus, PCI_DEVFN(0x1e, 1),
d7855ea6036726 Stefan Schaeckeler 2020-02-23  421  					 PCI_DEVICE_ID_INTE=
L_BROADWELL_IMC_PCU);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  422  	if (!priv->pcu.pci_dev)=
 {
d7855ea6036726 Stefan Schaeckeler 2020-02-23  423  		err =3D -ENODEV;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  424  		goto probe_out_free;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  425  	}
d7855ea6036726 Stefan Schaeckeler 2020-02-23  426  	pci_read_config_dword(p=
riv->pcu.pci_dev, TSODCNTL,
d7855ea6036726 Stefan Schaeckeler 2020-02-23  427  			      &priv->pcu.tsod=
_polling_interval);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  428
d7855ea6036726 Stefan Schaeckeler 2020-02-23  429  	mutex_init(&priv->pcu.m=
utex);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  430
d7855ea6036726 Stefan Schaeckeler 2020-02-23  431  	for (i =3D 0; i < 2; i+=
+) {
d7855ea6036726 Stefan Schaeckeler 2020-02-23  432  		err =3D imc_init_chann=
elpair(priv, i,
d7855ea6036726 Stefan Schaeckeler 2020-02-23  433  					   sadcntl & SADCNT=
L_LOCAL_NODEID_MASK);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  434  		if (err)
d7855ea6036726 Stefan Schaeckeler 2020-02-23  435  			goto probe_out_free_c=
hannelpair;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  436  	}
d7855ea6036726 Stefan Schaeckeler 2020-02-23  437
d7855ea6036726 Stefan Schaeckeler 2020-02-23  438  	return 0;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  439
d7855ea6036726 Stefan Schaeckeler 2020-02-23  440  probe_out_free_channelpa=
ir:
d7855ea6036726 Stefan Schaeckeler 2020-02-23  441  	for (j =3D 0; j < i; j+=
+)
d7855ea6036726 Stefan Schaeckeler 2020-02-23  442  		imc_free_channelpair(p=
riv, j);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  443
d7855ea6036726 Stefan Schaeckeler 2020-02-23  444  	mutex_destroy(&priv->pc=
u.mutex);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  445
d7855ea6036726 Stefan Schaeckeler 2020-02-23  446  probe_out_free:
d7855ea6036726 Stefan Schaeckeler 2020-02-23 @447  	kfree(priv);
d7855ea6036726 Stefan Schaeckeler 2020-02-23  448  	return err;
d7855ea6036726 Stefan Schaeckeler 2020-02-23  449  }
d7855ea6036726 Stefan Schaeckeler 2020-02-23  450

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0694577186268393428==--

