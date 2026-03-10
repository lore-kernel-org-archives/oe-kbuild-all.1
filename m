Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E644B69C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 09:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136308; cv=none; b=e4Af9gYazQVo7d6grK3kwBFsUPwGNNk5+Uzf4NrwvAiDu9OXc2bCRWgKaVco5TrSJ70Az0Rw21edNc3U2xHfjeT9n2KQubkY40nF7FAtThN3pqXP/vrgbkC1tHt3OPme7oc/lBMlCs09evwsjR+rfk7Zrf5ibvgLFS/DqeTtymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136308; c=relaxed/simple;
	bh=00C4x7rp40e1o6JLvxue+G7HzwsNnqt4TaLaLqSwYvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uk/uF+PkuB2AOUbAo3F9kUV0+tj3TWs3M8Tr0ij2c++g2TM46ucx+YUY5s5o8F4QNDewNIu0FB5hc6IbDAGhR7OXWREMtT0Qd7TYs6V+1KnYarXRVT0T0otb3SiZpJf2BN6UXHai4rZo7fhmkGDJe6n8gOG+4qb4eOIwGglxp60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTutzNdj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTutzNdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773136303; x=1804672303;
  h=date:from:to:cc:subject:message-id;
  bh=00C4x7rp40e1o6JLvxue+G7HzwsNnqt4TaLaLqSwYvM=;
  b=jTutzNdjo/DfVcVVnyGhnClPX1pd3PBY6rFAvrdjUWEJj48mZTE4sgYw
   ElpD3mGAlnbl/1mvqXhIv4FsmdUaiwmoaaTDk2VWGaiEg5a3QsgRTlHI2
   1TU08BVeMxo0NRRFuQ+bNrqw3vVA2bpGXW/aR44Qd0is8WMiFQrO3+PDC
   3FqtB8zWV3G6yBYaUYpS8ieNeh+QBjs3EJ1danYoFs686YlmnrnTQy1mh
   umSEHlCr35ei+QMaw31bu88QOdUsiYSSzB2CA5IF9Yy2e/hJHPmaZ6/K8
   ETy234jZyybrk1kfXPlZNqiJbmNA2ys4XUHvAEsYUWl5vDNs+6lYf5EEd
   g==;
X-CSE-ConnectionGUID: iwqB7k0PTAilneKuQuRvew==
X-CSE-MsgGUID: ynILsjv+QNKt/rzcVzCX4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="76785415"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="76785415"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 02:51:42 -0700
X-CSE-ConnectionGUID: +XcHnYnsTkePm1ehPqehsw==
X-CSE-MsgGUID: Y75QQjswT7GhJznMDmzDaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="243074466"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Mar 2026 02:51:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vztkW-0000000032D-0jT7;
	Tue, 10 Mar 2026 09:51:36 +0000
Date: Tue, 10 Mar 2026 10:50:48 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 63/64]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb:
 syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of
 the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202603101015.Bxy0Alx6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   027868526273f2766cd140b0fb54609225da2cf9
commit: 581b4b1a71f85cfb8d64705813b030e44fd06bfb [63/64] arm64: dts: mediatek: apply bpi-r4 nopcie2 overlay
config: arm64-randconfig-2054-20260307 (https://download.01.org/0day-ci/archive/20260310/202603101015.Bxy0Alx6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101015.Bxy0Alx6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101015.Bxy0Alx6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:phy-mode:0: 'internal' was expected
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: switch@15020000 (mediatek,mt7988-switch): ports:port@6:reg:0:0: 13 is not one of [5, 6]
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: switch@15020000 (mediatek,mt7988-switch): Unevaluated properties are not allowed ('ds-mux-bus', 'dsa,member' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: /soc/switch@15020000/ds-mux-bus/ds-mux@0: failed to match any schema with compatible: ['mxl862xx,ds-mux']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: ethernet@15100000 (mediatek,mt7988-eth): Unevaluated properties are not allowed ('mux-bus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: switch@10 (maxlinear,mxl86252): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'reset-assert-us', 'reset-deassert-us', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/maxlinear,mxl862xx.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: ethernet-phy@24 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: ethernet-phy@28 (ethernet-phy-ieee802.3-c45): leds: 'led0@0', 'led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-nopcie2.dtb: /soc/ethernet@15100000/mux-bus/ethernet-mux@1: failed to match any schema with compatible: ['mediatek,eth-mux']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
