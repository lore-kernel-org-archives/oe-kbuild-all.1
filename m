Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009371DDA32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732295636; cv=none; b=bUcVQQ1hXHb4tqQxRzL5SkdZ1pZ3F615nbJCKLZ+u6xfWDT9nVyhNKGDUwSTk4TaQpmo/0o85yNOYtBTpNJf0pCH4fQlqCH7IgBI6w720p1dCPy98Xw+xL+LH4uiAbL6u3c6+UQxhUnzWisGgaSD1wY+Jl3uNF6EtAGJu8eEGH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732295636; c=relaxed/simple;
	bh=+nc4xsLEqlF0CPG8eKJecVBICgMCP0g1v6pglCfjsBs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K2vXP/Bedd8k660MFVbRRWTYtnBuR6zdgcX+0M929nJIrFg3v7T0MdbsJZ826m6D55BDiJ8F8MwIARN9xhjAsj/uZWj2XcHBd/jXs6/90TWW4D06ZkFFkU4fKsBw69/xim/cxgeUfsNb1NiNlU1781LFScryPk73VVchkbQg20s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+Ab3fiO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+Ab3fiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732295634; x=1763831634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+nc4xsLEqlF0CPG8eKJecVBICgMCP0g1v6pglCfjsBs=;
  b=c+Ab3fiO1V29QNqSqLNzAJVlMKsIdnD6SShPvsO5QAlQ/Kd7rPYxFFm+
   4o5lWz0kpGzwzCQnULncGuziikkJ8zPXg0pwRy1CpTPzPZz97YvAxPL1o
   mwPpEzoOCcmkc53oA34pmiYbuWu5glYxevrdEL683foorCnz0j+8+HCWw
   dTrtfVjFtcW01kyulQKfkp4ClXvZUWu554pL+EJn4P1ASgUod8CpX+JLz
   5t73XwB4hMYnll3bHvzsKkz+R5XM9/3Z+GMXHZYOsTV0l8F9VgXbCkLTY
   RTP/XL5/UvCoNwi8zcQWsGcCG9z+piXWpLDYMJt5bpiQDkVh7poW5D+Ga
   w==;
X-CSE-ConnectionGUID: +2vSlkmbTPSFM5wgSQrB7A==
X-CSE-MsgGUID: ZCPcktbGSxmyX5tD+Nxn2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31846714"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="31846714"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 09:13:54 -0800
X-CSE-ConnectionGUID: VQEHQyewQ4SfUf/Sbeb20Q==
X-CSE-MsgGUID: hCftBb9kRtOLYklyZjN8xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="90806203"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2024 09:13:52 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEXE6-00045z-1e;
	Fri, 22 Nov 2024 17:13:50 +0000
Date: Sat, 23 Nov 2024 01:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 8/12]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed
 to match any schema with compatible: ['google,steelix-sku131076',
 'google,steelix-sku131078', 'google,steelix-sku2147483391',
 'google,steelix-sku2147483646', 'google,steelix', 'm...
Message-ID: <202411230156.4GuM63aT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   df8c1b2852c0b86a1037c2e27705c67293feb40b
commit: 93d11643735238c309981c90a447a8ee2d705161 [8/12] CHROMIUM: arm64: dts: mt8186: Add unprovisioned SKU IDs for Steelix
config: arm64-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241123/202411230156.4GuM63aT-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230156.4GuM63aT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230156.4GuM63aT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,tentacruel-sku262144' was expected
   	'google,tentacruel-sku262148' was expected
   	'google,spherion-rev0' was expected
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	'google,elm-rev3' was expected
   	'google,chinchou-sku5' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131076', 'google,steelix-sku131078', 'google,steelix-sku2147483391', 'google,steelix-sku2147483646', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131076', 'google,steelix-sku131078', 'google,steelix-sku2147483391', 'google,steelix-sku2147483646', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131076', 'google,steelix-sku131078', 'google,steelix-sku2147483391', 'google,steelix-sku2147483646', 'google,steelix', 'mediatek,mt8186']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /: failed to match any schema with compatible: ['google,steelix-sku131076', 'google,steelix-sku131078', 'google,steelix-sku2147483391', 'google,steelix-sku2147483646', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131076.dtb: spmi@10015000: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
