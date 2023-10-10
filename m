Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC09F8F53
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 04:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JqqntiMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696912334; x=1728448334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/w9BAwn3NCmh8N8MeNbabDNvXk01lr1cGtcZEmY4tG4=;
  b=JqqntiMRkzVLfJOQ7cGQdTrFET18XjpPq6M1t7nTI7daaOe/iJKcr55p
   rHOriZfw9wsXaanJw/H1dziNYNqQxwZjd8L49uPtd0xifbPKU6nxIu1D3
   S70JzKO/T+edGPFjqHcN3MdH3QAaH+3uzb39xbGg5255N6P7BzBrNEjik
   f+iXcW2RnFPgKckjXQTYXFQce4bRvdYCkfk6Uh8Ew553uF9j9TPa35ZiT
   OJ7+durNR2JQ/LuTggfvxRWLRt9lkDDFtin6Otf0HQ83CzRCL0zclG1MN
   2+WfTn3ITcGbMaVCuF6wF7bc3S2Gvf6Q5HxHXtnDNCwsH+ylT3BnnLX2A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="415305591"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="415305591"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 21:32:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823629696"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="823629696"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 09 Oct 2023 21:32:12 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq4Pi-000176-0q;
	Tue, 10 Oct 2023 04:32:10 +0000
Date: Tue, 10 Oct 2023 12:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] binfmt_misc, fork, proc: Introduce flag to
 expose the interpreted binary in procfs
Message-ID: <202310101213.5jXkSFZh-lkp@intel.com>
References: <20230907204256.3700336-2-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907204256.3700336-2-gpiccoli@igalia.com>

Hi Guilherme,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on pcmoore-audit/next linus/master v6.6-rc5]
[cannot apply to kees/for-next/execve next-20231009]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guilherme-G-Piccoli/binfmt_misc-fork-proc-Introduce-flag-to-expose-the-interpreted-binary-in-procfs/20230908-044529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230907204256.3700336-2-gpiccoli%40igalia.com
patch subject: [RFC PATCH 1/2] binfmt_misc, fork, proc: Introduce flag to expose the interpreted binary in procfs
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231010/202310101213.5jXkSFZh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101213.5jXkSFZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101213.5jXkSFZh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/fork.c:641: warning: Function parameter or member 'mm' not described in '__get_mm_exe_or_interp_file'
>> kernel/fork.c:641: warning: Function parameter or member 'prefer_interp' not described in '__get_mm_exe_or_interp_file'
   kernel/fork.c:1445: warning: Function parameter or member 'mm' not described in 'set_mm_exe_file'
   kernel/fork.c:1445: warning: Function parameter or member 'new_exe_file' not described in 'set_mm_exe_file'
>> kernel/fork.c:1445: warning: Function parameter or member 'new_interpreted_file' not described in 'set_mm_exe_file'
   kernel/fork.c:1498: warning: Function parameter or member 'mm' not described in 'replace_mm_exe_file'
   kernel/fork.c:1498: warning: Function parameter or member 'new_exe_file' not described in 'replace_mm_exe_file'
   kernel/fork.c:1551: warning: Function parameter or member 'task' not described in 'get_task_exe_file'
>> kernel/fork.c:1551: warning: Function parameter or member 'prefer_interpreted' not described in 'get_task_exe_file'
   kernel/fork.c:1581: warning: Function parameter or member 'task' not described in 'get_task_mm'
   kernel/fork.c:2156: warning: bad line: 
   kernel/fork.c:2177: warning: Function parameter or member 'ret' not described in '__pidfd_prepare'
   kernel/fork.c:2177: warning: Excess function parameter 'pidfd' description in '__pidfd_prepare'
   kernel/fork.c:2226: warning: Function parameter or member 'ret' not described in 'pidfd_prepare'
   kernel/fork.c:2226: warning: Excess function parameter 'pidfd' description in 'pidfd_prepare'
   kernel/fork.c:3235: warning: expecting prototype for clone3(). Prototype was for sys_clone3() instead


vim +641 kernel/fork.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  630  
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  631  /**
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  632   * __get_mm_exe_or_interp_file - helper that acquires a reference to the mm's
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  633   * executable file, or if prefer_interp is set, go with mm->interpreted_file
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  634   * instead.
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  635   *
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  636   * Returns %NULL if mm has no associated executable/interpreted file.
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  637   * User must release file via fput().
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  638   */
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  639  static inline struct file *__get_mm_exe_or_interp_file(struct mm_struct *mm,
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  640  						       bool prefer_interp)
fe69d560b5bd9e David Hildenbrand    2021-04-23 @641  {
fe69d560b5bd9e David Hildenbrand    2021-04-23  642  	struct file *exe_file;
fe69d560b5bd9e David Hildenbrand    2021-04-23  643  
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  644  	rcu_read_lock();
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  645  
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  646  	if (unlikely(prefer_interp))
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  647  		exe_file = rcu_dereference(mm->interpreted_file);
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  648  	else
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  649  		exe_file = rcu_dereference(mm->exe_file);
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  650  
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  651  	if (exe_file && !get_file_rcu(exe_file))
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  652  		exe_file = NULL;
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  653  	rcu_read_unlock();
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  654  	return exe_file;
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  655  }
b7ff0c42f1987b Guilherme G. Piccoli 2023-09-07  656  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
