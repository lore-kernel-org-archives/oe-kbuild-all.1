Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8C18E0A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 16:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N95QOTzT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698683079; x=1730219079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Zcg66WfYBem0+2bWHQA0RJH+P+Ok/et9+sAXu9vLiU=;
  b=N95QOTzT9Gau3ZQUdW55HZ4z73n9kuyENrfDZaIlhT6lNS26TGBZ6FDU
   P/WbggyXA8AZ2mR5CAFC1Cm3K1fnIdpc2vRaJ3FltT4WCPa8cW0YZqjB0
   y3sR///K3SbbuHDBzPxLPK1ymTVaTedD6fY/jXD9l7QxgL636qjyVs9gs
   Lr5ZerJH8P9jXMJp2wmUUwXsfO+DGmYVlWcBtBd0qekHxaT1k1SEEUOXL
   oyrs94PlVIEj21UytKItoQbUi2XQXrRx/Yr6DKHnfg6fxFa9habtHNVQy
   HxFVupai4uV2xS27G0OGMVQC7P7cYhu5L0QAARN1WLUTe9kTuLuRxV1Lt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="378482157"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="378482157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 09:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1546097"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Oct 2023 09:24:38 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxV47-000DPS-2v;
	Mon, 30 Oct 2023 16:24:35 +0000
Date: Tue, 31 Oct 2023 00:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 10527/16121] kernel/bpf/task_iter.c:919:36:
 error: 'CSS_TASK_ITER_THREADED' undeclared
Message-ID: <202310310055.RDWloNPr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c503e3eec382ac708ee7adf874add37b77c5d312
commit: 9c66dc94b62aef23300f05f63404afb8990920b4 [10527/16121] bpf: Introduce css_task open-coded iterator kfuncs
config: xtensa-randconfig-001-20231030 (https://download.01.org/0day-ci/archive/20231031/202310310055.RDWloNPr-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310310055.RDWloNPr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310310055.RDWloNPr-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_new':
   kernel/bpf/task_iter.c:919:14: error: 'CSS_TASK_ITER_PROCS' undeclared (first use in this function)
     919 |         case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
         |              ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:919:14: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/bpf/task_iter.c:919:36: error: 'CSS_TASK_ITER_THREADED' undeclared (first use in this function)
     919 |         case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:927:60: error: invalid application of 'sizeof' to incomplete type 'struct css_task_iter'
     927 |         kit->css_it = bpf_mem_alloc(&bpf_global_ma, sizeof(struct css_task_iter));
         |                                                            ^~~~~~
>> kernel/bpf/task_iter.c:930:9: error: implicit declaration of function 'css_task_iter_start'; did you mean 'task_seq_start'? [-Werror=implicit-function-declaration]
     930 |         css_task_iter_start(css, flags, kit->css_it);
         |         ^~~~~~~~~~~~~~~~~~~
         |         task_seq_start
   kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_next':
>> kernel/bpf/task_iter.c:940:16: error: implicit declaration of function 'css_task_iter_next'; did you mean 'class_dev_iter_next'? [-Werror=implicit-function-declaration]
     940 |         return css_task_iter_next(kit->css_it);
         |                ^~~~~~~~~~~~~~~~~~
         |                class_dev_iter_next
   kernel/bpf/task_iter.c:940:16: warning: returning 'int' from a function with return type 'struct task_struct *' makes pointer from integer without a cast [-Wint-conversion]
     940 |         return css_task_iter_next(kit->css_it);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_destroy':
>> kernel/bpf/task_iter.c:949:9: error: implicit declaration of function 'css_task_iter_end' [-Werror=implicit-function-declaration]
     949 |         css_task_iter_end(kit->css_it);
         |         ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/CSS_TASK_ITER_THREADED +919 kernel/bpf/task_iter.c

   904	
   905	__diag_push();
   906	__diag_ignore_all("-Wmissing-prototypes",
   907			  "Global functions as their definitions will be in vmlinux BTF");
   908	
   909	__bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
   910			struct cgroup_subsys_state *css, unsigned int flags)
   911	{
   912		struct bpf_iter_css_task_kern *kit = (void *)it;
   913	
   914		BUILD_BUG_ON(sizeof(struct bpf_iter_css_task_kern) != sizeof(struct bpf_iter_css_task));
   915		BUILD_BUG_ON(__alignof__(struct bpf_iter_css_task_kern) !=
   916						__alignof__(struct bpf_iter_css_task));
   917		kit->css_it = NULL;
   918		switch (flags) {
 > 919		case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
   920		case CSS_TASK_ITER_PROCS:
   921		case 0:
   922			break;
   923		default:
   924			return -EINVAL;
   925		}
   926	
 > 927		kit->css_it = bpf_mem_alloc(&bpf_global_ma, sizeof(struct css_task_iter));
   928		if (!kit->css_it)
   929			return -ENOMEM;
 > 930		css_task_iter_start(css, flags, kit->css_it);
   931		return 0;
   932	}
   933	
   934	__bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
   935	{
   936		struct bpf_iter_css_task_kern *kit = (void *)it;
   937	
   938		if (!kit->css_it)
   939			return NULL;
 > 940		return css_task_iter_next(kit->css_it);
   941	}
   942	
   943	__bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
   944	{
   945		struct bpf_iter_css_task_kern *kit = (void *)it;
   946	
   947		if (!kit->css_it)
   948			return;
 > 949		css_task_iter_end(kit->css_it);
   950		bpf_mem_free(&bpf_global_ma, kit->css_it);
   951	}
   952	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
