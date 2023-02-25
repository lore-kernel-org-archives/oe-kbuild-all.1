Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ADD7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 08:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677314306; x=1708850306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+P+++io5wE5hNapjBfHDsGL+AqoheeRdMorMbrnQ0VI=;
  b=M5VJm97iA/op09+N2QktWaD/KyBOljwRifHnLVK9QLox1delw1PUFwe5
   f+ipb3Dar2WLRORDM2XPXFFZtpc8RiVzKE59Cs6V7hrffwtubgiSLybha
   1GL5ADuTGsJNhznMb5NNCHmSndESvOMdQ/kp+aNDkodVJ4lsvNf4IfwZO
   syxufXDELg4M+iESflXsjUI6o7qUP85BXfdPWG+Sj+2Smtd4uvZJffQOo
   Pl0odVBKJFOkpxfapcGc89TyA3FXWHKnV1W0XDSTy01Ozf8o2oeiZioA9
   W+AviUg/k1Y6j5AuHZspFIqPSY2MaqqESanUtWwu1AaH6RoHXQvCsDJ10
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="335078552"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="335078552"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 00:38:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="741903359"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="741903359"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2023 00:38:23 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVq4V-00033z-0A;
	Sat, 25 Feb 2023 08:38:23 +0000
Date: Sat, 25 Feb 2023 16:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.1/prjc 284/376] kernel/sched/cputime.c:252:31: error:
 'paravirt_steal_enabled' undeclared
Message-ID: <202302251601.05pQGUp5-lkp@intel.com>
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

tree:   https://github.com/zen-kernel/zen-kernel 6.1/prjc
head:   16c9f17f2a21749a507d8b3358225d4d73cba785
commit: a9a7c3ea10ad1e83f4f64714235401ac4861dbfd [284/376] sched/alt: Headers cleanup
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230225/202302251601.05pQGUp5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/a9a7c3ea10ad1e83f4f64714235401ac4861dbfd
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 6.1/prjc
        git checkout a9a7c3ea10ad1e83f4f64714235401ac4861dbfd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251601.05pQGUp5-lkp@intel.com/

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

1fcf54deb767d47 Josh Don            2022-06-29  243  
03cbc732639ddca Wanpeng Li          2016-08-17  244  /*
03cbc732639ddca Wanpeng Li          2016-08-17  245   * When a guest is interrupted for a longer amount of time, missed clock
03cbc732639ddca Wanpeng Li          2016-08-17  246   * ticks are not redelivered later. Due to that, this function may on
03cbc732639ddca Wanpeng Li          2016-08-17  247   * occasion account more time than the calling functions think elapsed.
03cbc732639ddca Wanpeng Li          2016-08-17  248   */
2b1f967d80e8e5d Frederic Weisbecker 2017-01-31  249  static __always_inline u64 steal_account_process_time(u64 maxtime)
73fbec604432e1f Frederic Weisbecker 2012-06-16  250  {
73fbec604432e1f Frederic Weisbecker 2012-06-16  251  #ifdef CONFIG_PARAVIRT
73fbec604432e1f Frederic Weisbecker 2012-06-16 @252  	if (static_key_false(&paravirt_steal_enabled)) {
2b1f967d80e8e5d Frederic Weisbecker 2017-01-31  253  		u64 steal;
73fbec604432e1f Frederic Weisbecker 2012-06-16  254  
73fbec604432e1f Frederic Weisbecker 2012-06-16 @255  		steal = paravirt_steal_clock(smp_processor_id());
73fbec604432e1f Frederic Weisbecker 2012-06-16  256  		steal -= this_rq()->prev_steal_time;
2b1f967d80e8e5d Frederic Weisbecker 2017-01-31  257  		steal = min(steal, maxtime);
2b1f967d80e8e5d Frederic Weisbecker 2017-01-31  258  		account_steal_time(steal);
2b1f967d80e8e5d Frederic Weisbecker 2017-01-31  259  		this_rq()->prev_steal_time += steal;
73fbec604432e1f Frederic Weisbecker 2012-06-16  260  
2b1f967d80e8e5d Frederic Weisbecker 2017-01-31  261  		return steal;
73fbec604432e1f Frederic Weisbecker 2012-06-16  262  	}
73fbec604432e1f Frederic Weisbecker 2012-06-16  263  #endif
807e5b80687c067 Wanpeng Li          2016-06-13  264  	return 0;
73fbec604432e1f Frederic Weisbecker 2012-06-16  265  }
73fbec604432e1f Frederic Weisbecker 2012-06-16  266  

:::::: The code at line 252 was first introduced by commit
:::::: 73fbec604432e1fbfeb1bc59a110dac1f98160f6 sched: Move cputime code to its own file

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
