Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198A579CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 19:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724268540; cv=none; b=aIsOU1MSxMxBURyQ2XeS4WxOhBNGU4cJb87yqyT0CzcBago1DoaKXavi8ODRML3bTStcTyTW2xh9ezhsAkEg6FwsIVKAa3IRCnv/dKZO9ScCNZAhoZM9btNnVTJQUm5deGKSBdue/ZS4HX8yUVNo4kd8N1JmEJm6fervpE+gLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724268540; c=relaxed/simple;
	bh=8wSHV8yceaozHYr95fiAxc0zVVTihybyUYi0XFVc9Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ExVnbVphB4SA33cFgGEkpR0j5fzErRSwNaw/u3TAvRIzjuFGUNEGxW2HMqWRqu1LBI+v16SiengQ3gdsoj7shzx/ofe5Yb/le+lBcUOPBtyAfeAHaZCS/qgTzTLE7I8kmtf0n2SK5u49tAEOtsLHyCSVOiOlUoBVvPTony/wZ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ilhmxtdm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ilhmxtdm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724268538; x=1755804538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8wSHV8yceaozHYr95fiAxc0zVVTihybyUYi0XFVc9Gk=;
  b=Ilhmxtdm0xHUBIoHAOErZaWxGRjDsy8iFkR5LQl2h3ev4kDPT1G7d3FR
   x8s4e/Im1kKxJHNd9rbnwj0zjha/XRmJOlhPapOLtK3YwKoOJmzxc5LIk
   noJxhO8YkjrYEGiCy1CywQE50v6I0kB55hi+iMBV5hBdB6UNu6MRUIrT6
   lY+q3+3ec0sJcAgynHE/N4wTP7+d0mrLZe93NzhkLyoctLyBIf6DTUspV
   3CC3NQ8MFPmpql/auVgyRO3rStYxPWiEEMVlVSkPuXBZccXXGgfMKsYrG
   sh7a/sQ/VmkrkU0mE4fcr5StifFxQ0+CqiSgBsUSeJJEW8PrQ27lcJ3F0
   g==;
X-CSE-ConnectionGUID: IRVmBiRRRwacg1s8Z8lLvg==
X-CSE-MsgGUID: GNOmltzgTkScwAWL9WRwVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33803522"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="33803522"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 12:28:58 -0700
X-CSE-ConnectionGUID: zdQ2cTi5SWa1faKKe/bqXQ==
X-CSE-MsgGUID: tR4hQbJTR5ejdhHf2YhXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61053014"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Aug 2024 12:28:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgr0n-000BsG-1X;
	Wed, 21 Aug 2024 19:28:53 +0000
Date: Thu, 22 Aug 2024 03:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 5403/5728]
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2-pro.dtb: sound:
 Unevaluated properties are not allowed ('assigned-clock-parents',
 'assigned-clock-rates', 'assigned-clocks' were unexpected)
Message-ID: <202408220310.SBuJh10Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eb8c5ca373cbb018a84eb4db25c863302c9b6314
commit: 69591796c5d585816a306134f6d565cf19da575e [5403/5728] arm64: dts: amlogic: add support for Radxa ZERO 2 Pro
config: arm64-randconfig-053-20240821 (https://download.01.org/0day-ci/archive/20240822/202408220310.SBuJh10Y-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408220310.SBuJh10Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220310.SBuJh10Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2222.23-2262.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2-pro.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero-2-pro.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
