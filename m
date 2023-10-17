Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EFD2D03A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E294+0Rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697560753; x=1729096753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2E24tMxyO4RDWy91nh2CPg4fuvBrJKlEpQcbHYjsB0k=;
  b=E294+0RvbuAMvdIgsWMNDmrt4iUv4O2ykgsWie2nxH2HdkqquKRx/rQf
   dvC1MDUdLT10AxheOzgy9RYCNXv74ySYnAbU3CitivPMUnGnVU3kc76CA
   Qn+GbeVwHd6bLbq463VYkH5KKOzRz5NAaMatj7M88Jdlzcc/ob4GFwm5e
   dE9K5GtWSxB/+GN5OrIUpWswQ8QAlEN2ENPCjg+NJOI3MSuiEd+RtkB1z
   M+TcSytKuXasvAqfpk1AnbjMAzKirEGXOVTRyYPwj+2R/FPtZ0G4kOxWu
   kt60ak/1myCGvFMRkCirlFHyAHU6C9O5auomF6cIju7yW7VdxQzxyKcy9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389693714"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="389693714"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 09:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="706068409"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="706068409"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Oct 2023 09:39:10 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsn64-0009pf-1H;
	Tue, 17 Oct 2023 16:39:08 +0000
Date: Wed, 18 Oct 2023 00:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next v2 4/9] bpf: Add a new kfunc for cgroup1
 hierarchy
Message-ID: <202310180043.9mRP2HUf-lkp@intel.com>
References: <20231017124546.24608-5-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017124546.24608-5-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/cgroup-Make-operations-on-the-cgroup-root_list-RCU-safe/20231017-204729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20231017124546.24608-5-laoar.shao%40gmail.com
patch subject: [RFC PATCH bpf-next v2 4/9] bpf: Add a new kfunc for cgroup1 hierarchy
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231018/202310180043.9mRP2HUf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180043.9mRP2HUf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180043.9mRP2HUf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:2232: warning: expecting prototype for bpf_task_get_cgroup_within_hierarchy(). Prototype was for bpf_task_get_cgroup1_within_hierarchy() instead


vim +2232 kernel/bpf/helpers.c

  2220	
  2221	/**
  2222	 * bpf_task_get_cgroup_within_hierarchy - Acquires the associated cgroup of
  2223	 * a task within a specific cgroup1 hierarchy. The cgroup1 hierarchy is
  2224	 * identified by its hierarchy ID.
  2225	 * @task: The target task
  2226	 * @hierarchy_id: The ID of a cgroup1 hierarchy
  2227	 *
  2228	 * On success, the cgroup is returen. On failure, NULL is returned.
  2229	 */
  2230	__bpf_kfunc struct cgroup *
  2231	bpf_task_get_cgroup1_within_hierarchy(struct task_struct *task, int hierarchy_id)
> 2232	{
  2233		struct cgroup *cgrp = task_get_cgroup1_within_hierarchy(task, hierarchy_id);
  2234	
  2235		if (IS_ERR(cgrp))
  2236			return NULL;
  2237		return cgrp;
  2238	}
  2239	#endif /* CONFIG_CGROUPS */
  2240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
