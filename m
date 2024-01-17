Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E4524B23
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 20:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705521621; cv=none; b=WjbuKkfoFXT22XzvmzVl3l09DeBq7YW5uB6FrjA4hWGv1uD3uzSwEqWe7ovsX2BDIBb4MISNzsXdDMWLtgWMMCi4/ipk+RyT1NSVLvzPIBlKyE4ahJK9Gjgh2TYYxb0Ey5a3ZBpP+QUaeMNKDM9mbiiH6ckiL4+TghQ9x29lfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705521621; c=relaxed/simple;
	bh=czhwlEHeAkDbQmxmjZJmdY7P1X+EzrJL0Crr75oN7lM=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=lBRzrYWaCz3TWXe0Hbs/9gPbnxVD43WWdLcNCUv2oMb6zjom2d7APs9BQ42DdJjRr5MtT+lmel2LP+DUceS9kXUXgOGghSnBBdFDbYaU/OfC+yf41hs917nRVNQDGt6oY7OX6gEZYdegHZamsaIYJ5hST8Up1sl9nWOjUj1tU/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eX0BFiN/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eX0BFiN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705521619; x=1737057619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=czhwlEHeAkDbQmxmjZJmdY7P1X+EzrJL0Crr75oN7lM=;
  b=eX0BFiN/hM3HGyU/7/R6B+3UNRN6+BE8o+zDqf4UiSYVOMrcktZo9ztm
   o29LE6vzAKvhLDV+54me5GzcwRdPIjUSZBNklyWWaLkL4yEP2ALT3E8Bb
   xC1FTyb6c1TWyV0vQu6cqI4Dl502+SlLBGiEkkg/qLYrFxWFHNXlWHnAE
   t16hmpyPstW49V1byDgxtR8t32srfC3KqORad26+X5zluIxmibI2EzmFS
   uoyEIR/onNENc5p5U8CjuQEm2/S4v7KKsk7P3YDvhBodRblEd+5QgB+k1
   Hw8rD9d0g4ZWEp+fzRCeCVXom74N4dnCi8i+JioLO1p7LhMdopZr1xHy1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7021284"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7021284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 12:00:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="172397"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jan 2024 12:00:16 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQC58-0002J8-1e;
	Wed, 17 Jan 2024 20:00:14 +0000
Date: Thu, 18 Jan 2024 04:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1624/2425]
 drivers/cpufreq/loongson3-acpi-cpufreq.c:645:5: warning: no previous
 prototype for 'loongson3_set_mode'
Message-ID: <202401180343.M6gjqR5d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ec7d78798bfb669efc713c2c416a553a40d4dc77
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1624/2425] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240118/202401180343.M6gjqR5d-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180343.M6gjqR5d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180343.M6gjqR5d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpufreq/loongson3-acpi-cpufreq.c:645:5: warning: no previous prototype for 'loongson3_set_mode' [-Wmissing-prototypes]
     645 | int loongson3_set_mode(int mode, int freq_level)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:835:14: warning: no previous prototype for 'load_update' [-Wmissing-prototypes]
     835 | unsigned int load_update(struct core_data *core)
         |              ^~~~~~~~~~~
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:1520:36: warning: 'processor_device_ids' defined but not used [-Wunused-const-variable=]
    1520 | static const struct acpi_device_id processor_device_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'update_util' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'package' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'work_in_progress' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'irq_work' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'work' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'perf' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'normal_max_freq' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'boost_freq' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'clock_scale' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'package_id' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'shift' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'update_util_set' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'load' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'last_freq_update_time' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'freq_update_delay_ns' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'prev_update_time' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'prev_cpu_idle' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'prev_load' not described in 'core_data'
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:160: warning: Function parameter or member 'sampling_rate' not described in 'core_data'


