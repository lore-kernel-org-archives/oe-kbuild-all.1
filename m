Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF76011CB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687347915; x=1718883915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dqCF3GfDpG27kGoS0tVLvifXd0cUJHAq0oMXHt6Pows=;
  b=ufnME4oWO0taAX3ef+9530NQObvEKW8kXf4besNIdyEPk3KzxktPpMIz
   83jKMFjN358edmQGymkBlw5GScsInFskgHIiM2uh8tK+bGgYrkWdFTm+b
   S35p+RperABxPEz+AilcBgRDv8TwRL1jAjo2ba+IFISEkby16pMxl0wXs
   744vrBmyJ9b7kWW2ZCAGTraD6S+v8w8vACrEiRw5mCaqprXNXm/Lceebi
   hCh0IVYygDYZY8TOsJkrtOOqnD19tRSQ+JEOq3sAuDOmghThbyQvjM1JJ
   5fzs53NtmGW36JjM99N4ECdSAgou7yyDx9CSj/YIbuiIdz0TmwFzxAWbR
   w==;
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="asc'?scan'208";a="216987650"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2023 04:45:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 21 Jun 2023 04:44:34 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 21 Jun 2023 04:44:31 -0700
Date: Wed, 21 Jun 2023 12:44:04 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: kernel test robot <lkp@intel.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Roger
 Quadros <rogerq@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-riscv@lists.infradead.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v7 4/5] phy: starfive: Add JH7110 PCIE 2.0 PHY driver
Message-ID: <20230621-duckbill-scarf-fa79744cd42d@wendy>
References: <20230619094759.21013-5-minda.chen@starfivetech.com>
 <202306192215.TvQco9m6-lkp@intel.com>
 <d4824941-85dd-d378-be5b-072907b1169d@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tRw/601YCUT+ci1y"
Content-Disposition: inline
In-Reply-To: <d4824941-85dd-d378-be5b-072907b1169d@starfivetech.com>

--tRw/601YCUT+ci1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Jun 21, 2023 at 05:29:34PM +0800, Minda Chen wrote:
> On 2023/6/19 22:45, kernel test robot wrote:
> > kernel test robot noticed the following build errors:
> >=20
> > [auto build test ERROR on robh/for-next]
> > [also build test ERROR on linus/master v6.4-rc7 next-20230619]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >=20
> > url:    https://github.com/intel-lab-lkp/linux/commits/Minda-Chen/dt-bi=
ndings-phy-Add-StarFive-JH7110-PCIe-PHY/20230619-184756
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git =
for-next
> > patch link:    https://lore.kernel.org/r/20230619094759.21013-5-minda.c=
hen%40starfivetech.com
> > patch subject: [PATCH v7 4/5] phy: starfive: Add JH7110 PCIE 2.0 PHY dr=
iver
> > config: s390-allmodconfig (https://download.01.org/0day-ci/archive/2023=
0619/202306192215.TvQco9m6-lkp@intel.com/config)
> > compiler: s390-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230619/2023061922=
15.TvQco9m6-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306192215.TvQco9m6-l=
kp@intel.com/
> >=20
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >=20
> >>> ERROR: modpost: "devm_platform_ioremap_resource" [drivers/phy/starfiv=
e/phy-jh7110-pcie.ko] undefined!

> I can not find this error. devm_platform_ioremap_resource is an exported =
symbol

I asked Arnd about this since the error confused me too. Arnd pointed
out that this "allmodconfig" isn't really allmodconfig as PCI is
disabled. On s390, CONFIG_HAS_IOMEM depends on PCI and thus none of
this devres stuff is usable without it. He suggested that you make the
driver depend on USB_SUPPORT, which in turn depends on HAS_IOMEM.

Cheers,
Conor.

> > ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] unde=
fined!
> > ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.=
ko] undefined!
> > ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko=
] undefined!
> > ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefi=
ned!
> > ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefi=
ned!
> > ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus=
/xillybus_of.ko] undefined!
> > ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
> > ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
> > ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undef=
ined!
> > WARNING: modpost: suppressed 19 unresolved symbol warnings because ther=
e were too many)
> >> Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for USB_PHY
> >    Depends on [n]: USB_SUPPORT [=3Dn]
> >    Selected by [m]:
> >    - PHY_STARFIVE_JH7110_PCIE [=3Dm]
> >=20
> I will fix it.

--tRw/601YCUT+ci1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJLihAAKCRB4tDGHoIJi
0vj8AP9kJjPUKKeK5Ikb1Vd6nWoEl8ogTNFNE5HjZqKwMcYd4wD+MdHtCtk1hVIG
mTwN9gzq2iJiK6QVTmkspy3bwM3HLgQ=
=7ieo
-----END PGP SIGNATURE-----

--tRw/601YCUT+ci1y--
