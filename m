Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D471C5F27
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694338; cv=none; b=rKcH4cqv2XZ53EOGUmqwB9bIPui3gduLUujKDHynm0RLFz6nG6WFTNdVl/d861PZ49vN5QVvLYRai0t2cqkJobFg61QC5+XACT84WITmAKuAJmoImXVPKmyvqd8GCxiXQif+T/4sjtysBoMq9HVV2dFuTKaHRHcI62bmdf0gwxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694338; c=relaxed/simple;
	bh=h8rcratDHL3CvyN47F5e5qA7msi5dq/SRbFvgAOsqiI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hpzKBRcJXI89RnoI/QG4Q0GSR1+y2JZRrgP2UEx/mtDOtPXNUpvQCJbtp9r7iFop1/czPR6jS7vHA3xslSFLIUwK3qqbQBEUjOmg8Y8r9ApadM0kO3nYZ/MPTlu5BW5ruIIIAjwyJyYNozZnCkXjhXsIM+PlCine8ZyGnlsXgiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jeZwiXUT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeZwiXUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734694335; x=1766230335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8rcratDHL3CvyN47F5e5qA7msi5dq/SRbFvgAOsqiI=;
  b=jeZwiXUTUIEMiH8GRrtjOoUH+QQ9riZOtIKnWQpSon0sql6Deki423Hh
   e4S03Uk/XGzVupEdk7HywLOJe+rMLsvnOK9rcbUPK7FcEgwp1GldTcmkH
   YGN/eHbm5n+FdP6quKzlJU+qmmsOeWhcp/SJwJHxy7TztbojWJdR2nK68
   tp5KX25CC6BmOvu8s89pEInS7tfhgxRxIuaX8FLvHtmFMClQuSAROWGyg
   XsxhhjHkMXy0gZVyKnqYyv5hXUxeb/hbc767C9PFjc/HCNsDODW7gfLgT
   5RdcYIBwtea28J/SuXkHLULL/JlfoD1bihz2jb3ieJFb9S14rDHqFXPmz
   A==;
X-CSE-ConnectionGUID: QxUuxHuwSfqv+5dSq1zlFQ==
X-CSE-MsgGUID: IdUcs4hpSFCle+XpO9Dolg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35407859"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35407859"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 03:32:14 -0800
X-CSE-ConnectionGUID: MmdqX+ejQKiPDkPo5kYa8g==
X-CSE-MsgGUID: QiSMCwyAS16/w9WzAyuVPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98397693"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2024 03:32:14 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tObEp-00016B-1J;
	Fri, 20 Dec 2024 11:32:11 +0000
Date: Fri, 20 Dec 2024 19:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.12 436/540]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb:
 it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios',
 'interrupts', 'no-laneswap', 'port' were unexpected)
Message-ID: <202412201921.92uVUuKC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   76e007709ba23b69273c6c8ed1a893c1ec7b7df7
commit: 4e2088a2e8742fb8b8bbaa38d96339afeccd8d6b [436/540] CHROMIUM: arm64: dts: mt8183: Add Kukui-Jacuzzi-Makomo board
config: arm64-randconfig-053-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201921.92uVUuKC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201921.92uVUuKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201921.92uVUuKC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'ts3a227e_pins', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev0-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
--
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: pinctrl@10005000: 'audiopins', 'audiotdmoutoff', 'audiotdmouton', 'cam0@2', 'cam1@2', 'da7219_pins', 'dpi_pin_default', 'dpi_pin_func', 'ec-ap-int-odl', 'gpio-line-names', 'h1-int-od-l', 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'it6505_pins', 'pp1200-mipibrdg-en', 'pp1800-lcd-en', 'ppvarn-lcd-en', 'ppvarp-lcd-en', 'pwm0-pin-default', 'scp', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5', 'vddio-mipibrdg-en' do not match any of the regexes: '-pins(-[a-z]+)?$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/pwrap@1000d000/pmic/mt6358codec: failed to match any schema with compatible: ['mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: it6505dptx@5c: Unevaluated properties are not allowed ('hpd-gpios', 'interrupts', 'no-laneswap', 'port' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: syscon@13000000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: dsi@14014000: 'port' is a required property
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-rev3-sku0.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
