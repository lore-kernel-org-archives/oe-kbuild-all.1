Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC833C7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682081717; x=1713617717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DpfuyQ75qr+V9Z/606wtHMSQGGLItWQxYexWBYQPNjo=;
  b=OyNoRtTSptcAn8WIOE1kxlCLCM4e8uj6ey3hnfOjthRa3FtvBLWL+PjB
   F5SkUApmuD9a/16bq8amyU3tDZ0WoGeRu/jpMhU/NSN3IRmkfNAKkzgC0
   djQGa1lYG0c87jT6/D/h1XJxDwsO++9kD0Whbx7601nb3k4m3h4TMV7lE
   CDs5cAMcp/eQfWd70KxDoBF3P/P7EqLWxxjU+0Hc70elIM6yzSDwWAmdM
   asZxbde4yqW3kCVk+C+AQOfYCcEZY3sOxJ1Df3kWcHf40sVW5jc68Vn+3
   SmWtq5PjZ3b1KJaH1ccRT5qXARcfdw4YXnne91VbAopvnjRqohTJdkDMc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="346003028"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="346003028"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 05:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692269862"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="692269862"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Apr 2023 05:55:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppqID-000gas-23;
	Fri, 21 Apr 2023 12:55:13 +0000
Date: Fri, 21 Apr 2023 20:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Frederic Weisbecker <frederic@kernel.org>
Subject: [tip:timers/core 13/13] kernel/time/posix-cpu-timers.c:1310:30:
 error: 'timr' is a pointer; did you mean to use '->'?
Message-ID: <202304212002.oZSoeiXT-lkp@intel.com>
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
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230421/202304212002.oZSoeiXT-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=2aaae4bf41b101f7e58e8b06778b1cd9a1dddf94
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip timers/core
        git checkout 2aaae4bf41b101f7e58e8b06778b1cd9a1dddf94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304212002.oZSoeiXT-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/posix-cpu-timers.c: In function 'posix_cpu_timer_wait_running_nsleep':
>> kernel/time/posix-cpu-timers.c:1310:30: error: 'timr' is a pointer; did you mean to use '->'?
    1310 |         spin_unlock_irq(&timr.it_lock);
         |                              ^
         |                              ->
   kernel/time/posix-cpu-timers.c:1312:28: error: 'timr' is a pointer; did you mean to use '->'?
    1312 |         spin_lock_irq(&timr.it_lock);
         |                            ^
         |                            ->
   kernel/time/posix-cpu-timers.c:1308:66: warning: parameter 'timr' set but not used [-Wunused-but-set-parameter]
    1308 | static void posix_cpu_timer_wait_running_nsleep(struct k_itimer *timr)
         |                                                 ~~~~~~~~~~~~~~~~~^~~~


vim +1310 kernel/time/posix-cpu-timers.c

  1307	
  1308	static void posix_cpu_timer_wait_running_nsleep(struct k_itimer *timr)
  1309	{
> 1310		spin_unlock_irq(&timr.it_lock);
  1311		cpu_relax();
  1312		spin_lock_irq(&timr.it_lock);
  1313	}
  1314	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
