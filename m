Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBE349BD88
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Sep 2026 15:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055015; cv=none; b=VPq3NFH1CmpuI1FGBbfXx0u4JHu3pspoFuEeq8YQzPyf2KFzkSo09Es8I6bxwHLR5AL9xpZtN9Y7zXrPxnWUVWzbeKg4hR6mf5PY4WMEa0W6Yb6E52e2hKeU6NNuqi0Qp2Xfp2xiBjQCYdeiFnEXl4T64RWNwNpwNWDAGhuab34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055015; c=relaxed/simple;
	bh=HnCEIHUwyHneOhsqdwlmHv+LCssfB4lnmLPlIMwbCMQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HYfK57HHpLXfZT2EN8y38RLKkeTFIAwbcmreiYPLvcloRKkEfYLSQsTCGYnEoyC2PSu13ldGZZV0lJzVREmMEZCFg1vlxBMHGC2Y1ugXoqbPvFCbbsY8iASSziesbwt692D996g21YlUSsI0+FVRXAlx5PDLx0nVx5oI9JNB9no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QzIuL8sE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QzIuL8sE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789055013; x=1820591013;
  h=date:from:to:cc:subject:message-id;
  bh=HnCEIHUwyHneOhsqdwlmHv+LCssfB4lnmLPlIMwbCMQ=;
  b=QzIuL8sEvB1+8PuDndqnOs9q3fgrIBqB5q9iPM57VElVX8zzMbKmNzh4
   tRaC89b2ZDPzu0rUj0eQPQ7tz65rXgC2icCz+QG7r98KXg3mGhGS5v9EY
   NMC5Tk4mdffagINKmmzsDX44xpr270IKQJQ48Bbngt5qjJdniETs0F6Yr
   LIKPbi5Gb/7YRqZ8ctmehsPfWF4K1HbiZU9ejx+t1AbZpcN7PMES/e/Cp
   2HZ8iinxSrL0+04zkRxcbqSBw7TTOZSqZRjw8ZfZLPVWMfOuo23+3WiZb
   BtrcKUZI01Xkn79PGnjvyu8JiJ+wQZuWlnyRQU0Q420xorkMVrUGutIb1
   Q==;
X-CSE-ConnectionGUID: MMNbsbCyTBWfIuMe1z7y/Q==
X-CSE-MsgGUID: TwZ9DIXzQH6Oh7qucUbVeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93200678"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="93200678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:43:33 -0700
X-CSE-ConnectionGUID: 4LsTe3h6Sv2fdRVN3ec4lg==
X-CSE-MsgGUID: wOA4XtPqQjK1+B9ObpVFpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="301572116"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Sep 2026 08:43:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gvx-000000000RH-3Idw;
	Thu, 10 Sep 2026 15:43:29 +0000
Date: Thu, 10 Sep 2026 17:42:39 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 7/7]
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb:
 clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:14: 'ext_rmii'
 was expected
Message-ID: <202609101159.nYW64Rqu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   121ea1ece9487e8deae20bc5a48794afa81424c3
commit: 68de99550e9ee79f13c4cddb4c482eeb684e9249 [7/7] arm64: dts: amlogic: t7: Add clock controller nodes
config: arm64-randconfig-2051-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101159.nYW64Rqu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609101159.nYW64Rqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 68de99550e9e ("arm64: dts: amlogic: t7: Add clock controller nodes")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609101159.nYW64Rqu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:308.34-564.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:308.34-564.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:14: 'ext_rmii' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml
--
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:308.34-564.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:308.34-564.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: clock-controller@0 (amlogic,t7-peripherals-clkc): clock-names:14: 'ext_rmii' was expected
   	from schema $id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
