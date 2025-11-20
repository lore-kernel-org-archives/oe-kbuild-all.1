Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E33357A25
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654817; cv=none; b=D+W0u2AGqMCnQZLooOrtElf8NzgORqnQKxdzbHObh00w3MP22TWoKV+zOHvdqv06XX9sAvPaGlkzgqzwSDmsnT6B4lp/XRB8r7rzmkAAiy/K/K8CpU3LVYznMUYwd1ryBMarcyf1Ce9nuM2ckrUbnob1H2gOcY8Div3SycNf8dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654817; c=relaxed/simple;
	bh=u3jLpoyFTxc1uRN80n2XZ88kbXp4Qsm3E6TMzcDJAFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMl9fUKoG9zXQ4D5LVyb4Gm1u0IqRvrQByWWeDZ8C+otZ899ldfK2o8qF/Shx2T+ndHrJjRb/2OpMP8+GhCpByFZp9TdCpeR12GjDfJE+8b6WQ+c9NjroG9VCLZxhKe0Jy7E6wUlP+TLHZx3Hh8SI4QeaWyEl23KfkN7oBtcBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fs/0jKxN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fs/0jKxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763654815; x=1795190815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u3jLpoyFTxc1uRN80n2XZ88kbXp4Qsm3E6TMzcDJAFA=;
  b=fs/0jKxNrGiS2mdRpOw9kYS2DKkV+RlP+1+1E8P0Utj+Pi6ORkSAcMZp
   VofdkJPioG/0+kL8DAIKQHogz9SxoRpwUWrE+PPQtBJDD5QufH0rl78+x
   0vUhgvK1NUaq8D/7020s3NH/m+FWcEFcEzkkFxitxpLB5bnI/W5h7I2ZX
   EaBrKKtZjRoakfRJqUllonn1H2PYbMwjiUqzBrqBmm8ISQMrki3gdDEmb
   8BfMPxOzyGGh+4kToSytWdL+aZQ7ukvxmSKV8ba80qBPkf0Lsfe3AkoEK
   nIxoS8E+W3klPcdh6/N2bdaCNAKe1xYfyCGX5dOvR4NtY0nDN3Dz5vUpt
   Q==;
X-CSE-ConnectionGUID: JfVn6bVURmqNUX8N8qM7Bw==
X-CSE-MsgGUID: r28ApdTFS++VMBeozj+r3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76836057"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="76836057"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 08:06:55 -0800
X-CSE-ConnectionGUID: VNOZyJgWQAK14IDQbgAGAg==
X-CSE-MsgGUID: 4KHW1ubdRD2bLO4BeKKFwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="196552707"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 20 Nov 2025 08:06:54 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM7BL-000000001Ul-0neG;
	Thu, 20 Nov 2025 16:06:51 +0000
Date: Thu, 20 Nov 2025 17:06:30 +0100
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 8313/10599]
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: wdt@28330000
 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202511201715.tuEuZgdL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: 017bca91639f01302382013033b685ec8759aba4 [8313/10599] dt-bindings: watchdog: Allow node names named 'pmic'
config: arm64-randconfig-2052-20251119 (https://download.01.org/0day-ci/archive/20251120/202511201715.tuEuZgdL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201715.tuEuZgdL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201715.tuEuZgdL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): 'pwm_mux' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: wdt@28330000 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml
--
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: mmc-slot@0 (mmc-spi-slot): $nodename:0: 'mmc-slot@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: wdt@28330000 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
