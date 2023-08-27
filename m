Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F580B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693127024; x=1724663024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uVNh6oruMG/PzbbQDKzq6QJ3pfVajcyVMVidwkTFMEk=;
  b=KsYVL3i5exZ/uibNLapBC0WxZWR/0mhSPWe4yicOYD9nn3/k2IHRtiF2
   ympTu1o3gJ8TLSsm2D3ShKXG/SY0rkBSCFqAMeu9bOEsa7/8Isu+O0sY2
   3HO9wfdrFMhDva0OZs3Y34twrBYoFUGCGDQ9dqEnL3md1KxFG1owMlqpT
   bGYQFMJd2VMVSdNkdWAYSLZnU0RuPrreZRyL1Kh/mSrqa/IF2e0oeoIdp
   vxSa8wv/koGe5yT4RIuma0sxDX7TBvFKPOkVk+HbFjYEVdSEisjuCjGDS
   kF1Eyw5gnAyWOwuURpF5Cf04yvmAmSoOMjoHmdiWkxl0n1xXMoQD4ZGn2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="365132390"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="365132390"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 02:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="807969625"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="807969625"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Aug 2023 02:03:42 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaBgL-0005aR-2m;
	Sun, 27 Aug 2023 09:03:41 +0000
Date: Sun, 27 Aug 2023 17:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/4] bpf: Introduce css_task open-coded
 iterator kfuncs
Message-ID: <202308271630.m2pAiWQ1-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230827/202308271630.m2pAiWQ1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271630.m2pAiWQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271630.m2pAiWQ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/task_iter.c:830:17: warning: no previous prototype for 'bpf_iter_css_task_new' [-Wmissing-prototypes]
     830 | __bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:846:33: warning: no previous prototype for 'bpf_iter_css_task_next' [-Wmissing-prototypes]
     846 | __bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:855:18: warning: no previous prototype for 'bpf_iter_css_task_destroy' [-Wmissing-prototypes]
     855 | __bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_iter_css_task_new +830 kernel/bpf/task_iter.c

   829	
 > 830	__bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
   831			struct cgroup_subsys_state *css, unsigned int flags)
   832	{
   833		struct bpf_iter_css_task_kern *kit = (void *)it;
   834	
   835		BUILD_BUG_ON(sizeof(struct bpf_iter_css_task_kern) != sizeof(struct bpf_iter_css_task));
   836		BUILD_BUG_ON(__alignof__(struct bpf_iter_css_task_kern) !=
   837						__alignof__(struct bpf_iter_css_task));
   838	
   839		kit->css_it = kzalloc(sizeof(struct css_task_iter), GFP_KERNEL);
   840		if (!kit->css_it)
   841			return -ENOMEM;
   842		css_task_iter_start(css, flags, kit->css_it);
   843		return 0;
   844	}
   845	
 > 846	__bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
   847	{
   848		struct bpf_iter_css_task_kern *kit = (void *)it;
   849	
   850		if (!kit->css_it)
   851			return NULL;
   852		return css_task_iter_next(kit->css_it);
   853	}
   854	
 > 855	__bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
   856	{
   857		struct bpf_iter_css_task_kern *kit = (void *)it;
   858	
   859		if (!kit->css_it)
   860			return;
   861		css_task_iter_end(kit->css_it);
   862		kfree(kit->css_it);
   863	}
   864	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
