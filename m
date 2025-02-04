Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AFD21578C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690057; cv=none; b=nwVRtdkn/BwdEjeGu6UBJIce+rNYD6m3wYBfK7QwlfCtJppdstS9w7/GCXUru/W+eOu804D83dgM0lxM2HTDIU3AqPxd/JgT1N+5IvGCdYKBoowRfvA58o+ZOpirt5mjDY7yFZI375JK7kJRR0iuOvGbrNNL7qNkyD2emf2SGCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690057; c=relaxed/simple;
	bh=dg+wVMWuHJfilLm/ymamJNxBannhkgAGV6ThlFDh1BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6cq89siuUhConG1EfDtoX6POSregCoZO3iBei1a7MwSlBeCM/lhxngy6Qf9hbEXgKKIVwfRw/mwAeg8it9IXDYK2py7GRujkAHRd5XU3t/NfQByIgDKjSBRGrfWy6LOKD4A65YV1NCAxuhlJeekj2fLl0hrediDp0hdeMKf8Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnapsufQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnapsufQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690056; x=1770226056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dg+wVMWuHJfilLm/ymamJNxBannhkgAGV6ThlFDh1BE=;
  b=BnapsufQoy2jvMxw8JG7WIsIOlo6OQjhg+6HdKCDIGLBsmBpiL84LbtG
   yX3urQ4t5C+aINZNHX8wqsmSDavCBHuVKGBJYxps6fuPUJ25aoaP+Tuhy
   WWCCPGqksM0X4Ca/9qzEGYArlCBfeITKr/C5R1d9KyO4HsyzpUG73xjiz
   DvzRj+HPYI4YCAXYxuV5cXvCMTVJh/5z1oFfOClkY/Rxow75w+V/Oiu9d
   h9qs1NO8ib/UkD/DA6nuGC5eW7ybjh6PGJgvAG2hkel14Fun2iw1t73tM
   TEesxwYzH3Vu6ZqlUD5xnM0rK1ZPOMJofDHBGhQhe7niloWQbTRNUyzTI
   g==;
X-CSE-ConnectionGUID: Mz1WmE0SRAWHPRZ9c5mPjw==
X-CSE-MsgGUID: loyIHbErQ/OvdD/uQ9zMyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56654388"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="56654388"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:27:35 -0800
X-CSE-ConnectionGUID: JyMMJWHoQiuGXV53cLKFTg==
X-CSE-MsgGUID: 6D/jVUXLQeekxg7eochokw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="111238016"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Feb 2025 09:27:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfMhv-000snZ-0d;
	Tue, 04 Feb 2025 17:27:31 +0000
Date: Wed, 5 Feb 2025 01:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 35/35]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm0@160b0000:
 $nodename:0: 'disp-pwm0@160b0000' does not match
 '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202502050123.tCGjEYEf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   214a5686718f4ddf23fe02a3df2a4b37b05d1ed4
commit: 45e3c3db4a7683df4312ed68cad0be0757a21052 [35/35] CHROMIUM: arm64: dts: mt8196: add pwm-mtk-disp node
config: arm64-randconfig-051-20250203 (https://download.01.org/0day-ci/archive/20250205/202502050123.tCGjEYEf-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050123.tCGjEYEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050123.tCGjEYEf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14126000: failed to match any schema with compatible: ['mediatek,mt8196-apifrbus-ao-mem-reg', 'mediatek,mt8196-apifrbus_ao_mem_reg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14130000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14131000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/infracfg@14136000: failed to match any schema with compatible: ['mediatek,infracfg']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@142f4000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14400000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14401000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14500000: failed to match any schema with compatible: ['mediatek,mt8196-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14800000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/serial@16030000: failed to match any schema with compatible: ['mediatek,mt6985-uart']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm0@160b0000: $nodename:0: 'disp-pwm0@160b0000' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm0@160b0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm0@160b0000: clocks: [[38, 33]] is too short
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm0@160b0000: clock-names: ['main'] is too short
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-pwm0@160b0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-pwm', 'mediatek,mt8183-disp-pwm']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm1@160c0000: $nodename:0: 'disp-pwm1@160c0000' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm1@160c0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
   	'mediatek,mt8173-disp-pwm' was expected
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm1@160c0000: clocks: [[38, 33]] is too short
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm1@160c0000: clock-names: ['main'] is too short
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/disp-pwm1@160c0000: failed to match any schema with compatible: ['mediatek,mt8196-disp-pwm', 'mediatek,mt8183-disp-pwm']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16110000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16130000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16150000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16170000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@16190000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@161b0000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@161d0000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spi@161f0000: failed to match any schema with compatible: ['mediatek,mt8196-spi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: i2c@16200000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-i2c', 'mediatek,mt8188-i2c'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
