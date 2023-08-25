Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C97E174F7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 20:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692996500; x=1724532500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hHY+Lfc4UZbAwyUPctlSGOZgmr4PofYEoURMohaqTcw=;
  b=cAdlzEVfRlfd/Touai3gVXDKttd3W13/T8tOYv8iXt6CCfcDlGrILDzd
   LBHcuEoQkIFQnrlR3XSKQjIiS8F7EycN+VWMWLODvMLgfxJ0U6NGFNS9f
   Opsm7BA7DljWsC/Je8MBF2G0tIJJ2nkuJ/SHvDEneWkfEaYKFzeC3cNt0
   jQCftn9YczYJLVmOJgLdigWD2hP/NK/3izaET3SnmJtpdddg9BSZFbdef
   H7ls4D0OB91GdFqP8uAd97HCvWeDsPO3prJwU28or/8t6Bki9JXn1dv61
   xvCdJBsMIZQ2aqa6wTChW/qmfK3eIGmgYOMu780WoeQnnA7b9RZvi1eNi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="441145939"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="441145939"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 13:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="861191940"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="861191940"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Aug 2023 13:48:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZdj7-0003zZ-2J;
	Fri, 25 Aug 2023 20:48:17 +0000
Date: Sat, 26 Aug 2023 04:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/microcode 15/30]
 arch/x86/kernel/cpu/microcode/core.c:564:9: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202308260437.Sw48It1V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/microcode
head:   838b82359dcdd7171acc99bbce718d9fb8ef9429
commit: aad98d40c601665466e0b1d78109e6611ee71343 [15/30] x86/microcode: Remove pointless apply() invocation
config: i386-randconfig-062-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260437.Sw48It1V-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260437.Sw48It1V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260437.Sw48It1V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/microcode/core.c:564:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned int * @@
   arch/x86/kernel/cpu/microcode/core.c:564:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/microcode/core.c:564:9: sparse:     got unsigned int *
>> arch/x86/kernel/cpu/microcode/core.c:564:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned int * @@
   arch/x86/kernel/cpu/microcode/core.c:564:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/microcode/core.c:564:9: sparse:     got unsigned int *

vim +564 arch/x86/kernel/cpu/microcode/core.c

   555	
   556	static void setup_online_cpu(struct work_struct *work)
   557	{
   558		int cpu = smp_processor_id();
   559		struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
   560	
   561		memset(uci, 0, sizeof(*uci));
   562	
   563		microcode_ops->collect_cpu_info(cpu, &uci->cpu_sig);
 > 564		this_cpu_write(cpu_info.microcode, uci->cpu_sig.rev);
   565		if (!cpu)
   566			boot_cpu_data.microcode = uci->cpu_sig.rev;
   567		mc_cpu_online(cpu);
   568	}
   569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
