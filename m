Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31471E541
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 05:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706073898; cv=none; b=ZOSbW8kmyzZAw03Ks5Rd11XWf9H8v6NzArg9GIp/fRhGoabFRZu2pg3fnO9OWipWXfAMeLYoix/u+lVt3bhAPRKgWkXW/n2ASCe26K16Ps1W7QpklPGYuMjZwbwTPDEYLRLD5A7hk+4aReZZjr/ZndJKw3ZR6lPWHLJ3IBisjqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706073898; c=relaxed/simple;
	bh=EAx0qiXKtfNmEJl6Lp7XK1Sk4bwzYYhS0Ij1I/P7t8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cRKdhQPY+lxcU1uR31/i7QggALLINBiD7hTDzAie5bgvSVlXaNwrOI/7ofZzaZ/xH0c0SzDP5kQiZnTtZO0ITeEClEapWFuzM1yEvlDmBNr1hOtf72atItBf1fgAU/U297h5AIqbvA2fOkm+zf5GusQu1KQmYJietHkuM+f8sA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/fh6J1I; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/fh6J1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706073896; x=1737609896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EAx0qiXKtfNmEJl6Lp7XK1Sk4bwzYYhS0Ij1I/P7t8w=;
  b=N/fh6J1IryieL1pDxdxBayRe/jh5h6IOOAlAu0u6z6u0eEFswOoMB97o
   xd/vpKxGvVUP8Tr+6RIf2imxQ2Lh7sjQ8JtlQA7UnN5VdBcyQxpiq/FdF
   rluiS532Z0aCv1i1dFU20OThpCZ8wyvXF23Nt6layk4AWAY4fj+gt0IEi
   hQbD/OvzowYSpv7TzCEWlOblrgxpTqy/p6BKNI4bNhAXThlSsRcmc1ye+
   +A6xvc7xtIXTXM3rQZn+PHVhbBeo8L/Ep5+0h/CO+D1c8ab5WHQDBH0kf
   2o+zlc21QWw/mWNySFr241hqm/bOS/z/lkEihlGbmKrTbC28ZtQNnFa2Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15261606"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15261606"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 21:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="786297209"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="786297209"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Jan 2024 21:24:53 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSVkp-0007tp-1A;
	Wed, 24 Jan 2024 05:24:51 +0000
Date: Wed, 24 Jan 2024 13:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1689/2572] include/linux/suspend.h:36:60: error:
 expected ')' before numeric constant
Message-ID: <202401241339.EjsOdYEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   77caa0f8fcb7c7abbb34b5b49ae26c34c042fdc7
commit: 1f46f3a128f21c190281c72cad99267bcc177e34 [1689/2572] PCI: PM: fix pcie mrrs restoring
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240124/202401241339.EjsOdYEo-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241339.EjsOdYEo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241339.EjsOdYEo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci.c:35:
>> include/linux/suspend.h:36:60: error: expected ')' before numeric constant
      36 | #define PM_SUSPEND_ON           ((__force suspend_state_t) 0)
         |                                                            ^
   include/linux/suspend.h:341:34: note: in expansion of macro 'PM_SUSPEND_ON'
     341 | #define pm_suspend_target_state (PM_SUSPEND_ON)
         |                                  ^~~~~~~~~~~~~
   drivers/pci/pci.c:177:17: note: in expansion of macro 'pm_suspend_target_state'
     177 | suspend_state_t pm_suspend_target_state;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +36 include/linux/suspend.h

95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  35  
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18 @36  #define PM_SUSPEND_ON		((__force suspend_state_t) 0)
690cbb90a709c1 Rafael J. Wysocki 2017-08-10  37  #define PM_SUSPEND_TO_IDLE	((__force suspend_state_t) 1)
7e73c5ae6e7991 Zhang Rui         2013-02-06  38  #define PM_SUSPEND_STANDBY	((__force suspend_state_t) 2)
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  39  #define PM_SUSPEND_MEM		((__force suspend_state_t) 3)
690cbb90a709c1 Rafael J. Wysocki 2017-08-10  40  #define PM_SUSPEND_MIN		PM_SUSPEND_TO_IDLE
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  41  #define PM_SUSPEND_MAX		((__force suspend_state_t) 4)
95d9ffbe01fb21 Rafael J. Wysocki 2007-10-18  42  

:::::: The code at line 36 was first introduced by commit
:::::: 95d9ffbe01fb21d524c86bf77871255066bc6e55 PM: Move definition of struct pm_ops to suspend.h

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
