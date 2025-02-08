Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A691A9B4F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739026273; cv=none; b=ZtZRoXgohPQa1I9s4HPXQbddACKe++XTvliAeP8q4m/m1dW9+wUZcM6FcfiELzrxR5zgSIgbdBzNnbC+DnVVgk8hrNuCKwoBoAxu6loZS/jIyWJirXwLD2J2/WWpMt2ylOedWPOudlKXwyzIeMiErpEUGNzU09+0wnOKGltMXBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739026273; c=relaxed/simple;
	bh=bBRLATOfyfQQt2cYzmHhj1gtpyE1bMZwtEDTOSQq7SE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=diMsNnVkzXc3f15e2FQU97krAoCaZfSIjquwMk5klTBTqW6QVWVxON5ACaE4J+cetDgSAQAbYdr35+NnCtcO6ZqEaKrPFmQEp4L3rjabM/GyeOOdpmrLcSPkNN1/wPjyL5BLC+Bde8h/Lhm3cwx0ohZZqSY7u3iOOyT1RLLTZ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6F/11dL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6F/11dL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739026269; x=1770562269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bBRLATOfyfQQt2cYzmHhj1gtpyE1bMZwtEDTOSQq7SE=;
  b=O6F/11dLX1zrD49DtvNucvahWiWOfnY91yt00TNTmuYBrj9mISj4dpNS
   LRgMRV3I+Ojk19kbFsEKiBxPJ6sjdIgfB6umFid7BhGlVW1uxKSTlamps
   jwCzw1d1hAxYlrfOovBHh4b/+zLbB3NiM/LcKVKtlpvRSqpV9JHiMF66f
   rWIV/aXV4jrcRGBPhRwH5jNs8+fkOsUkcEGZMce440X49diQsWBnyi+Zn
   n8OFl5v7M2QBlZ5TjEcB3EBRIGwL+UcvXBXO4bE5R6dBLm9BehB1SKx3b
   +kaBD1SF+2ot7r7/fe2UfphfPStIsbJ/cRTB4z0OKpagVRKDtQXFcyffb
   Q==;
X-CSE-ConnectionGUID: nfIQw97oRFSGn3HUR0Jf5A==
X-CSE-MsgGUID: c1BBURFlRTyJtrIb9Vj6BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39548046"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39548046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 06:51:08 -0800
X-CSE-ConnectionGUID: OL+ySstkTimj+H4lprEV1Q==
X-CSE-MsgGUID: lCAQM2xJSEO63M3UzOnHWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111616101"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2025 06:51:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmAj-001083-0u;
	Sat, 08 Feb 2025 14:51:05 +0000
Date: Sat, 8 Feb 2025 22:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 211/211]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: vdisp-ctrl: 'ranges' is a
 required property
Message-ID: <202502082208.Oe8Q0UuJ-lkp@intel.com>
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
commit: d9575ab619e83df1e667b668594a153f52d16a44 [211/211] CHROMIUM: arm64: dts: mt8196: add vdisp device node
config: arm64-randconfig-051-20250207 (https://download.01.org/0day-ci/archive/20250208/202502082208.Oe8Q0UuJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082208.Oe8Q0UuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082208.Oe8Q0UuJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu-qos@13f800: failed to match any schema with compatible: ['mediatek,gpu-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: cm-mgr@c100000: required-opps: [[40], [41], [42], [43], [44], [45], [46], [47], [48], [49]] is too long
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mtk-apu-mem-code: compatible:0: 'mediatek, apu_mem_code' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mtk-apu-mem-code: failed to match any schema with compatible: ['mediatek, apu_mem_code']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mtk-apu-mem-data: compatible:0: 'mediatek, apu_mem_data' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mtk-apu-mem-data: failed to match any schema with compatible: ['mediatek, apu_mem_data']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: mvpu: compatible:0: 'mediatek, mt8196-mvpu' does not match '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._/]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mvpu: failed to match any schema with compatible: ['mediatek, mt8196-mvpu']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-mt6681-sound']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/vdisp-ctrl: failed to match any schema with compatible: ['mediatek,mt8196-vdisp-ctrl']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: thermal-zones: 'soc_max' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
