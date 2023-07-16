Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13797161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 05:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689484816; x=1721020816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dKSYPIZCHVVws7683Zdv/SBdJea8P1NBbEwA8cRDqlE=;
  b=DBcgcO1Nh+yS5++Cbm8bx2u9TcZWzKiptvVxz4Ecy2/UTdPLTAzDlbcR
   /6+0sjlq116aH78fv+bjM1IaOWgM+fvqMKzzWn8Hjf1aKBiZ9ZZdO03Hv
   GYBxBJJP6UnAoClRqd390bSM4h1/RZhzYhcUplNCtkjWtO/ChjdnG3fbJ
   TfNhgI/+Eja5fVglg0p3uBiYgi8URQSRZ6HoS6eM15x97KLfLwg6dPUW9
   OZ/BwTj/HzjfmT7k4/B02nYLhsPuqUo35IkKQbN+kgX1ewQZ5t2HiG+vc
   mJk9Qc+2ONiUQ9iqihfozL2Kmz8aWe9qOqS0b4aZMIPxvy/jjK5YaGa88
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="396547003"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="396547003"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 22:20:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="788257644"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="788257644"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2023 22:20:16 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKuB5-0008cD-0P;
	Sun, 16 Jul 2023 05:20:15 +0000
Date: Sun, 16 Jul 2023 13:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:overutilized-affinity 1/1] kernel/sched/fair.c:4650:29:
 error: implicit declaration of function 'task_fits_capacity'; did you mean
 'dl_task_fits_capacity'?
Message-ID: <202307161333.66GZlj1v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux overutilized-affinity
head:   ebfdc14c29d437e3fcd8df02e8d3a9c00b7f226f
commit: ebfdc14c29d437e3fcd8df02e8d3a9c00b7f226f [1/1] sched/eas: Check a task has a fitting cpu when updating misfit
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230716/202307161333.66GZlj1v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161333.66GZlj1v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161333.66GZlj1v-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'update_misfit_status':
>> kernel/sched/fair.c:4650:29: error: implicit declaration of function 'task_fits_capacity'; did you mean 'dl_task_fits_capacity'? [-Werror=implicit-function-declaration]
    4650 |                         if (task_fits_capacity(p, capacity_of(cpu))) {
         |                             ^~~~~~~~~~~~~~~~~~
         |                             dl_task_fits_capacity
   cc1: some warnings being treated as errors


vim +4650 kernel/sched/fair.c

  4630	
  4631	static inline void update_misfit_status(struct task_struct *p, struct rq *rq)
  4632	{
  4633		bool has_fitting_cpu = false;
  4634		int cpu;
  4635	
  4636		if (!sched_asym_cpucap_active())
  4637			return;
  4638	
  4639		if (!p || p->nr_cpus_allowed == 1)
  4640			goto out;
  4641	
  4642		if (task_fits_cpu(p, cpu_of(rq)))
  4643			goto out;
  4644	
  4645		/*
  4646		 * This could be an expensive check in __schedule()..
  4647		 */
  4648		if (!cpumask_equal(p->cpus_ptr, cpu_possible_mask)) {
  4649			for_each_cpu(cpu, p->cpus_ptr) {
> 4650				if (task_fits_capacity(p, capacity_of(cpu))) {
  4651					has_fitting_cpu = true;
  4652					break;
  4653				}
  4654			}
  4655	
  4656			if (!has_fitting_cpu)
  4657				goto out;
  4658		}
  4659	
  4660		/*
  4661		 * Make sure that misfit_task_load will not be null even if
  4662		 * task_h_load() returns 0.
  4663		 */
  4664		rq->misfit_task_load = max_t(unsigned long, task_h_load(p), 1);
  4665		return;
  4666	out:
  4667		rq->misfit_task_load = 0;
  4668	}
  4669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
