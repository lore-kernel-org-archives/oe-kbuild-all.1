Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9330F29C351
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765452183; cv=none; b=tyahdGRCjlMFrXOBjLJeZY7ZrwiPqx7yFys68FRPbBxQ9Z5aS1NDUqy/BO9KLJ0ldSi9ZqGsM3AqYQxdk+jlisfRGL+GyCbFiHrTv5SVhsR/eNb2bjfyhIDSuh5Rl9Ym9fvYnmgbt7RLcvoxzjnANzN+7H1UVIGD8zxBONXk5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765452183; c=relaxed/simple;
	bh=Xj1JTGTk5PoWSu/Vn1cBtAqRKnWNvwNwi5l01InnDMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fvcpitrrvWXxemM7LGUEFQp3vsak9KYYdpYdWH44Hikc9Z0HcQsz2h7rHK+2C2mAGD27OGPAoFG4LeLTNF6XHRJrt2u91DHgE7+zdbT6EY2c3kylLejltmUMRSj8CjnDhIdbd2141OEgx5Q0elM9Pf0Vs7/DZcVyfECzNioBfFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dRx4HAM0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dRx4HAM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765452181; x=1796988181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xj1JTGTk5PoWSu/Vn1cBtAqRKnWNvwNwi5l01InnDMw=;
  b=dRx4HAM0H5hj12lm/fJEgsFfTrPZCVms+KP6OdtJgIpI+yEzC23n0b90
   XgJ8dIejg8FI4nGBukTAyNeM4e4Vc5O1Q8Lsu5dYONffiH2rzQJN1534q
   Ulcf1mwMr1vz3ZtUvRfb/3cvyWF7hydiAwFcwOJkbmWC9pvVfmAEgybvS
   f3t5C4nKfoA5/XoQ9w/kgFALgV8JtBVqc06ZWU49o377WoyfU5z4KFYts
   xXBkbQJ8Y1DJNvYyDoaxKgqe6YEWnwgQB4Vq/zz0oKrMwPrJFQH2IDR0O
   P4zPrjC//FGfIvOpAiZcL2go72FS6/gX7fVatSSkqADnV8pV+ZbRMrjvX
   A==;
X-CSE-ConnectionGUID: Q6i7KXiaQhCsyvh/ihZubQ==
X-CSE-MsgGUID: yXDQV5MYRru+3bH//QY0QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78543662"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78543662"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 03:22:59 -0800
X-CSE-ConnectionGUID: K/Rn0R36R0aZeem6QYI1YA==
X-CSE-MsgGUID: k6KsivKdSLWwDUeiABoaCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201690336"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Dec 2025 03:22:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTel5-000000004aF-1JKl;
	Thu, 11 Dec 2025 11:22:55 +0000
Date: Thu, 11 Dec 2025 19:22:21 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5] kernel/sched/isolation.c:323:6:
 warning: no previous prototype for 'update_wilds_cpumask'
Message-ID: <202512111912.CeMlM7S2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   38743d2d77ee27e7fe97c7ef81b8643365903536
commit: 5814c67f4b329028e1062bc374604613b20c624c [5/5] anolis: sched/isolation: dynamical CPU isolation support
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251211/202512111912.CeMlM7S2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111912.CeMlM7S2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111912.CeMlM7S2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:105:
>> kernel/sched/isolation.c:323:6: warning: no previous prototype for 'update_wilds_cpumask' [-Wmissing-prototypes]
     323 | void update_wilds_cpumask(cpumask_var_t new_allowed, cpumask_var_t old_allowed)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/update_wilds_cpumask +323 kernel/sched/isolation.c

   322	
 > 323	void update_wilds_cpumask(cpumask_var_t new_allowed, cpumask_var_t old_allowed)
   324	{
   325		struct css_task_iter it;
   326		struct task_struct *task;
   327		struct task_group *tg = &root_task_group;
   328	
   329		css_task_iter_start(&tg->css, 0, &it);
   330		while ((task = css_task_iter_next(&it))) {
   331			if (task->flags & PF_KTHREAD)
   332				continue;
   333	
   334			if (!cpumask_equal(task->cpus_ptr, old_allowed))
   335				continue;
   336	
   337			set_cpus_allowed_ptr(task, new_allowed);
   338		}
   339		css_task_iter_end(&it);
   340	}
   341	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
