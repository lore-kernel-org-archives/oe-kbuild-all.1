Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900E015B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 03:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nttWa370"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697168881; x=1728704881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RtqlAuJsUwoG0wTA+SV+3l+rP6UeT48+js+hm5budFg=;
  b=nttWa370Dt5qHbi1lp8Yz6Pi7rSokBFrXqjnGhc4FhbBaZT3ALiDrZl3
   +1+89i+o5fhInqhwzHeN/1l9UT7lXdi+VbcuK8t8JkqV6pGKvYGy4CPRH
   ihX8vnABRjN0UXnXG/Y/QqXdjYqiTOCTB0AwM5dd5XF8OifA8/cn/0RF1
   9te0KPge7cz7L+tqMeZcHc7uMmvLEtOqOkPVN1jo6EGhgQYBBLYURJPTi
   iWcVhiHPmH58Z19Jrq2a6RqmgsGnbpmaP3EDvgMpCd4uCt4oQdyI+zOTe
   OOZDhjPuQhtku+zI1Os4ha5OZUrjpxzL4tEt/u/SNioj/q0WSMyfqjKss
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375444346"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375444346"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 20:47:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704459460"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="704459460"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 20:47:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr99Q-0004In-2f;
	Fri, 13 Oct 2023 03:47:48 +0000
Date: Fri, 13 Oct 2023 11:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2449/24022]
 kernel/tracepoint.c:662:27: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202310131112.kjXwTpN4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   8a0ac15c3162cd3792293d0848bde875b44e48d5
commit: e0cfc5fd8c9358c2d85fa65167794c2657f7656e [2449/24022] ANDROID: vendor_hooks: Allow multiple attachments to restricted hooks
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231013/202310131112.kjXwTpN4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131112.kjXwTpN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131112.kjXwTpN4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/tracepoint.c:662:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func [noderef] __rcu *funcs @@     got void * @@
   kernel/tracepoint.c:662:27: sparse:     expected struct tracepoint_func [noderef] __rcu *funcs
   kernel/tracepoint.c:662:27: sparse:     got void *
>> kernel/tracepoint.c:671:25: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/tracepoint.c:693:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct tracepoint_func *tp_funcs @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   kernel/tracepoint.c:693:38: sparse:     expected struct tracepoint_func *tp_funcs
   kernel/tracepoint.c:693:38: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> kernel/tracepoint.c:668:31: sparse: sparse: dereference of noderef expression
   kernel/tracepoint.c:670:42: sparse: sparse: dereference of noderef expression

vim +662 kernel/tracepoint.c

   654	
   655	#define ANDROID_RVH_NR_PROBES_MAX	2
   656	static int rvh_func_add(struct tracepoint *tp, struct tracepoint_func *func)
   657	{
   658		int i;
   659	
   660		if (!static_key_enabled(&tp->key)) {
   661			/* '+ 1' for the last NULL element */
 > 662			tp->funcs = rvh_zalloc_funcs(ANDROID_RVH_NR_PROBES_MAX + 1);
   663			if (!tp->funcs)
   664				return ENOMEM;
   665		}
   666	
   667		for (i = 0; i < ANDROID_RVH_NR_PROBES_MAX; i++) {
 > 668			if (!tp->funcs[i].func) {
   669				if (!static_key_enabled(&tp->key))
   670					tp->funcs[i].data = func->data;
 > 671				WRITE_ONCE(tp->funcs[i].func, func->func);
   672	
   673				return 0;
   674			}
   675		}
   676	
   677		return -EBUSY;
   678	}
   679	
   680	static int android_rvh_add_func(struct tracepoint *tp, struct tracepoint_func *func)
   681	{
   682		int ret;
   683	
   684		if (tp->regfunc && !static_key_enabled(&tp->key)) {
   685			ret = tp->regfunc();
   686			if (ret < 0)
   687				return ret;
   688		}
   689	
   690		ret = rvh_func_add(tp, func);
   691		if (ret)
   692			return ret;
 > 693		tracepoint_update_call(tp, tp->funcs, false);
   694		static_key_enable(&tp->key);
   695	
   696		return 0;
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
