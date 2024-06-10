Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C20617C66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718002569; cv=none; b=aq3KgsHGdTdjuUoGlyF4tV+fBi11UQC7dpHelHWPsZAhCvhPkpnnGAtpyG1YuJ0A6pYmmnHjGF6cT4rug3h5AY3NCvVp3SJbn87lrAYbCYIv6uIyrEIPIi+MTaRbolQz1OTR1dUmOBZOzFYjJce66BoYxI8jyjpeKqaYY5qboMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718002569; c=relaxed/simple;
	bh=oETmX+G9NQUOzMzKFXYtfSnaONfCUIL1kKpG9sYAz1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8IUJhIZMYaGFpv1VcIvXXNTSKZumrMLebcjgeVNQ5g/5WDM1PXao28w/ZQh1TN1U8RyGmdu+vuBs4wGUs8kOqBf7ib5X3F79g2gtr/7A7MvruNWODdghRg23Lc08L1u1hyGsewE1xOQ/+xAgGgOLUANmYqnWqHENHM/j0dWuWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4a3w0Xi; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4a3w0Xi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718002564; x=1749538564;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oETmX+G9NQUOzMzKFXYtfSnaONfCUIL1kKpG9sYAz1o=;
  b=b4a3w0XiskVvhdqJXgRg+gdOXDsYvBw8EhEw4DVCNZDEgiQCaCpn3f+R
   JwGmWX4SXD7wecRuMbn81hHNKR18QTecKq0q3XuODHTh8v6tsXhW9Z2vX
   dqnrDWkQrYax0oDsRvx2PCGZIovAMwoY/Jc3m3I9z+TjI+Zr+eoqyXiWO
   prLe9AbIjHOvuuhE1MmhE07l7pTAmHAcDbNJzKwDs7D4+EpDckdD/bQl2
   HjVJ1lU060uVTFyNdkkkXCnckiYY/q4VeeoeZhoRBLWtC35a2pkLbfnle
   jOnxSyW8/2v5aG4Fl8ll99sXHPGOLf8N+KIZ+o38mdkArf24/vKXr2B3W
   A==;
X-CSE-ConnectionGUID: m4ZVhdEXQ6mMa113ILkaCA==
X-CSE-MsgGUID: Tcmj7YjZTu6Dc/5aM2RLUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32139027"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="32139027"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 23:56:03 -0700
X-CSE-ConnectionGUID: 5dWV/ifhQbmT2E7VD6YsfA==
X-CSE-MsgGUID: N54JzOaoQ/GtVFpDSPcKyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="38799465"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jun 2024 23:56:02 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGYwh-0001vB-1f;
	Mon, 10 Jun 2024 06:55:59 +0000
Date: Mon, 10 Jun 2024 14:55:14 +0800
From: kernel test robot <lkp@intel.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 6/61]
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: dss-oldi-io-ctrl@8600: compatible:
 'anyOf' conditional failed, one must be fixed:
Message-ID: <202406101418.S1X7TYlz-lkp@intel.com>
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
head:   504c87f7f0af17421d2bb08aa33fc8f0f3191a8f
commit: 3ac4f7eae7cadbab878fd172b1f116ae24358275 [6/61] arm64: dts: ti: k3-=
am62p-main: Add support for DSS0
config: arm64-randconfig-051-20240609 (https://download.01.org/0day-ci/arch=
ive/20240610/202406101418.S1X7TYlz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d=
2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240610/202406101418.S1X7TYlz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406101418.S1X7TYlz-lkp@i=
ntel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts:383.10-392.6: Warning (graph_chi=
ld_address): /bus@f0000/i2c@20000000/usb-power-controller@3f/connector/port=
s: graph node has single child node 'port@0', #address-cells/#size-cells ar=
e not necessary
   arch/arm64/boot/dts/ti/k3-am62p-main.dtsi:656.22-666.5: Warning (graph_c=
hild_address): /bus@f0000/usb@f900000/usb@31000000: graph node has single c=
hild node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: bus@43000000: compatible: ['sys=
con', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: dss-oldi-io-ctrl@8600: compatib=
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
>> arch/arm64/boot/dts/ti/k3-am62p5-sk.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']
--
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: bus@43000000: compatible: ['sys=
con', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4008: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
   arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/bus@b00000/bus@43000=
000/syscon@4018: failed to match any schema with compatible: ['ti,am62-usb-=
phy-ctrl', 'syscon']
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: dss-oldi-io-ctrl@8600: compatib=
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
>> arch/arm64/boot/dts/ti/k3-j722s-evm.dtb: /bus@f0000/dss@30200000: failed=
 to match any schema with compatible: ['ti,am62p51-dss']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
