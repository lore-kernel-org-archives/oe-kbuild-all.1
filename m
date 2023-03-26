Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F8136A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Mar 2023 00:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679790446; x=1711326446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UEwv8iyHukdJuqSIDOgvaEuTpOAfRruovVEWOEbwvP0=;
  b=EaAkSTCcP3tWoag6yKBk3z2ORmPtEcFsAYjB2EuOaS6tmzGVM7bAOGLo
   LFucgTI0/LVmnmJ44MURpx0DVo55PgFfvGMcN7SyhqC6gTvka0sv+D2Kq
   zw1A7zmYgAaOF1tXiXYcTEFtAM27AsAmvcaN8YdX7WkPt9OxzyzFzIn+u
   CYugLJCCYMTmQL7vPKoCWYZqPiVarSGxpJ1oL00t4JTNxZ4/EUjiA6q+b
   DCkyvXvt335usd58G3x40rByFvUQDjVctTYQ6abKuB4X4CNtzl+jB66Xl
   teEmQcx5KzsEGhxYWGs2JsPr5I54ZOSjLmjF30qL3Hhwq5brICCxSksBR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="426287884"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="426287884"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 17:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="1012670629"
X-IronPort-AV: E=Sophos;i="5.98,291,1673942400"; 
   d="scan'208";a="1012670629"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2023 17:27:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgEEG-000GmB-02;
	Sun, 26 Mar 2023 00:27:24 +0000
Date: Sun, 26 Mar 2023 08:26:24 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.2/prjc 284/378] kernel/sched/cputime.c:252:31: error:
 'paravirt_steal_enabled' undeclared
Message-ID: <202303260807.xHzosPfT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.2/prjc
head:   cc40208b65c30b11f0c42b3b4d347fb315de837b
commit: 2f71a7687db0896451980a290f1fa0a9f5c47e3d [284/378] sched/alt: Headers cleanup
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230326/202303260807.xHzosPfT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/2f71a7687db0896451980a290f1fa0a9f5c47e3d
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.2/prjc
        git checkout 2f71a7687db0896451980a290f1fa0a9f5c47e3d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303260807.xHzosPfT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/idle.c: In function 'cpu_idle_poll':
   kernel/sched/idle.c:56:9: error: implicit declaration of function 'ct_idle_enter'; did you mean 'cpuidle_enter'? [-Werror=implicit-function-declaration]
      56 |         ct_idle_enter();
         |         ^~~~~~~~~~~~~
         |         cpuidle_enter
   kernel/sched/idle.c:63:9: error: implicit declaration of function 'ct_idle_exit'; did you mean 'ct_irq_exit'? [-Werror=implicit-function-declaration]
      63 |         ct_idle_exit();
         |         ^~~~~~~~~~~~
         |         ct_irq_exit
   In file included from kernel/sched/build_policy.c:56:
   kernel/sched/cputime.c: In function 'steal_account_process_time':
>> kernel/sched/cputime.c:252:31: error: 'paravirt_steal_enabled' undeclared (first use in this function)
     252 |         if (static_key_false(&paravirt_steal_enabled)) {
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/cputime.c:252:31: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/sched/cputime.c:255:25: error: implicit declaration of function 'paravirt_steal_clock' [-Werror=implicit-function-declaration]
     255 |                 steal = paravirt_steal_clock(smp_processor_id());
         |                         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/paravirt_steal_enabled +252 kernel/sched/cputime.c

1fcf54deb767d4 Josh Don            2022-06-29  243  
03cbc732639ddc Wanpeng Li          2016-08-17  244  /*
03cbc732639ddc Wanpeng Li          2016-08-17  245   * When a guest is interrupted for a longer amount of time, missed clock
03cbc732639ddc Wanpeng Li          2016-08-17  246   * ticks are not redelivered later. Due to that, this function may on
03cbc732639ddc Wanpeng Li          2016-08-17  247   * occasion account more time than the calling functions think elapsed.
03cbc732639ddc Wanpeng Li          2016-08-17  248   */
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  249  static __always_inline u64 steal_account_process_time(u64 maxtime)
73fbec604432e1 Frederic Weisbecker 2012-06-16  250  {
73fbec604432e1 Frederic Weisbecker 2012-06-16  251  #ifdef CONFIG_PARAVIRT
73fbec604432e1 Frederic Weisbecker 2012-06-16 @252  	if (static_key_false(&paravirt_steal_enabled)) {
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  253  		u64 steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  254  
73fbec604432e1 Frederic Weisbecker 2012-06-16 @255  		steal = paravirt_steal_clock(smp_processor_id());
73fbec604432e1 Frederic Weisbecker 2012-06-16  256  		steal -= this_rq()->prev_steal_time;
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  257  		steal = min(steal, maxtime);
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  258  		account_steal_time(steal);
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  259  		this_rq()->prev_steal_time += steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  260  
2b1f967d80e8e5 Frederic Weisbecker 2017-01-31  261  		return steal;
73fbec604432e1 Frederic Weisbecker 2012-06-16  262  	}
73fbec604432e1 Frederic Weisbecker 2012-06-16  263  #endif
807e5b80687c06 Wanpeng Li          2016-06-13  264  	return 0;
73fbec604432e1 Frederic Weisbecker 2012-06-16  265  }
73fbec604432e1 Frederic Weisbecker 2012-06-16  266  

:::::: The code at line 252 was first introduced by commit
:::::: 73fbec604432e1fbfeb1bc59a110dac1f98160f6 sched: Move cputime code to its own file

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
