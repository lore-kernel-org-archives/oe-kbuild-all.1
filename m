Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36157450F6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 23:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695080646; x=1726616646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NzPzi/KFo6n8291HMGtzKQ1kHLm9JCVlkjkEGjiWzP0=;
  b=F8/pIFaXNLU3gNOk2MDXPOwhFAP16wl8jCkIezxlS5oQ+trjC34EgfbP
   IX8fbeGcLe8/UNtGIHXx+nCyW7p8fo8OvuVuje/sS1rmAgm8cE0xmMuFu
   QnXcT0ekoRx2qDOv/ps/VQK4zs7qvdWxyEBF3MA6YOzkD69Em2h4iMSMw
   wejMd3F4a4iYStOypIN51HMXCyWqiAsGpO9byyDyOHt9w+YsaLQPOCft0
   IM5pOECGSs8vZLNFCgcmqWXVto7VhknuAK/8SnJPKgCF1E1Orq6WRlkW1
   ++OXtI66WWD4BdHhcJA+vxWT7s7IBrwZV7W3tm4hjICwfAcjGoZmzUMWg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="378706596"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="378706596"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 16:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="869755295"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; 
   d="scan'208";a="869755295"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 18 Sep 2023 16:44:03 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiNuL-0006eM-0X;
	Mon, 18 Sep 2023 23:44:01 +0000
Date: Tue, 19 Sep 2023 07:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 5435/5912] kernel/bpf/helpers.c:2491:41: warning:
 cast to pointer from integer of different size
Message-ID: <202309190741.A98l02ua-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fc7222d9680366edeecc219c21ca96310bdbc10
commit: ec5290a178b787b2f8b21581fdadc919bd004e12 [5435/5912] bpf: Prevent KASAN false positive with bpf_throw
config: arc-randconfig-002-20230919 (https://download.01.org/0day-ci/archive/20230919/202309190741.A98l02ua-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309190741.A98l02ua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309190741.A98l02ua-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/helpers.c: In function 'bpf_throw':
>> kernel/bpf/helpers.c:2491:41: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2491 |         kasan_unpoison_task_stack_below((void *)ctx.sp);
         |                                         ^


vim +2491 kernel/bpf/helpers.c

  2476	
  2477	__bpf_kfunc void bpf_throw(u64 cookie)
  2478	{
  2479		struct bpf_throw_ctx ctx = {};
  2480	
  2481		arch_bpf_stack_walk(bpf_stack_walker, &ctx);
  2482		WARN_ON_ONCE(!ctx.aux);
  2483		if (ctx.aux)
  2484			WARN_ON_ONCE(!ctx.aux->exception_boundary);
  2485		WARN_ON_ONCE(!ctx.bp);
  2486		WARN_ON_ONCE(!ctx.cnt);
  2487		/* Prevent KASAN false positives for CONFIG_KASAN_STACK by unpoisoning
  2488		 * deeper stack depths than ctx.sp as we do not return from bpf_throw,
  2489		 * which skips compiler generated instrumentation to do the same.
  2490		 */
> 2491		kasan_unpoison_task_stack_below((void *)ctx.sp);
  2492		ctx.aux->bpf_exception_cb(cookie, ctx.sp, ctx.bp);
  2493	}
  2494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
