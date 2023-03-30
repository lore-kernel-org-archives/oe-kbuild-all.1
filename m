Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08B41FB9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 12:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680177956; x=1711713956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OMVIWKYbf0qod38FXFuK2d9D0a8mQRG6+OY2W6jIMvs=;
  b=VdjRNdQzqGP91xo0WYWRsrALvTk2M8fbEDDNCNos2tdDhC1602zDurtM
   7mifP++F3X1xI33zhfZ4g81TI7s3ADMfx7iuoyXdl4sD6n5kh5BEPzVfz
   YkjCZrywlcrHOM+HgvRaSJP8uX5gBS3xXEPSDoIp6ghFwoZRyjX8/hNWV
   XCnL/gPpPW+Cp0HALaS4tA2jShO09Tn/ZNLgIxHv4fWlCcZirzSJsTLvS
   vD8VpxCZDK0u8JO4YOYoAEbH4SHL1TycQRMjIOJgmqmjAec/fvAXM1fCX
   Wvd4MBMlSiLXA8xa2kA0KY1prMUPPsfV9n5B/xQVWA95qFPWDPABBYwsL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342761050"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="342761050"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 05:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="795650773"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="795650773"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2023 05:05:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phr2O-000KpM-0c;
	Thu, 30 Mar 2023 12:05:52 +0000
