Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8880D13DBB1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 20:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720037670; cv=none; b=eBErwTSVVX+HwsihsDXnjjMrI3annm0QjnCC0HNC4jamvWmC/uT9M7puy6fm5ObeyO/iU/qxvc0gONiyzMCcWGq9O+/AWPXbkWu1cHCxFI3bZLKSkY5se5WnnUbPnMjKz20RYtK14S1+nYDtuMqIm2SVa5kIIkqE6Y31jWYHFus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720037670; c=relaxed/simple;
	bh=VXPUkC6IPKFcrnhxPSUnVmvhL2Jy/RgQZgKxlq8jeNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFbgHlu66brKboI6MPX/1HVJb8zVizy4HcrhEyzy3EIS4AWV2VlDM4FJrIs+7EYISoA7BT9s0MQQdb7C4DEWfdaOEyTOIMxnoJGgiMqj+xEZWnE5PX1bVlMO25oA5b8qWKnTy37L9/qXrZDy6Dhu8IpL2XUA4iz2u88C+ZKZW/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRxTbAqd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRxTbAqd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C16C2BD10;
	Wed,  3 Jul 2024 20:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720037670;
	bh=VXPUkC6IPKFcrnhxPSUnVmvhL2Jy/RgQZgKxlq8jeNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRxTbAqdS4OD2hn8PDbtjG4PJ4SZO9PLkDxWvLcJ1eMw8YvlRvdDAQEUU6EnetBzV
	 T2Vjgg/Wp2Vm8EjhoAc7lIkTr2Pv54KSyCUFwi05eRQcY39ECAgvJGRVHudZOS5YUL
	 u9tF2AFa8VrbQnNzTwx3x2wV9FCAyHN87jRUsAAoI9EiBd9zBvw0wAhaXOM4EFYwT4
	 f3Jtp1bO6Zbim0UQtNvqR2Z/qaxgNi2yAd+vFITNzBucnXZXAuvN2sfMBwDDRrn/Vh
	 +JiKzgBcjkeg/1SDpTOgilyzh+nChCMLlEf4P2HJthHXrbn5GnOSoZ/ZieGOvQa8X6
	 cYedzy/tcVx/Q==
Date: Wed, 3 Jul 2024 21:14:27 +0100
From: Conor Dooley <conor@kernel.org>
To: kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] PCI: microchip: rework reg region handing to
 support using either instance 1 or 2
Message-ID: <20240703-persuaded-replace-abd30141b2eb@spud>
References: <20240701-charger-recognize-fd8a65026a89@spud>
 <202407040339.i1nFFozS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jH5brkQiYfRlV10t"
Content-Disposition: inline
In-Reply-To: <202407040339.i1nFFozS-lkp@intel.com>


