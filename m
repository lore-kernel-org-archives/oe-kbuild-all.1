Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42CE1E863
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705330; cv=none; b=gKEbA+KMZFMIAbFnHeXMheCDv3t7011mTJrJGdcIxARdVwpQU5v3x/42d/SBHfuRdnntTYR4ZaCyMbgGydMmN6xqUaFAnnFBBmuu1qqOJlxNHz6qIYxk4TZobAGmESZo7ORCUw1eFIwQMRX5kwFf+pqBeJKD8YLJOUs0dVd0IrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705330; c=relaxed/simple;
	bh=TiffW5HG5QmcoLJ9YJJ5X6xWOHJLfvKcnFPSRbUtyTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C6hRZJG9eMBf6sjkV3+JOxfmCkJldPuYNtxbJc+/VcAZJvZfttU1S1OmB4uFzJlX3Gn0N1RZfJWecleTf8fig9kz2xKZdxSQBtT1XZHv5HWpCjYUr6bFWbGSMxfjQaqGiEvBB+uwqboIjKUqus2ZJV6ftXYLiKLh+mcoMIvu6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKBk2Ubo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKBk2Ubo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718705328; x=1750241328;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TiffW5HG5QmcoLJ9YJJ5X6xWOHJLfvKcnFPSRbUtyTc=;
  b=mKBk2UboMeN39LDAIK6H9EClov+7UxtVOOQhsa20uFhSp54RiHCX1Zwj
   oRY/GTHFist8cp9gJJxBeuu4xyA+0v3VWc2tRUxIq10c3vIeMr1J5D1C9
   8MMhv9IPf2S8gIGmyu4wgKrvhT5ZqeqE+nGFAY2QRWMKoJTBwqoCsAdb0
   SUCmryFceF1j+aFpNOh1Z+Ozgcmlv3GhOJnTIphbnuJM/tNKQF0AoY29/
   uurU/lisBKlJKWxc5X8O3bCRj9qe1SVJw2TCXb3UxSQcqv3zgCGhTOLdn
   gyQVz1lbxg+eeasRX9ss9iPs4/c+ccLZaHkMbpdFRr6BjEfRURdM5qwSp
   A==;
X-CSE-ConnectionGUID: lVoJLN5/Tk+DNc0mgvSGUg==
X-CSE-MsgGUID: E9FunHxgRCyKlWga9D0AXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15806712"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15806712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 03:08:47 -0700
X-CSE-ConnectionGUID: h2I+NkkaSGmlTUtq0owC2Q==
X-CSE-MsgGUID: 7oFq6W8mTuKy/AUTwVzc2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42181352"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jun 2024 03:08:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJVlb-0005P7-1O;
	Tue, 18 Jun 2024 10:08:43 +0000
Date: Tue, 18 Jun 2024 18:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: Vibhore Vardhan <vibhore@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 99/137]
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: syscon@43000000: compatible:
 ['syscon', 'simple-mfd'] is too short
Message-ID: <202406181828.Nu0VeZtQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y=
-wip
head:   28ca41014f923e6e0e314492899b7cda49439c39
commit: efab3fb636673837886599a49cddf1e862c8aeb6 [99/137] arm64: dts: ti: k=
3-am62p-wakeup: Configure ti-sysc for wkup_uart0
config: arm64-randconfig-051-20240616 (https://download.01.org/0day-ci/arch=
ive/20240618/202406181828.Nu0VeZtQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240618/202406181828.Nu0VeZtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181828.Nu0VeZtQ-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts:428.10-437.6: Warning (graph_chi=
ld_address): /bus@f0000/i2c@20000000/usb-power-controller@3f/connector/port=
s: graph node has single child node 'port@0', #address-cells/#size-cells ar=
e not necessary
   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:669.22-679.5: Warning (graph_c=
hild_address): /bus@f0000/usb@f900000/usb@31000000: graph node has single c=
hild node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: syscon@43000000: compatible: ['=
syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: dss-oldi-io-ctrl@8600: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain', 'ti,am625-dss-oldi-io-ctrl', 'ti,am654-dss-oldi-=
io-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: compatible: 'one=
Of' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: pinctrl@f4000: 'interrupts' doe=
s not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:1242.21-1245.5: Warning (graph=
_child_address): /bus@f0000/dss@30220000/ports: graph node has single child=
 node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: syscon@43000000: compatible: ['=
syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4008: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/syscon@43=
000000/syscon@4018: failed to match any schema with compatible: ['ti,am62-u=
sb-phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: dss-oldi-io-ctrl@8600: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain', 'ti,am625-dss-oldi-io-ctrl', 'ti,am654-dss-oldi-=
io-ctrl', 'ti,j784s4-pcie-ctrl']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@f4000: compatible: 'one=
Of' conditional failed, one must be fixed:
   	['ti,am654-padconf'] is too short
   	'ti,am654-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.y=
aml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: pinctrl@f4000: 'interrupts' doe=
s not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
