Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F481C3B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 22:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688511484; x=1720047484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mqVB3o5Quuip/RzuktnALT4z6qEbTTfD4IyZbheQHAk=;
  b=bo+2CGZHnYr7muvAH9Fat6raw03xLArgcM9nGK0ZnOOS6GVRBHNCLjc3
   ONF9uMh6RVfFcylRY1BfF8ZEgjXhdrkbyyIzLIFQyFnzwS6jYLxPpl14Y
   dE/D/AQi5/Nig9nzyewB1fkpu3NyD+7vC2bzwSw4FPh84IulAi1Qbo4TB
   zX+aLOlwrmRtOazy815d1ToAPQAYUYeR1pxh6rafFFIfqqbV2pz67uEmo
   N99yqBBUYs+sfovcvyB3M4bmYUw6GsmGv0GM+Ot0tRlYo+BzPhYh27oM7
   2t1Xpvs4AlnMvi581VM3H3okvOxy1k1GYrfOe6GNKgTufEeCkG10uhtri
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="362068176"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="362068176"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 15:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="965608527"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="965608527"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Jul 2023 15:58:03 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGoyA-000Ibf-2N;
	Tue, 04 Jul 2023 22:58:02 +0000
Date: Wed, 5 Jul 2023 06:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 21/39] arch/x86/kernel/cpu/debugfs.c:16:13:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202307050659.KBW6Db7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   3f2657ab54543fb9ee5894d239f8b7131a6ffac8
commit: 7dfe7402f594575e16ac80d7e963106ad734322a [21/39] x86/cpu: Provide debug interface
config: i386-randconfig-r082-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050659.KBW6Db7q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050659.KBW6Db7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050659.KBW6Db7q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/debugfs.c:16:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct cpuinfo_x86 * @@
   arch/x86/kernel/cpu/debugfs.c:16:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/debugfs.c:16:13: sparse:     got struct cpuinfo_x86 *

vim +16 arch/x86/kernel/cpu/debugfs.c

     7	
     8	static int cpu_debug_show(struct seq_file *m, void *p)
     9	{
    10		unsigned long cpu = (unsigned long)m->private;
    11		struct cpuinfo_x86 *c;
    12	
    13		if (!cpu_online(cpu))
    14			return -ENODEV;
    15	
  > 16		c = per_cpu_ptr(&cpu_info, cpu);
    17		seq_printf(m, "initial_apicid:      %x\n", c->topo.initial_apicid);
    18		seq_printf(m, "apicid:              %x\n", c->topo.apicid);
    19		seq_printf(m, "pkg_id:              %u\n", c->topo.pkg_id);
    20		seq_printf(m, "die_id:              %u\n", c->topo.die_id);
    21		seq_printf(m, "cu_id:               %u\n", c->topo.cu_id);
    22		seq_printf(m, "core_id:             %u\n", c->topo.core_id);
    23		seq_printf(m, "logical_pkg_id:      %u\n", c->topo.logical_pkg_id);
    24		seq_printf(m, "logical_die_id:      %u\n", c->topo.logical_die_id);
    25		seq_printf(m, "num_cores_per_pkg:   %u\n", c->topo.num_cores_per_pkg);
    26		seq_printf(m, "llc_id:              %u\n", c->topo.llc_id);
    27		seq_printf(m, "l2c_id:              %u\n", c->topo.l2c_id);
    28		seq_printf(m, "L max_die_per_pkg:   %u\n", __max_die_per_package);
    29		seq_printf(m, "L smt_max_siblings:  %u\n", smt_max_siblings);
    30		return 0;
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
