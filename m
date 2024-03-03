Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B352E412
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709477277; cv=none; b=FTbA4LYAUHdSjWW/Ibvx7Dbih1NhHaBlB0XUGG7c//3ONrBBT212UDx2whE8Htqr2rPSr9hsk7OwakdKXtIstiyLc8ntKlI25XSADutgxPdHgF25Mmiyh3h9yBAWAp2++pO+QVUKpegHBox/Srjnlrm25xdRj5O0Sid5NwIrDUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709477277; c=relaxed/simple;
	bh=wakQooC85y+8KCOUpUT2j+WapV0YC+sMFrOs4pad15k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o+4+IR9481QyG0+vg0zHm0ws9bItT2OrQ2VXoRiIiI7404OSjybmFBO7/3Es0T/apRA6zLTzWAGUN31zJs1/N+i8XmQ+aMV0242+vbgGPQ66jrGJRquGnyghgBwD+O8+UP57wu9QsQZ7SgzJHHEFrYL9k+LXC97klMOxoqN9Jt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgbuVMBG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgbuVMBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709477275; x=1741013275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wakQooC85y+8KCOUpUT2j+WapV0YC+sMFrOs4pad15k=;
  b=EgbuVMBGLHy6irnJFD1pvlRDfhV8iU8YIpXFoIvf0sK1HqqJazTHQHSq
   LJn4ZL8slcRmzy3LoRXFqpKXXP2JImGbyyHIgbM6jLg2o9ddNhFDTlLYm
   INt5RpnbOT5K+HzjbIbSBpx45dd4Jx3If6l6vOn6qtJfTngc8d6YdrL2f
   fjmv20O0V+YjgYH90CPseGV+CRTg7d0T0lrV1ym4YOASfF19N544dVRns
   uzy6SX19H8r2johuww3XLhSMJ2aTjrsOMkyfVJilwXRix9BrC05BEgqlX
   eWElw7Fpe8WM6+ptLR4t4YsxIp07ml6QPJxO1wp9p24sDULgO5exaeLRk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="6921150"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="6921150"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 06:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="39558279"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Mar 2024 06:47:51 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgn80-0001ps-0K;
	Sun, 03 Mar 2024 14:47:48 +0000
Date: Sun, 3 Mar 2024 22:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 77/98] kernel/cgroup/cpuset.c:3184:5: warning: no
 previous prototype for 'cpuset_cgroupfs_stat_cpuacct'
