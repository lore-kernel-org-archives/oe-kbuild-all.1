Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962CA430CC6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785421527; cv=none; b=nKVKshGv3o9uDEdXS+xj53gXe9oTW3fsbCE6vbG0Y5OO2nwFAfNh7B1pmQnRpnve64xmDs1YH/Otb69RX22nwQy/nES7b7KH9MUNUxhz79T+Keq0q5Qvfxh280SNZSlRS4jiNMPkbFV8v8HjW44FvqGe+THp1O9dlgrYtuxtuwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785421527; c=relaxed/simple;
	bh=4cZdCDfjHzv+GtHrcLMJh4fRs8swWvZQClz8fWSQyhQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FNjqmzCqTIiN5R2ROQaxPz+AXVgGKWrbMOyP1jpAEUd71U2yrZz8f/GJ4ZpMH+YLPSpgjOk/s5Cg1iHmoRfHFIIkjL4wnnr4IJLt1FV0Mpu1MXTVvasm2orkPA69mddOMfGK3Fb3Zzv1668+xBQJXHbvfJ4cXeJ6tQpvzXOuthA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILMNbpso; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILMNbpso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785421526; x=1816957526;
  h=date:from:to:cc:subject:message-id;
  bh=4cZdCDfjHzv+GtHrcLMJh4fRs8swWvZQClz8fWSQyhQ=;
  b=ILMNbpsos+yUR8YxCIY4lljUTCH7vFI6MVqFmp7RWIt1R2Z65FFV/QD3
   49ZOgPlmyKezO8pbqQMA/r8e+AyrLDxoTggig65LxqFeijxOsR7rrC/7s
   OB3yMLQMXzCKfIChd9WeIYg/KEzTZp19YZBBgxsVcDOhrhca+GZFWovqs
   aDO9WGancNn8UfoeCMiEG8tg2UQFiwImx/EDDmBl0BC4dW/HlDrjbjsqF
   n38dzMoSwfEjZzrLI6Zbe0B4MynTSy6q02byIejAGo3dRXunweyRpjrCj
   rj0BYIQ70yi9nAix04s+vm79wEcxxUzaEfiExmdrsVCy3cZAc7YQoOZ8l
   w==;
X-CSE-ConnectionGUID: FoRfW9tGQFe8LVF9eGR/Zw==
X-CSE-MsgGUID: MYuGGLLTSPmMHW8TvTuKGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103448653"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103448653"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:25:26 -0700
X-CSE-ConnectionGUID: 3oS5VvtuTaiWlRd9/rgZJw==
X-CSE-MsgGUID: aeAruN4dSGGgX8yQ3q8f3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="260374771"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 30 Jul 2026 07:25:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpRhJ-00000000ghM-2Ohp;
	Thu, 30 Jul 2026 14:25:21 +0000
Date: Thu, 30 Jul 2026 22:25:11 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Subject: [riscv:for-next 17/18]
 arch/riscv/kernel/unaligned_access_speed.c:380:24: error:
 'check_vector_unaligned_access' undeclared; did you mean
 'check_unaligned_access'?
Message-ID: <202607302206.qIdQdDcn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
head:   03ececaea90889587dac37c802f02a1ea8b61d51
commit: d91f147112ba46e443aac2d45777824362365dcb [17/18] riscv: unaligned: stop using kthread for check_vector_unaligned_access()
config: riscv-randconfig-002-20260730 (https://download.01.org/0day-ci/archive/20260730/202607302206.qIdQdDcn-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607302206.qIdQdDcn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607302206.qIdQdDcn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/unaligned_access_speed.c: In function 'check_unaligned_access_all_cpus':
>> arch/riscv/kernel/unaligned_access_speed.c:380:24: error: 'check_vector_unaligned_access' undeclared (first use in this function); did you mean 'check_unaligned_access'?
     380 |   schedule_on_each_cpu(check_vector_unaligned_access);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        check_unaligned_access
   arch/riscv/kernel/unaligned_access_speed.c:380:24: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
   arch/riscv/kernel/unaligned_access_speed.c:291:13: warning: 'check_unaligned_access_speed' defined but not used [-Wunused-function]
     291 | static void check_unaligned_access_speed(struct work_struct *work __always_unused)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +380 arch/riscv/kernel/unaligned_access_speed.c

   345	
   346	static int __init check_unaligned_access_all_cpus(void)
   347	{
   348		int cpu;
   349	
   350		unaligned_access_init();
   351	
   352		if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
   353			pr_info("scalar unaligned access speed set to '%s' (%lu) by command line\n",
   354				speed_str[unaligned_scalar_speed_param], unaligned_scalar_speed_param);
   355			for_each_online_cpu(cpu)
   356				per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
   357		} else if (!check_unaligned_access_emulated_all_cpus()) {
   358			check_unaligned_access_speed_all_cpus();
   359		}
   360	
   361		if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
   362			if (!has_vector() &&
   363			    unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED) {
   364				pr_warn("vector support is not available, ignoring unaligned_vector_speed=%s\n",
   365					speed_str[unaligned_vector_speed_param]);
   366			} else {
   367				pr_info("vector unaligned access speed set to '%s' (%lu) by command line\n",
   368					speed_str[unaligned_vector_speed_param], unaligned_vector_speed_param);
   369			}
   370		}
   371	
   372		if (!has_vector())
   373			unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
   374	
   375		if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
   376			for_each_online_cpu(cpu)
   377				per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
   378		} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
   379			   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 > 380			schedule_on_each_cpu(check_vector_unaligned_access);
   381		}
   382	
   383		/*
   384		 * Setup hotplug callbacks for any new CPUs that come online or go
   385		 * offline.
   386		 */
   387		cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
   388					  riscv_online_cpu, riscv_offline_cpu);
   389		cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
   390					  riscv_online_cpu_vec, NULL);
   391	
   392		cpus_read_lock();
   393		modify_unaligned_access_branches(cpu_online_mask);
   394		cpus_read_unlock();
   395	
   396		return 0;
   397	}
   398	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
