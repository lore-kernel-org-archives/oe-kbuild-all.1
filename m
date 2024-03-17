Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B642D21342
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 22:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710714466; cv=none; b=bL9NyJ4bXjc9GzoItR5kUhBqBxskZcwV3tumOpi6zYoPi2okEBSulHuEe46jwnerdsGG1lA7e1XImz4buCfCX3oFhTc4mQUd0LAKrtrfTHmPxIvTvi1R1fqG8ocGuPqtHgzqGKCyhvGOo+KoVul/2uWs02DJis3vel82Xk9ljks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710714466; c=relaxed/simple;
	bh=8FoMhOPaqm77lRnkbOg+VukWrmbzSwH4eaWEWizZjBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DsvP4qKiY6Dwe3MuCfgKXxqhHCbom/XBR6d5BIL24QDFNhlp0rydMcJjDFyabqutIdrc3mfWL8G3xX/jrFjE52TCfFPbwd99bGPPGD1O9x8D5QRlQJadveucD6M6N8uvI79ujLOsVjjr8rtlaRUVKx9kGJOC/CFwDQjmXXeBd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0mLOT/j; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0mLOT/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710714464; x=1742250464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8FoMhOPaqm77lRnkbOg+VukWrmbzSwH4eaWEWizZjBQ=;
  b=I0mLOT/jpYTKZSbySUP2QmZuP+mcfjdP4bgBZekd0frtEjy6Yoip3MK4
   +uksht9pOtt5VZoP0H8lpokuI6VT50fIPKISR57gDWSaZF3Dv+iTW+rVO
   1txFNrz30aPZhySSkqvyf+1yGcW7ijrLMWdLk6G513x29urmqFJVaYe/G
   Uugh10WXyEJKhAME+zIQDW0+xQaJ5KTm/N2PszCDHeyvPscJiAgxuiC45
   QcpSGcVOemcaTSQ8uyDGOwMDDiJfohAw7oAWS96aOpgB9AhGWOCeuVzHq
   6HXTwgoYa5uAnr6S09GfzuEwMybd5Us9XHB4Ojttw65sJOvLmx0gqELjG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5642813"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="5642813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 15:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="36410130"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2024 15:27:38 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlyyd-000GVH-0k;
	Sun, 17 Mar 2024 22:27:35 +0000
Date: Mon, 18 Mar 2024 06:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26696/27507]
 kernel/cgroup/cpuset.c:2714:5: sparse: sparse: symbol
 'cpuset_cgroupfs_stat_cpuacct' was not declared. Should it be static?
Message-ID: <202403180640.HDi0yzhv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: d3d7646bc98dbdde8ad7c6ea36ca645fd495fe38 [26696/27507] rue/cgroupfs: support stat based on cpuacct
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/archive/20240318/202403180640.HDi0yzhv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403180640.HDi0yzhv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180640.HDi0yzhv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/cpuset.c:2714:5: sparse: sparse: symbol 'cpuset_cgroupfs_stat_cpuacct' was not declared. Should it be static?
   kernel/cgroup/cpuset.c:4251:6: sparse: sparse: symbol 'cgroup_cpuset_calc_load' was not declared. Should it be static?

vim +/cpuset_cgroupfs_stat_cpuacct +2714 kernel/cgroup/cpuset.c

  2712	
  2713	extern int cpuacct_cgroupfs_cpu_usage(struct cgroup_subsys_state *css, int cpu, u64 *sys, u64 *user);
