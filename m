Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250499;
	b=soxuwCRxBHpSW+t0Nx3AOevCwVS0i14H4DdEY5Mgvji29S74UOO7MTaUGmk15zQNXMd7
	 Y1m3ElffPPx07PfHZnkPmVo/GGMHtjPlXEAXuFC4L3IhHt26RdP3ZbK47OqaSnSk55qnc
	 /n0nD5WO4TNvMsWmjQAoMyr3N+3VxSoSs6duaHxlgjqqZNQH8vQQ8VwCN6wWLylIp+lAI
	 spwicMY5IuQrc+++NdQ8//1TucXxuvwYWqQPrs6t8td+ebZMo2I/bsYmPr8tHptqRnD88
	 V1aP03Iq8Vio6ysJSPuRo3jMG7CLf+I14F2CLJFClcd0mBIEjEgJq34fwyEYoIaYzsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250499;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=z5tv9DmsVlfaOrDHGVZcAZknpsaqYvoVDUAtqf5lS9s=;
	b=tORcpwutue0h9cUiyjZS0d4QEK8VaRVVG+2Z3usjD1iP7kUX+HyvLwwNNesevg8x+o/H
	 ttZYFKdoCtqHoPmMF9bLkaEbQNbAbYZxPfiKLo2ansd5T2hQ8pib3F+3/1cLPzhW7W1oX
	 nVqiz6FFV9Rkc3n1wDD1Eo3AN9+sFn15SIfv6b6PS9ERHloFAxdDSj4C/jcLJz+TKW5r+
	 VO9dENVuTYYYP8tcgxcWLa5EEEpC85gZt5XlzdK+OiQ30LZTncnYGSsO9miby4qefidlq
	 mIgFl34kSdo3P4fsrFiZEubrze82zWixFuzsmznR7S3/CWWW4w/Ul7Kh/s3soekR+uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hFYjCUP+;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B04606A325
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 18:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B04606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hFYjCUP+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794250498; x=1825786498;
  h=date:from:to:cc:subject:message-id;
  bh=SRUqjaun/+afTip/cdUos+FXbZz7UY43jcc871xVD3w=;
  b=hFYjCUP+HkjQ+c64P8FsKL7nz2U5V+jWPEHO9E9jRpd2koCkBC7XYa9p
   g3oYxoMxGAVOo/s+xHm2ofZy/zMRhezoXVl0gLk3EOu7Rbp+ISS8MG/sJ
   Q48UacYm+UaDnw7tCR+pETk9AEbJixMky/tehW0Ag2gkXbn7BD4Nk7Ml9
   lLuGeANynRlkjRbqrg1k2titvwaRRJxrWBOqYo2pzeXE87ZN/rfvN4bF+
   pDucrw+/b0yNOxlIUTcgfWaFq/iZtRvDd9WBhyp0SBC4P+pXnYuC+svdY
   t5oavmYOIFdyP3HkBroNQ9FkX208KxKK032aPcz9HK9e9gMYUA50Rwdl3
   g==;
X-CSE-ConnectionGUID: gGp9+5LAT86kXIqbTwrtNw==
X-CSE-MsgGUID: qTaZIFYLRGOoNid10MLW2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3069961"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3069961"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:54:58 -0800
X-CSE-ConnectionGUID: yERVHtgsQsGlaW25tav7CA==
X-CSE-MsgGUID: dvaoPAG8QZ+8ns+sdY64ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7826557"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 09 Nov 2026 10:54:53 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQUW2-000000000Rb-0rVD;
	Mon, 09 Nov 2026 18:54:50 +0000
Date: Mon, 09 Nov 2026 19:54:21 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 54/154]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10080000
 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611091936.ZPPTh7XX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: c1a0368094ca73231f1a761d2314d399c788b840 [54/154] arm64: dts: add usxgmii pcs and link both pcs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611091936.ZPPTh7XX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091936.ZPPTh7XX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091936.ZPPTh7XX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-emmc.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn15.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
--
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10060000 (mediatek,mt7988-sgmiisys0): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: syscon@10070000 (mediatek,mt7988-sgmiisys1): pcs: '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10080000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb: pcs@10081000 (mediatek,mt7988-usxgmiisys): '#pcs-cells', 'phys' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
