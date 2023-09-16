Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7888823DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 03:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694836271; x=1726372271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3y4+DZUSSQnijcC3XaDZOvmUTD1nUdLyop9AJ1SxPs=;
  b=a6LZgD3yQ13wERbh4w8wyd//RGAX57gpJqxwevViHPH0HxLd5OvTvBqx
   IwuOD9H/gMecpV4B5NXprLpkRIUFK5fr/4fvL2F0oFYPCFmwqwMWIzXHa
   pOITRoxk/Gd6y6hrmLk1fXEbkDlQMPyRUsVXWgoLP5ojMiDPFJaS3Rp6A
   31WLDYuRQDSSSbBf6WitKIilZeiDkWbNYbApX42fN9RVYPU/uZN2qnElH
   OkFQl7Pzjo9Trelt18sk5vQNouxPrNFrAew+zqg6Q1cczQvH73o/Vk/YT
   MsKeuU+eHady9j1Iak3tq9DkU58uuw3Lk+3Jewp8/iPWtU4obBGHwDgdU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465742608"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="465742608"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 20:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745211266"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="745211266"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Sep 2023 20:51:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhMKo-0003oa-2k;
	Sat, 16 Sep 2023 03:51:06 +0000
Date: Sat, 16 Sep 2023 11:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2449/23345]
 kernel/tracepoint.c:662:27: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202309161129.6PvkH1Ja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f9a1230327dc4d4a5a2b9e519e7bbe4289f660ad
commit: e0cfc5fd8c9358c2d85fa65167794c2657f7656e [2449/23345] ANDROID: vendor_hooks: Allow multiple attachments to restricted hooks
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230916/202309161129.6PvkH1Ja-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161129.6PvkH1Ja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161129.6PvkH1Ja-lkp@intel.com/

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
