Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4373F0757
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402487; cv=none; b=bo0gKIR6Vag4FmHwCNGn9rFqmxvYVzSoYAa6TgPnwT0Xz6Ua4ECb2ncGme7djY1LKQBTR0kj8P+0n3j7ex5uV4UP1mIOGfO7byF5P9tH0h4iOzInQd8JezwA2CgkDWzSkEOnnznKmH+xusKGCe6beeJ2hPNavbvFJl73ZX4BNjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402487; c=relaxed/simple;
	bh=/mhstjN9UxwntYDdo4xcPC7tIkZAtTlXHRctNaVYKl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f4E0q6OngGFee0KQajKBHlBOBmU1jvNu7dcYQL4g1UGn1zgWY8aNKXVXFQWPeaSM50qTIYczp1AzbsJ3F4Eu2aVagMgPTYvOSjwLspK4fYmbDd9CZtERjCOQU579ddFmghVNll2llqCs6NnGKkBI+TdC/A7CN1KaIsb9h5D5J0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYPI+3lN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYPI+3lN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785402484; x=1816938484;
  h=date:from:to:cc:subject:message-id;
  bh=/mhstjN9UxwntYDdo4xcPC7tIkZAtTlXHRctNaVYKl8=;
  b=ZYPI+3lNWQNdZyCAplIrtNGM6sAPiFWGY0qhNqD1EHF0ZYYKlQz1JpFQ
   IQIVjqCxFGikTVBQfOeQOYAOs6U6rkGFmx+hsHGPwE9bXUe5BWEhPxwCP
   gdC2VpyyuUeip565tw/JF50TqJAjobWVVY2tzhJCZVusdiwSohkZFRjPb
   heUDw6xFrc9nSCy5k4I9bHD8HgSuJCyQS2ZLpE22/bO3R5x3lDILIADow
   kLjuYXU7h6KNhunfbjF92GyqzwYXT3Sq/lthYgi2ivZWc6kIgkw+9Y1nB
   NYZPkiX+A4FWQys7cwthu3MKAbQq7t5j/p72s1D9rilsxjQMwyEJjLiwG
   Q==;
X-CSE-ConnectionGUID: gkgex3fQSbe7gthN/EMzwg==
X-CSE-MsgGUID: idIq6afFQu6zCWbrGJolIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103421654"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="103421654"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 02:08:03 -0700
X-CSE-ConnectionGUID: Zl5Ws5MLTVai8KJwWL8jrQ==
X-CSE-MsgGUID: OVq0FAj+S1m4e2PtyOk06w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="290201951"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Jul 2026 02:08:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpMkA-00000000gLm-4AvB;
	Thu, 30 Jul 2026 09:07:58 +0000
Date: Thu, 30 Jul 2026 17:07:29 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Subject: [riscv:for-next 17/18]
 arch/riscv/kernel/unaligned_access_speed.c:291:13: warning:
 'check_unaligned_access_speed' defined but not used
Message-ID: <202607301618.yrE3EKfS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
head:   03ececaea90889587dac37c802f02a1ea8b61d51
commit: d91f147112ba46e443aac2d45777824362365dcb [17/18] riscv: unaligned: stop using kthread for check_vector_unaligned_access()
config: riscv-randconfig-002-20260730 (https://download.01.org/0day-ci/archive/20260730/202607301618.yrE3EKfS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301618.yrE3EKfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301618.yrE3EKfS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/unaligned_access_speed.c: In function 'check_unaligned_access_all_cpus':
   arch/riscv/kernel/unaligned_access_speed.c:380:24: error: 'check_vector_unaligned_access' undeclared (first use in this function); did you mean 'check_unaligned_access'?
     380 |   schedule_on_each_cpu(check_vector_unaligned_access);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        check_unaligned_access
   arch/riscv/kernel/unaligned_access_speed.c:380:24: note: each undeclared identifier is reported only once for each function it appears in
   At top level:
>> arch/riscv/kernel/unaligned_access_speed.c:291:13: warning: 'check_unaligned_access_speed' defined but not used [-Wunused-function]
     291 | static void check_unaligned_access_speed(struct work_struct *work __always_unused)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/check_unaligned_access_speed +291 arch/riscv/kernel/unaligned_access_speed.c

   289	
   290	#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
 > 291	static void check_unaligned_access_speed(struct work_struct *work __always_unused)
   292	{
   293	}
   294	#endif
   295	
   296	static int riscv_online_cpu_vec(unsigned int cpu)
   297	{
   298		if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
   299			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
   300			return 0;
   301		}
   302	
   303	#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
   304		if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
   305			return 0;
   306	
   307		check_vector_unaligned_access_emulated(NULL);
   308		check_vector_unaligned_access(NULL);
   309	#endif
   310	
   311		return 0;
   312	}
   313	
   314	static const char * const speed_str[] __initconst = { NULL, NULL, "slow", "fast", "unsupported" };
   315	
   316	static int __init set_unaligned_scalar_speed_param(char *str)
   317	{
   318		if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW]))
   319			unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
   320		else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_FAST]))
   321			unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
   322		else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED]))
   323			unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED;
   324		else
   325			return -EINVAL;
   326	
   327		return 1;
   328	}
   329	__setup("unaligned_scalar_speed=", set_unaligned_scalar_speed_param);
   330	
   331	static int __init set_unaligned_vector_speed_param(char *str)
   332	{
   333		if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW]))
   334			unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW;
   335		else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_FAST]))
   336			unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_FAST;
   337		else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED]))
   338			unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
   339		else
   340			return -EINVAL;
   341	
   342		return 1;
   343	}
   344	__setup("unaligned_vector_speed=", set_unaligned_vector_speed_param);
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
