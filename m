Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76C68827
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Apr 2023 21:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682632292; x=1714168292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qDKdvAGKI0QcCEwsSQB+6XQop7gFpkd98PF2ePrKY4M=;
  b=VRjkZ2J9LGukapf7BCCeNEfNJM3sc5YEnOyrPvLYkApdIIV1YsrX4vMi
   ywh/6ugoQ82blMn7JPnGICsFkbPm4ci1ky4QsuKIZHZ6+IPVu4uXGJt64
   8xM+iB7DVZH2dTlPiy8tYDmMMPLeNQDP4Le6eIRNHAX1QkQITU1t2sIbw
   uL2d6gjl9ihU/l1Ox7useCo6S0qAskaRXBY2xxkLaqnXuoTqiuZ73M40b
   5vavj6tCEUs3HuCv5v74pXHni73gQAGpY3fJ1mlxVUkBZcsdVtS2eQxIz
   UAuYBM/QN10Pu3QAnRulMat+U5oLv1xyt2kMPyr6U83XOzbhElLVtrgsY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346345780"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="346345780"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 14:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="868892637"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="868892637"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Apr 2023 14:51:28 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps9WR-000097-19;
	Thu, 27 Apr 2023 21:51:27 +0000
Date: Fri, 28 Apr 2023 05:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmck-rcu:dev.2023.04.26b 35/53] arch/mips/kernel/process.c:46:1:
 warning: 'noreturn' function does return
Message-ID: <202304280553.ZsGndQkE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.04.26b
head:   fcaa8c6ca41362484ff84124f7fd8929739eef45
commit: 2b927bfdda366c1719e021cd0e9688baf933c9cf [35/53] objtool: Fix for unreachable instruction warning
config: mips-randconfig-r012-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280553.ZsGndQkE-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=2b927bfdda366c1719e021cd0e9688baf933c9cf
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2023.04.26b
        git checkout 2b927bfdda366c1719e021cd0e9688baf933c9cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280553.ZsGndQkE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/mips/kernel/process.c: In function 'arch_cpu_idle_dead':
>> arch/mips/kernel/process.c:46:1: warning: 'noreturn' function does return
      46 | }
         | ^


vim +/noreturn +46 arch/mips/kernel/process.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  41  
cdbedc61c8d012 Thomas Gleixner 2013-03-21  42  #ifdef CONFIG_HOTPLUG_CPU
cdbedc61c8d012 Thomas Gleixner 2013-03-21  43  void arch_cpu_idle_dead(void)
^1da177e4c3f41 Linus Torvalds  2005-04-16  44  {
cdbedc61c8d012 Thomas Gleixner 2013-03-21  45  	play_dead();
cdbedc61c8d012 Thomas Gleixner 2013-03-21 @46  }
cdbedc61c8d012 Thomas Gleixner 2013-03-21  47  #endif
1b2bc75c1bde65 Ralf Baechle    2009-06-23  48  

:::::: The code at line 46 was first introduced by commit
:::::: cdbedc61c8d0122ad682815936f0d11df1fe5f57 mips: Use generic idle loop

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