Message-ID: <202403032204.MATw06EB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: a4793456cf4437284a72e89d0ea5c991b0d4248c [77/98] cgroupfs: support stat based on cpuacct
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403032204.MATw06EB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403032204.MATw06EB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403032204.MATw06EB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/cgroup/cpuset.c:3184:5: warning: no previous prototype for 'cpuset_cgroupfs_stat_cpuacct' [-Wmissing-prototypes]
    3184 | int cpuset_cgroupfs_stat_cpuacct(struct cpuset *cs, struct seq_file *m, void *v, int max_cpu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3299:5: warning: no previous prototype for 'cpuset_cgroupfs_stat_show' [-Wmissing-prototypes]
    3299 | int cpuset_cgroupfs_stat_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3473:5: warning: no previous prototype for 'cpuset_cgroups_cpu_allowed' [-Wmissing-prototypes]
    3473 | int cpuset_cgroups_cpu_allowed(struct task_struct *task, int cpu, int once)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:3503:5: warning: no previous prototype for 'cpuset_cgroupfs_cpuinfo_show' [-Wmissing-prototypes]
    3503 | int cpuset_cgroupfs_cpuinfo_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/cgroup/cpuset.c:3518:5: warning: no previous prototype for 'cpuset_cgroupfs_get_cpu_count' [-Wmissing-prototypes]
    3518 | int cpuset_cgroupfs_get_cpu_count(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4898:6: warning: no previous prototype for 'cgroup_cpuset_calc_load' [-Wmissing-prototypes]
    4898 | void cgroup_cpuset_calc_load(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/cpuset.c:4972:5: warning: no previous prototype for 'cpuset_cgroupfs_loadavg_show' [-Wmissing-prototypes]
    4972 | int cpuset_cgroupfs_loadavg_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/sched/build_utility.c:61:
   kernel/sched/cpuacct.c:322:5: warning: no previous prototype for 'cpuacct_cgroupfs_uptime_show' [-Wmissing-prototypes]
     322 | int cpuacct_cgroupfs_uptime_show(struct seq_file *m, void *v)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/cpuacct.c:336:5: warning: no previous prototype for 'cpuacct_cgroupfs_cpu_usage' [-Wmissing-prototypes]
     336 | int cpuacct_cgroupfs_cpu_usage(struct cgroup_subsys_state *css, int cpu, u64 *sys, u64 *user)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cpuset_cgroupfs_stat_cpuacct +3184 kernel/cgroup/cpuset.c

  3181	
  3182	#ifdef CONFIG_CGROUPFS
  3183	extern int cpuacct_cgroupfs_cpu_usage(struct cgroup_subsys_state *css, int cpu, u64 *sys, u64 *user);
> 3184	int cpuset_cgroupfs_stat_cpuacct(struct cpuset *cs, struct seq_file *m, void *v, int max_cpu)
  3185	{
  3186		typedef struct usage_info {
  3187			u64 sys, usr, idle;
  3188		} u_info;
  3189	
  3190		u_info *res;
  3191		struct timespec64 boottime;
  3192		struct cgroup_subsys_state *css;
  3193		u64 sys, usr, cpu_total, cpu_idle, acct_total, total_sys, total_usr, total_idle;
  3194		u64 n_ctx_switch, n_process, n_running, n_blocked;
  3195		int i, k = 0, num_cpu = nr_cpu_ids + 1;;
  3196		total_sys = 0, total_usr = 0, total_idle = 0;
  3197	
  3198		res = kmalloc(sizeof(u_info) * num_cpu, GFP_KERNEL);
  3199		if (!res)
  3200			return -ENOMEM;
  3201		getboottime64(&boottime);
  3202		/*
  3203		 * Tasks can run on any cpu of cpuset, consider with quota,
  3204		 * cpu number listed in stat may be less than cpuset, leading sum of usages
  3205		 * of each cpus less than total. To make sum of usage of each cpu equal to total,
  3206		 * set quota_aware=0 or configure quota equal to cpuset num.
  3207		 */
  3208		css = task_get_css(current, cpuacct_cgrp_id);
  3209		for_each_cpu(i, cs->cpus_allowed) {
  3210			struct kernel_cpustat kcs;
  3211			kcpustat_cpu_fetch(&kcs, i);
  3212	
  3213			++k;
  3214			cpu_total = 0;
  3215			cpu_idle = get_idle_time(&kcs, i);
  3216			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_USER];
  3217			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_NICE];
  3218			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_SYSTEM];
  3219			cpu_total += get_iowait_time(i);
  3220			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_IRQ];
  3221			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_SOFTIRQ];
  3222			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_STEAL];
  3223			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_GUEST];
  3224			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_GUEST_NICE];
  3225			cpuacct_cgroupfs_cpu_usage(css, i, &sys, &usr);
  3226			acct_total = sys + usr;
  3227			if (cpu_total > acct_total)
  3228				cpu_idle = cpu_idle + (cpu_total - acct_total);
  3229			total_sys += sys;
  3230			total_usr += usr;
  3231			total_idle += cpu_idle;
  3232			if (k < num_cpu) {
  3233				res[k].sys = sys;
  3234				res[k].usr = usr;
  3235				res[k].idle = cpu_idle;
  3236			}
  3237		}
  3238		css_put(css);
  3239		res[0].sys = total_sys;
  3240		res[0].usr = total_usr;
  3241		res[0].idle = total_idle;
  3242		for (i = 0; i <= k && i <= max_cpu; i++) {
  3243			if (!i)
  3244				seq_printf(m, "cpu ");
  3245			else
  3246				seq_printf(m, "cpu%d", i - 1);
  3247			seq_put_decimal_ull(m, " ", nsec_to_clock_t(res[i].usr));
  3248			seq_put_decimal_ull(m, " ", 0);
  3249			seq_put_decimal_ull(m, " ", nsec_to_clock_t(res[i].sys));
  3250			seq_put_decimal_ull(m, " ", nsec_to_clock_t(res[i].idle));
  3251			seq_put_decimal_ull(m, " ", 0);
  3252			seq_put_decimal_ull(m, " ", 0);
  3253			seq_put_decimal_ull(m, " ", 0);
  3254			seq_put_decimal_ull(m, " ", 0);
  3255			seq_put_decimal_ull(m, " ", 0);
  3256			seq_put_decimal_ull(m, " ", 0);
  3257			seq_putc(m, '\n');
  3258		}
  3259		kfree(res);
  3260		seq_put_decimal_ull(m, "intr ", 0);
  3261		for_each_irq_nr(i)
  3262			seq_put_decimal_ull(m, " ", 0);
  3263	
  3264		n_ctx_switch = 0;
  3265		n_process = 0;
  3266		n_running = 0;
  3267		n_blocked = 0;
  3268		k = 0;
  3269		for_each_cpu(i, cs->cpus_allowed) {
  3270			if (++k > max_cpu)
  3271				break;
  3272			n_ctx_switch += nr_context_switches_cpu(i);
  3273			n_process += per_cpu(total_forks, i);
  3274			n_running += nr_running_cpu(i);
  3275			n_blocked += nr_iowait_cpu(i);
  3276		}
  3277		seq_printf(m,
  3278			"\nctxt %llu\n"
  3279			"btime %llu\n"
  3280			"processes %llu\n"
  3281			"procs_running %llu\n"
  3282			"procs_blocked %llu\n",
  3283			n_ctx_switch,
  3284			(unsigned long long)boottime.tv_sec,
  3285			n_process,
  3286			n_running,
  3287			n_blocked);
  3288	
  3289		seq_put_decimal_ull(m, "softirq ", 0);
  3290	
  3291		for (i = 0; i < NR_SOFTIRQS; i++)
  3292			seq_put_decimal_ull(m, " ", 0);
  3293		seq_putc(m, '\n');
  3294	
  3295		return 0;
  3296	}
  3297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
