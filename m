Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EB7AD4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687533735; x=1719069735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hg2ccO4Fgw277fiW62Wxje3atpAT3R09LfW6qUcVb/4=;
  b=EF0c7/WdpRm0tbQqivhNR73rMbE462/+DJ1ThH0H5ciQXx7OFZ1P4Qpz
   lFE5cUiwSiBAEZ04H5UReVf6z02F4yQRPJQyNhznKqqsis4Hk+Np/EVA6
   uvRsBoWhnz5urNtA6rCcMzPK8NbRBYIu2JtYBE+OZK6V2j3nlbj7jFGT2
   Duq4rA+7K9Hj5XvV5baqWEteVooI/L2Z0IDiAQd4IHhkiVLguSYrZ6LjG
   Svkki5iUrahOD6CMYxVVuwkRi9Gk+oyhXMGRSYrWJU186F+xjeybmL0aV
   Qo3L3yvR2dYCJi0i3cRtcjH3Yrd1QuXZCWmiO2uNcHp3M86ntQmBneS+F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="345543913"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="345543913"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 08:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="889510803"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="889510803"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Jun 2023 08:22:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCibz-0008OB-37;
	Fri, 23 Jun 2023 15:22:11 +0000
Date: Fri, 23 Jun 2023 23:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>
Subject: [linux-next:master 11921/12162] include/linux/nmi.h:160: undefined
 reference to `arch_trigger_cpumask_backtrace'
Message-ID: <202306232330.luFAk63S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d2be868b42c08290509c60515865f4de24ea704
commit: 1141ba8fc84c333b138946d4cf973f5ade78b9ed [11921/12162] powerpc: move arch_trigger_cpumask_backtrace from nmi.h to irq.h
config: powerpc-randconfig-r025-20230622 (https://download.01.org/0day-ci/archive/20230623/202306232330.luFAk63S-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306232330.luFAk63S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306232330.luFAk63S-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/panic.o: in function `trigger_all_cpu_backtrace':
>> include/linux/nmi.h:160: undefined reference to `arch_trigger_cpumask_backtrace'
>> powerpc-linux-ld: include/linux/nmi.h:160: undefined reference to `arch_trigger_cpumask_backtrace'
>> powerpc-linux-ld: include/linux/nmi.h:160: undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/sched/core.o: in function `trigger_single_cpu_backtrace':
   include/linux/nmi.h:178: undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/watchdog.o: in function `trigger_allbutself_cpu_backtrace':
   include/linux/nmi.h:166: undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: drivers/tty/sysrq.o:include/linux/nmi.h:160: more undefined references to `arch_trigger_cpumask_backtrace' follow


vim +160 include/linux/nmi.h

6e7458a6f074c7 Ulrich Obergfell 2014-10-13  151  
47cab6a722d44c Ingo Molnar      2009-08-03  152  /*
47cab6a722d44c Ingo Molnar      2009-08-03  153   * Create trigger_all_cpu_backtrace() out of the arch-provided
47cab6a722d44c Ingo Molnar      2009-08-03  154   * base function. Return whether such support was available,
47cab6a722d44c Ingo Molnar      2009-08-03  155   * to allow calling code to fall back to some other mechanism:
47cab6a722d44c Ingo Molnar      2009-08-03  156   */
9a01c3ed5cdb35 Chris Metcalf    2016-10-07  157  #ifdef arch_trigger_cpumask_backtrace
47cab6a722d44c Ingo Molnar      2009-08-03  158  static inline bool trigger_all_cpu_backtrace(void)
47cab6a722d44c Ingo Molnar      2009-08-03  159  {
9a01c3ed5cdb35 Chris Metcalf    2016-10-07 @160  	arch_trigger_cpumask_backtrace(cpu_online_mask, false);
47cab6a722d44c Ingo Molnar      2009-08-03  161  	return true;
47cab6a722d44c Ingo Molnar      2009-08-03  162  }
9a01c3ed5cdb35 Chris Metcalf    2016-10-07  163  

:::::: The code at line 160 was first introduced by commit
:::::: 9a01c3ed5cdb35d9004eb92510ee6ea11b4a5f16 nmi_backtrace: add more trigger_*_cpu_backtrace() methods

:::::: TO: Chris Metcalf <cmetcalf@mellanox.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
