Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C549682891
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 02:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718935937; cv=none; b=uBMvWDnrdI+XkQK+5iHrwOtknnG4i2wvwVG9GTvXZH7U3mRwjxFkBFBQ2SPBqEWaSBiVEDZz2K/fiIq7PW2NVkTgPrvvLGeF9G5BVJQKkgFUHP2PuCB4a6dIa2x90PuaMgxTY/OISlXMv01pyxJJ6V+Bv9eCwmSes7Eg8rLf8gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718935937; c=relaxed/simple;
	bh=5k8RAvs24MMKwBmY4bMabzNzMTuzRc6+iWP5+6p1MtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lBjGI2cmE3mWl+FyqI16y+NhtJboPJX9ZCneZO7Da4GcUD11D+OLe0H6YCQyMlXqayWMJOh8w5zp91YY9mOhsbuh+GXnaPAZDipx8n5fjYgksIkzqvN6TSGqJxdOfxlScMWccgOTD73E+y5JgMvem7SOHnEW/tk9C9iCe9h8CH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lyR9s2Ap; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lyR9s2Ap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718935936; x=1750471936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5k8RAvs24MMKwBmY4bMabzNzMTuzRc6+iWP5+6p1MtE=;
  b=lyR9s2ApQa+jUgHcVQBDr+n8PI5A9UQQ8UOFp6dv/4lrKOOW/rUeVabD
   jYbxIc/80KGNosHsz3GYoXRQQ9sSVe3oz8w5JCagzRpR0uAVBEMAMqcLP
   UJONOVicZ9vZSbUP3xXVU1Vq85tbjqdmzMYLlnB6jyNwaQVnHPafkprQV
   Q5oMELvbnpWi7NqKxHEf2+F0T4f8JOYIVl6LXFe0blJiX9D/fC5vhqp56
   Xu3ENN3+JD8d+Fg/6ItHYNcl6AFKzKzCzmudBE2C4lE033h5Av2jG00Z4
   Zf84uI9V/6BmXd+GzMnurGN9e4S8bav5sNy2VDvA5nRRDTMqM4Vz3ctg2
   g==;
X-CSE-ConnectionGUID: xTiVopu0RAS40kxOq//Gqw==
X-CSE-MsgGUID: y5obOAMoT3i+zUGcXfoHXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33495601"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="33495601"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 19:12:15 -0700
X-CSE-ConnectionGUID: lH3/I6aeTJu8g236sydNBg==
X-CSE-MsgGUID: 1cLgau/JSzCH6CRx9zWG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="42407783"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jun 2024 19:12:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKTl6-00087H-0j;
	Fri, 21 Jun 2024 02:12:12 +0000
Date: Fri, 21 Jun 2024 10:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Vernet <dvernet@meta.com>
Subject: [tj-sched-ext:scx-cpuperf 11/33] make[3]: *** No rule to make target
 'sched_ext_clean'.
Message-ID: <202406210915.WSyfcfgt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-cpuperf
head:   3049cfbbee553cab70e10d2ac1f9646386df12a6
commit: 2a52ca7c98960aafb0eca9ef96b2d0c932171357 [11/33] sched_ext: Add scx_simple and scx_example_qmap example schedulers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240621/202406210915.WSyfcfgt-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210915.WSyfcfgt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210915.WSyfcfgt-lkp@intel.com/

Note: the tj-sched-ext/scx-cpuperf HEAD 3049cfbbee553cab70e10d2ac1f9646386df12a6 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'sched_ext_clean'.
   make[2]: *** [Makefile:1361: sched_ext] Error 2
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'distclean' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
