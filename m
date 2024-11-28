Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD82CCC0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 10:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732788989; cv=none; b=LFvtth53TsEGQ9/wb0W+SneTg/e8OcOE/XtuM1ER4otacKhj/5nmUXN4qTzb/k+yZNz9Y6fDaYquEcPxwBM0B3doZalZP+dIZRsEdM6YSLTxyTe5DS92tGPDhNKKpcRxudVF/CN1zTfUe4/aR7IngtswxUkhr7fbBgj8qyGMRLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732788989; c=relaxed/simple;
	bh=RN6EGQkAHIoH7dfkA8jdaCVmmKvolrgykk+Zm/lJm7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XxA5DsJ1drNsPf5YqOy7QhSr38kfmga77G7q+Rr/aWethdu4cIZYDJDbVXwGhd882UmV0mgvdGOZFs5/ubYqPpej688vMu0YVsSfy/VVczjS+/A053hojJuBYYUh468SbzdXw8i6vtn2WI53G8xRfyjMJFzZwbge46Uqaapb2o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIc1z1Tn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIc1z1Tn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732788988; x=1764324988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RN6EGQkAHIoH7dfkA8jdaCVmmKvolrgykk+Zm/lJm7I=;
  b=EIc1z1TnZDLOiFXH9B6JbMqbBcazCplHpM6GjJPnfw+Z8giPOT2rbKgQ
   xgiVMDWvEo787uZvNTtIhWln/mUsC2O3JBgt/O/cezGFNt1vZiZVBgWij
   UgROoZm17SYgDSa525FDBS8Jyb7LRMzQGo4iosfU/WeFq3xZl1GmOVrJ5
   6nF6LU2cDo/OW4PihLTNiesSgxIwJKVtwomRQj2OOcpq2Zf7x47MeVm0m
   ISrf33ch0KokaRoSKcm+GEwkbdOjASZzj4MEd04Cz7fSfq6njwyxylVdQ
   GYlC1+u4JHug64Fgdrp2R5ogjoMsCLyPSRPreusqyKtAl1BEJjpJEazs4
   g==;
X-CSE-ConnectionGUID: AZjsk3VTRpGTIy/8FF+8gA==
X-CSE-MsgGUID: k/97yPsqQaCvOZLpTTcKRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="50541297"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="50541297"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 02:16:27 -0800
X-CSE-ConnectionGUID: 9/3P0cEeR5WnOiARL8ouXw==
X-CSE-MsgGUID: CH1e1dRXRHaAp8PrGZT3gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="123039076"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2024 02:16:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGbZO-0009SB-3C;
	Thu, 28 Nov 2024 10:16:22 +0000
Date: Thu, 28 Nov 2024 18:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 10/12]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202411281804.Nx82xwcc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0b85ac2b0a40e4ebe1bec773a7d999bd69205bf0
commit: 2be90d9e37d22417d6ff2d257df7b33a01dd344d [10/12] CHROMIUM: arm64: dts: mt8186: Add unprovisioned SKU IDs for Ponyta
config: arm64-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241128/202411281804.Nx82xwcc-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281804.Nx82xwcc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281804.Nx82xwcc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,ponyta-sku0', 'google,ponyta-sku2147483647', 'google,ponyta', 'mediatek,mt8186'] is too long
   	['google,ponyta-sku0', 'google,ponyta-sku2147483647', 'google,ponyta', 'mediatek,mt8186'] is too short
   	'google,ponyta-sku0' is not one of ['mediatek,mt2701-evb']
   	'google,ponyta-sku0' is not one of ['mediatek,mt2712-evb']
   	'google,ponyta-sku0' is not one of ['mediatek,mt6580-evbp1']
   	'google,ponyta-sku0' is not one of ['prestigio,pmt5008-3g']
   	'google,ponyta-sku0' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,ponyta-sku0' is not one of ['mediatek,mt6592-evb']
   	'google,ponyta-sku0' is not one of ['mediatek,mt6755-evb']
   	'google,ponyta-sku0' is not one of ['mediatek,mt6765-evb']
--
   	'google,spherion-rev1' was expected
   	'google,elm-rev5' was expected
   	'google,hana-rev3' was expected
   	'google,chinchou-sku21' was expected
   	'google,chinchou-sku3' was expected
   	'google,steelix-rev1-sku196608' was expected
   	'google,tentacruel-sku262144' was expected
   	'google,tentacruel-sku262148' was expected
   	'google,spherion-rev0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /: failed to match any schema with compatible: ['google,ponyta-sku0', 'google,ponyta-sku2147483647', 'google,ponyta', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
