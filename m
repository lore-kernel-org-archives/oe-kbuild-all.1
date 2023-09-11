Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7176AD2E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694454513; x=1725990513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=01b4xyLkOVETMZXpvSE0HzGKWSXLarba3T75F9itxJc=;
  b=AM1crLXA1uuix1MpKCdIUPZnyKqVydW6sUW0Jzb6Xa5xKO8rW8E3NZcz
   qMJGdOActMgNPcvqyAmX0MTTbG7FlRAmrqkEj3SfDZnSj7MzbsnP4lHWt
   HEqMXbCvXKNKeTreHt0GllluLbHUtO1WG3lVHUm58FTYQG+3h54wClcIn
   /sibkQdM2cp4mkN7G/RKMGWOxwfRwgvU1Vd+y+MT0KpQ9uDdlfGzHJNUT
   6keyQXODhD7iC/+Nl+8gD6o9ZlZFYjqh+izvXvYnJ1z8EIEPWi4oGrwZG
   vfItm2kvjRGyjWnDCmZn1AbYDE5x9uRSuvtZd+tKl+mLM06T4gdiXG2R0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409119083"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="409119083"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 10:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="720066595"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="720066595"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Sep 2023 10:48:30 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfl1P-0006YC-3A;
	Mon, 11 Sep 2023 17:48:27 +0000
Date: Tue, 12 Sep 2023 01:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 22/41] arch/x86/kernel/cpu/debugfs.c:11:33:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202309120124.2CDGcIGf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   75f5f85b73b5996415faac82e1535525a1cf01c4
commit: b8f285eb46639df7f680c92122aa65302f32e2cd [22/41] x86/cpu: Provide debug interface
config: x86_64-randconfig-122-20230911 (https://download.01.org/0day-ci/archive/20230912/202309120124.2CDGcIGf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120124.2CDGcIGf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120124.2CDGcIGf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/debugfs.c:11:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct cpuinfo_x86 * @@
   arch/x86/kernel/cpu/debugfs.c:11:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/debugfs.c:11:33: sparse:     got struct cpuinfo_x86 *

vim +11 arch/x86/kernel/cpu/debugfs.c

     7	
     8	static int cpu_debug_show(struct seq_file *m, void *p)
     9	{
    10		unsigned long cpu = (unsigned long)m->private;
  > 11		struct cpuinfo_x86 *c = per_cpu_ptr(&cpu_info, cpu);
    12	
    13		seq_printf(m, "online:              %d\n", cpu_online(cpu));
    14		if (!c->initialized)
    15			return 0;
    16	
    17		seq_printf(m, "initial_apicid:      %x\n", c->topo.initial_apicid);
    18		seq_printf(m, "apicid:              %x\n", c->topo.apicid);
    19		seq_printf(m, "pkg_id:              %u\n", c->topo.pkg_id);
    20		seq_printf(m, "die_id:              %u\n", c->topo.die_id);
    21		seq_printf(m, "cu_id:               %u\n", c->topo.cu_id);
    22		seq_printf(m, "core_id:             %u\n", c->topo.core_id);
    23		seq_printf(m, "logical_pkg_id:      %u\n", c->topo.logical_pkg_id);
    24		seq_printf(m, "logical_die_id:      %u\n", c->topo.logical_die_id);
    25		seq_printf(m, "llc_id:              %u\n", c->topo.llc_id);
    26		seq_printf(m, "l2c_id:              %u\n", c->topo.l2c_id);
    27		seq_printf(m, "max_cores:           %u\n", c->x86_max_cores);
    28		seq_printf(m, "max_die_per_pkg:     %u\n", __max_die_per_package);
    29		seq_printf(m, "smp_num_siblings:    %u\n", smp_num_siblings);
    30		return 0;
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
