Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722EE8C17
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 06:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695967705; x=1727503705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=giAVI+01eW3Y1aSyfY09p6nVoX4nZ7ysOacYBgd2FVk=;
  b=mzr3dHRGcOmLCUWc7N3Lx0AQqVzvTICwSAzAJY9wdF/QKCLh/beZoAUb
   CVf0XiC18lqoDPTx+rlgrjcrjeb2pFypWzwgwkBeU9kBTMgCRhI+Z7AKd
   swJp9C890upckgCPrq6LzksqVQsze+8Sy2otBfwYAO4RMJ/t+AemmDdPI
   K7ePjFjOkWAwcBjvHn+5h1tsa6KplJi7dZS831yIYUbDXE5sJUQa9dZWA
   VxO2oumuU/TrrA/kSlEmKXQQYar9voj2QhdYQcqYvnKowg2C3SaPdWdOA
   WCKc0Esn4thqK40rzuf6s4PX9Cg5nidPH+yv5Xc/sR0bhuDyu+H1DL97A
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446401087"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="446401087"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 23:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="779195222"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="779195222"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Sep 2023 23:08:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm6fi-0002XJ-1T;
	Fri, 29 Sep 2023 06:08:18 +0000
Date: Fri, 29 Sep 2023 14:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Earl Chew <earl.chew@yahoo.ca>, linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, peter@hurleysoftware.com,
	earl.chew@yahoo.ca, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/3] tty: Serialise racing tiocspgrp() callers
Message-ID: <202309291311.hbeO1nmm-lkp@intel.com>
References: <20230928130658.4045344-3-earl.chew@yahoo.ca>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928130658.4045344-3-earl.chew@yahoo.ca>

Hi Earl,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.6-rc3 next-20230928]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Earl-Chew/tty-Fix-__tty_check_change-and-tiocspgrp-race/20230929-010931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20230928130658.4045344-3-earl.chew%40yahoo.ca
patch subject: [PATCH v2 2/3] tty: Serialise racing tiocspgrp() callers
config: i386-randconfig-062-20230929 (https://download.01.org/0day-ci/archive/20230929/202309291311.hbeO1nmm-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230929/202309291311.hbeO1nmm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291311.hbeO1nmm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/tty_jobctrl.c:83:52: sparse: sparse: Using plain integer as NULL pointer
   drivers/tty/tty_jobctrl.c:88:45: sparse: sparse: Using plain integer as NULL pointer
   drivers/tty/tty_jobctrl.c:97:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:97:9: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:97:9: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:100:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:100:34: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:100:34: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:141:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:141:31: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:141:31: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:143:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:143:33: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:143:33: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:152:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:152:31: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:152:31: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:173:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:173:33: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:173:33: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:182:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:182:9: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:182:9: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:184:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:184:40: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:184:40: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:222:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:222:41: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:222:41: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:232:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:232:51: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:232:51: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:244:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:244:43: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:244:43: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:308:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:308:39: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:308:39: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:311:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:311:41: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:311:41: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:340:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:340:31: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:340:31: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:343:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   drivers/tty/tty_jobctrl.c:343:33: sparse:     expected struct spinlock [usertype] *lock
   drivers/tty/tty_jobctrl.c:343:33: sparse:     got struct spinlock [noderef] __rcu *
   drivers/tty/tty_jobctrl.c:19:41: sparse: sparse: dereference of noderef expression
   drivers/tty/tty_jobctrl.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in '__tty_check_change_locked' - different lock contexts for basic block

vim +83 drivers/tty/tty_jobctrl.c

    80	
    81	int __tty_check_change(struct tty_struct *tty, int sig)
    82	{
  > 83		return __tty_check_change_locked(tty, sig, 0);
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