> 2714	int cpuset_cgroupfs_stat_cpuacct(struct cpuset *cs, struct seq_file *m, void *v, int max_cpu)
  2715	{
  2716		typedef struct usage_info {
  2717			u64 sys, usr, idle;
  2718		} u_info;
  2719	
  2720		u_info *res;
  2721		struct timespec boottime;
  2722		struct cgroup_subsys_state *css;
  2723		u64 sys, usr, cpu_total, cpu_idle, acct_total, total_sys, total_usr, total_idle;
  2724		u64 n_ctx_switch, n_process, n_running, n_blocked;
  2725		int i, k = 0, num_cpu = nr_cpu_ids + 1;;
  2726		total_sys = 0, total_usr = 0, total_idle = 0;
  2727	
  2728		res = kmalloc(sizeof(u_info) * num_cpu, GFP_KERNEL);
  2729		if (!res)
  2730			return -ENOMEM;
  2731		getboottime(&boottime);
  2732		/*
  2733		 * Tasks can run on any cpu of cpuset, consider with quota,
  2734		 * cpu number listed in stat may be less than cpuset, leading sum of usages
  2735		 * of each cpus less than total. To make sum of usage of each cpu equal to total,
  2736		 * set quota_aware=0 or configure quota equal to cpuset num.
  2737		 */
  2738		css = task_get_css(current, cpuacct_cgrp_id);
  2739		for_each_cpu(i, cs->cpus_allowed) {
  2740			++k;
  2741			cpu_total = 0;
  2742			cpu_idle = get_idle_time(i);
  2743			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_USER];
  2744			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_NICE];
  2745			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_SYSTEM];
  2746			cpu_total += get_iowait_time(i);
  2747			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_IRQ];
  2748			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_SOFTIRQ];
  2749			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_STEAL];
  2750			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_GUEST];
  2751			cpu_total += kcpustat_cpu(i).cpustat[CPUTIME_GUEST_NICE];
  2752			cpuacct_cgroupfs_cpu_usage(css, i, &sys, &usr);
  2753			acct_total = sys + usr;
  2754			if (cpu_total > acct_total)
  2755				cpu_idle = cpu_idle + (cpu_total - acct_total);
  2756			total_sys += sys;
  2757			total_usr += usr;
  2758			total_idle += cpu_idle;
  2759			if (k < num_cpu) {
  2760				res[k].sys = sys;
  2761				res[k].usr = usr;
  2762				res[k].idle = cpu_idle;
  2763			}
  2764		}
  2765		css_put(css);
  2766		res[0].sys = total_sys;
  2767		res[0].usr = total_usr;
  2768		res[0].idle = total_idle;
  2769		for (i = 0; i <= k && i <= max_cpu; i++) {
  2770			if (!i)
  2771				seq_printf(m, "cpu ");
  2772			else
  2773				seq_printf(m, "cpu%d", i - 1);
  2774			seq_put_decimal_ull(m, " ", nsec_to_clock_t(res[i].usr));
  2775			seq_put_decimal_ull(m, " ", 0);
  2776			seq_put_decimal_ull(m, " ", nsec_to_clock_t(res[i].sys));
  2777			seq_put_decimal_ull(m, " ", nsec_to_clock_t(res[i].idle));
  2778			seq_put_decimal_ull(m, " ", 0);
  2779			seq_put_decimal_ull(m, " ", 0);
  2780			seq_put_decimal_ull(m, " ", 0);
  2781			seq_put_decimal_ull(m, " ", 0);
  2782			seq_put_decimal_ull(m, " ", 0);
  2783			seq_put_decimal_ull(m, " ", 0);
  2784			seq_putc(m, '\n');
  2785		}
  2786		kfree(res);
  2787		seq_put_decimal_ull(m, "intr ", 0);
  2788		for_each_irq_nr(i)
  2789			seq_put_decimal_ull(m, " ", 0);
  2790	
  2791		n_ctx_switch = 0;
  2792		n_process = 0;
  2793		n_running = 0;
  2794		n_blocked = 0;
  2795		k = 0;
  2796		for_each_cpu(i, cs->cpus_allowed) {
  2797			if (++k > max_cpu)
  2798				break;
  2799			n_ctx_switch += nr_context_switches_cpu(i);
  2800			n_process += per_cpu(total_forks, i);
  2801			n_running += nr_running_cpu(i);
  2802			n_blocked += nr_iowait_cpu(i);
  2803		}
  2804		seq_printf(m,
  2805			"\nctxt %llu\n"
  2806			"btime %llu\n"
  2807			"processes %llu\n"
  2808			"procs_running %llu\n"
  2809			"procs_blocked %llu\n",
  2810			n_ctx_switch,
  2811			(unsigned long long)boottime.tv_sec,
  2812			n_process,
  2813			n_running,
  2814			n_blocked);
  2815	
  2816		seq_put_decimal_ull(m, "softirq ", 0);
  2817	
  2818		for (i = 0; i < NR_SOFTIRQS; i++)
  2819			seq_put_decimal_ull(m, " ", 0);
  2820		seq_putc(m, '\n');
  2821	
  2822		return 0;
  2823	}
  2824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
