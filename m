Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408E61EA90
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 22:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719266432; cv=none; b=U8n54RIyIkYIlnIz5fXUGsIVIGpheX5DNucPTwYOb7KogoPKKshByi8FK5JkyA+JTSGHTGkUrBrfgRTJCJeGs6v0DQb4h2scmGp+i4RkW2HlRDxxhAEU3d5/5tU/DUGoI4SzUQOAsLrD4thFMxr4c9Nv3whCYGhri6JnxQ+2JWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719266432; c=relaxed/simple;
	bh=Xdo7l7RD5uc4BASF6zDW0ToCaZK7Vy5RsAah/PlB20o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WmSXYR5UY8NhqbranHXki/k4PI6rdzwk/HGiEQ0pM64dOPDGm/tg82Og8OFluTCqtVVlUwD0n0ms3DPlvdp9Fmjhf9j4qNN0dkOpJpUBOOAfqZITJz7gKZW4MP/tiTDkwXm6G/dv55URVMHyml8T9fbuZzrDj4k0qnLUIoQtBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmHJFpXE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmHJFpXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719266430; x=1750802430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xdo7l7RD5uc4BASF6zDW0ToCaZK7Vy5RsAah/PlB20o=;
  b=NmHJFpXESY9rA4k/pEM5HmLARBibdzvkMbFY9Y8qW8IaSZ6gYty6cGHF
   VZsyOgRPfWTL4Sw73pymTVl7VlnfTkySHYsZjY9oxiOMhMtR6A5XGSm+B
   PxWAZc4F5X5VEDjEMuluMXJiJP45Wr8peCvpPShvLuLfsGznQmWFb9Mr1
   8a2q0+a9pgEhJiR6swxKwPF1eJLg6S6hNeiHi7Aj+UROlOobSBI/l5/92
   0QZdBVw5TcT4Xx7cczN/9aZJYp6QJfJwmhwyLUJSmKC8m84c/qg46Egcs
   gSKueWwG+8pgNooS1Z/A30lKmM1JWhCGiJ/T9P6mPYVVfQUAiG9V6056/
   g==;
X-CSE-ConnectionGUID: M2I4A6tdRqGl/eF79KOmsA==
X-CSE-MsgGUID: nj0hbnk8RN6+Gswd1gHWbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="27395175"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="27395175"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 15:00:29 -0700
X-CSE-ConnectionGUID: zcOmghQkS8WTPxzKrlUtqw==
X-CSE-MsgGUID: Uwr13GaGSmS1L0z7uGHejg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="47800491"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jun 2024 15:00:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLrjd-000Dlh-2l;
	Mon, 24 Jun 2024 22:00:25 +0000
Date: Tue, 25 Jun 2024 05:59:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 7723/8016]
 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: sound: Unevaluated
 properties are not allowed ('assigned-clock-parents',
 'assigned-clock-rates', 'assigned-clocks' were unexpected)
Message-ID: <202406250501.z9oKHeeJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62c97045b8f720c2eac807a5f38e26c9ed512371
commit: 83a6f4c62cb12aa902043fc1910fdbe483193f3c [7723/8016] arm64: dts: meson: add initial support for Dreambox One/Two
config: arm64-randconfig-051-20240625 (https://download.01.org/0day-ci/archive/20240625/202406250501.z9oKHeeJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250501.z9oKHeeJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250501.z9oKHeeJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2217.23-2257.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1754.27-2026.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2217.23-2257.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
