Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DA363
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 01:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687483674; x=1719019674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KmyVnwA9izWyucns16A0Ln8YLgUCUTPucFhpOBOpsJk=;
  b=UDSIOWL3Opid8XWNkmy9xdhpYywqgvjzHT9rV0FR4zZ3yfKtzvxluDju
   t/hJdnweoH+lzPfy7hdse6/6FBa4G7YQx0G2d2+kxCsWduXPOjTGYv9BI
   nDq/W4JwLrPDZwiXBMjfQi4S9iyhN9A6BZOl3YlPeZGo02pQwkBOAL4VD
   kfx+l0lNpbCoZdCc7naiCJaeXxFc/J/xsgZxuU9F2UyjFf7okppm4lrhc
   dpOCFeKntF3T9IVIEOj9GdJ9veEwoI2chFoLu+yGf9v54ccNmHwydpOoR
   /Au2mRc/4STYc2AQPWEwjzfPf8nfhZmpvhze/1mVjgp7SfmFJIKoBU8V8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359523620"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="359523620"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 18:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="859670866"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="859670866"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2023 18:27:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCVaZ-0007sR-1R;
	Fri, 23 Jun 2023 01:27:51 +0000
Date: Fri, 23 Jun 2023 09:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 69/70] panic.c:undefined reference to
 `arch_trigger_cpumask_backtrace'
Message-ID: <202306230940.cAAzoBuj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   2f300c1db6849096050b341817208f97d55586b9
commit: 7cf0441a9e57e752c39bb70ceb2e74bbf66ec958 [69/70] powerpc: move arch_trigger_cpumask_backtrace from nmi.h to irq.h
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230623/202306230940.cAAzoBuj-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230940.cAAzoBuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230940.cAAzoBuj-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/panic.o: in function `panic':
>> panic.c:(.text+0xa9c): undefined reference to `arch_trigger_cpumask_backtrace'
>> powerpc-linux-ld: panic.c:(.text+0xae0): undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/panic.o: in function `oops_enter':
   panic.c:(.text+0x1518): undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/sched/core.o: in function `dump_cpu_task':
>> core.c:(.text+0x1dd70): undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/hung_task.o: in function `check_hung_uninterruptible_tasks':
>> hung_task.c:(.text+0x11e0): undefined reference to `arch_trigger_cpumask_backtrace'
   powerpc-linux-ld: kernel/watchdog.o:watchdog.c:(.text+0x8f0): more undefined references to `arch_trigger_cpumask_backtrace' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
