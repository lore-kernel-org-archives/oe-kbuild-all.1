Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE3E33CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 05:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqeWTU2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696916351; x=1728452351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nTg8Q14cM6kKh/h0FxRu51MO6/gRCjmw3bKJ0v2615w=;
  b=FqeWTU2wDP2+5ZnrY8v4K0sLnsNCbiHvK7N0d7EtMOUD9AFX0iZOdtm0
   m3BJxkW9ks2+mseOzA3tQMhoVAwshCTqGcxQvR71APuca2XsKwwvWmo6h
   IKYKGlbChkwIjH/Ab0KQy2XyxU7IkKWxVCPrueV3PvGzsjAGTNTbEM+BZ
   vXmFybt8/l2jdQJ7A3RR0xux3t/zUC8ZwE8p7FhWHzuIL7Q5KVZduJX0K
   BHeFhz7GEVFO0INoVhrQCVZGB/ZaEVlxHyRRe/j/NOiXXKzL/ueYEi1bq
   sujt8uOfO/qjDXZe0jVH7FBSWKNrNHI7/+Thw1u/XNYpC420+mEw14n7s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384172635"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="384172635"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 22:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="703182589"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="703182589"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 09 Oct 2023 22:39:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq5ST-00001u-36;
	Tue, 10 Oct 2023 05:39:06 +0000
Date: Tue, 10 Oct 2023 13:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] fork, procfs: Introduce /proc/self/interpreter
 symlink
Message-ID: <202310101349.prZqmt5R-lkp@intel.com>
References: <20230907204256.3700336-3-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907204256.3700336-3-gpiccoli@igalia.com>

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
patch link:    https://lore.kernel.org/r/20230907204256.3700336-3-gpiccoli%40igalia.com
patch subject: [RFC PATCH 2/2] fork, procfs: Introduce /proc/self/interpreter symlink
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231010/202310101349.prZqmt5R-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101349.prZqmt5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101349.prZqmt5R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/fork.c:641: warning: Function parameter or member 'mm' not described in '__get_mm_exe_or_interp_file'
   kernel/fork.c:641: warning: Function parameter or member 'prefer_interp' not described in '__get_mm_exe_or_interp_file'
   kernel/fork.c:1445: warning: Function parameter or member 'mm' not described in 'set_mm_exe_file'
   kernel/fork.c:1445: warning: Function parameter or member 'new_exe_file' not described in 'set_mm_exe_file'
   kernel/fork.c:1445: warning: Function parameter or member 'new_interpreted_file' not described in 'set_mm_exe_file'
   kernel/fork.c:1498: warning: Function parameter or member 'mm' not described in 'replace_mm_exe_file'
   kernel/fork.c:1498: warning: Function parameter or member 'new_exe_file' not described in 'replace_mm_exe_file'
   kernel/fork.c:1551: warning: Function parameter or member 'task' not described in 'get_task_exe_file'
   kernel/fork.c:1551: warning: Function parameter or member 'prefer_interpreted' not described in 'get_task_exe_file'
>> kernel/fork.c:1581: warning: Function parameter or member 'task' not described in 'get_task_interpreter_file'
   kernel/fork.c:1607: warning: Function parameter or member 'task' not described in 'get_task_mm'
   kernel/fork.c:2182: warning: bad line: 
   kernel/fork.c:2203: warning: Function parameter or member 'ret' not described in '__pidfd_prepare'
   kernel/fork.c:2203: warning: Excess function parameter 'pidfd' description in '__pidfd_prepare'
   kernel/fork.c:2252: warning: Function parameter or member 'ret' not described in 'pidfd_prepare'
   kernel/fork.c:2252: warning: Excess function parameter 'pidfd' description in 'pidfd_prepare'
   kernel/fork.c:3261: warning: expecting prototype for clone3(). Prototype was for sys_clone3() instead


vim +1581 kernel/fork.c

  1570	
  1571	/**
  1572	 * get_task_interpreter_file - acquire a reference to the task's *interpreter*
  1573	 * executable (which is in fact the exe_file on mm_struct!). This is used in
  1574	 * order to expose /proc/self/interpreter, if we're under an interpreted
  1575	 * scenario (like binfmt_misc).
  1576	 *
  1577	 * Returns %NULL if exe_file is not an interpreter (i.e., it is the truly
  1578	 * running binary indeed).
  1579	 */
  1580	struct file *get_task_interpreter_file(struct task_struct *task)
> 1581	{
  1582		struct file *interpreter_file = NULL;
  1583		struct mm_struct *mm;
  1584	
  1585		task_lock(task);
  1586	
  1587		mm = task->mm;
  1588		if (mm && mm->has_interpreter) {
  1589			if (!(task->flags & PF_KTHREAD))
  1590				interpreter_file = get_mm_exe_file(mm);
  1591		}
  1592	
  1593		task_unlock(task);
  1594		return interpreter_file;
  1595	}
  1596	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
