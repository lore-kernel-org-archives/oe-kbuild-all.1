Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0952510E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 21:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680210913; x=1711746913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4c0aESFxZ8berxXFQmvySJKqSAPgcOxrerzDfckycYg=;
  b=Wz9E2tHvzCSr/QNZPZIjKXLRniBy/PnhNl4VPkwT7r4EsgGEmdPw4CtT
   cCq2q3OaqwGZ/fJB+ILQxITBGVwwNuQ3UzTemffeYGfHYUThJ9DeBL7hB
   YLr+3Jh18fIVF258p9ksOQ0zncKopTgCD7vE1yHGvI2iPzzKfxw3QDXVU
   m2ThwBmnwCSeyexQzjR0XfCgKMxzz2yxx5IHdAaxolTWlIxSdn04uZsQk
   rtqGtCbj7HA/YogDWtV6ajh0s0Z/figCXOyl26pjKCqIhfAT/KrIbydH1
   /JsX5CJX+f9zo/EkZOYuiBQ6HOV6Mp06624Fz7ieiqSZxB/jlxo2WK/me
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="320942031"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="320942031"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 14:15:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="808785785"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="808785785"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 30 Mar 2023 14:15:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phzby-000LDM-0k;
	Thu, 30 Mar 2023 21:15:10 +0000
Date: Fri, 31 Mar 2023 05:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:tglx-parallel-2 22/25] kernel/cpu.c:1797:9: error: too many
 arguments to function 'cpuhp_bringup_cpus_parallel'
Message-ID: <202303310531.t8Yhrzyw-lkp@intel.com>
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
commit: c8f7cb6d0895e48171b3fc33201e9244ac0e5970 [22/25] cpu/hotplug: Allow "parallel" bringup up to CPUHP_BP_KICK_AP_STATE
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230331/202303310531.t8Yhrzyw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add dwmw2 git://git.infradead.org/users/dwmw2/linux
        git fetch --no-tags dwmw2 tglx-parallel-2
        git checkout c8f7cb6d0895e48171b3fc33201e9244ac0e5970
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310531.t8Yhrzyw-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cpu.c: In function 'cpuhp_bp_sync_alive':
   kernel/cpu.c:436:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     436 |         int ret = 0;
         |             ^~~
   kernel/cpu.c: In function 'bringup_nonboot_cpus':
>> kernel/cpu.c:1797:9: error: too many arguments to function 'cpuhp_bringup_cpus_parallel'
    1797 |         cpuhp_bringup_cpus_parallel(setup_max_cpus);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cpu.c:652:20: note: declared here
     652 | static inline void cpuhp_bringup_cpus_parallel(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cpuhp_bringup_cpus_parallel +1797 kernel/cpu.c

  1791	
  1792	void bringup_nonboot_cpus(unsigned int setup_max_cpus)
  1793	{
  1794		unsigned int cpu;
  1795	
  1796		/* If enabled, run the "parallel" bringup states first. */
> 1797		cpuhp_bringup_cpus_parallel(setup_max_cpus);
  1798	
  1799		/* Do the per CPU serialized bringup to ONLINE state */
  1800		for_each_present_cpu(cpu) {
  1801			if (num_online_cpus() >= setup_max_cpus)
  1802				break;
  1803	
  1804			if (!cpu_online(cpu)) {
  1805				struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
  1806				int ret = cpu_up(cpu, CPUHP_ONLINE);
  1807	
  1808				/*
  1809				 * If parallel bringup is enabled, then the online
  1810				 * attempt has only rolled back to CPUHP_BP_KICK_AP.
  1811				 * Do the remaining cleanups. NOOP for the non
  1812				 * parallel case.
  1813				 */
  1814				if (ret && can_rollback_cpu(st))
  1815					WARN_ON(cpuhp_invoke_callback_range(false, cpu, st, CPUHP_OFFLINE));
  1816			}
  1817		}
  1818	}
  1819	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
