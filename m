Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F31310A11
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 09:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718445085; cv=none; b=eG92rHuoaz2AYlvCIAQFnGBBszkvglapxRPdHx4SfJ5dMOjNA01vitk8OwXJtmDe1AVt1C13qdaIBXPzEnhE4s6XoqE+jk26D2iCl0mnJpAj+BFclavl+1nOZCyBFXFpikV2YGZwuFuUa6w8RxZ5SjWEQI+549yjj6yfIXiipY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718445085; c=relaxed/simple;
	bh=A86QEglFU+5q1lBhHjKS00k1rjWlLfbjIcdqz0weqMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RdaiaOulGgsmzcjncKy2PMjWpah6gY4BbLOuv6yzGkhFZQMASv3MuTHNHOPZ55SVyKV/WGuk/TE4zvdCYFetyQu76mn2pBMv4KpTSsL4rRvav/6dLCq8qrip0K9lBv4/dUDko2k5bPY74xPeshFLphplJvoLuCZ0oQRPNtvxdkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oo9lnlmE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oo9lnlmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718445082; x=1749981082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A86QEglFU+5q1lBhHjKS00k1rjWlLfbjIcdqz0weqMc=;
  b=Oo9lnlmEJ8nROEp9i7aBJbRlPgz+6hpwdw7U3974vuoW6o6uJNh5Ialw
   WEbKGHsuUsw7XyNHqBi/pDLq5l0UFmyu7/ZRv/weedCeAoERuvYrBQFWu
   lU0pZkyiK4wBlzp2wvqdGZOn7dmeXWY+RR4bgeMSkoIKAuGRVpo94qKW6
   srgPDzxnQ6ziv/+wEgG3bwCu5H2sbIupQTqiq9Idv06rcD9/3HcNpgt84
   cUy28iO8z1bODyLanzBc/aG9coDSnhP37LqM5Z7pyx0VDitadUEfTxDnl
   8i6EKfmMHb5nDPQDq5/UO/wBCqWp8ZM6gPGwq57F3rTVARmUbUng5amHI
   Q==;
X-CSE-ConnectionGUID: StRHPUUMQHKfWs2oVi70vA==
X-CSE-MsgGUID: LRgX0P/CScCFlCapK5G6cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26018706"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="26018706"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 02:51:21 -0700
X-CSE-ConnectionGUID: FAacNhoxR/q+lj/DqVBtfA==
X-CSE-MsgGUID: YWFhz1YiTVSHChLkSZhzeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="71524827"
Received: from lkp-server01.sh.intel.com (HELO 0bcb674f05cd) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jun 2024 02:51:21 -0700
Received: from kbuild by 0bcb674f05cd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIQ46-00001S-1Q;
	Sat, 15 Jun 2024 09:51:18 +0000
Date: Sat, 15 Jun 2024 17:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/dt-bindings-mfd-syscon-split 16/18]
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: medianoc_ade@f4520000:
 compatible: ['syscon'] is too short
