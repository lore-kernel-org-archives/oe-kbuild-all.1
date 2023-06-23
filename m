Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCC815499
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 21:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687555888; x=1719091888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9ddSXdGjqnGmVFdYPwU18Acem5jTDD5Ha7mAffSJmI=;
  b=SFzlUpZ71CF0u2N/cZld5OEm2ku279o55XfKL1BZqsL4zPLACiKxbYfO
   8GbZVuZeYbVgQ1IIqBP0JnmJ5bKAIG2wcZoxpwbPkjjS4gRA3J9eQldDe
   vX+7g86z6NmQ5VyQIGhnRSCQe+27zxcVMWCBULe4Oa5FjfZzJzmbSD8Vk
   CQNVt32Woybih2iv3lmvCgGK2bXldXdfs/ZzjWTOrl+tzq24XlP2/wHha
   Ef8+gWsCpKWn9rw0ygbyYmdasTaO3iHOBKlFh1Tp7+IuOl0Nv2nv87QSC
   oTZ2kKxIY54lFM50R7gHNO5mzggoyF8BpiuttmA6Rp7VgLJ7F+aKhidj5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="426851395"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="426851395"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 14:31:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="962114707"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="962114707"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jun 2023 14:31:19 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCoND-0008Xh-0J;
	Fri, 23 Jun 2023 21:31:19 +0000
Date: Sat, 24 Jun 2023 05:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>
Subject: [linux-next:master 11921/12162] panic.c:undefined reference to
 `arch_trigger_cpumask_backtrace'
Message-ID: <202306240558.jm85FlCG-lkp@intel.com>
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230624/202306240558.jm85FlCG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240558.jm85FlCG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240558.jm85FlCG-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/panic.o: in function `panic':
>> panic.c:(.text.panic+0x2f8): undefined reference to `arch_trigger_cpumask_backtrace'
>> powerpc-linux-ld: panic.c:(.text.panic+0x33c): undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/panic.o: in function `oops_enter':
>> panic.c:(.text.oops_enter+0x58): undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/sched/core.o: in function `dump_cpu_task':
>> core.c:(.text.dump_cpu_task+0xe8): undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/hung_task.o: in function `check_hung_uninterruptible_tasks':
>> hung_task.c:(.text.check_hung_uninterruptible_tasks+0x584): undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/watchdog.o:watchdog.c:(.text.watchdog_timer_fn+0x4cc): more undefined references to `arch_trigger_cpumask_backtrace' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
