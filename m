Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FD82F41
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 07:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TN3Wr2lI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700982487; x=1732518487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iVrxXuVXta97qZOKOuLAX42/DNnluVKZH7nqlVSpU2Q=;
  b=TN3Wr2lI7lu36LVWMQN92YJyh7E0wfacmmpvHNqjETdPKDyCzxClwMNX
   y0SJYlfKAZiumTJpStmvefwP0f5q8hvi47+lpbqSGT+1RuMfTX1kfK4Yp
   C/aRNXGCvfHWDdAx/ISRLq5USWwfkzXSh8GDWj+vX71EzXVWGcqmXIAfM
   pt1vEQigra9IkMwFpxmmVoqtP2dYajHUkX3lLddatVrvEAGrNN/8Veldd
   9pwfpt3R4jzKtFk8urhkVsIgDCB7RyXMwgJ36Y8OlCwYHvhhKBntN9GZ7
   XIVRhIwu/xfMFTYEbtsCXbg4BUXaTO1Sp4kYTusfQKOlv/DfydJtDxmpZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="395375593"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="395375593"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 23:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="891409269"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="891409269"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Nov 2023 23:08:05 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r79FK-0004vi-26;
	Sun, 26 Nov 2023 07:08:02 +0000
Date: Sun, 26 Nov 2023 15:07:08 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH] simpler way to get benefits of "vfs: shave work on
 failed file open"
Message-ID: <202311261246.kHFXNLds-lkp@intel.com>
References: <20231126020834.GC38156@ZenIV>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126020834.GC38156@ZenIV>

Hi Al,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Al-Viro/simpler-way-to-get-benefits-of-vfs-shave-work-on-failed-file-open/20231126-101216
base:   linux/master
patch link:    https://lore.kernel.org/r/20231126020834.GC38156%40ZenIV
patch subject: [RFC][PATCH] simpler way to get benefits of "vfs: shave work on failed file open"
config: i386-randconfig-141-20231126 (https://download.01.org/0day-ci/archive/20231126/202311261246.kHFXNLds-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311261246.kHFXNLds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311261246.kHFXNLds-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/file_table.c:436:18: error: use of undeclared identifier 'f'
                   if (unlikely(!(f->f_mode & (FMODE_BACKING | FMODE_OPENED)))) {
                                  ^
   fs/file_table.c:437:14: error: use of undeclared identifier 'f'
                           file_free(f);
                                     ^
   2 errors generated.


vim +/f +436 fs/file_table.c

   430	
   431	void fput(struct file *file)
   432	{
   433		if (atomic_long_dec_and_test(&file->f_count)) {
   434			struct task_struct *task = current;
   435	
 > 436			if (unlikely(!(f->f_mode & (FMODE_BACKING | FMODE_OPENED)))) {
   437				file_free(f);
   438				return;
   439			}
   440			if (likely(!in_interrupt() && !(task->flags & PF_KTHREAD))) {
   441				init_task_work(&file->f_rcuhead, ____fput);
   442				if (!task_work_add(task, &file->f_rcuhead, TWA_RESUME))
   443					return;
   444				/*
   445				 * After this task has run exit_task_work(),
   446				 * task_work_add() will fail.  Fall through to delayed
   447				 * fput to avoid leaking *file.
   448				 */
   449			}
   450	
   451			if (llist_add(&file->f_llist, &delayed_fput_list))
   452				schedule_delayed_work(&delayed_fput_work, 1);
   453		}
   454	}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
