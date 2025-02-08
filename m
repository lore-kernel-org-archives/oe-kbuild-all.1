Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18739241C8C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739034636; cv=none; b=DeEJUwfZcSIoEGFO46OVmI3r8NOJqU6H3sKD1RRn1tohaLVzE7ATtEVrkZ7VDPpxWLNuya+bi4x3jAIrZg9jXFY9t+GYvodkqfphWfoyV7SJdyusmLje9rsWpTToxZZ9WH6icRPOCr5PbVewnySHJfxAM3hPYQ1KQgijAPbOHzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739034636; c=relaxed/simple;
	bh=nntRjvnyBnc7FPELKgaMh8ksUKpO0KI5HXshMLpIf/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmHN5k7JHr5m2yD7Hjeq43GttEF5DCFjSxNpHPd8EK2qW7CxQXpGK/0VCbNI2g8zavWV8lqlihVZ/5mUwaeYnmam0vTeTMujCbVtwwWms7TmcccebO1pjCFuCEuXYHQ8c8GeQdJRYrNPKwmxQ3DrJrMjKpbmsLaP+v4KSyEROI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fM4R2bWQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fM4R2bWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739034634; x=1770570634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nntRjvnyBnc7FPELKgaMh8ksUKpO0KI5HXshMLpIf/k=;
  b=fM4R2bWQKfCAqYexPL3xp8I9ibiKr9q7eyUgwNF0MtsJiHWHvZgBDkta
   aXlar7++gSbHnxjDIYucsyB7NLOZE8/JfZsYzaBnHTlB/JbmNUvEOSEOX
   VaLB+K2wisHKoG62KACwsr0DHZa1SAHKaOBy/jM/tr3A0onfmx/nPQGDt
   52T+pkWvccMepu/TLtXaOTDHvMw2kbtEBT5wur/uSQbNF8IpZPKaphz5m
   oRWeH4wG6+To//u/2mvlo38zGHycImt0tJlGtPPZa/XxAKbzupUOBQZb3
   E/KYjt1/1VzHV3K7uc806M0uM6rzW0S3kNrqBWRbx5lBig74JtwB6KamX
   Q==;
X-CSE-ConnectionGUID: pPsEXhDvRD+FgqDGY22v7Q==
X-CSE-MsgGUID: Q3/dEuJlS0C5fOFwj/JXrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39788606"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39788606"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 09:10:33 -0800
X-CSE-ConnectionGUID: 7274/L1+QUiAU/6lJD882g==
X-CSE-MsgGUID: QQnGUDC2TAW3kPJkmtbP4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112692638"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Feb 2025 09:10:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgoLc-0010P0-2q;
	Sat, 08 Feb 2025 17:10:28 +0000
Date: Sun, 9 Feb 2025 01:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/slbc@117800: failed to
 match any schema with compatible: ['mediatek,mt8196-slbc']
Message-ID: <202502090144.Ete5fu2Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   fd00cab3fe36e486cd2aaf166b98a6a5b943a097
commit: 35ddc053cc4d9759176eeb552ab755e47d697c06 [204/204] CHROMIUM: arm64: dts: mt8196: Add slbc device node
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250209/202502090144.Ete5fu2Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090144.Ete5fu2Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090144.Ete5fu2Q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu-qos@13f800: failed to match any schema with compatible: ['mediatek,gpu-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