vim +/loongson3_set_mode +645 drivers/cpufreq/loongson3-acpi-cpufreq.c

   644	
 > 645	int loongson3_set_mode(int mode, int freq_level)
   646	{
   647		uint32_t val;
   648		int ret = 0;
   649		uint32_t message;
   650	
   651		ret = wait_for_ready_timeout(MAX_READY_TIMEOUT);
   652		if (ret)
   653			return ret;
   654	
   655		message = mode | (VOLTAGE_COMMAND << 24) | freq_level;
   656		iocsr_write32(message, 0x51c);
   657		val = iocsr_read32(0x420);
   658		val |= 1 << 10;
   659		iocsr_write32(val, 0x420);
   660		return wait_for_ready_timeout(MAX_READY_TIMEOUT);
   661	}
   662	
   663	enum freq_adjust_action {
   664		FAA_NORMAL,
   665		FAA_N2B,
   666		FAA_B2N,
   667		FAA_BOOST,
   668	};
   669	
   670	static int faa_normal(struct cpufreq_policy *policy, int load)
   671	{
   672		int ret;
   673		unsigned int freq_next, min_f, max_f;
   674		struct core_data *core = get_core_data(policy->cpu);
   675	
   676		if (!core)
   677			return -1;
   678	
   679		min_f = policy->min;
   680		max_f = policy->max;
   681		freq_next = min_f + load * (max_f - min_f) / 100;
   682		ret = loongson3_set_freq(core, freq_next, 0);
   683		return ret;
   684	}
   685	
   686	static void handle_boost_cores(struct core_data *core, struct package_data *package,
   687			unsigned long target_freq, bool skip_update_and_notify, bool update_core, bool inc_boost)
   688	{
   689		int boost_level;
   690		int find_level;
   691		int find_freq;
   692		int ret;
   693		int inc_core = inc_boost ? 1 : -1;
   694	
   695		if (boost_gears == 1) {
   696			find_level = 0;
   697			boost_level = boost_gears;
   698		} else {
   699			find_level = package->boost_cores;
   700			if (update_core)
   701				boost_level = package->boost_cores + inc_core;
   702			else
   703				boost_level = package->boost_cores;
   704		}
   705		find_freq = boost_level;
   706		ret = loongson3_set_freq(core, target_freq, boost_level);
   707		if (ret)
   708			return;
   709	
   710		if (skip_update_and_notify) {
   711			if (update_core)
   712				update_core_boost_info(core, inc_boost);
   713			return;
   714		}
   715	
   716		if (boost_gears != 1) {
   717			cores_freq_trans_notify(package, true, false,
   718					find_level, find_freq, 1 << core->cpu);
   719			cores_freq_trans_notify(package, false, false,
   720					find_level, find_freq, 1 << core->cpu);
   721		}
   722		if (update_core)
   723			update_core_boost_info(core, inc_boost);
   724	}
   725	
   726	static void faa_boost(struct cpufreq_policy *policy, int load)
   727	{
   728		unsigned int min_f, max_f;
   729		struct core_data *core = get_core_data(policy->cpu);
   730		struct package_data *package = core->package;
   731		unsigned long target_freq;
   732	
   733		/* boost cores form n to n + 1 */
   734		if (core->load > BOOST_THRESHOLD) {
   735			if (package->boost_cores < package->max_boost_cores
   736					&& !core->in_boost) {
   737				if (boost_gears == 1) {
   738					target_freq = policy->max;
   739				} else {
   740					target_freq = cpufreq_table_find_freq(policy, policy->max,
   741									package->boost_cores + 1);
   742					if (!target_freq) {
   743						pr_debug("%s: find freq error ,boost_level %d, cur freq %d\n",
   744								__func__, package->boost_cores, policy->max);
   745					}
   746				}
   747				handle_boost_cores(core, package, target_freq, false, true, true);
   748			}
   749		} else {
   750			/* 1. core not in boost, level up but not change  pll
   751			 * 2. core in boost, boost cores from n to n - 1
   752			 */
   753			min_f = policy->min;
   754			max_f = policy->max;
   755			target_freq = min_f + load * (max_f - min_f) / 100;
   756			handle_boost_cores(core, package, target_freq, !core->in_boost, core->in_boost, false);
   757		}
   758	
   759	
   760	}
   761	
   762	static void get_boost_cores(struct package_data *package, int *boost_cores, int *boost_count)
   763	{
   764		struct core_data *core;
   765		struct cpufreq_policy *policy;
   766		int i;
   767	
   768		/* count boost cores */
   769		for (i = 0; i < package->nr_cores; i++) {
   770			core = &package->core[i];
   771			policy = cpufreq_cpu_get_raw(core->cpu);
   772			if (!policy)
   773				continue;
   774	
   775			if (cpu_can_boost(core->cpu)) {
   776				if (boost_cores)
   777					*boost_cores |= (1 << i);
   778	
   779				(*boost_count)++;
   780			}
   781		}
   782	}
   783	
   784	static void faa_n2b(struct package_data *package, struct core_data *core)
   785	{
   786		int boost_cores = 0;
   787		int boost_count = 0;
   788		int freq_level;
   789		int i;
   790	
   791		get_boost_cores(package, &boost_cores, &boost_count);
   792	
   793		if (boost_gears == 1)
   794			boost_count = 1;
   795	
   796		freq_level = cores_freq_trans_notify(package, true, false,
   797				0, boost_count, 0);
   798		if (!loongson3_set_mode(BOOST_MODE, freq_level)) {
   799			cores_freq_trans_notify(package, false, false,
   800					0, boost_count, 0);
   801			package->in_boost = true;
   802			for (i = 0; i < package->nr_cores; i++) {
   803				if (boost_cores & (1 << i))
   804					update_core_boost_info(&package->core[i], true);
   805			}
   806		} else
   807			cores_freq_trans_notify(package, false, true,
   808					0, boost_count, 0);
   809	}
   810	
   811	static void faa_b2n(struct package_data *package)
   812	{
   813		int i;
   814		int boost_count = package->boost_cores;
   815	
   816		if (boost_gears == 1)
   817			boost_count = 1;
   818	
   819		cores_freq_trans_notify(package, true, false,
   820				boost_count, 0, 0);
   821		if (!loongson3_set_mode(NORMAL_MODE, 0)) {
   822			cores_freq_trans_notify(package, false, false,
   823					boost_count, 0, 0);
   824			for (i = 0; i < package->nr_cores; i++) {
   825				if (package->core[i].in_boost)
   826					update_core_boost_info(&package->core[i], false);
   827			}
   828			package->in_boost = false;
   829		} else
   830			cores_freq_trans_notify(package, false, true,
   831					boost_count, 0, 0);
   832	}
   833	
   834	
 > 835	unsigned int load_update(struct core_data *core)
   836	{
   837		int i;
   838		u64 update_time, cur_idle_time;
   839		unsigned int idle_time, time_elapsed;
   840		unsigned int load = 0;
   841		struct package_data *package = core->package;
   842	
   843		cur_idle_time = get_cpu_idle_time(core->cpu, &update_time, true);
   844	
   845		time_elapsed = update_time - core->prev_update_time;
   846		core->prev_update_time = update_time;
   847	
   848		idle_time = cur_idle_time - core->prev_cpu_idle;
   849		core->prev_cpu_idle = cur_idle_time;
   850	
   851		if (unlikely(!time_elapsed)) {
   852			/*
   853			 * That can only happen when this function is called
   854			 * twice in a row with a very short interval between the
   855			 * calls, so the previous load value can be used then.
   856			 */
   857			load = core->prev_load;
   858		} else if (unlikely((int)idle_time > 2 * core->sampling_rate &&
   859					core->prev_load)) {
   860	
   861			load = core->prev_load;
   862			core->prev_load = 0;
   863		} else {
   864			if (time_elapsed >= idle_time)
   865				load = 100 * (time_elapsed - idle_time) / time_elapsed;
   866			else
   867				load = (int)idle_time < 0 ? 100 : 0;
   868			core->prev_load = load;
   869		}
   870	
   871		package->nr_full_load_cores = 0;
   872		for (i = 0; i < package->nr_cores; i++) {
   873			if (package->core[i].load > BOOST_THRESHOLD)
   874				package->nr_full_load_cores++;
   875		}
   876	
   877		return load;
   878	}
   879	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
