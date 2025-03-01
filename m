Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029951DED79
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 15:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740843831; cv=none; b=t0A+XctMWfu25r4ibFmAYzxgGOhHPcg3ZcuD8aNgGjpPJUnQhMFyCpnFumndIgcI6Nz6aEzRXnLEjGeNuTLV2dCOTx4dQCoHc35rrBL3/wqZAq8la/+YydF3aA8iOPwtAy6e4e/9E5zDYwUKyX38e5dyxOBrD75jfyGIbX/D5E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740843831; c=relaxed/simple;
	bh=5RFCfPVrVeLBD69g1m4SZtIVTe36YezRd1+9UEqPYOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV2dvFO07kcmIu97Ip35GHtcwGCR63/ehUJZvHrPrCLGHH3zchw83B2y40QHF7LRmvmuBy23Es3bTzQ+U2xXWPJyWs6ccIx8zw1SbuT8zXfE2Z0U0cLcDlK8mC30/48Zhk8sxYeGljo6HgRra/vcvRoooDBELJiTU0fC+QxynYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jntYeYPa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jntYeYPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740843830; x=1772379830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5RFCfPVrVeLBD69g1m4SZtIVTe36YezRd1+9UEqPYOg=;
  b=jntYeYPaTOQjqPAeJX5T15aJGkaDAGtkQ4eGgksbVBiwSykCUaLTgVRr
   FNgApxFzSkiUVDxiJTcOL3Di7g8Peo1fysc5YfzPIzl8YTQO+h19Omfx7
   qKxI2wrsDdsh8az+Kl9siUemFtZs90IRkmmFs19PtgO60X2RHyOS2GGV8
   eBIe6sEh7Xi5rYoddSe1KJQNGjGqSR3IyMPqpUJ1G15zMPKHT1pAmAqZ2
   g3x2S1Ij7ApAfnhWDPRtq/F3nlLhdaizMvEvJIGQNuZfCYUVddsZbK3Qi
   jDVTrS/bPgOMFn7wTBCvtFAlYpqfNB42WopDhhuM/8vrKtbGqMX5Jtrga
   w==;
X-CSE-ConnectionGUID: pRIC7fQ1Qw24ow+YaD8/iQ==
X-CSE-MsgGUID: 3PNcm4GdTrmS/SWQi43Z+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45410414"
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="45410414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 07:43:50 -0800
X-CSE-ConnectionGUID: Z4Z9D3WNSSqGtVDp/VqlKA==
X-CSE-MsgGUID: qvNvoEz9Toy3bqcXXPgDrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,325,1732608000"; 
   d="scan'208";a="140831011"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2025 07:43:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toP0D-000GOQ-2R;
	Sat, 01 Mar 2025 15:43:45 +0000
Date: Sat, 1 Mar 2025 23:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/7 v3] sched/fair: Rework feec() to use cost instead of
 spare capacity
Message-ID: <202503012301.MFboCLGE-lkp@intel.com>
References: <20250228134000.1226665-4-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228134000.1226665-4-vincent.guittot@linaro.org>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on peterz-queue/sched/core linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Guittot/sched-fair-Filter-false-overloaded_group-case-for-EAS/20250228-214408
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20250228134000.1226665-4-vincent.guittot%40linaro.org
patch subject: [PATCH 3/7 v3] sched/fair: Rework feec() to use cost instead of spare capacity
config: s390-randconfig-002-20250301 (https://download.01.org/0day-ci/archive/20250301/202503012301.MFboCLGE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503012301.MFboCLGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503012301.MFboCLGE-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'find_pd_cost':
>> kernel/sched/fair.c:8301:55: error: passing argument 2 of 'em_pd_get_previous_state' makes integer from pointer without a cast [-Wint-conversion]
    8301 |         i = em_pd_get_previous_state(em_table->state, pd, i);
         |                                                       ^~
         |                                                       |
         |                                                       struct em_perf_domain *
   In file included from kernel/sched/fair.c:23:
   include/linux/energy_model.h:393:59: note: expected 'int' but argument is of type 'struct em_perf_domain *'
     393 | em_pd_get_previous_state(struct em_perf_state *table, int nr_perf_states,
         |                                                       ~~~~^~~~~~~~~~~~~~
>> kernel/sched/fair.c:8301:13: error: too few arguments to function 'em_pd_get_previous_state'
    8301 |         i = em_pd_get_previous_state(em_table->state, pd, i);
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/energy_model.h:393:1: note: declared here
     393 | em_pd_get_previous_state(struct em_perf_state *table, int nr_perf_states,
         | ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/em_pd_get_previous_state +8301 kernel/sched/fair.c

  8280	
  8281	/* Find the cost of a performance domain for the estimated utilization */
  8282	static inline void find_pd_cost(struct em_perf_domain *pd,
  8283					unsigned long max_util,
  8284					struct energy_cpu_stat *stat)
  8285	{
  8286		struct em_perf_table *em_table;
  8287		struct em_perf_state *ps;
  8288		int i;
  8289	
  8290		/*
  8291		 * Find the lowest performance state of the Energy Model above the
  8292		 * requested performance.
  8293		 */
  8294		em_table = rcu_dereference(pd->em_table);
  8295		i = em_pd_get_efficient_state(em_table->state, pd, max_util);
  8296		ps = &em_table->state[i];
  8297	
  8298		/* Save the cost and performance range of the OPP */
  8299		stat->max_perf = ps->performance;
  8300		stat->cost = ps->cost;
> 8301		i = em_pd_get_previous_state(em_table->state, pd, i);
  8302		if (i < 0)
  8303			stat->min_perf = 0;
  8304		else {
  8305			ps = &em_table->state[i];
  8306			stat->min_perf = ps->performance;
  8307		}
  8308	}
  8309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
