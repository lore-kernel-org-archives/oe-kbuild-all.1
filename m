Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40651A682A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 May 2026 05:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780118659; cv=none; b=pjJ2DeWTMosVaTrKUK0zARqE9N0qfzJxtN85V1Oi74jr5kXqcFdhXy3ABIcF85YRVzKYiXZxn/3Th9aJk3Ojeukw5JTlR6upan+JwInXPlwG2dF2hRsmy9R/AC2nqr3v123hRbGAiCdawJHu7nzHyIgqPuM11BT9y6h01lvxMPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780118659; c=relaxed/simple;
	bh=UUS1h6p2B7Z1o0bXGe6TaaNMJXwJgxpW40bNeCBaWRg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LBGTphtHvbU2JQZT4hVZcM9cc6fEDHAX/sJ4yBxYA4+3v1kXpd8pnMyETUuzVnAdyhQGgUVtC9dEK9QZPu9SoykqnAjbA77lWKjdYYbEE55ha8kY9ZPzrYoF7g3H11AmQDH+aRk+1g7c5zed3DXiD+31Wopt5bts0wjJOxrtvtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEiaFTTK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEiaFTTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780118657; x=1811654657;
  h=date:from:to:cc:subject:message-id;
  bh=UUS1h6p2B7Z1o0bXGe6TaaNMJXwJgxpW40bNeCBaWRg=;
  b=kEiaFTTK46D+2KFJJc1cXgxBEe48hSUlMpzvgWEeYlB2j6Wd7hNpMquI
   o7MI60DHUk82cXgy1hyx7oRDy3PGEpY/FZlRE51foV63Kwv5NpmNzKYU3
   pyPVepzhmxvsVGPr0wsgk67efH5V+H9YBSeDmHHgqvPWr3VBy6rnZeIGo
   IlkuCVxd65ZyZiRBokyrT+z1SfA0SSYHpjR3mIbCOBPwtSp7UC69DDQ6h
   3tDu2g8G8K3XoMdrC+BUHB2lu4aXbi1fyhFeONiOBcCKiXp9OGVWlDCkI
   90C91T7sGOC2RlkEsDcCFd95ZLHyGnQXo150Ko6L6Le6wuODGa5F3BNM2
   A==;
X-CSE-ConnectionGUID: vntD68HSTsOL4uRt/MmjCQ==
X-CSE-MsgGUID: Ly+pYYcfSxqb4mOXJkqisQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="79997474"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="79997474"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 22:24:17 -0700
X-CSE-ConnectionGUID: irmkOqM2Rdy+GkOVtdnqJQ==
X-CSE-MsgGUID: w99vo3QkSm6Bac/LthlKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247959531"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2026 22:24:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTCBB-0000000088I-1mq2;
	Sat, 30 May 2026 05:24:13 +0000
Date: Sat, 30 May 2026 13:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Lukasz Luba <lukasz.luba@arm.com>
Subject: [thermal:thermal/bleeding-edge 24/30]
 include/linux/thermal.h:332:1: error: expected identifier or '(' before
 'static'
Message-ID: <202605301334.P9P1vN7f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   100e27ef9a645f07881160256b7131fb40885215
commit: 06f53fafe3cccbb83d6d6f0812e4d5c8d46bbb63 [24/30] thermal/of: Move cooling device OF helpers out of thermal core
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260530/202605301334.P9P1vN7f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301334.P9P1vN7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605301334.P9P1vN7f-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/power/supply/power_supply_core.c:23:
>> include/linux/thermal.h:332:1: error: expected identifier or '(' before 'static'
     332 | static inline void thermal_cooling_device_unregister(
         | ^~~~~~


vim +332 include/linux/thermal.h

06f53fafe3cccb Daniel Lezcano 2026-05-26  331  
12ca7188468ee2 Nishanth Menon 2015-02-13 @332  static inline void thermal_cooling_device_unregister(
12ca7188468ee2 Nishanth Menon 2015-02-13  333  	struct thermal_cooling_device *cdev)
12ca7188468ee2 Nishanth Menon 2015-02-13  334  { }
12ca7188468ee2 Nishanth Menon 2015-02-13  335  static inline struct thermal_zone_device *thermal_zone_get_zone_by_name(
12ca7188468ee2 Nishanth Menon 2015-02-13  336  		const char *name)
12ca7188468ee2 Nishanth Menon 2015-02-13  337  { return ERR_PTR(-ENODEV); }
12ca7188468ee2 Nishanth Menon 2015-02-13  338  static inline int thermal_zone_get_temp(
17e8351a77397e Sascha Hauer   2015-07-24  339  		struct thermal_zone_device *tz, int *temp)
12ca7188468ee2 Nishanth Menon 2015-02-13  340  { return -ENODEV; }
4a7069a32c99a8 Rajendra Nayak 2016-05-05  341  static inline int thermal_zone_get_slope(
4a7069a32c99a8 Rajendra Nayak 2016-05-05  342  		struct thermal_zone_device *tz)
4a7069a32c99a8 Rajendra Nayak 2016-05-05  343  { return -ENODEV; }
4a7069a32c99a8 Rajendra Nayak 2016-05-05  344  static inline int thermal_zone_get_offset(
4a7069a32c99a8 Rajendra Nayak 2016-05-05  345  		struct thermal_zone_device *tz)
4a7069a32c99a8 Rajendra Nayak 2016-05-05  346  { return -ENODEV; }
f0129c231772a8 Daniel Lezcano 2020-04-02  347  

:::::: The code at line 332 was first introduced by commit
:::::: 12ca7188468ee29c4e717f73db4bf43c90954fc7 thermal: Introduce dummy functions when thermal is not defined

:::::: TO: Nishanth Menon <nm@ti.com>
:::::: CC: Eduardo Valentin <edubezval@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
