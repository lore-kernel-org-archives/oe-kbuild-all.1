Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50626C284
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678390124; x=1709926124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RiX3I5rjIa2fi2G9lRM4CW/77TS0GdEZn8DowlHJz0o=;
  b=RSsWkr2FddnoXV5eIbZ0fpRMvZOVLQRcj8Grwhy5WwB8KVqh++ABQwdV
   e4x1VE4//+JsP0UFlxooee9yNH0E7ITfSIizAZ4INywqY/SyYsBrfOUgp
   EApJy7FFUR65R4iwCSw8SrCJO+7hmuH6WXAF7taWjzgXPFda1UmpsUI7C
   WLmcFCX4TQOh6yWJHf/uRi4IaZB5RU86AKu8XdsravU8WPdUxNfMJeBqF
   zfss+exX+W0kpYeObeQKqB+U3BrefA3P9yUMI6Bd7MT+9JsnXi1u3bKwY
   4bnoOwBtfRZ7Q7Z/R4tR075NJIx7RgeHtJv+v0xcwAB5fziESqnqUUL7V
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324893736"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="324893736"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 11:17:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="654884921"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="654884921"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Mar 2023 11:17:38 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paLlh-0003AN-1P;
	Thu, 09 Mar 2023 19:17:37 +0000
Date: Fri, 10 Mar 2023 03:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.3.y-rt-rebase 15/47]
 kernel/printk/printk.c:3341:13: warning: variable 'index' set but not used
Message-ID: <202303100327.IbeLrGlf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.3.y-rt-rebase
head:   c0ca8b79d21d0c9a1ac7ed0ebebb5588804ba825
commit: 8bc429d558376b052de3bb766a424033d39e443b [15/47] serial: 8250: implement write_atomic
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230310/202303100327.IbeLrGlf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=8bc429d558376b052de3bb766a424033d39e443b
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.3.y-rt-rebase
        git checkout 8bc429d558376b052de3bb766a424033d39e443b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100327.IbeLrGlf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/printk/printk.c: In function 'atomic_console_flush_all':
>> kernel/printk/printk.c:3341:13: warning: variable 'index' set but not used [-Wunused-but-set-variable]
    3341 |         int index = 0;
         |             ^~~~~


vim +/index +3341 kernel/printk/printk.c

f7ffa0536cb17da John Ogness 2022-02-04  3335  
f7ffa0536cb17da John Ogness 2022-02-04  3336  static void atomic_console_flush_all(void)
f7ffa0536cb17da John Ogness 2022-02-04  3337  {
f7ffa0536cb17da John Ogness 2022-02-04  3338  	unsigned long flags;
f7ffa0536cb17da John Ogness 2022-02-04  3339  	struct console *con;
f7ffa0536cb17da John Ogness 2022-02-04  3340  	bool any_progress;
f7ffa0536cb17da John Ogness 2022-02-04 @3341  	int index = 0;
f7ffa0536cb17da John Ogness 2022-02-04  3342  
f7ffa0536cb17da John Ogness 2022-02-04  3343  	if (console_suspended)
f7ffa0536cb17da John Ogness 2022-02-04  3344  		return;
f7ffa0536cb17da John Ogness 2022-02-04  3345  

:::::: The code at line 3341 was first introduced by commit
:::::: f7ffa0536cb17da9589ecda6513bfa0bd1fd1745 printk: add infrastucture for atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
