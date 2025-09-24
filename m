Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C3D26F2AB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758698901; cv=none; b=HTGRidn+6hDkFKe9mWlGcDhjo13NmQgvSeAw+Jqzfhr9NxG2sbRe1gBI4Db3u2YFqWRjBewQgOlXu2q3DW3A+t3+rxVkCpQ1GwXn43ANhZLayt2bdBT5nAGIcyN0DJnhbWJzJJjNWxz5PGnzTvEZhWjpcsxj6PeSfQZ0icS7/b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758698901; c=relaxed/simple;
	bh=KFbupJjt4UrBg6ulAOujpiSXm+jjaLbrpymbUts31w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T34djUy/2cW0fkkOvtzk/YQ8dLYr9hSFOhTDloyPW421vP6M7W64g0yx5KlG5maOKyLAqzcvmThnmS84N4Ey9kkMK2AR277rMtNhHSYhSGPXlN8JA8V/XTYK7HfoQZzQAvnWl93CSVSg9c9ciZaVabkEfJbAPe0ctGR5Yzampz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DV2TVLZF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DV2TVLZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758698900; x=1790234900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFbupJjt4UrBg6ulAOujpiSXm+jjaLbrpymbUts31w0=;
  b=DV2TVLZFZk/ftJzE/H54ow4GZJjga9Q2J0942898npEsLLn2mSRiMyKZ
   kRITmbrkyz85ghtGL1sLEQwFJPNZzkLXui2RxqemWrSAQXYbbTJcNmZpQ
   xqR8pZJnhdss6Ze/LylqVO7U/3pCwBZro4jKCdGaF/GoaRST8Dhrti6Yx
   CSigbpVhPGHdcF1u0XkWqSIcxc3O5u4iZ3m+3HYUdhwcsxGhqJBBOo5HK
   4XLdp6H7qxbgZra4jBdYgsONeeJf5hRwwolMvLan3JnSjJXgvFRNgh1fB
   Sg2kvqCHC+su69nQ41OC5IfGNUW8RjvbbYCEsspmtxM8C6Z2HrtmKWAAc
   Q==;
X-CSE-ConnectionGUID: a/nSECqxSLCCXskgil4hDQ==
X-CSE-MsgGUID: IqvrxeaNQDSgiIOexTZuLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60877758"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="60877758"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 00:28:19 -0700
X-CSE-ConnectionGUID: kp/d2HlaTUKBdhwFoinD0g==
X-CSE-MsgGUID: 79HuYEgiQpevQjbmrQMbIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176568550"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 24 Sep 2025 00:28:18 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1JvD-000000004QD-3uIN;
	Wed, 24 Sep 2025 07:28:15 +0000
Date: Wed, 24 Sep 2025 09:28:08 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.17-r4lite 25/116]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: chosen:
 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer',
 '^pinctrl-[0-9]+$'
Message-ID: <202509240952.ODf16tuU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.17-r4lite
head:   9a70bbe70bba99a85bc2ae4e361c254101229422
commit: 62b94d28b83e4e073182c373061e73e66f94b4ab [25/116] arm64: dts: update bpi-r4.dtsi to actual state
config: arm64-randconfig-2051-20250924 (https://download.01.org/0day-ci/archive/20250924/202509240952.ODf16tuU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509240952.ODf16tuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509240952.ODf16tuU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: / (bananapi,bpi-r4): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: / (bananapi,bpi-r4): memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pcs@10080000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pcs@10081000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: eeprom@57 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: gpio-keys (gpio-keys): 'wps' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:715.26-737.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: / (bananapi,bpi-r4-2g5): memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: / (bananapi,bpi-r4-2g5): memory: False schema does not allow {'reg': [[0, 1073741824, 0, 268435456]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/pcs@10080000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: /soc/pcs@10081000: failed to match any schema with compatible: ['mediatek,mt7988-usxgmiisys']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: eeprom@57 (atmel,24c02): Unevaluated properties are not allowed ('address-bits', 'page-size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: chosen: 'rootdisk-spim-nand' does not match any of the regexes: '^framebuffer', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/chosen.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dtb: gpio-keys (gpio-keys): 'wps' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
