Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4698B28EC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 00:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739062652; cv=none; b=sYfSWxmyNNt4rYE7X0QcAL2+Q5N3cUF2wcVjh/ZQlnXfdN8nG4KwE1o7SDeXrk0uIe3SegCT8Xo4BonVp3HqjfMRRuLZ19Of+yrqSvaHf8G2lH6mZE7f6XL7cBJ6oOtPD5tLoV2m6reJMYdffUg4iAgctny8uwnuiQo139xTBww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739062652; c=relaxed/simple;
	bh=7w4+kppTgZohNvzQA1x6+88TLBHVsAwuRBQTgVyEciI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAbJKeoZ/eudE8wWsPyvpA4Of/ddcm8Jv2CMjBqVLtVoO6BEQv+x8yS8U0i3tl+3vtFv8Ts+qgbcY2Z2y8hM5mpDE4k9k/Tv1EYWAHNfZcDBR90M2e4tOmgttE3gk9hygEajYWsKna+3yQS2atbv9jP0QS61QMN15iWFGzn3BdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H5Vf5/So; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H5Vf5/So"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739062650; x=1770598650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7w4+kppTgZohNvzQA1x6+88TLBHVsAwuRBQTgVyEciI=;
  b=H5Vf5/SoPQGwIgPN2iy+JMxPrRLnQRqagKjP3UPxJDfE6JrDz2P4AnA1
   xFIpFwTdPl/wYtDMnCLOYMo/wMa+8zr9YdJRf/FiuRljs3gRO4/pp5/zk
   oIrU4OvgiqC9058rv+fZU17HYgwHRajvBeJWuxk01urbh7qNptjtYyenG
   Ya1T95JR1TDVff749sdAAhSQVJlOF4LHUkBhmxcstN+ZIDH3SIoVEyVBn
   cjMHg3zMcu84nh4SL9yMjX/taylyXDpXOCJmyNDopnJu8CybImp1iUaee
   BwYy43foegALFjqISmd+wdF1XeKrlxl2r39jZsWldIMzHgaFfBNZkDyyv
   Q==;
X-CSE-ConnectionGUID: kzJmj7/NTbWD1OCyYlNBvg==
X-CSE-MsgGUID: fEQrUvetRMyYlQ4NrkYT3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="38873467"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="38873467"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 16:57:29 -0800
X-CSE-ConnectionGUID: jppe1os3QNa7DuKW9SaB4g==
X-CSE-MsgGUID: ddcrWF18Tc2RNsulu7wnTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="112485527"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Feb 2025 16:57:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgvdW-0010rX-1y;
	Sun, 09 Feb 2025 00:57:26 +0000
Date: Sun, 9 Feb 2025 08:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: cm-mgr@c100000: required-opps:
 [[39], [40], [41], [42], [43], [44], [45], [46], [47], [48]] is too long
Message-ID: <202502090838.iOsAREs2-lkp@intel.com>
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
commit: 1fe62fcb2a55fbf67fb3bb11d7398dfbebfa9f71 [204/204] CHROMIUM: arm64: dts: mt8196: add cmmgr device node
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250209/202502090838.iOsAREs2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090838.iOsAREs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090838.iOsAREs2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu-qos@13f800: failed to match any schema with compatible: ['mediatek,gpu-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: cm-mgr@c100000: required-opps: [[39], [40], [41], [42], [43], [44], [45], [46], [47], [48]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e4000: failed to match any schema with compatible: ['mediatek,mt8196-ptppll-pll-ctrl', 'mediatek,mt8196-ptppll_pll_ctrl', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
