Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CF734753A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392329; cv=none; b=Z3jkC+RHPog/A5blLszMOZKKLLht5sM4Uq5M5XJxzuOr8qTQb6z2F6q3BNp5Yz6mOvRU2ra4c5bCyq0LrhrCe5oK/tyzpjwmDXsWjH1SPuKsBcVG3DbANLTSXMLv4Wip6aj1NTZUYMwYqbPqpyAKKvdHw+z5pmEaSswQ96bIUlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392329; c=relaxed/simple;
	bh=mt+BjKsSlPTOyr36cejmkv2iGLD+y8xiCm7yNoGBH5M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dobocA0t/JXLxegxE5k4jYHfGx3z+uQCawa0OHIUv6DuRaIdxSG/KrOxeNOpOjQCXIy62HXo4XbRusxgJP/KTG3G7pFZsOR8g00DT41JfQLlAkiClRGpG9UDh8LyZcKnzAQfjkK8xYo2NZnDD0KzWz7bZhBjVC967kT8I2kWD+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5kkV2bz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5kkV2bz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780392328; x=1811928328;
  h=date:from:to:cc:subject:message-id;
  bh=mt+BjKsSlPTOyr36cejmkv2iGLD+y8xiCm7yNoGBH5M=;
  b=U5kkV2bzAbLjOA2UIyKEX5qz4vw9VNz5JNt+Um9sEBqoBB7YXzgzWSGa
   rUNyu6CrnjhC5SNo0UtoelErIAEZ+MjisdAGnttObBCZgvj4SRvAgC0kG
   r0kEHZmqZAKvRl/F+eHwt4GSTqIQFcRitQWn2CzaOvgADK20O3R44+Y8j
   GJkh7lUIgPDQb5KGffXlDc00FM96ALqQPbh11OELKSBcIvmcPwexHAG/6
   ayvqyQN3JH8E8oeBrW/nMv+V7scILNVSCCo08NV4ra0WbYm8TYOjPQQfK
   6h1GKfOLeIuIcYkTS4BQXTGD9hC2Knk5UNEEFKYVL5ofSzchoZykH5Sf5
   g==;
X-CSE-ConnectionGUID: JComRKX2RmCg8T5/eZTbGQ==
X-CSE-MsgGUID: JhGqq+ImQlWK9EzWkJE9Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91479949"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="91479949"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 02:25:28 -0700
X-CSE-ConnectionGUID: 2iUiLPl0Q6KJdBKGlHZ/UQ==
X-CSE-MsgGUID: ebh9lAuuTWKtgIcsPzRNtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="243968767"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 02:25:26 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wULNE-000000001mj-0dWL;
	Tue, 02 Jun 2026 09:25:24 +0000
Date: Tue, 02 Jun 2026 11:25:17 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 8704/9733]
 arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb:
 front-camera@48 (aptina,mi1040): 'orientation' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202606021112.42YPL0Tl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08484c504b55a98bd100527fbe10a3caf55ff3ff
commit: a5acde8adb4d4d921a004b8df995d50255253afa [8704/9733] ARM: tegra: grouper: Add support for front camera
config: arm-randconfig-2051-20260531 (https://download.01.org/0day-ci/archive/20260602/202606021112.42YPL0Tl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021112.42YPL0Tl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606021112.42YPL0Tl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: front-camera@48 (aptina,mi1040): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
