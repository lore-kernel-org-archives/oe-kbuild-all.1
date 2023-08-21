Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53EA8C03
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692643119; x=1724179119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1MZsQ8+jftqlEqF5TqG7ViteX4VHYpdU+NLSuN1XZoI=;
  b=D0NykkTz0A+2Enkg9TrB7v0cCz5CmAkv7Vd86hiigvnJQ+fx3bU48HUI
   UVaT5tiuNfGyC8vOqtfASUwjtW5iann7NXoMLGw4RiZruVr+8+WtAXSrR
   T6PLjuvEFXQCqOJu2+6VzUx8GWByTAXo09+3c8wbu6rrRMH3Hoo8oJHvi
   bwMiuPKCPQp13yVpigoiP1zP40yHqUSZUwHM4ykSIonMimALylAIu3Oaa
   niooxPXBS9Y2maob5rGq5D6wMhyLzeKvl0tKNYaXNXxPmJeaa6NzjESG/
   /sKscH5Pw6LouH0Oj/LVI11t46ZII+hRtR0rXu6tpU85HsjK46pT81jkf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377417116"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="377417116"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 11:38:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685755155"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="685755155"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 11:38:34 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY9nK-0000ni-2k;
	Mon, 21 Aug 2023 18:38:32 +0000
Date: Tue, 22 Aug 2023 02:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: kernel/trace/trace_events.c:2102:37: warning: 'ftrace_event_id_fops'
 defined but not used
Message-ID: <202308220210.4uvlS2Zx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 93a4fa622eb061f75f87f0cf9609ab4e69c67d01 LoongArch: Add STACKTRACE support
date:   1 year ago
config: loongarch-randconfig-r014-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220210.4uvlS2Zx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220210.4uvlS2Zx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220210.4uvlS2Zx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events.c:2102:37: warning: 'ftrace_event_id_fops' defined but not used [-Wunused-const-variable=]
    2102 | static const struct file_operations ftrace_event_id_fops = {
         |                                     ^~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/locking/lockdep.c:61:
>> kernel/locking/lockdep_internals.h:69:28: warning: 'LOCKF_USED_IN_IRQ_READ' defined but not used [-Wunused-const-variable=]
      69 | static const unsigned long LOCKF_USED_IN_IRQ_READ =
         |                            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/locking/lockdep_internals.h:63:28: warning: 'LOCKF_ENABLED_IRQ_READ' defined but not used [-Wunused-const-variable=]
      63 | static const unsigned long LOCKF_ENABLED_IRQ_READ =
         |                            ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/locking/lockdep_internals.h:57:28: warning: 'LOCKF_USED_IN_IRQ' defined but not used [-Wunused-const-variable=]
      57 | static const unsigned long LOCKF_USED_IN_IRQ =
         |                            ^~~~~~~~~~~~~~~~~
>> kernel/locking/lockdep_internals.h:51:28: warning: 'LOCKF_ENABLED_IRQ' defined but not used [-Wunused-const-variable=]
      51 | static const unsigned long LOCKF_ENABLED_IRQ =
         |                            ^~~~~~~~~~~~~~~~~


vim +/ftrace_event_id_fops +2102 kernel/trace/trace_events.c

981d081ec8b958 Steven Rostedt 2009-03-02  2101  
23725aeeab10ba Peter Zijlstra 2009-03-19 @2102  static const struct file_operations ftrace_event_id_fops = {
23725aeeab10ba Peter Zijlstra 2009-03-19  2103  	.read = event_id_read,
6038f373a3dc1f Arnd Bergmann  2010-08-15  2104  	.llseek = default_llseek,
23725aeeab10ba Peter Zijlstra 2009-03-19  2105  };
23725aeeab10ba Peter Zijlstra 2009-03-19  2106  

:::::: The code at line 2102 was first introduced by commit
:::::: 23725aeeab10ba02bcf10ec49ad73146b54cb52f ftrace: provide an id file for each event

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
