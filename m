Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB8133CC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 03:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrDOSp2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699674104; x=1731210104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T2NjVj9rPnxwL+IQbqxBzX5Q5tORM3JKI13xCFtl1Xo=;
  b=DrDOSp2kUyV9n3Dxq8BcZBS1ri8LYMMuizFm5cm4YcGLKfEqhII2ph5D
   SiQ+oJRFLR2DkYAKEdopqj4IwqphMkt8y0h8HX2025oM7/BvdlDanII3j
   EGlUuhb3TyGM/wdzEfe+jBJh0PpaSPWyUDz/1HDMI1hhWmqt4JCvcUyDU
   Ka9VPUEzro2qIW9rJx4SeRnhXcDPG1eF4IbvfHckDhea0k8Humua+T6GM
   xpiJslEcGgvaMUpAHI1UAaEOAeDnrJu9xoIgnl0D+RMSfQJbDxTZfJ0N5
   6ZpB2NRCvn/CNeUUcbIT7hSksV3hwyS05RfopkCbeciGBldJDH5oS2iqm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369585467"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="369585467"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 19:41:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757347004"
X-IronPort-AV: E=Sophos;i="6.03,294,1694761200"; 
   d="scan'208";a="757347004"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Nov 2023 19:41:42 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1esN-000ABl-35;
	Sat, 11 Nov 2023 03:41:39 +0000
Date: Sat, 11 Nov 2023 11:41:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2449/24081]
 kernel/tracepoint.c:662:27: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202311111145.BjnFD5IR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d8156345d8c56a2b082c1877eaee48a22c33014f
commit: e0cfc5fd8c9358c2d85fa65167794c2657f7656e [2449/24081] ANDROID: vendor_hooks: Allow multiple attachments to restricted hooks
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20231111/202311111145.BjnFD5IR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311111145.BjnFD5IR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311111145.BjnFD5IR-lkp@intel.com/

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
