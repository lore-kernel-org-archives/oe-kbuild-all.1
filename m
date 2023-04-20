Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CAC539D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681985139; x=1713521139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZo1dkEr8nGdn59n7e30WLCAcntRZFtMDVYpdAMi48Y=;
  b=Oxas9Z7SgXStiCyN41LxlRJEz3FbYyWPsVGLqE6s305cO8pZ08GpsYmN
   u1aRFM1VPbJJi2K1qRIHPCp4CdxUZ7bQxxVXtDJhUZ2knSU65N9CUyuXm
   Ao59O6656DDn2f8B4KAbubdD4hhvg6dnrOaL4FWx4AebpNJa1P/sM9wZu
   TXzq8kSipRyT/h6NNkasVWNMXAJZ0sTFtIkz6PopLtxTXf4fDodqBsn4d
   QsSSlo+pQF3IjWYnovDdYesN0ZVbE2sl4TDiYRaUXiMP9+HoDpb/AHk8D
   zm9rDqtxrphOhzZVpMcxdh5y+YgQDQ29P6QcXeYa3HvkhfVbFu7+KtE3l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373587519"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="373587519"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 03:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="642087771"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="642087771"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Apr 2023 03:05:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppRAW-000fim-1N;
	Thu, 20 Apr 2023 10:05:36 +0000
Date: Thu, 20 Apr 2023 18:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Frederic Weisbecker <frederic@kernel.org>
Subject: [tip:timers/core 13/13] kernel/time/posix-cpu-timers.c:1308:66:
 warning: parameter 'timr' set but not used
Message-ID: <202304201736.fc1wH7zC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
head:   2aaae4bf41b101f7e58e8b06778b1cd9a1dddf94
commit: 2aaae4bf41b101f7e58e8b06778b1cd9a1dddf94 [13/13] posix-cpu-timers: Implement the missing timer_wait_running callback
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304201736.fc1wH7zC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=2aaae4bf41b101f7e58e8b06778b1cd9a1dddf94
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip timers/core
        git checkout 2aaae4bf41b101f7e58e8b06778b1cd9a1dddf94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201736.fc1wH7zC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/time/posix-cpu-timers.c: In function 'posix_cpu_timer_wait_running_nsleep':
   kernel/time/posix-cpu-timers.c:1310:30: error: 'timr' is a pointer; did you mean to use '->'?
    1310 |         spin_unlock_irq(&timr.it_lock);
         |                              ^
         |                              ->
   kernel/time/posix-cpu-timers.c:1312:28: error: 'timr' is a pointer; did you mean to use '->'?
    1312 |         spin_lock_irq(&timr.it_lock);
         |                            ^
         |                            ->
>> kernel/time/posix-cpu-timers.c:1308:66: warning: parameter 'timr' set but not used [-Wunused-but-set-parameter]
    1308 | static void posix_cpu_timer_wait_running_nsleep(struct k_itimer *timr)
         |                                                 ~~~~~~~~~~~~~~~~~^~~~


vim +/timr +1308 kernel/time/posix-cpu-timers.c

  1307	
> 1308	static void posix_cpu_timer_wait_running_nsleep(struct k_itimer *timr)
  1309	{
  1310		spin_unlock_irq(&timr.it_lock);
  1311		cpu_relax();
  1312		spin_lock_irq(&timr.it_lock);
  1313	}
  1314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
