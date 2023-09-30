Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A651388
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 03:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696042948; x=1727578948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JlTqLvHg0+Zx+J9xQT+C5Q+ZYONuzsSFi4KbSg81u0E=;
  b=oBzgXW6MhR6EEQLcRW0gBkVDjw+5AvqOwhCCIi9OI4RXS+Aei2U3/47R
   fxhJkqy0PQ6FyVOieNCDKwa+YtAMkCMI9as5cF4hYJcdWnpBnjbp9YHxr
   QefeGTOPp+I1GKoIhIsncQ0i+zc1d4hHbsxj8d5IRrc62GBaPQf/XeMpe
   +Om1inGa/+9c1mP3J6kxeyB4l/wwXj7J97Km6KjQs6qB88QDVPVvl5TbJ
   HJJrDO8E54ig3yqoboIhaIOM7YnTGROG7MMD697B/Sr45FBEx2Mn2WMH+
   QJ3joiiY2MaK/A9yU2LmOI/FkNPS53QCNdHN46vLWdqvE/8C8SuB3enm1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="385243654"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="385243654"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 20:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="815775968"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="815775968"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2023 20:02:26 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmQFM-0003cV-1y;
	Sat, 30 Sep 2023 03:02:24 +0000
Date: Sat, 30 Sep 2023 11:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-kexec 13/13]
 arch/x86/kernel/acpi/madt_wakeup.c:149:2: error: 'smp_ops' undeclared
Message-ID: <202309301018.JdWROPS5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-kexec
head:   34488d4fd2b299a51196e878575dd1e83cbbbc7f
commit: 34488d4fd2b299a51196e878575dd1e83cbbbc7f [13/13] x86/acpi: Add support for CPU offlining for ACPI MADT wakeup method
config: x86_64-buildonly-randconfig-006-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301018.JdWROPS5-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301018.JdWROPS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301018.JdWROPS5-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/acpi/madt_wakeup.c: In function 'acpi_mp_setup_reset':
>> arch/x86/kernel/acpi/madt_wakeup.c:149:2: error: 'smp_ops' undeclared (first use in this function)
     149 |  smp_ops.play_dead = acpi_mp_play_dead;
         |  ^~~~~~~
   arch/x86/kernel/acpi/madt_wakeup.c:149:2: note: each undeclared identifier is reported only once for each function it appears in


vim +/smp_ops +149 arch/x86/kernel/acpi/madt_wakeup.c

   120	
   121	static int __init acpi_mp_setup_reset(u64 reset_vector)
   122	{
   123		pgd_t *pgd;
   124		struct x86_mapping_info info = {
   125			.alloc_pgt_page = alloc_pgt_page,
   126			.page_flag      = __PAGE_KERNEL_LARGE_EXEC,
   127			.kernpg_flag    = _KERNPG_TABLE_NOENC,
   128		};
   129	
   130		pgd = alloc_pgt_page(NULL);
   131	
   132		for (int i = 0; i < nr_pfn_mapped; i++) {
   133			unsigned long mstart, mend;
   134			mstart = pfn_mapped[i].start << PAGE_SHIFT;
   135			mend   = pfn_mapped[i].end << PAGE_SHIFT;
   136			if (kernel_ident_mapping_init(&info, pgd, mstart, mend))
   137				return -ENOMEM;
   138		}
   139	
   140		if (kernel_ident_mapping_init(&info, pgd,
   141					      PAGE_ALIGN_DOWN(reset_vector),
   142					      PAGE_ALIGN(reset_vector + 1))) {
   143			return -ENOMEM;
   144		}
   145	
   146		if (init_transition_pgtable(pgd))
   147			return -ENOMEM;
   148	
 > 149		smp_ops.play_dead = acpi_mp_play_dead;
   150		smp_ops.cpu_die = acpi_mp_cpu_die;
   151		smp_ops.stop_other_cpus = acpi_mp_stop_other_cpus;
   152		smp_ops.crash_stop_other_cpus = acpi_mp_crash_stop_other_cpus;
   153	
   154		acpi_mp_reset_vector_paddr = reset_vector;
   155		acpi_mp_pgd = __pa(pgd);
   156	
   157		return 0;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
