Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4054B2417E7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 03:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738899180; cv=none; b=AM17YelFhfU7njfxSAFMuvkNARsWMymU0N8oTy84uUSbpmA6c/VzkeeVNe+YhQ3aNYw/0LRFvM9g8ZmyzX6QbQfh/CpS2VxGxAKxVXcY6q+NMHxfaMycF8J2q7eBZ5DgukoL8DDODaMO7O9Ae/uzqSPuBRERlqaIYnfl+kOsBFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738899180; c=relaxed/simple;
	bh=hEYqeStaLOWJsM0d7zUphSH2chxqcJuRSkYVaF/OGIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tMpgFMpoI7xOMfJYwPdHuLoAQMdFlTqDgt2vpuke/FmKjwKD6tVpTh8f6p6+McPnHSp0CaG/XW1jVHIZdDfJ4lrM492mCNtqowL8P8KVVDq92ICZdh1qqU+gsjJuc/dDsFohDOsIv95GXB65fh8fxYbQ7NYsuDRUJ1jrTbDL/lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b15gYg9u; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b15gYg9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738899177; x=1770435177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hEYqeStaLOWJsM0d7zUphSH2chxqcJuRSkYVaF/OGIg=;
  b=b15gYg9uLJwqCBwQOT7IyzNhI/8I3zk66rKCdBKZ504ZUgzyztTMftwQ
   6n/gidWvafJKt+gfYaar5d8mS295h/Vx19KWNbagDHMWx23rJNyoHcskn
   rRBzeP9pskQS2JygFUIYPy6k3MeZGW9GRwxwt6wHVkEeLymLkauMpECQh
   DYPZjF02j0WjZVf88v9t2Kh5BS9Ir9m9cjX+PYo5KShx60XGL2DSWej7R
   YoCNmgch91Z1PqYd++zLyUVYl0voE14W/79JDne7NJqwJK/Z5RCA8if9m
   CLJkiJ9xsShja15kg46Clcxqf4DmzGNNlUK3v90QaCL3JR2XtxHUKskfn
   A==;
X-CSE-ConnectionGUID: aqwaUodLQDCjwSy0D4rrMg==
X-CSE-MsgGUID: gwJyea3+SbuQ12t5pfaurQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39440091"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39440091"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 19:32:57 -0800
X-CSE-ConnectionGUID: 5n9MSaoWRNiCsqkpAtm1Vw==
X-CSE-MsgGUID: dM/EhsOZSR2cLja6O8M8Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116027997"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2025 19:32:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgF6s-000xiR-0k;
	Fri, 07 Feb 2025 03:32:54 +0000
Date: Fri, 7 Feb 2025 11:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: thermal-zones: 'ranges' is
 a required property
Message-ID: <202502071107.a8lssm5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71
commit: 4f541a49834f56400f88a01d532fb96849bb0b25 [204/204] CHROMIUM: arm64: dts: mt8196: add thermal_zone information
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250207/202502071107.a8lssm5j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071107.a8lssm5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502071107.a8lssm5j-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/gpueb-reserved-memory@a0000000: failed to match any schema with compatible: ['mediatek,gpueb-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu-qos@13f800: failed to match any schema with compatible: ['mediatek,gpu-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@140c0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@140e0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14126000: failed to match any schema with compatible: ['mediatek,mt8196-apifrbus-ao-mem-reg', 'mediatek,mt8196-apifrbus_ao_mem_reg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14126000: failed to match any schema with compatible: ['mediatek,mt8196-apifrbus-ao-mem-reg', 'mediatek,mt8196-apifrbus_ao_mem_reg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14130000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14131000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/infracfg@14136000: failed to match any schema with compatible: ['mediatek,infracfg']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@142f4000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14400000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14401000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/thermal-sensor@14414000: failed to match any schema with compatible: ['mediatek,mt8196-lvts']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@14500000: failed to match any schema with compatible: ['mediatek,mt8196-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@14800000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/serial@16030000: failed to match any schema with compatible: ['mediatek,mt6985-uart']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm0@160b0000: $nodename:0: 'disp-pwm0@160b0000' does not match '^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: disp-pwm0@160b0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-disp-pwm', 'mediatek,mt8183-disp-pwm'] is too long
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt2701-disp-pwm', 'mediatek,mt6595-disp-pwm', 'mediatek,mt8173-disp-pwm', 'mediatek,mt8183-disp-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt6795-disp-pwm', 'mediatek,mt8167-disp-pwm']
   	'mediatek,mt8196-disp-pwm' is not one of ['mediatek,mt8186-disp-pwm', 'mediatek,mt8188-disp-pwm', 'mediatek,mt8192-disp-pwm', 'mediatek,mt8195-disp-pwm']
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b890000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b8b0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-mt6681-sound']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
