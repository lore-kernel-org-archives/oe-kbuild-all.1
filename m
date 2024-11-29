Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2BC2595
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732838580; cv=none; b=hufSHQKkxn5ED+yO3pgprzrDDPMztDvztPZqalg9GUah+AG9h9X5SDnHNLcQQzPqJFV2ZWv2K7/VDc4jwIjYiw3Z293hamja2RGLT9UBuLrJfBSzH+4DrMw8IjgbORGquTPgAwccG4tp8GbTw7NFRX/nvS5owU4tgZ4Ckxm0fTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732838580; c=relaxed/simple;
	bh=t9WJ3liML23gXyNfsPk1WhQMEXGGD8YAWwSXTVYJ3gA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsrQ5T6ZmIU1dY1p2jyjsEiVeIUCqa/LgXLCKh3EjcxuuHja775wLIUW4Mkisuf5F4qvVJFfaIK68dzHNrM2rGCQ6EMr2Oirv2liPmobM5pqw3nl/vjZ49w7+617p7+jV/VKfaLrDXtwh0gCfFFLlm409ALJY8T3f/05ZITOC+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkXTOJnN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkXTOJnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732838579; x=1764374579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t9WJ3liML23gXyNfsPk1WhQMEXGGD8YAWwSXTVYJ3gA=;
  b=DkXTOJnNRlOuOjIjUYBGBU8kWH5Lu9//lcTCb/EbosTkUdU3lzFNw3B3
   ayMwOFaRAZFhcer/6Twf+Kcr7OVr2xOKr2yKlIrRQk44VTw6enhtFg4GI
   i1lzs0z1P7SqESuT/NEbNGnDnLomI0RBSYQQyF/Q1WBLYr8V55/rBaUCT
   2/zZIJpZS7nVMcfh6KX9JAjR60IqBxJr0+V5iq4jGDukE6qZ+QqytCTxK
   4+rW8kMkHAooKMTzPVj4i1MS+R+o1+XdpD4oVIXct37Id2DN7FK2i1ZTq
   YGXR7giFIBBg0M7KEs61xF/bY0VnclREJY/vESppIhs2vob9ZPw/n/OfW
   A==;
X-CSE-ConnectionGUID: Tm10FOrvRtyLE2eLkxnjvA==
X-CSE-MsgGUID: 8d1NpfhwQQuylB1Wd5G39w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="35939396"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="35939396"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 16:02:58 -0800
X-CSE-ConnectionGUID: seHq+nEhS+yq8q5591Jygw==
X-CSE-MsgGUID: GtmrRzaCRJq5htJUegNL0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="91966751"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Nov 2024 16:02:56 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGoTG-000AAR-03;
	Fri, 29 Nov 2024 00:02:54 +0000
Date: Fri, 29 Nov 2024 08:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 12/12]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202411290742.GZlgb258-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3c6853ebba70a03ae7540022d1b4ecffe0da3703
commit: e340b817e2b43e73be5201248ae076b8b0513478 [12/12] CHROMIUM: arm64: dts: mt8186: Add unprovisioned SKU IDs for Tentacruel
config: arm64-randconfig-051-20241122 (https://download.01.org/0day-ci/archive/20241129/202411290742.GZlgb258-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290742.GZlgb258-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290742.GZlgb258-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,tentacruel-sku262147', 'google,tentacruel-sku262146', 'google,tentacruel-sku262145', 'google,tentacruel-sku262144', 'google,tentacruel-sku327680', 'google,tentacruel-sku327681', 'google,tentacruel', 'mediatek,mt8186'] is too long
   	['google,tentacruel-sku262147', 'google,tentacruel-sku262146', 'google,tentacruel-sku262145', 'google,tentacruel-sku262144', 'google,tentacruel-sku327680', 'google,tentacruel-sku327681', 'google,tentacruel', 'mediatek,mt8186'] is too short
   	'google,tentacruel-sku262147' is not one of ['mediatek,mt2701-evb']
   	'google,tentacruel-sku262147' is not one of ['mediatek,mt2712-evb']
   	'google,tentacruel-sku262147' is not one of ['mediatek,mt6580-evbp1']
   	'google,tentacruel-sku262147' is not one of ['prestigio,pmt5008-3g']
   	'google,tentacruel-sku262147' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,tentacruel-sku262147' is not one of ['mediatek,mt6592-evb']
   	'google,tentacruel-sku262147' is not one of ['mediatek,mt6755-evb']
   	'google,tentacruel-sku262147' is not one of ['mediatek,mt6765-evb']
--
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	'google,elm-rev3' was expected
   	'google,chinchou-sku5' was expected
   	'google,elm' was expected
   	'google,chinchou-sku6' was expected
   	'google,chinchou-sku7' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /: failed to match any schema with compatible: ['google,tentacruel-sku262147', 'google,tentacruel-sku262146', 'google,tentacruel-sku262145', 'google,tentacruel-sku262144', 'google,tentacruel-sku327680', 'google,tentacruel-sku327681', 'google,tentacruel', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2203.30-2207.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2209.23-2213.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2215.35-2219.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2195.32-2312.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,tentacruel-sku262151', 'google,tentacruel-sku262150', 'google,tentacruel-sku262149', 'google,tentacruel-sku262148', 'google,tentacruel-sku327682', 'google,tentacruel-sku327683', 'google,tentacruel', 'mediatek,mt8186'] is too long
   	['google,tentacruel-sku262151', 'google,tentacruel-sku262150', 'google,tentacruel-sku262149', 'google,tentacruel-sku262148', 'google,tentacruel-sku327682', 'google,tentacruel-sku327683', 'google,tentacruel', 'mediatek,mt8186'] is too short
   	'google,tentacruel-sku262151' is not one of ['mediatek,mt2701-evb']
   	'google,tentacruel-sku262151' is not one of ['mediatek,mt2712-evb']
   	'google,tentacruel-sku262151' is not one of ['mediatek,mt6580-evbp1']
   	'google,tentacruel-sku262151' is not one of ['prestigio,pmt5008-3g']
   	'google,tentacruel-sku262151' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,tentacruel-sku262151' is not one of ['mediatek,mt6592-evb']
   	'google,tentacruel-sku262151' is not one of ['mediatek,mt6755-evb']
   	'google,tentacruel-sku262151' is not one of ['mediatek,mt6765-evb']
--
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou-sku2147483647' was expected
   	'google,chinchou-sku4' was expected
   	'google,elm-rev3' was expected
   	'google,chinchou-sku5' was expected
   	'google,elm' was expected
   	'google,chinchou-sku6' was expected
   	'google,chinchou-sku7' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /: failed to match any schema with compatible: ['google,tentacruel-sku262151', 'google,tentacruel-sku262150', 'google,tentacruel-sku262149', 'google,tentacruel-sku262148', 'google,tentacruel-sku327682', 'google,tentacruel-sku327683', 'google,tentacruel', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
