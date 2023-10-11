Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988CA198
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 00:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MNpLv85g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696983714; x=1728519714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BISmiJLcFSp1/cbINv0ac3ifKNb4TzbasV+dPFbUtWA=;
  b=MNpLv85gsDSUitBHbojgqarjb6dch8Iqt+Jo0lgLTu5Hf0SQDQNvDwun
   pfIMEGksThskWQSaJNS8IKdGgiyRVQ7cMjGh16T4NX8/FVxPrh9q9aNzN
   AmigG1D5IYz5gZDdomVqitaYpwjBF7SF6v+9NEZwBpB7SacUEaGC1F90S
   CDp+uUErP9IbmbxYm0LTo2E5QHxc8ShkmLUMbyzhc9nRKHbAGlTE96KLB
   /v1yKgWcHqia4OwYgbgTGbgcNv8OfJLkzb+2eDD/glPgh3x3gNZURwSMW
   MsGx1wqx64WcR9muB9bEXfOkTbORPqNw96t2nZc23GXjjznxUHZptukM+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="415591382"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="415591382"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 17:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="783057183"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="783057183"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Oct 2023 17:21:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqMyv-0001Qu-16;
	Wed, 11 Oct 2023 00:21:46 +0000
Date: Wed, 11 Oct 2023 08:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2449/24020]
 kernel/tracepoint.c:662:27: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202310110829.tgduzvci-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   082a5bf28b5fd8c6fe51fb60dddabf7d617b7914
commit: e0cfc5fd8c9358c2d85fa65167794c2657f7656e [2449/24020] ANDROID: vendor_hooks: Allow multiple attachments to restricted hooks
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231011/202310110829.tgduzvci-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231011/202310110829.tgduzvci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310110829.tgduzvci-lkp@intel.com/

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
