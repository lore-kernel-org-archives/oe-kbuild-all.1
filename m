Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D541837A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 20:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693859983; x=1725395983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3O50hkdrWZm5IEoYuG9lUwvmPAw9V1ghpJDrgdE/Z/A=;
  b=ZeXBMGumq/Jq+SnF3qD+tEldSYD4vRnXoFWHwyHm003ao1DZs9v4Vy4Y
   eDUjoklgez+VPSJIMOlsV5VWIjs1gDtu3ZpoBYcAvjMi6UEZ6R70JJ8NJ
   1F9tr/5cFZynx3lSAQK42LGEbfXKbldADI+27Bel1yX8Bw2SqH0bkf90W
   8PvbVFh2w+Zs3My98lLxEWnJ5NtrweIH47DpieDoFdwhZtvuhcSrYOjWO
   kM1TPLTNL3RPc+j1IUIvGcruljo5PnC1RwKLmvdpil0p2jn6YNy/9XZ/H
   fbl7qgkqFNYb/wdBp0kUQZBEEkkZ4LdaElOpIctWMJWs7vtyiqpqSgMEt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="356146858"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="356146858"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 13:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="1071717511"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; 
   d="scan'208";a="1071717511"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 04 Sep 2023 13:39:41 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdGMF-0000ol-22;
	Mon, 04 Sep 2023 20:39:39 +0000
Date: Tue, 5 Sep 2023 04:38:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 28/30]
 arch/x86/kernel/cpu/microcode/core.c:454:3: error: implicit declaration of
 function 'apic_send_nmi_to_offline_cpu'; did you mean
 'ucode_kick_offline_cpus'?
Message-ID: <202309050454.w8l6MzRu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/microcode
head:   1e0a6155f60f402c59f26124cd743356417e3647
commit: 99a3c2d08c80edc3687dafcdd93ef4e5cfa3b030 [28/30] x86/microcode: Handle "offline" CPUs correctly
config: x86_64-randconfig-011-20230904 (https://download.01.org/0day-ci/archive/20230905/202309050454.w8l6MzRu-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309050454.w8l6MzRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309050454.w8l6MzRu-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/microcode/core.c: In function 'ucode_kick_offline_cpus':
>> arch/x86/kernel/cpu/microcode/core.c:454:3: error: implicit declaration of function 'apic_send_nmi_to_offline_cpu'; did you mean 'ucode_kick_offline_cpus'? [-Werror=implicit-function-declaration]
      apic_send_nmi_to_offline_cpu(cpu);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      ucode_kick_offline_cpus
   arch/x86/kernel/cpu/microcode/core.c: In function 'ucode_setup_cpus':
>> arch/x86/kernel/cpu/microcode/core.c:664:34: error: 'struct apic' has no member named 'nmi_to_offline_cpu'
      (microcode_ops->use_nmi && apic->nmi_to_offline_cpu);
                                     ^~
   cc1: some warnings being treated as errors


vim +454 arch/x86/kernel/cpu/microcode/core.c

   446	
   447	static bool ucode_kick_offline_cpus(unsigned int nr_offl)
   448	{
   449		unsigned int cpu, timeout;
   450	
   451		for_each_cpu(cpu, &cpu_offline_mask) {
   452			/* Enable the rendevouz handler and send NMI */
   453			per_cpu(ucode_ctrl.nmi_enabled, cpu) = true;
 > 454			apic_send_nmi_to_offline_cpu(cpu);
   455		}
   456	
   457		/* Wait for them to arrive */
   458		for (timeout = 0; timeout < (USEC_PER_SEC / 2); timeout++) {
   459			if (atomic_read(&offline_in_nmi) == nr_offl)
   460				return true;
   461			udelay(1);
   462		}
   463		/* Let the others time out */
   464		return false;
   465	}
   466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
