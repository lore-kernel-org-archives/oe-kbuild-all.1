Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCA6211A11
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 20:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787981; cv=none; b=CJjdm8GrTdFT+UmBhwUyPplE4Ly/jN1AZd+P/hFSDOzMkkuo3x+FW4zaRgi4HKfIdmHGZtzcr8q16MccA9FwhdKXA0k27jYYwG7RzIC0vWdWQ55OWgVPqGmmHx8Z9kQEe3mccW8VKWa+1qal5mSPP3OjqCFnFm9A1uHT2aqv3tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787981; c=relaxed/simple;
	bh=hMcLXmU9hg4GiDNjLKQJTuKQxWvV1LqJFiyOlHaWOT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KsmoXie80cMCFRYJFUo0hVvb0i9IEgkk3DVFpE4yb2lgMOPJGl+E4cXMgWz07mlmchvLelumwWg3gXEB1QkCKl5Nbbt2Ypi5fLgvaZK2gh87Gj6FgbVV4YsDxJux5G9ZtZBFtSRzmsXW2dnVkOPO4rHWD2KB+rFnyuMN7r9zPZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7k2d+Cs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7k2d+Cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738787979; x=1770323979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hMcLXmU9hg4GiDNjLKQJTuKQxWvV1LqJFiyOlHaWOT0=;
  b=e7k2d+Cs+8dNEsFY4QjnkIUgitfXn0XfNpQBrhBQZZ2Z8CRy+Oqw2NK0
   9pH0c++mljm00TCapWDsvJ7di7EGnWT7pxpDZQ4In6AammxTXmF9q2UOr
   +t4sdRhAyGHRAkUMwDx1nlpYpKlbc6LyDFh0r2cmf+HU/FKQRPKlUOYwo
   7agMKx8KMao71tlZzyrfYahIK5i2FL2EVQ0h+X79/cGWsJDVMNwRBpfyx
   QqSYm/t/QCDCdc8PKjVCXf915rAJ6DYmg3KJ1dnatEiX93wR6bs2sNvyQ
   PWzi0PnJlWc0NV/DI8m4wjxLJB/hwfPXWBNimAtqvOsNic/T+kU27IPsf
   w==;
X-CSE-ConnectionGUID: NZzR7oFfR0C4m7JD+6FOew==
X-CSE-MsgGUID: bXhYXIUSSZaWBfpL2gIbqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38604630"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="38604630"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 12:39:38 -0800
X-CSE-ConnectionGUID: vU+Jdpu2Q16KOq4JysRmiQ==
X-CSE-MsgGUID: DgMZlpV+SSefvRKD0oM5Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="110987639"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 12:39:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfmBL-000w3P-0j;
	Wed, 05 Feb 2025 20:39:35 +0000
Date: Thu, 6 Feb 2025 04:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 170/170]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mt8196-afe-pcm@1a110000:
 failed to match any schema with compatible: ['mediatek,mt8196-sound']
Message-ID: <202502060433.sM5oGhS3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: 2f2aff80fd0e0d01257aa3520f7b259d5bd3d507 [170/170] CHROMIUM: arm64: dts: mediatek: mt8196: config audio driver and codec node
config: arm64-randconfig-051-20250204 (https://download.01.org/0day-ci/archive/20250206/202502060433.sM5oGhS3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060433.sM5oGhS3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060433.sM5oGhS3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp0cfg-ao', 'mediatek,mt8196-pextp0cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169b0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000: failed to match any schema with compatible: ['mediatek,mt8196-pextp1cfg-ao', 'mediatek,mt8196-pextp1cfg_ao', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@169e0000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@18000000: failed to match any schema with compatible: ['mediatek,mt8196-ssr-top', 'mediatek,mt8196-ssr_top', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@180f3000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@1a019000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@1a110000: failed to match any schema with compatible: ['mediatek,mt8196-audiosys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/mt8196-afe-pcm@1a110000: failed to match any schema with compatible: ['mediatek,mt8196-sound']
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
--
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810400: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc0-pll-ctrl', 'mediatek,mt8196-mfgpll_sc0_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@4b810800: failed to match any schema with compatible: ['mediatek,mt8196-mfgpll-sc1-pll-ctrl', 'mediatek,mt8196-mfgpll_sc1_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b890000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/devapc@4b8b0000: failed to match any schema with compatible: ['mediatek,mt8196-devapc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible:0: 'arm,smmu-v3' was expected
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: iommu@4c000000: compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu-v3.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/iommu@4c000000: failed to match any schema with compatible: ['mediatek,mt8196-apu-smmu', 'arm,smmu-v3']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/sound: failed to match any schema with compatible: ['mediatek,mt8196-mt6681-sound']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: panel: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
