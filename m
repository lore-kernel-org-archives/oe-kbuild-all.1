Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474A4C7E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 04:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689308383; x=1720844383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufAw6mjc5wzgF7vFXFiI3O4p6jU5BPDMkoP3xLMXJ1A=;
  b=B2QkjvRjwrsBrBtINzrpPPjencdbEa6hjSIxw7ASLT2V6DiWUBJnnYng
   OIuRA2VQHO2+decDY86gUJFvBJQDIdWdKhplwLy1YS+XbjYrO9DHR8Lxg
   Ai6l5fsjZLJw8v6ryLnrcsXdFIRwts+jt1djdlgGDf2FhYa+WvsNyUq4H
   vn9KColiq+iMA7EI0VQvGD+I4UD9BVzsM8vJaXDMbzNk2kvu2W4yNV7ju
   v8wQgpuoE9chHaRxwTMO46b9T42oxaectNnQM5dMy1s3kN2L8cRESKbJi
   Vy916z5oQkLk0OvqpzXX5xh5clA1VVzwMp8VmxvcrVoMbyIhbdDaJ3rIb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365426219"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="365426219"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 21:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="725558997"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="725558997"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Jul 2023 21:19:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKAH3-0007B1-2K;
	Fri, 14 Jul 2023 04:19:21 +0000
Date: Fri, 14 Jul 2023 12:18:26 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 48/57] arch/x86/kernel/cpu/debugfs.c:31:52:
 error: '__amd_nodes_per_pkg' undeclared
Message-ID: <202307141258.AxRXgfTf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   39d1f9d6ad3d4b9bf9c298db5685f22d8fe6e2c0
commit: 15d4a8d9254f6947ad3f73cc3d2bf11d320864ff [48/57] x86/cpu: Provide an AMD/HYGON specific topology parser
config: i386-buildonly-randconfig-r004-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141258.AxRXgfTf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141258.AxRXgfTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141258.AxRXgfTf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/debugfs.c: In function 'cpu_debug_show':
>> arch/x86/kernel/cpu/debugfs.c:31:52: error: '__amd_nodes_per_pkg' undeclared (first use in this function)
      31 |         seq_printf(m, "amd_nodes_per_pkg:   %u\n", __amd_nodes_per_pkg);
         |                                                    ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/debugfs.c:31:52: note: each undeclared identifier is reported only once for each function it appears in


vim +/__amd_nodes_per_pkg +31 arch/x86/kernel/cpu/debugfs.c

     9	
    10	static int cpu_debug_show(struct seq_file *m, void *p)
    11	{
    12		unsigned long cpu = (unsigned long)m->private;
    13		struct cpuinfo_x86 *c;
    14	
    15		if (!cpu_online(cpu))
    16			return -ENODEV;
    17	
    18		c = per_cpu_ptr(&cpu_info, cpu);
    19	
    20		seq_printf(m, "initial_apicid:      %x\n", c->topo.initial_apicid);
    21		seq_printf(m, "apicid:              %x\n", c->topo.apicid);
    22		seq_printf(m, "pkg_id:              %u\n", c->topo.pkg_id);
    23		seq_printf(m, "die_id:              %u\n", c->topo.die_id);
    24		seq_printf(m, "cu_id:               %u\n", c->topo.cu_id);
    25		seq_printf(m, "core_id:             %u\n", c->topo.core_id);
    26		seq_printf(m, "logical_pkg_id:      %u\n", c->topo.logical_pkg_id);
    27		seq_printf(m, "logical_die_id:      %u\n", c->topo.logical_die_id);
    28		seq_printf(m, "llc_id:              %u\n", c->topo.llc_id);
    29		seq_printf(m, "l2c_id:              %u\n", c->topo.l2c_id);
    30		seq_printf(m, "amd_node_id:         %u\n", c->topo.amd_node_id);
  > 31		seq_printf(m, "amd_nodes_per_pkg:   %u\n", __amd_nodes_per_pkg);
    32		seq_printf(m, "max_cores:           %u\n", c->x86_max_cores);
    33		seq_printf(m, "max_die_per_pkg:     %u\n", __max_die_per_package);
    34		seq_printf(m, "smp_num_siblings:    %u\n", smp_num_siblings);
    35		return 0;
    36	}
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
