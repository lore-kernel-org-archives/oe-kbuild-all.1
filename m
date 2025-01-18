Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA21898E9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 22:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737240617; cv=none; b=ua9EKsIQ0Lck3zYQ5eN5hZPfF281+ODeyDKAPHvhDRqYWERw6j6QsQiUjrZ+lSNu7mTe+05cMAARaiZOQPc/+3ar5gk9t9TDtUTAkI53VYLcE3YZsa1AC2U545wEwY831I5+slTu+0YrCoLkkitOoKVKn5K91xJHuMa9WP2e7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737240617; c=relaxed/simple;
	bh=osuSWhOikIJ/Cq53UJ3jaWQ4tvCm0941N46ENfmt3BA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T8jwcuiDM6HN5jtMZaI4+PmZW/YyHX227fG6TUoUD34W/mrrluvZ5LiqtdSBk3oqZQgJHjai82DjJumAkSO6FHyz60SP2j4ZL+FRid9LzDZt52eR342HfaHuav1eAzq0lVkY1OhmBADCvTmgIOws7iet/8G94tSjHGKM5n0xG04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHCyRD78; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHCyRD78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737240614; x=1768776614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=osuSWhOikIJ/Cq53UJ3jaWQ4tvCm0941N46ENfmt3BA=;
  b=gHCyRD789pwvCdjUg73LxLq5nxwBzg7UbSOYccsRPfeFn2+zmlOn1xXD
   K2MWOgXA9GNI6IXI9CcJ6QkDK4k+lMzZNN1SFVbOAL3ILw7Ma9Ph2yPQy
   8fCnI86gXgPD8LOQPP2Tc0XwjcJWWWrKpzFqukaOb8DhFfFoXFPDIQa+6
   KMkVm3KbE4KAAzoRogcbrSn2D+LuwLy4rhiaublu4w94jdU0M/bJOfTNY
   ZHarmyw35cmPM+q9YQDr+sKY0E5e+MjjL7KePnwp31HgqVt+pXZP4sVI3
   TJLPrFLJJXKtpeGaOaGeY3Qyzu7Zq8FJG8GtUtSjGG0/YXFYR6bIwHB4Q
   Q==;
X-CSE-ConnectionGUID: ScbwxAyCQdGpRM1Lh39YAw==
X-CSE-MsgGUID: xB9VJGoYQOisvVOmvH+WVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48314958"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="48314958"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 14:50:13 -0800
X-CSE-ConnectionGUID: TRQWCTfdR0ixYn1xx9+s2Q==
X-CSE-MsgGUID: b5EFu9NsTauc9lJn6e8Hkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106302410"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jan 2025 14:50:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZHdq-000Uu9-1a;
	Sat, 18 Jan 2025 22:50:10 +0000
Date: Sun, 19 Jan 2025 06:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 292/292]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: efuse@13260000: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202501190654.916BMo5B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c5c75fa9e727eeea4f1aac71a5838a1bdc76d0dd
commit: 576847ca8eb1b0199ae73d2fe7d919e8b5743969 [292/292] CHROMIUM: arm64: dts: mt8196: Add node for efuse
config: arm64-randconfig-051-20250117 (https://download.01.org/0day-ci/archive/20250119/202501190654.916BMo5B-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190654.916BMo5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190654.916BMo5B-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'mediatek,mt8192-i2c' was expected
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt7629-i2c', 'mediatek,mt8516-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt2701-i2c', 'mediatek,mt6797-i2c', 'mediatek,mt7623-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8365-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt6795-i2c']
   	'mediatek,mt8196-i2c' is not one of ['mediatek,mt8195-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/i2c@13190000: failed to match any schema with compatible: ['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@131b0000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-w', 'mediatek,mt8196-imp_iic_wrap_w', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@131b0000: failed to match any schema with compatible: ['mediatek,mt8196-imp-iic-wrap-w', 'mediatek,mt8196-imp_iic_wrap_w', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: efuse@13260000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-efuse', 'mediatek,efuse'] is too long
   	'mediatek,mt8196-efuse' is not one of ['mediatek,mt7622-efuse', 'mediatek,mt7623-efuse', 'mediatek,mt7986-efuse', 'mediatek,mt8173-efuse', 'mediatek,mt8183-efuse', 'mediatek,mt8186-efuse', 'mediatek,mt8188-efuse', 'mediatek,mt8192-efuse', 'mediatek,mt8195-efuse', 'mediatek,mt8516-efuse']
   	'mediatek,mt8173-efuse' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: efuse@13260000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/efuse@13260000: failed to match any schema with compatible: ['mediatek,mt8196-efuse', 'mediatek,efuse']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@13930000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long
   	'mediatek,mt2712-i2c' was expected
   	'mediatek,mt6577-i2c' was expected
   	'mediatek,mt6589-i2c' was expected
   	'mediatek,mt7622-i2c' was expected
   	'mediatek,mt7981-i2c' was expected
   	'mediatek,mt7986-i2c' was expected
   	'mediatek,mt8168-i2c' was expected
   	'mediatek,mt8173-i2c' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
