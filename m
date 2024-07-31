Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6703A1A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 21:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722461705; cv=none; b=Fwq2oCbF60iP/LRo9zYxH7Bp1W8uvr2/kAxt6fdUwwKvGltrb8Wt8DWJLnax+HqWAqvHFqV6CkiQoal9ZaHX3XUcV5CcPkjMWiuxWhF5P9Gwzej/sVGcUO5FBlpgd3IialAANnVcAAOsaBjchfKgtAVjENYNaHZlNA9XmhO+H9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722461705; c=relaxed/simple;
	bh=GPBpyX6Iwj5T9fSMwzuKrXlmvryk8yZ5plubimLDpUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8ssuJko8pQ/EMKMN7EgV7HRSGbKUbQ6GbhqSRPN0UiUAdARYRW8aDmBKgwPoamJgwIqbYqXoqbemNXzBhj2u+Q5RPFoCaFoAVgZOkTJRcRt192G/yqvifcLfEsMgyATLb7tg12tRDmgXgSLYHgDv98DvVtqS4TyshmLAqm1xfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZF//4T4b; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZF//4T4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722461703; x=1753997703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GPBpyX6Iwj5T9fSMwzuKrXlmvryk8yZ5plubimLDpUo=;
  b=ZF//4T4bbFTtyNd+kXbkVPMW0fUrXZ2QU94fpfGGI7DEcQQt6p+IOWtf
   sCId8AyTX9TkPTqf8CFAi9Y+POcMM6Z12CupPlGf1p3cO2dIQPBuz5WKj
   hN0Z/tECqnoFBaTJIAuGKUU3bS4VNuyMQnfw9QKPf8yYHKTsx5d3bKJWQ
   ghxp2Zqzg5/JCblL/zUbxJe8fi3qVBuWTQqURJzehL1uNPCZ3Ekdm2gos
   l5o11b8BdKFtQbvc+cMC79zbXPDz8/r6foHw1i3Pr9gEMV67IzaM7o8KI
   jUkk310FK6iVUEmhdDMVgTIhDCDC4vFR/ku1WUOIjohv/6I/qam48C3hg
   w==;
X-CSE-ConnectionGUID: U7jPNv+fT3OPoHwKewz9BA==
X-CSE-MsgGUID: 3yukJIl+Q96IKwee1d4nFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31032893"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="31032893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 14:35:03 -0700
X-CSE-ConnectionGUID: 22waPod2RNmuFnVBhEXmqA==
X-CSE-MsgGUID: tRMwOEsjTYOVNjt8Nx9YLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="59864183"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2024 14:35:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZGyI-000uq5-37;
	Wed, 31 Jul 2024 21:34:58 +0000
Date: Thu, 1 Aug 2024 05:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	devel@acpica.org, linux-pm@vger.kernel.org
Subject: [rafael-pm:thermal-core-testing 5/28]
 drivers/thermal/tegra/tegra30-tsensor.c:326:22: warning: unused variable 'i'
Message-ID: <202408010519.LbMLx3ZP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal-core-testing
head:   7fd1b071fe42b890c55ac5e735fb39d3d46c1e4d
commit: 52f97fa22ebcf77f8a19cb39932c3069f90c428d [5/28] thermal: tegra: Use thermal_zone_for_each_trip() for walking trip points
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240801/202408010519.LbMLx3ZP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010519.LbMLx3ZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010519.LbMLx3ZP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/tegra/tegra30-tsensor.c: In function 'tegra_tsensor_get_hw_channel_trips':
>> drivers/thermal/tegra/tegra30-tsensor.c:326:22: warning: unused variable 'i' [-Wunused-variable]
     326 |         unsigned int i;
         |                      ^


vim +/i +326 drivers/thermal/tegra/tegra30-tsensor.c

52f97fa22ebcf7 Rafael J. Wysocki 2024-07-29  322  
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  323  static void tegra_tsensor_get_hw_channel_trips(struct thermal_zone_device *tzd,
e45ebb38c6b589 Rafael J. Wysocki 2024-07-29  324  					       struct trip_temps *temps)
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  325  {
3747e4263ff6d6 Dmitry Osipenko   2021-06-16 @326  	unsigned int i;
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  327  
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  328  	/*
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  329  	 * 90C is the maximal critical temperature of all Tegra30 SoC variants,
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  330  	 * use it for the default trip if unspecified in a device-tree.
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  331  	 */
e45ebb38c6b589 Rafael J. Wysocki 2024-07-29  332  	temps->hot_trip  = 85000;
e45ebb38c6b589 Rafael J. Wysocki 2024-07-29  333  	temps->crit_trip = 90000;
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  334  
52f97fa22ebcf7 Rafael J. Wysocki 2024-07-29  335  	thermal_zone_for_each_trip(tzd, tegra_tsensor_get_trips_cb, temps);
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  336  
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  337  	/* clamp hardware trips to the calibration limits */
e45ebb38c6b589 Rafael J. Wysocki 2024-07-29  338  	temps->hot_trip = clamp(temps->hot_trip, 25000, 90000);
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  339  
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  340  	/*
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  341  	 * Kernel will perform a normal system shut down if it will
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  342  	 * see that critical temperature is breached, hence set the
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  343  	 * hardware limit by 5C higher in order to allow system to
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  344  	 * shut down gracefully before sending signal to the Power
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  345  	 * Management controller.
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  346  	 */
e45ebb38c6b589 Rafael J. Wysocki 2024-07-29  347  	temps->crit_trip = clamp(temps->crit_trip + 5000, 25000, 90000);
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  348  }
3747e4263ff6d6 Dmitry Osipenko   2021-06-16  349  

:::::: The code at line 326 was first introduced by commit
:::::: 3747e4263ff6d6085507a32946f8236c62dd2495 thermal/drivers/tegra: Add driver for Tegra30 thermal sensor

:::::: TO: Dmitry Osipenko <digetx@gmail.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
