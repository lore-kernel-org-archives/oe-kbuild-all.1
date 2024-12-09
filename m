Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B72AF1B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717064; cv=none; b=ffSvyMeZqRLRRLtZ/rs19olWZSuYVLbtTo9YS8PifR4r6BfcPMLNCNnHnzbZPkdHKfksdCDS4FC++Tlq64K/oeToR4Dz80KyMwBHDVqHG4c2r8qNFRg1dZqm0HWQpP79n8i6P5nhSP/nbuuO69fsmhGztejhqKh6xseW6HTKkQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717064; c=relaxed/simple;
	bh=IGxnR/9abIV/8AX+Px7Z546LvXUWR7UDdCD4cEBaVl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JfIQ8GQr9XFFngrnI8YzWav/OWFqoTWq+kBaHRxRVynz2B+UpN+AaNItqN+kJ8PpbXHENfnpC7yMoty9CugsG5jbuTum0y/mfoSR8YjCQsaJhi+ZKWAjAJrO3FcWe5bvTjs71inXnwjgFCROETnW27wwvmhdfaAK1Ng8TY2HcRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYqHgn1h; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYqHgn1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717063; x=1765253063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IGxnR/9abIV/8AX+Px7Z546LvXUWR7UDdCD4cEBaVl0=;
  b=dYqHgn1hrKgLSZRWcywRblveSNxai3ofR0m4yK19pCBu78VJDyU3f4Nw
   C3XIrqATDxEbVPV0l7JWqfammEzsRpLhRMFXKwD1ub3ycQw0o3oGcT8DA
   anBbqZjvDcn6NwBGf8w9zHXC7syipkvdPaVHVkgxZN1e+O3+LJUI2uYCp
   r2aSblqhqzCt7jUreGMhtf554RJjVb5NwS3Wk0r3oLt1sPmcl/Z9vOFGz
   Yzwy6GK/mUXqoHG/si/1F7LfMH7Q8By/2cwB6psSvYxl7SQhwyKn2bzbj
   JxBvW0bmL4SibFnndQXHvfPgDwitb43bIyQ47JwCqyIXPgaweiaFDbDGh
   Q==;
X-CSE-ConnectionGUID: ZnCGGdBZTzS8Cc8f2SFEPw==
X-CSE-MsgGUID: sfmu2LCzQ3CJ8pI6DfpRBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33923666"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33923666"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:04:06 -0800
X-CSE-ConnectionGUID: yFofg0VVTtyWEnS5jAZXUg==
X-CSE-MsgGUID: QA+rLtSDT6OMJizThHFgxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95150826"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Dec 2024 20:04:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV06-0003mT-01;
	Mon, 09 Dec 2024 04:04:02 +0000
Date: Mon, 9 Dec 2024 12:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.12-main 32/66]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: efuse@11f50000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412071112.MYkfVzJ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.12-main
head:   63f5c68fb1c45af50c6178c710e89d311c2c5c84
commit: 743b1a5445bb72bba71015a572ca4f3ed35c7573 [32/66] dts: arm64: mediatek: add MT7988A reference board device tree
config: arm64-randconfig-051-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071112.MYkfVzJ2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071112.MYkfVzJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071112.MYkfVzJ2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/tphy@11c50000: failed to match any schema with compatible: ['mediatek,mt7988', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: xphy@11e10000: $nodename:0: 'xphy@11e10000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: xphy@11e10000: compatible:0: 'mediatek,mt7988' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: xphy@11e10000: usb-phy@11e13000: 'mediatek,syscon-type' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/xphy@11e10000: failed to match any schema with compatible: ['mediatek,mt7988', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: efuse@11f50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,efuse'] is too short
   	'mediatek,efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7981-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt7988-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: efuse@11f50000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: switch@15020000: ports:port@6:phy-mode:0: 'internal' is not one of ['rgmii', 'trgmii']
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: switch@15020000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mdio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet-phy@0: leds: 'gsw-phy0-led0@0', 'gsw-phy0-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet-phy@1: leds: 'gsw-phy1-led0@0', 'gsw-phy1-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: ethernet-phy@2: leds: 'gsw-phy2-led0@0', 'gsw-phy2-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
--
   	'mediatek,mt8183-i2c' was expected
   	'mediatek,mt8186-i2c' was expected
   	'mediatek,mt8188-i2c' was expected
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt7988-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: i2c@11003000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/i2c@11003000: failed to match any schema with compatible: ['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: i2c@11004000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
--
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/tphy@11c50000: failed to match any schema with compatible: ['mediatek,mt7988', 'mediatek,generic-tphy-v2']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: xphy@11e10000: $nodename:0: 'xphy@11e10000' does not match '^xs-phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: xphy@11e10000: compatible:0: 'mediatek,mt7988' is not one of ['mediatek,mt3611-xsphy', 'mediatek,mt3612-xsphy']
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: xphy@11e10000: usb-phy@11e13000: 'mediatek,syscon-type' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/xphy@11e10000: failed to match any schema with compatible: ['mediatek,mt7988', 'mediatek,xsphy']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: efuse@11f50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,efuse'] is too short
   	'mediatek,efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7981-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt7988-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: efuse@11f50000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: switch@15020000: ports:port@6:phy-mode:0: 'internal' is not one of ['rgmii', 'trgmii']
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: switch@15020000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'mdio' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet-phy@0: leds: 'gsw-phy0-led0@0', 'gsw-phy0-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet-phy@1: leds: 'gsw-phy1-led0@0', 'gsw-phy1-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: ethernet-phy@2: leds: 'gsw-phy2-led0@0', 'gsw-phy2-led1@1' do not match any of the regexes: '^led@[a-f0-9]+$', 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