Message-ID: <202406151747.rFjJodGP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/dt-bindings-mfd-syscon-split
head:   035b86aab61498947d010dd7a1dd95f7343d5477
commit: d62bcc0529c132bdd0826953ebd81888d90c9d7f [16/18] dt-bindings: mfd: syscon: Split and enforce documenting MFD children
config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151747.rFjJodGP-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151747.rFjJodGP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151747.rFjJodGP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc: usbphy: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc: replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc: stub_clock: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/acpu_sctrl@f6504000: failed to match any schema with compatible: ['hisilicon,hi6220-acpu-sctrl', 'syscon']
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: medianoc_ade@f4520000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/stub_clock: failed to match any schema with compatible: ['hisilicon,hi6220-stub-clk']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/dma@f7370000: failed to match any schema with compatible: ['hisilicon,k3-dma-1.0']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: pinmux@f7010000: pinctrl-single,gpio-range: [[32, 80, 8, 0], [32, 88, 8, 0], [32, 96, 8, 0], [32, 104, 8, 0], [32, 112, 8, 0], [32, 120, 2, 0], [32, 2, 6, 1], [32, 8, 8, 1], [32, 0, 1, 1], [32, 16, 7, 1], [32, 23, 3, 1], [32, 28, 5, 1], [32, 33, 3, 1], [32, 43, 5, 1], [32, 48, 8, 1], [32, 56, 8, 1], [32, 74, 6, 1], [32, 122, 1, 1], [32, 126, 1, 1], [32, 127, 8, 1], [32, 135, 8, 1], [32, 143, 8, 1], [32, 151, 8, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: spi@f7106000: Unevaluated properties are not allowed ('bus-id', 'enable-dma' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39: 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39: 'dvdd-supply' is a required property
--
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /mbigen_pcie@a0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /mbigen_dsa@c0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: serial@2f8: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: usb@a7030000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: usb@a7020000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: sds_ctrl@c2200000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /soc/mdio@603c0000: failed to match any schema with compatible: ['hisilicon,hns-mdio']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /soc/dsa@c5000000: failed to match any schema with compatible: ['hisilicon,hns-dsaf-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /soc/sas@c3000000: failed to match any schema with compatible: ['hisilicon,hip06-sas-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /soc/sas@a2000000: failed to match any schema with compatible: ['hisilicon,hip06-sas-v2']
   arch/arm64/boot/dts/hisilicon/hip06-d03.dtb: /soc/sas@a3000000: failed to match any schema with compatible: ['hisilicon,hip06-sas-v2']
--
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@8,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@400,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@408,d0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /interrupt-controller@c0080000: failed to match any schema with compatible: ['hisilicon,mbigen-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/serial@602b0000: failed to match any schema with compatible: ['arm,sbsa-uart']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7030000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ohci.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: usb@a7020000: Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: dsa_cpld@78000010: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: sds_ctrl@c2200000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/mdio@603c0000: failed to match any schema with compatible: ['hisilicon,hns-mdio']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/dsa@c5000000: failed to match any schema with compatible: ['hisilicon,hns-dsaf-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@0: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@1: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@4: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@5: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'array', 'boolean', 'null'
--
>> arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: syscfg-pctl@10005000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: pinctrl@1000b000: 'ethernet', 'gpiodefault', 'i2c0', 'i2c2' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/syscon@15000000: failed to match any schema with compatible: ['mediatek,mt8167-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8167-vdecsys', 'syscon']
--
   	'mediatek,mt8516-topckgen' is not one of ['mediatek,mt2701-topckgen', 'mediatek,mt2712-topckgen', 'mediatek,mt6765-topckgen', 'mediatek,mt6779-topckgen', 'mediatek,mt6795-topckgen', 'mediatek,mt7629-topckgen', 'mediatek,mt7981-topckgen', 'mediatek,mt7986-topckgen', 'mediatek,mt7988-mcusys', 'mediatek,mt7988-topckgen', 'mediatek,mt8167-topckgen', 'mediatek,mt8183-topckgen']
   	'mediatek,mt2701-topckgen' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,topckgen.yaml#
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: apmixedsys@10018000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8516-apmixedsys', 'syscon'] is too long
   	['mediatek,mt8516-apmixedsys', 'syscon'] is too short
   	'mediatek,mt7623-apmixedsys' was expected
   	'mediatek,mt8516-apmixedsys' is not one of ['mediatek,mt2701-apmixedsys', 'mediatek,mt2712-apmixedsys', 'mediatek,mt6765-apmixedsys', 'mediatek,mt6779-apmixedsys', 'mediatek,mt6795-apmixedsys', 'mediatek,mt7629-apmixedsys', 'mediatek,mt8167-apmixedsys', 'mediatek,mt8183-apmixedsys']
   	'mediatek,mt2701-apmixedsys' was expected
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,apmixedsys.yaml#
>> arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: syscfg-pctl@10005000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: pinctrl@1000b000: 'ethernet', 'gpiodefault', 'i2c0', 'i2c2' do not match any of the regexes: 'pinctrl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
--
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: soc: aon-gate: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: soc: disp-gate: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: soc: apahb-gate: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: soc: apapb-gate: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: soc: agcp-gate: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@20210000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@402b0000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@402e0000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@40400000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@415e0000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@61100000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@62100000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@63100000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: syscon@70b00000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-apb@70000000: $nodename:0: 'ap-apb@70000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-ahb: $nodename:0: 'ap-ahb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/ap-ahb/dma-controller@20100000: failed to match any schema with compatible: ['sprd,sc9860-dma']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/ap-ahb/sdio@50430000: failed to match any schema with compatible: ['sprd,sdhci-r11']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: aon: $nodename:0: 'aon' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/spi@40030000/pmic@0: failed to match any schema with compatible: ['sprd,sc2731']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
