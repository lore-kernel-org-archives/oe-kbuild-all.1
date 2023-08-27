Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F85780B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693128286; x=1724664286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u2qIE15xEyhhwK9YkaI8zxXZSbDIbsU7hBjbaGMdzQo=;
  b=Y39b95SUTOhqvJh9R2tRKXkzlj2dJst6VxkJbDB5qT5m3FYeM0IMreG6
   WzlYVmFvID78y4AYlI1bPfZkqh91G2uSDelL8N7f58sfCN1M0hWuqwClq
   f2tfAtHntxk1KOtkOK5mTO5OgVkxMb9USvptIqbbmFfwaMLIVQl20qxIQ
   rMU1Td9yUBWPdX7WGZmOF5HlfPgA3ON6h5aGjaYzOL52SpLvKMTM50ScS
   DwoKmyf0B44A4g0z8LzHWnE4SWZKT8nEjNyJuPEke8wWC1OF5Jl8qlSAR
   vnFZe6rIVnNgUEiaPJyIfE9jS/sqvZpNF3fNJcMKehyIHoMo/PZaMjicQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="461296517"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="461296517"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 02:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="911728078"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="911728078"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 27 Aug 2023 02:24:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaC0g-0005bx-2O;
	Sun, 27 Aug 2023 09:24:42 +0000
Date: Sun, 27 Aug 2023 17:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/4] bpf: Introduce css_task open-coded
 iterator kfuncs
Message-ID: <202308271707.4mUjMXwL-lkp@intel.com>
References: <20230827072057.1591929-2-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827072057.1591929-2-zhouchuyi@bytedance.com>

Hi Chuyi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuyi-Zhou/bpf-Introduce-css_task-open-coded-iterator-kfuncs/20230827-152340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230827072057.1591929-2-zhouchuyi%40bytedance.com
patch subject: [RFC PATCH bpf-next 1/4] bpf: Introduce css_task open-coded iterator kfuncs
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230827/202308271707.4mUjMXwL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271707.4mUjMXwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271707.4mUjMXwL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/task_iter.c:830:17: warning: no previous prototype for 'bpf_iter_css_task_new' [-Wmissing-prototypes]
     830 | __bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_new':
   kernel/bpf/task_iter.c:839:38: error: invalid application of 'sizeof' to incomplete type 'struct css_task_iter'
     839 |         kit->css_it = kzalloc(sizeof(struct css_task_iter), GFP_KERNEL);
         |                                      ^~~~~~
   kernel/bpf/task_iter.c:842:9: error: implicit declaration of function 'css_task_iter_start'; did you mean 'task_seq_start'? [-Werror=implicit-function-declaration]
     842 |         css_task_iter_start(css, flags, kit->css_it);
         |         ^~~~~~~~~~~~~~~~~~~
         |         task_seq_start
   kernel/bpf/task_iter.c: At top level:
   kernel/bpf/task_iter.c:846:33: warning: no previous prototype for 'bpf_iter_css_task_next' [-Wmissing-prototypes]
     846 | __bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_next':
   kernel/bpf/task_iter.c:852:16: error: implicit declaration of function 'css_task_iter_next'; did you mean 'class_dev_iter_next'? [-Werror=implicit-function-declaration]
     852 |         return css_task_iter_next(kit->css_it);
         |                ^~~~~~~~~~~~~~~~~~
         |                class_dev_iter_next
>> kernel/bpf/task_iter.c:852:16: warning: returning 'int' from a function with return type 'struct task_struct *' makes pointer from integer without a cast [-Wint-conversion]
     852 |         return css_task_iter_next(kit->css_it);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c: At top level:
   kernel/bpf/task_iter.c:855:18: warning: no previous prototype for 'bpf_iter_css_task_destroy' [-Wmissing-prototypes]
     855 | __bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_destroy':
   kernel/bpf/task_iter.c:861:9: error: implicit declaration of function 'css_task_iter_end' [-Werror=implicit-function-declaration]
     861 |         css_task_iter_end(kit->css_it);
         |         ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +852 kernel/bpf/task_iter.c

   845	
   846	__bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
   847	{
   848		struct bpf_iter_css_task_kern *kit = (void *)it;
   849	
   850		if (!kit->css_it)
   851			return NULL;
 > 852		return css_task_iter_next(kit->css_it);
   853	}
   854	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