--jH5brkQiYfRlV10t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 04:01:42AM +0800, kernel test robot wrote:
> Hi Conor,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on pci/for-linus]
> [also build test WARNING on robh/for-next linus/master v6.10-rc6]
> [cannot apply to pci/next next-20240703]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/dt-bi=
ndings-PCI-microchip-pcie-host-fix-reg-properties/20240701-183154
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-l=
inus
> patch link:    https://lore.kernel.org/r/20240701-charger-recognize-fd8a6=
5026a89%40spud
> patch subject: [PATCH v3 2/2] PCI: microchip: rework reg region handing t=
o support using either instance 1 or 2
> config: x86_64-randconfig-102-20240703 (https://download.01.org/0day-ci/a=
rchive/20240704/202407040339.i1nFFozS-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407040339.i1nFFozS-lkp=
@intel.com/
>=20
> cocci warnings: (new ones prefixed by >>)
> >> drivers/pci/controller/pcie-microchip-host.c:1142:5-11: inconsistent I=
S_ERR and PTR_ERR on line 1143.

This is a valid warning and was reported against my patch submission
rather than my kernel.org tree where I had put the patch overnight
before submitting - any reason why it only CCed me and the build issue
mailing list? Seems worth sending to the maintainers etc since it is a
Real Bug^tm.

Also, Julia - any chance of an improved error message here? I was
scratching my head saying wtf cos IS_ERR() and PTR_ERR() are the right
things to use here - missing that the inconsistency was the variable
passed to it. Would something like "inconsistent argument passed to IS_ERR()
and PTR_ERR() on line $" be an improvement here?

Cheers,
Conor.

>=20
> vim +1142 drivers/pci/controller/pcie-microchip-host.c
>=20
>   1118=09
>   1119	static int mc_host_probe(struct platform_device *pdev)
>   1120	{
>   1121		struct device *dev =3D &pdev->dev;
>   1122		void __iomem *apb_base_addr;
>   1123		int ret;
>   1124		u32 val;
>   1125=09
>   1126		port =3D devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>   1127		if (!port)
>   1128			return -ENOMEM;
>   1129=09
>   1130		port->dev =3D dev;
>   1131=09
>   1132		port->bridge_base_addr =3D devm_platform_ioremap_resource_byname(=
pdev, "bridge");
>   1133		port->ctrl_base_addr =3D devm_platform_ioremap_resource_byname(pd=
ev, "ctrl");
>   1134		if(!IS_ERR(port->bridge_base_addr) && !IS_ERR(port->ctrl_base_add=
r))
>   1135			goto addrs_set;
>   1136=09
>   1137		/*
>   1138		 * The original, incorrect, binding that lumped the control and
>   1139		 * bridge addresses together still needs to be handled by the dri=
ver.
>   1140		 */
>   1141		apb_base_addr =3D devm_platform_ioremap_resource_byname(pdev, "ap=
b");
> > 1142		if (IS_ERR(apb_base_addr))
> > 1143			return dev_err_probe(dev, PTR_ERR(port->bridge_base_addr),
>   1144					     "both legacy apb register and ctrl/bridge regions missing=
");
>   1145=09
>   1146		port->bridge_base_addr =3D apb_base_addr + MC_PCIE1_BRIDGE_ADDR;
>   1147		port->ctrl_base_addr =3D apb_base_addr + MC_PCIE1_CTRL_ADDR;
>   1148=09
>   1149	addrs_set:
>   1150		mc_disable_interrupts(port);
>   1151=09
>   1152		/* Allow enabling MSI by disabling MSI-X */
>   1153		val =3D readl(port->bridge_base_addr + PCIE_PCI_IRQ_DW0);
>   1154		val &=3D ~MSIX_CAP_MASK;
>   1155		writel(val, port->bridge_base_addr + PCIE_PCI_IRQ_DW0);
>   1156=09
>   1157		/* Pick num vectors from bitfile programmed onto FPGA fabric */
>   1158		val =3D readl(port->bridge_base_addr + PCIE_PCI_IRQ_DW0);
>   1159		val &=3D NUM_MSI_MSGS_MASK;
>   1160		val >>=3D NUM_MSI_MSGS_SHIFT;
>   1161=09
>   1162		port->msi.num_vectors =3D 1 << val;
>   1163=09
>   1164		/* Pick vector address from design */
>   1165		port->msi.vector_phy =3D readl_relaxed(port->bridge_base_addr + I=
MSI_ADDR);
>   1166=09
>   1167		ret =3D mc_pcie_init_clks(dev);
>   1168		if (ret) {
>   1169			dev_err(dev, "failed to get clock resources, error %d\n", ret);
>   1170			return -ENODEV;
>   1171		}
>   1172=09
>   1173		return pci_host_common_probe(pdev);
>   1174	}
>   1175=09
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--jH5brkQiYfRlV10t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoWxIwAKCRB4tDGHoIJi
0rYsAQD2ndT+QjgTEwnvsU8fJCyk4GgIRa+CvnMLrxL/Bh4HJQD9ERmsk3VnziSl
wWHoYWXQ2pqIh4ps4WKZ92ljn0fKzws=
=t/yJ
-----END PGP SIGNATURE-----

--jH5brkQiYfRlV10t--
