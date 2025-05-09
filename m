Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6441E9B2A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 18:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815265; cv=none; b=nq2iiKtdFzTHLLfBHUleIRfsWD3qGMte/OGN3TEFTK7xcm/hpn603u4wwFolXa2fnnTT69TzrECrsnSgodNGnKBml1UONXvZ+tqcXsVZOpYTtj3yYNPtt7Unmb9NuQQx/cp+INFbBpIy4sx//EW6Y4iAjN55NSAPE5mEO5cBGDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815265; c=relaxed/simple;
	bh=qV8V0m30GFRdn80wBEGyAI5zfw4HDBuqR2ybpcMyUOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gvsyF4qrS29tGtAGhoEbZrBfobPaXFdrDBFH/aKqN0gNw0FqVb4tvXwKynhioYzq9F87NdGIq6P3gk+ojkpMuXzYsv2Hr0Jjhknhv71v4MPVUUU58R5xzkd6aI9ALUJqSeBcmvPR1a/b/DRJa9WJ2kDJrYCMcjKSROGODM7aFS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8x/5Scx; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8x/5Scx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746815264; x=1778351264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qV8V0m30GFRdn80wBEGyAI5zfw4HDBuqR2ybpcMyUOc=;
  b=O8x/5ScxO4yKAYsgj86HCIo7DEZNtifx5FAOvFKf7N1lcxwDL8fh3AkL
   8Ab8rqCJxPcsjEhD1/ab+uGcg1fnZYpLbXn0NdpLOwkUZSibbGVFTAHya
   ceP5iX7J9yK9lQ+T7kgJY8niVkD5dLVNmnOzEgyX+RQ+Ho+2qXWttc0eB
   Hux9vJtHZPl6t1J5WhBCdk9+6QWOegvtvbSrlOWp3Yf20etE6S9bi+EZf
   iXbKOwAO26uJyuWo14l8hp08WGMm4h1j8ZpCYxQ4wdYrlmMQcHIcrEwrR
   jotPNp8KuusTJDSuZCEmnJ/aiLyf5bk0+QYuL+y9pwvxTUPtVrXct82qf
   w==;
X-CSE-ConnectionGUID: jsN/gwuZRLO7REDmxzqvDA==
X-CSE-MsgGUID: HErJGTHARwyhP9ALf7dGxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="60057246"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="60057246"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 11:27:44 -0700
X-CSE-ConnectionGUID: UGxa1MW/SHWCIsfqGWtt1A==
X-CSE-MsgGUID: +ZgygB6fQbCkiYfw0cCJxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="141811332"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 May 2025 11:27:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDSRg-000CMN-1j;
	Fri, 09 May 2025 18:27:40 +0000
Date: Sat, 10 May 2025 02:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] kernel/sched/isolation.c:323:6:
 warning: no previous prototype for function 'update_wilds_cpumask'
Message-ID: <202505100221.l8evb4Zp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3e44eae7361a463faa2cab260363678a02c089f5
commit: 805a8687e30e5b269493f2deed8405e9888ff9ae [0/94] anolis: sched/isolation: dynamical CPU isolation support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250510/202505100221.l8evb4Zp-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505100221.l8evb4Zp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505100221.l8evb4Zp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:105:
>> kernel/sched/isolation.c:323:6: warning: no previous prototype for function 'update_wilds_cpumask' [-Wmissing-prototypes]
     323 | void update_wilds_cpumask(cpumask_var_t new_allowed, cpumask_var_t old_allowed)
         |      ^
   kernel/sched/isolation.c:323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     323 | void update_wilds_cpumask(cpumask_var_t new_allowed, cpumask_var_t old_allowed)
         | ^
         | static 
   1 warning generated.


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
