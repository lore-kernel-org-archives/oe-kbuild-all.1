Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A0DC131
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687167382; x=1718703382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nRHBCKIrnylxPy/Jpsw3Cgqk86DTrAikfOve6iX1hfg=;
  b=LVyyYzVMfq2+w7PFuWv2+nSHfgnSYdlsVx6CjenPgEq04lZwGN7k0RKO
   9+3f0+R0cOrtSkQGhQP/8eMXAJq7hsC6STb0gfv27cnjdpZw/8TaOu5Js
   xFAQaigy0pj6CIUcSMPIdEDcKEvDtA+o+xcF+Ad+4ZQGtd+IUDsyHzzSV
   fh6nVzbYiUyNXT+Y0ladIt2DMG1dAb69e9Ic5uRjSTSnL4GYrfT1eHc4Q
   svS7VL1QeSp8xsjtMlZUy5TE9APAdgkn8YbytELaeH5I2NfpP36moNlkz
   k5QNew0UBuFqYyBlHHoo+krhdeI4u4ltf12PKqQWaY3CaE4Bh6uq23hmK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="423253523"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="423253523"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 02:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="713608140"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="713608140"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jun 2023 02:36:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBBJ5-0004aG-2q;
	Mon, 19 Jun 2023 09:36:19 +0000
Date: Mon, 19 Jun 2023 17:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 7325/27674]
 kernel/tracepoint.c:683:27: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202306191708.lhPUtNKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   31e1367ff78eb68e54a2025e9c6601e3fa6c6312
commit: cc6eed90a467a413b9c62fdd76e8f06347266a88 [7325/27674] ANDROID: vendor_hooks: Allow multiple attachments to restricted hooks
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230619/202306191708.lhPUtNKL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191708.lhPUtNKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191708.lhPUtNKL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/tracepoint.c:683:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func [noderef] __rcu *funcs @@     got void * @@
   kernel/tracepoint.c:683:27: sparse:     expected struct tracepoint_func [noderef] __rcu *funcs
   kernel/tracepoint.c:683:27: sparse:     got void *
>> kernel/tracepoint.c:692:25: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/tracepoint.c:714:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct tracepoint_func *tp_funcs @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   kernel/tracepoint.c:714:38: sparse:     expected struct tracepoint_func *tp_funcs
   kernel/tracepoint.c:714:38: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> kernel/tracepoint.c:689:31: sparse: sparse: dereference of noderef expression
   kernel/tracepoint.c:691:42: sparse: sparse: dereference of noderef expression

vim +683 kernel/tracepoint.c

   675	
   676	#define ANDROID_RVH_NR_PROBES_MAX	2
   677	static int rvh_func_add(struct tracepoint *tp, struct tracepoint_func *func)
   678	{
   679		int i;
   680	
   681		if (!static_key_enabled(&tp->key)) {
   682			/* '+ 1' for the last NULL element */
 > 683			tp->funcs = rvh_zalloc_funcs(ANDROID_RVH_NR_PROBES_MAX + 1);
   684			if (!tp->funcs)
   685				return ENOMEM;
   686		}
   687	
   688		for (i = 0; i < ANDROID_RVH_NR_PROBES_MAX; i++) {
 > 689			if (!tp->funcs[i].func) {
   690				if (!static_key_enabled(&tp->key))
   691					tp->funcs[i].data = func->data;
 > 692				WRITE_ONCE(tp->funcs[i].func, func->func);
   693	
   694				return 0;
   695			}
   696		}
   697	
   698		return -EBUSY;
   699	}
   700	
   701	static int android_rvh_add_func(struct tracepoint *tp, struct tracepoint_func *func)
   702	{
   703		int ret;
   704	
   705		if (tp->regfunc && !static_key_enabled(&tp->key)) {
   706			ret = tp->regfunc();
   707			if (ret < 0)
   708				return ret;
   709		}
   710	
   711		ret = rvh_func_add(tp, func);
   712		if (ret)
   713			return ret;
 > 714		tracepoint_update_call(tp, tp->funcs, false);
   715		static_key_enable(&tp->key);
   716	
   717		return 0;
   718	}
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
