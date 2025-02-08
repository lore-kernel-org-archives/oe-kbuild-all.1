Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5B23C8D4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739010582; cv=none; b=brrOLnkaEaVL8ss/YYZw6B3VTMf9VVUoSWk368mz7jy9gH/zmW1yGQAMORA2q4B0UD1oHWgxYjv40KfWpt1UvuT1O8Cf1NEBXCY07iXO/amwdXB39CYrQl8lb650FgttoiFJPMIp2D6Mf76S+ORr24ho4FSJHq84hSOo0tm8Elw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739010582; c=relaxed/simple;
	bh=8K/33ky2ZG9yFrKrVQvCOoNrSNKpBySngxzP69mmQek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BVGQyFzejtAHM/JV6kxKCRQ0oJtK74rqrK/CskmPfa9UWJkGERKi1gv+huZl4sC8Qbr39Oxa+5rVpYS2DMjZXpifsn8f3VswtrIqtR5Ql2oQ5lcfXXrZ/Wq2soveGWkd5fGRrBlyQ8T2gx2e+DDP6Bf6oj2fS8jsv+Za8wpYSeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzMIkZuE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzMIkZuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739010581; x=1770546581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8K/33ky2ZG9yFrKrVQvCOoNrSNKpBySngxzP69mmQek=;
  b=FzMIkZuE9JGB6FUfYwyF6gqRWnVoNhYExM+jt/l7HPgIl1CCFODxcIDD
   kiY/UhGHKeC8cUXY7UimeNqVAbEKULyLN504X5RocjS2mUYniXyfgUcHM
   IYONH6WLg86cm1hYRhtmklPzpNnQ4QpJhd/c/vfpFUWzCtEBNhDcCWb1S
   aXKnA5UPDvm52NCAVp97dZ62nNMA4Jeyl3lg7iv/OG/Gk71Wz0PWxT96i
   AMX9lw+RnNse7ob4Y+GWjTwiSB1LdUGEYXFf1XEjvwqpVK9Iumpc4KiTO
   noj5nIaIuZdiOOaAJzHKsKKcFmv/2+8y41cuYSVEwIZg8EIL8ZTvy2laj
   w==;
X-CSE-ConnectionGUID: 0I/ZZyS8RHG/MWRv6Aa0/w==
X-CSE-MsgGUID: qYIvJg8mQzy+J8jaFOgt2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38847594"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; 
   d="scan'208";a="38847594"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 02:29:40 -0800
X-CSE-ConnectionGUID: PT21gBoXSiSdCSRFRWBg5w==
X-CSE-MsgGUID: HiesR9BTSHmk/9lEI7YSgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116957727"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Feb 2025 02:29:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgi5g-000zr1-0E;
	Sat, 08 Feb 2025 10:29:36 +0000
Date: Sat, 8 Feb 2025 18:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 204/204]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dvfsrc@1c013000: failed to
 match any schema with compatible: ['mediatek,mt8196-dvfsrc']
Message-ID: <202502081852.RSJcOxuQ-lkp@intel.com>
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
commit: a5a854b9d1f4b667c31596d727f6d7f0f6025e96 [204/204] CHROMIUM: arm64: dts: mt8196: add vcore dvfs device node
config: arm64-randconfig-051-20250206 (https://download.01.org/0day-ci/archive/20250208/202502081852.RSJcOxuQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081852.RSJcOxuQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502081852.RSJcOxuQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/power-controller@1c004000: failed to match any schema with compatible: ['mediatek,mt8196-scpsys-hwv', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c00d000: failed to match any schema with compatible: ['mediatek,mt8196-scpsys-bus', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2712-wdt', 'mediatek,mt6589-wdt', 'mediatek,mt6735-wdt', 'mediatek,mt6795-wdt', 'mediatek,mt7986-wdt', 'mediatek,mt8183-wdt', 'mediatek,mt8186-wdt', 'mediatek,mt8188-wdt', 'mediatek,mt8192-wdt', 'mediatek,mt8195-wdt']
   	'mediatek,mt8196-wdt' is not one of ['mediatek,mt2701-wdt', 'mediatek,mt6582-wdt', 'mediatek,mt6797-wdt', 'mediatek,mt7622-wdt', 'mediatek,mt7623-wdt', 'mediatek,mt7629-wdt', 'mediatek,mt8173-wdt', 'mediatek,mt8365-wdt', 'mediatek,mt8516-wdt']
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: watchdog@1c010000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mtk-wdt.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/watchdog@1c010000: failed to match any schema with compatible: ['mediatek,mt8196-wdt', 'mediatek,mt6589-wdt', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/dvfsrc@1c013000: failed to match any schema with compatible: ['mediatek,mt8196-dvfsrc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1c016000: failed to match any schema with compatible: ['mediatek,mt8196-vlp-cksys', 'mediatek,mt8196-vlp_cksys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000: failed to match any schema with compatible: ['mediatek,mt8196-spmi']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@6: failed to match any schema with compatible: ['mediatek,mt6316']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@6/mt6316-6-regulator: failed to match any schema with compatible: ['mediatek,mt6316-6-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@7: failed to match any schema with compatible: ['mediatek,mt6316']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@7/mt6316-7-regulator: failed to match any schema with compatible: ['mediatek,mt6316-7-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@8: failed to match any schema with compatible: ['mediatek,mt6316']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@8/mt6316-8-regulator: failed to match any schema with compatible: ['mediatek,mt6316-8-regulator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/spmi@1c01a000/mt6316@15: failed to match any schema with compatible: ['mediatek,mt6316']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
