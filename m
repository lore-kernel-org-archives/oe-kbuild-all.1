Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26FB385510
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256347; cv=none; b=VI8PwJqllQNzqaI1hSyhXBFmehDL4aPCNCFv22yhKeUNtYMUWKsAutreeXRz/UNPu+MHm2kw0FXsvpDGjBKC+UlfxsB82/j/oJ3TlUR14iUB/IeQXQIS7Ub6jYNLth+UAzqouYsWkmYd8u8vslm0ij5LbMj3fJJXcNjv6kWyWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256347; c=relaxed/simple;
	bh=97Tl7WWNl0LOhSSE+ONFsclASjw1i96l5+Rbh033fXI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WHQ5YBsBGcgZwgbK8uc7JhV0TXdeQcVPlSDKN+yiz5jk7w/blOudeFsbFeEkn2FovibD4/SQgMlx3c2JCBKtFYNMtIF8kdF3Xo8Mcj3pXP6pfEih3aa7aRyf1tC1qSo0VxnRhttnuM1aIqOcU4KL+Kx2KFWsCHpghcYtKJ40LJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEnOCfIe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEnOCfIe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774256346; x=1805792346;
  h=date:from:to:cc:subject:message-id;
  bh=97Tl7WWNl0LOhSSE+ONFsclASjw1i96l5+Rbh033fXI=;
  b=lEnOCfIe2WfwxcVSW09yU9n0d1qgXDJ+HwgWkWF9zL/OabZboZ8EJ3ks
   VNb/Eedmf6LzVnl6duP6w9Yy9iVpyEnfb5t+016BAehQ/idSCwGRcoASC
   0Lp/CfHXc7htICcEZbPLuAgfC29lzkUYh9POcWp0BDDv8EUExIgSZ3Ylv
   j0tYeLz2sVVh2O4VFislcVMSTHoKCPdvi0isUPA5RtRMAAWyV+c8RB+Hl
   44c4DDxoHGzRj4ty8bUcG6g2y3eh/8S705ralASpIdK5ga1mB5BNMqSLM
   5JbYa6UWb0yDax+C4Bsa8Db/zWYG3FRLC//3uXSE7o17T8PoARffNKzfD
   g==;
X-CSE-ConnectionGUID: vagx9WsbThyK21xK9jNizQ==
X-CSE-MsgGUID: pVa9V50EQ9qXtcKt9MpXYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75155305"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75155305"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:59:05 -0700
X-CSE-ConnectionGUID: E+gc4Xw3TsesVKjw167LKA==
X-CSE-MsgGUID: nF5f+G+1SVW3nqBvCIs3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="228434228"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Mar 2026 01:59:04 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4b7l-000000006an-1tPP;
	Mon, 23 Mar 2026 08:59:01 +0000
Date: Mon, 23 Mar 2026 09:58:49 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-mxl 89/113]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: switch@10
 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is
 not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t',
 'seville']
Message-ID: <202603230943.sk1MmHys-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-mxl
head:   033a14af21b86a958a82e31fe31bab10b2905445
commit: bf1e3be220045bb8bf3d073924f5ce4dc44ccd20 [89/113] arm64: dts: add switch to BPi-R4Pro
config: arm64-randconfig-2052-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230943.sk1MmHys-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230943.sk1MmHys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230943.sk1MmHys-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: switch@10 (maxlinear,mxl86252): ports:port@9:dsa-tag-protocol:0: 'mxl862xx-8021q' is not one of ['dsa', 'edsa', 'ocelot', 'ocelot-8021q', 'rtl8_4', 'rtl8_4t', 'seville']
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dsa,member', 'ports', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
