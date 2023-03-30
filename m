Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63BD301
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 23:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680217697; x=1711753697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LYu7WGDMa6Q4Tgd6eU5td82J9HnYbVi/lhq0wD3U/vM=;
  b=Q3joWU6Sn2apkVkJZj5ATsg0ykuhLBHoPTqy3g54H7fDEu3NT40sLD4x
   VVbboCH8cxGfQ+F0Led6nPBmtApm/N5gUs+nxnPXhNVEhc2LfAhRl9sPF
   wnFqBkSpPthlwr/dahGjN1YSS5Emi9HkOqDMauh53lHAP56kmbxKMwgcG
   OfSt+U+hVu6CXN4a3Ua54Na7knjEe008GIf+pZ9IZerIcOuu8En3KqqoG
   ckZdMd3n1Q5j8OfNC87Ywvuoo3JZVi0NP9y5aj8csxURI+Nbcpa+9AMBK
   mE8EyNeDN6S2tBdIJod1xNWkwLd3o1J8IWHp/IMDyg6Nk7rHrrzGN0NUu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342953033"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="342953033"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 16:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662211821"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="662211821"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Mar 2023 16:08:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi1NO-000LIK-26;
	Thu, 30 Mar 2023 23:08:14 +0000
Date: Fri, 31 Mar 2023 07:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
	Brian Gerst <brgerst@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>
Subject: [dwmw2:tglx-parallel-2 24/25] kernel/cpu.c:641:17: error: implicit
 declaration of function 'cpu_up'
Message-ID: <202303310707.3I5nSh0C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux tglx-parallel-2
head:   553f41a50ed7c3097c465e96d5c41522a1fae23e
commit: 0a1bcd102db41f6364d0aa00960e2fb908fd3762 [24/25] x86/smpboot: Support parallel startup of secondary CPUs
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230331/202303310707.3I5nSh0C-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 tglx-parallel-2
        git checkout 0a1bcd102db41f6364d0aa00960e2fb908fd3762
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310707.3I5nSh0C-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cpu.c: In function 'cpuhp_bp_sync_alive':
   kernel/cpu.c:436:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     436 |         int ret = 0;
         |             ^~~
   kernel/cpu.c: In function 'cpuhp_bringup_cpus_parallel':
>> kernel/cpu.c:641:17: error: implicit declaration of function 'cpu_up' [-Werror=implicit-function-declaration]
     641 |                 cpu_up(cpu, CPUHP_BP_KICK_AP);
         |                 ^~~~~~
   kernel/cpu.c: At top level:
>> kernel/cpu.c:1706:12: error: static declaration of 'cpu_up' follows non-static declaration
    1706 | static int cpu_up(unsigned int cpu, enum cpuhp_state target)
         |            ^~~~~~
   kernel/cpu.c:641:17: note: previous implicit declaration of 'cpu_up' with type 'int()'
     641 |                 cpu_up(cpu, CPUHP_BP_KICK_AP);
         |                 ^~~~~~
   kernel/cpu.c: In function 'bringup_nonboot_cpus':
   kernel/cpu.c:1797:9: error: too many arguments to function 'cpuhp_bringup_cpus_parallel'
    1797 |         cpuhp_bringup_cpus_parallel(setup_max_cpus);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cpu.c:631:13: note: declared here
     631 | static void cpuhp_bringup_cpus_parallel(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cpu_up +641 kernel/cpu.c

c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  620  
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  621  /*
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  622   * On architectures which have enabled parallel bringup this invokes all BP
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  623   * prepare states for each of the to be onlined APs. The last state sends
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  624   * the startup IPI to the APs. The APs proceed through the low level
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  625   * bringup code in parallel and then wait for the control CPU to release
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  626   * them one by one for the final onlining procedure.
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  627   *
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  628   * This avoids waiting for each AP to respond to the startup IPI in
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  629   * CPUHP_BRINGUP_CPU.
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  630   */
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  631  static void cpuhp_bringup_cpus_parallel(void)
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  632  {
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  633  	unsigned int cpu, n = 1;
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  634  
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  635  	if (!__cpuhp_parallel_bringup)
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  636  		return;
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  637  
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  638  	for_each_present_cpu(cpu) {
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  639  		if (n++ >= setup_max_cpus)
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  640  			break;
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30 @641  		cpu_up(cpu, CPUHP_BP_KICK_AP);
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  642  	}
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  643  }
c8f7cb6d0895e4 Thomas Gleixner 2023-03-30  644  

:::::: The code at line 641 was first introduced by commit
:::::: c8f7cb6d0895e48171b3fc33201e9244ac0e5970 cpu/hotplug: Allow "parallel" bringup up to CPUHP_BP_KICK_AP_STATE

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: David Woodhouse <dwmw@amazon.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
