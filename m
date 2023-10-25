Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A73341BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 21:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeodulzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698269861; x=1729805861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcqpKdpz2QV8RBDos3U+fFKqCooST/AWWnQzrWK3IM0=;
  b=UeodulzQGIdsIGAE0cennsxEK2ZQjf3Qn/YmQsUXXHHAbNB+aNrFM9f2
   RLrWPc8Tpjcyv5CFrUtd0PnzNx54fluruoVSeY3Rvfp+cLhQB2tY9ARCl
   OYpkF+ybFhJIQ6kz6z30ViIqqAySUImkF2EP65tXmjIw7h3f6VnekZXt+
   zXyTkG25tQ+O+AaXRLNtNkMBmqFAnrS3fqqnxUN1mrnmurjXsbQX2gk+T
   /aem7q/XAkysKY4zG5xEEwcxF6uXpxSuYRPhMgEltebYkV/AXzSY0HzQ3
   GYeG0tdmHdlwJ9VpvzEgjdAd7D6SufJ6FH6dz0QPBwAVosAyoJvsGzUzU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="386283421"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="386283421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 14:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="226012"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2023 14:37:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvlZG-0009DT-12;
	Wed, 25 Oct 2023 21:37:34 +0000
Date: Thu, 26 Oct 2023 05:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 10579/14992] kernel/bpf/task_iter.c:940:9:
 warning: return makes pointer from integer without a cast
Message-ID: <202310260528.aHWgVFqq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe1998aa935b44ef873193c0772c43bce74f17dc
commit: 9c66dc94b62aef23300f05f63404afb8990920b4 [10579/14992] bpf: Introduce css_task open-coded iterator kfuncs
config: i386-buildonly-randconfig-006-20231026 (https://download.01.org/0day-ci/archive/20231026/202310260528.aHWgVFqq-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260528.aHWgVFqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260528.aHWgVFqq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/task_iter.c:831:17: warning: no previous declaration for 'bpf_iter_task_vma_new' [-Wmissing-declarations]
    __bpf_kfunc int bpf_iter_task_vma_new(struct bpf_iter_task_vma *it,
                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:875:36: warning: no previous declaration for 'bpf_iter_task_vma_next' [-Wmissing-declarations]
    __bpf_kfunc struct vm_area_struct *bpf_iter_task_vma_next(struct bpf_iter_task_vma *it)
                                       ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:884:18: warning: no previous declaration for 'bpf_iter_task_vma_destroy' [-Wmissing-declarations]
    __bpf_kfunc void bpf_iter_task_vma_destroy(struct bpf_iter_task_vma *it)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:909:17: warning: no previous declaration for 'bpf_iter_css_task_new' [-Wmissing-declarations]
    __bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_new':
   kernel/bpf/task_iter.c:919:7: error: 'CSS_TASK_ITER_PROCS' undeclared (first use in this function); did you mean 'BPF_TASK_ITER_TGID'?
     case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
          ^~~~~~~~~~~~~~~~~~~
          BPF_TASK_ITER_TGID
   kernel/bpf/task_iter.c:919:7: note: each undeclared identifier is reported only once for each function it appears in
   kernel/bpf/task_iter.c:919:29: error: 'CSS_TASK_ITER_THREADED' undeclared (first use in this function); did you mean 'CSS_TASK_ITER_PROCS'?
     case CSS_TASK_ITER_PROCS | CSS_TASK_ITER_THREADED:
                                ^~~~~~~~~~~~~~~~~~~~~~
                                CSS_TASK_ITER_PROCS
   kernel/bpf/task_iter.c:927:53: error: invalid application of 'sizeof' to incomplete type 'struct css_task_iter'
     kit->css_it = bpf_mem_alloc(&bpf_global_ma, sizeof(struct css_task_iter));
                                                        ^~~~~~
   kernel/bpf/task_iter.c:930:2: error: implicit declaration of function 'css_task_iter_start'; did you mean '__sg_page_iter_start'? [-Werror=implicit-function-declaration]
     css_task_iter_start(css, flags, kit->css_it);
     ^~~~~~~~~~~~~~~~~~~
     __sg_page_iter_start
   kernel/bpf/task_iter.c: At top level:
   kernel/bpf/task_iter.c:934:33: warning: no previous declaration for 'bpf_iter_css_task_next' [-Wmissing-declarations]
    __bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
                                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_next':
   kernel/bpf/task_iter.c:940:9: error: implicit declaration of function 'css_task_iter_next'; did you mean '__sg_page_iter_next'? [-Werror=implicit-function-declaration]
     return css_task_iter_next(kit->css_it);
            ^~~~~~~~~~~~~~~~~~
            __sg_page_iter_next
>> kernel/bpf/task_iter.c:940:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return css_task_iter_next(kit->css_it);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c: At top level:
   kernel/bpf/task_iter.c:943:18: warning: no previous declaration for 'bpf_iter_css_task_destroy' [-Wmissing-declarations]
    __bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c: In function 'bpf_iter_css_task_destroy':
   kernel/bpf/task_iter.c:949:2: error: implicit declaration of function 'css_task_iter_end'; did you mean 'vma_iter_end'? [-Werror=implicit-function-declaration]
     css_task_iter_end(kit->css_it);
     ^~~~~~~~~~~~~~~~~
     vma_iter_end
   cc1: some warnings being treated as errors


vim +940 kernel/bpf/task_iter.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
