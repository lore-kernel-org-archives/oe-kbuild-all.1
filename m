Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083C313266
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 02:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766717062; cv=none; b=JxfEIr0PTB6k7D3zARZR+0fvIf/FqZ27XWovPujIvOo+okO/mnG0XLk+rKYrv/c8pQum50NpaYeVQxLQNMsgTE/m28x4pI9+fSyQm5yPri1G+rQKBarfpd8ITJVLfn9IJ+Xr6z2l97BPGeB/QXdsK5NwGaYZhbziIDAUrbesK4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766717062; c=relaxed/simple;
	bh=9Esdul89Y3Zf4aFkxLwfYbWabtkg+WnwPpTb0rHKsxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KCucxX3uS7UOxnO45tu9MdMPtrCiEYeGpgNRiH5w5ZPj1sXtRZEPyLZcgzoyANl14J3UuzSI3YMHYK5EglcvZLuM3esWDHd2iqh1OMerreoAu+aXdjFtoien6at0YR0WOGkY2rJIXR3cDrPc7C9Tye7vLv90O5D6g/v+iuAAG+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNSh9GQY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNSh9GQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766717060; x=1798253060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9Esdul89Y3Zf4aFkxLwfYbWabtkg+WnwPpTb0rHKsxg=;
  b=XNSh9GQY2rnhlnT4siBXV8mTtvrOVvOca1tUdoD5MaSi6JVse15PF1J/
   sQ26me0MzIAlImkhgNWFfZKbCqIuMYMT83Q8m9fWI4LAAr0rz0wAjplgT
   +MiuOuSvZMnM6gSWZpv9JSieV9duLHpREuWoWmFi3GUaBaVWmd4IK5gIL
   izltaWvXBIyHEoVMyFKYXj2xDVNs59KsXSsH534HcnE8RQivot577IDS4
   3Xx7V3gLvPWHHTQMXFqi45Su8u0PsLusmGA4H839hKq0HeUXO6+5M3jz1
   NeRJveIjBBjCuzoBRh9uyrrArJP7XWngdFxVxkeURruwDhLnww2njyP5i
   A==;
X-CSE-ConnectionGUID: zul50NcTQaeqEgyajHLxgA==
X-CSE-MsgGUID: W3qDGJZgQ86KCkVaMXypvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79854539"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="79854539"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 18:44:19 -0800
X-CSE-ConnectionGUID: HFspRvJySnydpPvpxHiP6g==
X-CSE-MsgGUID: Y2vapdfmS46hg2kK3yWw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="205220933"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 25 Dec 2025 18:44:18 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYxoO-000000006km-0jjP;
	Fri, 26 Dec 2025 02:44:16 +0000
Date: Fri, 26 Dec 2025 03:43:43 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 67/111]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb:
 ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not
 allowed ('mux-bus' was unexpected)
Message-ID: <202512260313.9MnXE5ad-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   fff6186ad59ed77c50897afb2a9258b9b260308d
commit: 90b4afb77d85bf04a56f6a46cac018a1dae0888c [67/111] arm64: dts: r4pro: add eth-mux
config: arm64-randconfig-2052-20251220 (https://download.01.org/0day-ci/archive/20251226/202512260313.9MnXE5ad-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260313.9MnXE5ad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260313.9MnXE5ad-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: /soc/ethernet@15100000/mdio-bus/switch@16: failed to match any schema with compatible: ['mxl,86252']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: /soc/ethernet@15100000/mdio-bus/switch@16/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
