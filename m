Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F34218E27
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 23:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694819987; x=1726355987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OyPB4FiXpy0hwy8Ujm0Th7oLsYvphQlWbTk0gjT5mP0=;
  b=LdrKRaDUCNAUsVt6TTp88VQptgvY1551EVhBXy1YrPFZ5DNTi2ASNlgj
   aVt4HKPE7LakL5Tx/EH+2w4AOOvykZl6BQPaviGUKLmdMkPXjWYwd9dxH
   kTNaIlyvP/fk6E+DUsMb4KMT1kPmtK/TRUya3aJt1efHPhPOULFzDdp0f
   lzkxb/wFpuD25IvqMGSuxInPW10sO27XFL9tqgsMgn4gpeBuU+0W8szrm
   YAWzo5em6fPR6hLi8fP+iUMtxh7m4w7RCwdf5ofc/OW6Ca5YbQ95sBoXa
   72JDibTk2yuSVF5B2mUZ1fPMrICtb9i+rf4pKzGbL/VmdT1dhL8ImYzvP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="443432423"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="443432423"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 16:19:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="1075940298"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="1075940298"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2023 16:19:45 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhI6B-0003bA-0d;
	Fri, 15 Sep 2023 23:19:43 +0000
Date: Sat, 16 Sep 2023 07:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 42/92]
 arch/x86/kernel/cpu/topology_common.c:185:31: error: 'cpuid_to_apicid'
 undeclared; did you mean 'x86_cpu_to_apicid'?
Message-ID: <202309160746.FdJLBvJj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   a71fe714eb23e6465ebd4962d95ea340b20bd792
commit: 0fe8ff5a6a522b6019d24015a06d7e03ee94296f [42/92] x86/cpu/topology: Make the APIC mismatch warnings complete
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230916/202309160746.FdJLBvJj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160746.FdJLBvJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160746.FdJLBvJj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/topology_common.c: In function 'cpu_parse_topology':
>> arch/x86/kernel/cpu/topology_common.c:185:31: error: 'cpuid_to_apicid' undeclared (first use in this function); did you mean 'x86_cpu_to_apicid'?
     185 |         if (c->topo.apicid != cpuid_to_apicid[cpu]) {
         |                               ^~~~~~~~~~~~~~~
         |                               x86_cpu_to_apicid
   arch/x86/kernel/cpu/topology_common.c:185:31: note: each undeclared identifier is reported only once for each function it appears in


vim +185 arch/x86/kernel/cpu/topology_common.c

   172	
   173	void cpu_parse_topology(struct cpuinfo_x86 *c)
   174	{
   175		unsigned int dom, cpu = smp_processor_id();
   176		struct topo_scan tscan = { .c = c, };
   177	
   178		parse_topology(&tscan, false);
   179	
   180		if (c->topo.initial_apicid != c->topo.apicid) {
   181			pr_err(FW_BUG "CPU%4u: APIC ID mismatch. CPUID: 0x%04x APIC: 0x%04x\n",
   182			       cpu, c->topo.initial_apicid, c->topo.apicid);
   183		}
   184	
 > 185		if (c->topo.apicid != cpuid_to_apicid[cpu]) {
   186			pr_err(FW_BUG "CPU%4u: APIC ID mismatch. Firmware: 0x%04x APIC: 0x%04x\n",
   187			       cpu, cpuid_to_apicid[cpu], c->topo.apicid);
   188		}
   189	
   190		for (dom = TOPO_SMT_DOMAIN; dom < TOPO_MAX_DOMAIN; dom++) {
   191			if (tscan.dom_shifts[dom] == x86_topo_system.dom_shifts[dom])
   192				continue;
   193			pr_err(FW_BUG "CPU%d: Topology domain %u shift %u != %u\n", cpu, dom,
   194			       tscan.dom_shifts[dom], x86_topo_system.dom_shifts[dom]);
   195		}
   196	
   197		/* Bug compatible with the existing parsers */
   198		if (tscan.dom_ncpus[TOPO_SMT_DOMAIN] > smp_num_siblings) {
   199			if (system_state == SYSTEM_BOOTING) {
   200				pr_warn_once("CPU%d: SMT detected and enabled late\n", cpu);
   201				smp_num_siblings = tscan.dom_ncpus[TOPO_SMT_DOMAIN];
   202			} else {
   203				pr_warn_once("CPU%d: SMT detected after init. Too late!\n", cpu);
   204			}
   205		}
   206	
   207		topo_set_ids(&tscan);
   208		topo_set_max_cores(&tscan);
   209	}
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
