Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294171EB1A4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Sep 2025 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757782257; cv=none; b=Gg+Oycrrk/UvjuXDeKvEwPiqAUDL6Vvh2R8cZ15x/ZXz1koFBdD7xVcbXgzuAXvt1Sztqz5O5QiEt7lrbpklZggYnndUG91o49EbKVDtx4rjAThnBm065FBXwGr7f/qXIEQSWwfAvB9kW18wl3J2BrVYNlo+g1JyN6nxtga9IXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757782257; c=relaxed/simple;
	bh=nQrBt5BgT1y8TzoC58ExMgISVtXM2zmiXXz0xAHdFLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=snNBfJn8yegAM5NQg+GGUHOXRzSZe2QIQpxE79XdNNX5r04ZevjKcUnxt9KoBfh5T/K9pJLLn7c27e3okbtbKlIkAMuIwtTLB+oy4f8Zgh7f6GWe8lEkOIsPpovjQYxafjmje/QgDLrwzbcgkmtVIr269XFanlyeIQ3urDZDn08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lnSem1NJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lnSem1NJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757782256; x=1789318256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nQrBt5BgT1y8TzoC58ExMgISVtXM2zmiXXz0xAHdFLs=;
  b=lnSem1NJ8alIV4KQfjucGo+gLt01RTFvwPGXJqHT6u/qZhYN9oqNHejL
   fNykIr5MrRbrbYR191I4KYh92G+Ko/6QIjSdHU8uOieS9IbCY4yE/FaRX
   HeFjc5Ji1lznyLdDKZFQcw7+7U4nhYwbSbexpiv2AYT8Hj+UcZ3rSxY4y
   GXdR3QGhOE8kmgMvFUmvVyaXXB+1hDZ4SsTR6Kg0KnlBV13X6euFFCpht
   RQlxvqrJK9X/30xpTlHdhlEU0e9UeN83fhZVMf6ZkamZgbVMOkQX4I91k
   x5URyHYAgxit5CHo17979aGdSRdExZIXxGnmZ26ceKniTy6EEypFKLZlN
   Q==;
X-CSE-ConnectionGUID: l9b6ZfoORXqIwaqt79OeGw==
X-CSE-MsgGUID: sO2YPRFFS4G9H3XGNyLhzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11552"; a="77553616"
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="77553616"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 09:50:55 -0700
X-CSE-ConnectionGUID: SHvidzArRoKnD8VNJ2nNIA==
X-CSE-MsgGUID: be8hdcGJROWGBYxi/BMAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,262,1751266800"; 
   d="scan'208";a="178566973"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 13 Sep 2025 09:50:54 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxTSc-0001gS-36;
	Sat, 13 Sep 2025 16:50:50 +0000
Date: Sun, 14 Sep 2025 00:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 20/20]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: touchscreen@24
 (parade,tc3408): 'vccio-supply' is a required property
Message-ID: <202509140058.YipfYzcK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   9666592a44cc1272900debbbfacd9761b05c337a
commit: 36adf97d1cd72b15817ff9bef059f464235caf7b [20/20] CHROMIUM: dts: mt8189-skywalker-baze: Add parade touchscreen support
config: arm64-randconfig-051-20250913 (https://download.01.org/0day-ci/archive/20250914/202509140058.YipfYzcK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509140058.YipfYzcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509140058.YipfYzcK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: touchscreen@24 (parade,tc3408): 'vccio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku0.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: touchscreen@24 (parade,tc3408): 'vccio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-baze-sku2.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: touchscreen@24 (parade,tc3408): 'vccio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048576.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: touchscreen@24 (parade,tc3408): 'vccio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048578.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: touchscreen@24 (parade,tc3408): 'vccio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048580.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: touchscreen@24 (parade,tc3408): 'vccio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-jye-sku1048582.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: touchscreen@24 (parade,tc3408): 'vccio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097153.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected
--
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@11b21000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-ws', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/mipi-tx-config@11b40000: failed to match any schema with compatible: ['mediatek,mt8189-mipi-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/dp-tx@11b60000: failed to match any schema with compatible: ['mediatek,mt8189-dp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/edp-tx@11b70000: failed to match any schema with compatible: ['mediatek,mt8189-edp-tx']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@11c22000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-e', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/i2c@11d70000/tpm@50: failed to match any schema with compatible: ['google,ti50', 'google,cr50']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: touchscreen@16 (elan,ekth6a12nay): reg:0:0: 16 was expected
   	from schema $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: touchscreen@24 (parade,tc3408): 'vccio-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/input/parade,tc3408.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: /soc/syscon@11d74000: failed to match any schema with compatible: ['mediatek,mt8189-iic-wrap-s', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): 'power-domains' does not match any of the regexes: '^(usb|pcie|sata)-phy@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,tphy.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-shaak-sku2097154.dtb: t-phy@11e50700 (mediatek,mt8189-tphy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8189-tphy', 'mediatek,generic-tphy-v2'] is too long
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2701-tphy', 'mediatek,mt7623-tphy', 'mediatek,mt7622-tphy', 'mediatek,mt8516-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt2712-tphy', 'mediatek,mt7629-tphy', 'mediatek,mt7986-tphy', 'mediatek,mt8183-tphy', 'mediatek,mt8186-tphy', 'mediatek,mt8192-tphy', 'mediatek,mt8365-tphy']
   	'mediatek,mt8189-tphy' is not one of ['mediatek,mt8188-tphy', 'mediatek,mt8195-tphy']
   	'mediatek,mt2701-u3phy' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