Date: Thu, 30 Mar 2023 20:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rui Wang <wangrui@loongson.cn>
Subject: kernel/events/core.c:223:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202303301921.astlDuQv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ffe78bbd512166e0ef1cc4858010b128c510ed7d
commit: 720dc7ab252bbdf404cab7b909e26b31e602bf7e LoongArch: Add subword xchg/cmpxchg emulation
date:   7 months ago
config: loongarch-randconfig-s033-20230329 (https://download.01.org/0day-ci/archive/20230330/202303301921.astlDuQv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=720dc7ab252bbdf404cab7b909e26b31e602bf7e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 720dc7ab252bbdf404cab7b909e26b31e602bf7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/ drivers/perf/ kernel/events/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301921.astlDuQv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/core.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:223:9: sparse:     expected void *ptr
   kernel/events/core.c:223:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/events/core.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:223:9: sparse:     expected void *ptr
   kernel/events/core.c:223:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/events/core.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:223:9: sparse:     expected void *ptr
   kernel/events/core.c:223:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/events/core.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:223:9: sparse:     expected void *ptr
   kernel/events/core.c:223:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/events/core.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:223:9: sparse:     expected void *ptr
   kernel/events/core.c:223:9: sparse:     got int [noderef] __percpu *
>> kernel/events/core.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:223:9: sparse:     expected void *ptr
   kernel/events/core.c:223:9: sparse:     got int [noderef] __percpu *
>> kernel/events/core.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:223:9: sparse:     expected void *ptr
   kernel/events/core.c:223:9: sparse:     got int [noderef] __percpu *
>> kernel/events/core.c:223:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:223:9: sparse:     expected void *ptr
   kernel/events/core.c:223:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:320:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:320:9: sparse:     expected void *ptr
   kernel/events/core.c:320:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:320:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:320:9: sparse:     expected void *ptr
   kernel/events/core.c:320:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:320:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:320:9: sparse:     expected void *ptr
   kernel/events/core.c:320:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:320:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:320:9: sparse:     expected void *ptr
   kernel/events/core.c:320:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:320:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:320:9: sparse:     expected void *ptr
   kernel/events/core.c:320:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:320:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:320:9: sparse:     expected void *ptr
   kernel/events/core.c:320:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:320:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:320:9: sparse:     expected void *ptr
   kernel/events/core.c:320:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:320:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:320:9: sparse:     expected void *ptr
   kernel/events/core.c:320:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1074:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1074:9: sparse:     expected void *ptr
   kernel/events/core.c:1074:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1074:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1074:9: sparse:     expected void *ptr
   kernel/events/core.c:1074:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1074:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1074:9: sparse:     expected void *ptr
   kernel/events/core.c:1074:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1074:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1074:9: sparse:     expected void *ptr
   kernel/events/core.c:1074:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1074:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1074:9: sparse:     expected void *ptr
   kernel/events/core.c:1074:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1074:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1074:9: sparse:     expected void *ptr
   kernel/events/core.c:1074:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1074:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1074:9: sparse:     expected void *ptr
   kernel/events/core.c:1074:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1074:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1074:9: sparse:     expected void *ptr
   kernel/events/core.c:1074:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1161:9: sparse:     expected void *ptr
   kernel/events/core.c:1161:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1161:9: sparse:     expected void *ptr
   kernel/events/core.c:1161:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1161:9: sparse:     expected void *ptr
   kernel/events/core.c:1161:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1161:9: sparse:     expected void *ptr
   kernel/events/core.c:1161:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1161:9: sparse:     expected void *ptr
   kernel/events/core.c:1161:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1161:9: sparse:     expected void *ptr
   kernel/events/core.c:1161:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1161:9: sparse:     expected void *ptr
   kernel/events/core.c:1161:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1161:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1161:9: sparse:     expected void *ptr
   kernel/events/core.c:1161:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1170:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1170:9: sparse:     expected void *ptr
   kernel/events/core.c:1170:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1170:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1170:9: sparse:     expected void *ptr
   kernel/events/core.c:1170:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1170:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1170:9: sparse:     expected void *ptr
   kernel/events/core.c:1170:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1170:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/events/core.c:1170:9: sparse:     expected void *ptr
   kernel/events/core.c:1170:9: sparse:     got unsigned int [noderef] __percpu *
   kernel/events/core.c:1170:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1170:9: sparse:     expected void *ptr
   kernel/events/core.c:1170:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1170:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1170:9: sparse:     expected void *ptr
   kernel/events/core.c:1170:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1170:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1170:9: sparse:     expected void *ptr
   kernel/events/core.c:1170:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1170:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1170:9: sparse:     expected void *ptr
   kernel/events/core.c:1170:9: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1402:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1402:15: sparse:    struct perf_event_context [noderef] __rcu *

vim +223 kernel/events/core.c

fae3fde65138b60 Peter Zijlstra      2016-01-11  213  
fae3fde65138b60 Peter Zijlstra      2016-01-11  214  static int event_function(void *info)
fae3fde65138b60 Peter Zijlstra      2016-01-11  215  {
fae3fde65138b60 Peter Zijlstra      2016-01-11  216  	struct event_function_struct *efs = info;
fae3fde65138b60 Peter Zijlstra      2016-01-11  217  	struct perf_event *event = efs->event;
fae3fde65138b60 Peter Zijlstra      2016-01-11  218  	struct perf_event_context *ctx = event->ctx;
fae3fde65138b60 Peter Zijlstra      2016-01-11  219  	struct perf_cpu_context *cpuctx = __get_cpu_context(ctx);
fae3fde65138b60 Peter Zijlstra      2016-01-11  220  	struct perf_event_context *task_ctx = cpuctx->task_ctx;
63b6da39bb38e8f Peter Zijlstra      2016-01-14  221  	int ret = 0;
fae3fde65138b60 Peter Zijlstra      2016-01-11  222  
164446455a5d3f1 Frederic Weisbecker 2017-11-06 @223  	lockdep_assert_irqs_disabled();
fae3fde65138b60 Peter Zijlstra      2016-01-11  224  
63b6da39bb38e8f Peter Zijlstra      2016-01-14  225  	perf_ctx_lock(cpuctx, task_ctx);
fae3fde65138b60 Peter Zijlstra      2016-01-11  226  	/*
fae3fde65138b60 Peter Zijlstra      2016-01-11  227  	 * Since we do the IPI call without holding ctx->lock things can have
fae3fde65138b60 Peter Zijlstra      2016-01-11  228  	 * changed, double check we hit the task we set out to hit.
fae3fde65138b60 Peter Zijlstra      2016-01-11  229  	 */
fae3fde65138b60 Peter Zijlstra      2016-01-11  230  	if (ctx->task) {
63b6da39bb38e8f Peter Zijlstra      2016-01-14  231  		if (ctx->task != current) {
0da4cf3e0a68c97 Peter Zijlstra      2016-02-24  232  			ret = -ESRCH;
63b6da39bb38e8f Peter Zijlstra      2016-01-14  233  			goto unlock;
fae3fde65138b60 Peter Zijlstra      2016-01-11  234  		}
fae3fde65138b60 Peter Zijlstra      2016-01-11  235  
fae3fde65138b60 Peter Zijlstra      2016-01-11  236  		/*
fae3fde65138b60 Peter Zijlstra      2016-01-11  237  		 * We only use event_function_call() on established contexts,
fae3fde65138b60 Peter Zijlstra      2016-01-11  238  		 * and event_function() is only ever called when active (or
fae3fde65138b60 Peter Zijlstra      2016-01-11  239  		 * rather, we'll have bailed in task_function_call() or the
fae3fde65138b60 Peter Zijlstra      2016-01-11  240  		 * above ctx->task != current test), therefore we must have
fae3fde65138b60 Peter Zijlstra      2016-01-11  241  		 * ctx->is_active here.
fae3fde65138b60 Peter Zijlstra      2016-01-11  242  		 */
fae3fde65138b60 Peter Zijlstra      2016-01-11  243  		WARN_ON_ONCE(!ctx->is_active);
fae3fde65138b60 Peter Zijlstra      2016-01-11  244  		/*
fae3fde65138b60 Peter Zijlstra      2016-01-11  245  		 * And since we have ctx->is_active, cpuctx->task_ctx must
fae3fde65138b60 Peter Zijlstra      2016-01-11  246  		 * match.
fae3fde65138b60 Peter Zijlstra      2016-01-11  247  		 */
63b6da39bb38e8f Peter Zijlstra      2016-01-14  248  		WARN_ON_ONCE(task_ctx != ctx);
63b6da39bb38e8f Peter Zijlstra      2016-01-14  249  	} else {
63b6da39bb38e8f Peter Zijlstra      2016-01-14  250  		WARN_ON_ONCE(&cpuctx->ctx != ctx);
fae3fde65138b60 Peter Zijlstra      2016-01-11  251  	}
63b6da39bb38e8f Peter Zijlstra      2016-01-14  252  
fae3fde65138b60 Peter Zijlstra      2016-01-11  253  	efs->func(event, cpuctx, ctx, efs->data);
63b6da39bb38e8f Peter Zijlstra      2016-01-14  254  unlock:
fae3fde65138b60 Peter Zijlstra      2016-01-11  255  	perf_ctx_unlock(cpuctx, task_ctx);
fae3fde65138b60 Peter Zijlstra      2016-01-11  256  
63b6da39bb38e8f Peter Zijlstra      2016-01-14  257  	return ret;
fae3fde65138b60 Peter Zijlstra      2016-01-11  258  }
fae3fde65138b60 Peter Zijlstra      2016-01-11  259  

:::::: The code at line 223 was first introduced by commit
:::::: 164446455a5d3f1402b5a0ea42acce33fd576ed7 perf/core: Use lockdep to assert IRQs are disabled/enabled

:::::: TO: Frederic Weisbecker <frederic@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
