Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325831C16
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 03:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689305903; x=1720841903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8xKD5tm6iTIAhc17at7PnTknlzMxq8jKFdAeUfwHHI=;
  b=TcO5lqO+pU8i89fK528G4LSUNQMv+sZLNrT55ORk1bp+4cYquWm3e9Br
   am7F66NFLh/JTq3kscomf2G97q1aKvUZvDxhIkYiy38I3YAj6pOCw/gXZ
   Gt1Q0HFcFOGaVAN/GhPzMrmD1PWD0Cf+167qFWaDsuTew+V4MlM03ZZ5w
   9r3eJqqdh6obW4ns8GSFrT4FSEsuvfVc9P+kcILoGTR4VoQfIZSEsMvJ8
   Iv/YgK/9BoR2JR4LAJBu/xaN8qWWMe61ijeHw797/A5IGcJ4Z7f9tFaCW
   7kfv/03CpNQY1fJDGLMa5eWp9Z7xInfhQLcL8yyO6tTxFbMIZ71sg7QKI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451744197"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="451744197"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 20:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="792300505"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="792300505"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2023 20:38:21 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK9dM-000799-26;
	Fri, 14 Jul 2023 03:38:20 +0000
Date: Fri, 14 Jul 2023 11:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 41/57]
 arch/x86/kernel/cpu/topology_common.c:160:9: error: 'smp_num_siblings'
 undeclared
Message-ID: <202307141142.bJnAU433-lkp@intel.com>
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
commit: cddc2e9c0152480ee1041b2806b1301b0157d109 [41/57] x86/cpu: Provide cpu_init/parse_topology()
config: i386-buildonly-randconfig-r004-20230714 (https://download.01.org/0day-ci/archive/20230714/202307141142.bJnAU433-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141142.bJnAU433-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141142.bJnAU433-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/topology_common.c: In function 'cpu_init_topology':
>> arch/x86/kernel/cpu/topology_common.c:160:9: error: 'smp_num_siblings' undeclared (first use in this function)
     160 |         smp_num_siblings = x86_topo_system.dom_size[TOPO_SMT_DOMAIN];
         |         ^~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/topology_common.c:160:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/smp_num_siblings +160 arch/x86/kernel/cpu/topology_common.c

   130	
   131	void __init cpu_init_topology(struct cpuinfo_x86 *c)
   132	{
   133		struct topo_scan tscan = { .c = c, };
   134		unsigned int dom, sft;
   135	
   136		parse_topology(&tscan, true);
   137	
   138		if (!topo_is_converted(c))
   139			return;
   140	
   141		/* Copy the shift values and calculate the unit sizes. */
   142		memcpy(x86_topo_system.dom_shifts, tscan.dom_shifts, sizeof(x86_topo_system.dom_shifts));
   143	
   144		dom = TOPO_SMT_DOMAIN;
   145		x86_topo_system.dom_size[dom] = 1U << x86_topo_system.dom_shifts[dom];
   146	
   147		for (dom++; dom < TOPO_MAX_DOMAIN; dom++) {
   148			sft = x86_topo_system.dom_shifts[dom] - x86_topo_system.dom_shifts[dom - 1];
   149			x86_topo_system.dom_size[dom] = 1U << sft;
   150		}
   151	
   152		topo_set_ids(&tscan);
   153		topo_set_max_cores(&tscan);
   154	
   155		/*
   156		 * This is deliberately using the domain size and not the real one,
   157		 * as this might be a hybrid system. If the boot CPU does not have
   158		 * SMT this would end up with one sibling.
   159		 */
 > 160		smp_num_siblings = x86_topo_system.dom_size[TOPO_SMT_DOMAIN];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
