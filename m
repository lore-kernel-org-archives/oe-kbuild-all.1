Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E183A0B13
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 16:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058078; cv=none; b=B9iEbO8SG4TTuy5060lj/zKUBTB39s6kZudXzY6P9DfD74BRbLWJ6Koo35LDodzSgo3yub8iog14VO2pfl0qdPtiCgypAgSau3xjwIzsThz0xfVaJkYPxGXwTBCsDc6nnd9KEGMKNbG1N4BfOs/FF/qY/XTXB2wqseBU7/9koFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058078; c=relaxed/simple;
	bh=n6umMU+nS/qxcftrSelR2/SVdiBBTkDwpMutFB0bdGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LTsvCCoyakKWYRNqxku01bn2mWYInTYyzBlC1dup0az7UG97I+QV+TY9HFx6Q5M5OzoYDyiBpMd2lgF9PZeTMe1wm46WeBrdb2PnWDHeEtcrzRsBFw2PTPA8NiPYwqnc9iQad+3kv5dLfPmHusXwIUaVrZsgTIylUQRbKxdyKLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/W85ApW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/W85ApW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789058075; x=1820594075;
  h=date:from:to:cc:subject:message-id;
  bh=n6umMU+nS/qxcftrSelR2/SVdiBBTkDwpMutFB0bdGY=;
  b=T/W85ApW1PzhpD/7mihpWIUdCg9MteyyydI3kLnBgkAyEFp9zg+OKf4U
   y80F4j9jdMB/ybKLyvzuRVhNje/Upi1Ok0LLfmAez/XUNLTcQlZZnwgNq
   mnGDZXBG5R3/gHG2eEYPECVrrMMddyH3UnpqbRP3ukBsYidqqx78paXmz
   1PlaXU7KgSxfVSLUAeZJIjTYQCViUKpQHL7CA9/gUsgmp+bnkBf8GGw5Q
   IdzSouT50Iscqxv6v+vq2x1gz4sk22qlwNIlr3naoHAiLFBqvrH9wBE6R
   ittJcvaeoL6jbBnHr8D92SXXKT8E8wIPlS6nwq1VRlbr7st7wOHJESj+7
   g==;
X-CSE-ConnectionGUID: Tj0JV/UmTm+LGwxJhNFKrQ==
X-CSE-MsgGUID: qVfKXr6sS1S9yjdrTLRhEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="107030751"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="107030751"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 09:34:34 -0700
X-CSE-ConnectionGUID: 7Ejdwwv+Rj6ORPjc1NMz+w==
X-CSE-MsgGUID: KbHhBQgIQjG8L0Qtp6YWdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="36310"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 10 Sep 2026 09:34:32 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4hjK-000000000SR-2zWz;
	Thu, 10 Sep 2026 16:34:30 +0000
Date: Thu, 10 Sep 2026 18:33:59 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-main 213/213]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb:
 pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0:
 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1',
 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1',...
Message-ID: <202609101834.TV4vj2d4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-main
head:   e2b8c6a7a01daa29f0109ecfd5d0fa93e27da8bf
commit: 69ec6676065d067b5ae08cfa0ec425f6f2ffc0da [213/213] arm64: dts: mediatek: mt7988-bpi-r4: add uart1 / uart2
config: arm64-randconfig-2054-20260909 (https://download.01.org/0day-ci/archive/20260910/202609101834.TV4vj2d4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101834.TV4vj2d4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101834.TV4vj2d4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
--
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pinctrl@1001f000 (mediatek,mt7988-pinctrl): uart2-3-lite-pins:mux:groups:0: 'uart2_3_lite' is not one of ['net_wo0_uart_txd_0', 'net_wo0_uart_txd_1', 'net_wo1_uart_txd_0', 'net_wo1_uart_txd_1', 'net_wo2_uart_txd_0', 'net_wo2_uart_txd_1', 'tops_uart0_0', 'tops_uart0_1', 'tops_uart0_2', 'tops_uart1_0', 'tops_uart1_1', 'tops_uart1_2', 'uart0', 'uart1_0', 'uart1_1', 'uart1_2', 'uart1_2_lite', 'uart2', 'uart2_0', 'uart2_1', 'uart2_3']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7988-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
