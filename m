Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06F226D1D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429775; cv=none; b=czoIqr3yXKcNOmQscr4qnoG0q2J5IUwJ0HdIVN5VBwQj4kMFdj/1GsX0sKQex/7NuFEspnuHNIFGYbCdT6ZIMPIGxeQG+7MRmkeL+N8959Hd8UpIQuFvxGc2XZFwiEyZ28Ya3dw8T+pToMkLMbN7Kn8dddTjDYHxp4SjxjcIRQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429775; c=relaxed/simple;
	bh=3RpTfwH1ZwKT1av8fQDOamNuW+OjRW5jLJAv6UfD/JY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXCkFXvbzw58dbJwJgbRzg8iE5YJVJDO5bo1Qp15iswWQ5EH3Vgf3DKIU7ioQsW6LKtC8pBml+afcHv8gbLUrrecAkh6ITFnpfR3uPLE68VZ6iDjjr0LxQCiutnVFRS5K/735F1D51luoGfE6sMng5+v79DeI6FtQ//tRnNqtyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=meVqLXOS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="meVqLXOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757429773; x=1788965773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3RpTfwH1ZwKT1av8fQDOamNuW+OjRW5jLJAv6UfD/JY=;
  b=meVqLXOSM3ZgVHW6EaHqfl5mhOreKPbpkcBFydYw7zmVusrk0tr6FtXO
   8psA1pkeebnyUsxn/yAmuciq3ceRTTfkk4UeRCLseAC60zrjG1pZLNb3r
   OBGpiRvCvA3Luzj7+2mZI6x1QaB5pjLbcZDJDBir1j99SCHy7a+LGesLg
   PCBljyUDqGJEJs82iEkzWX/3BuQPf87ct5sZy16cxx1eV6GUov5+T1QAw
   f7EzSFK3OtRvhO29Z6FbPeCuR7sJLDHzbfS/JM9W3pJtC8z6Wc2ZS39GN
   +aWe/ALf2BIvQPC6thNtPxMBszPoALj16FsZD1mwvz0ztWtTe40cSHF04
   A==;
X-CSE-ConnectionGUID: VBqUk/oNQp6yoJay47BRbw==
X-CSE-MsgGUID: kdyGCMirQfmBo86Dz2qoeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59780626"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59780626"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 07:56:13 -0700
X-CSE-ConnectionGUID: 62T5jE4PRh2kWBTNRO+bJg==
X-CSE-MsgGUID: 3GuGYRrbT8+EQEqSa2WxLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173228443"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Sep 2025 07:56:12 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvzlR-0004xV-2Q;
	Tue, 09 Sep 2025 14:56:09 +0000
Date: Tue, 9 Sep 2025 22:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/3] mm/vmscan.c:997:15: warning: no
 previous prototype for function 'shrink_slab'
Message-ID: <202509092222.OY16bfJi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi huangshaobo1,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   8cde8d25c90b1eba83a82ef30f7fab4a2b2bf68c
commit: 09ab235661116880b7ea9b4deb705802f2c19ab4 [0/3] ANDROID: vendor_hooks: export shrink_slab
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250909/202509092222.OY16bfJi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092222.OY16bfJi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509092222.OY16bfJi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:997:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
     997 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^
   mm/vmscan.c:997:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     997 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         | ^
         | static 
   1 warning generated.


vim +/shrink_slab +997 mm/vmscan.c

   976	
   977	/**
   978	 * shrink_slab - shrink slab caches
   979	 * @gfp_mask: allocation context
   980	 * @nid: node whose slab caches to target
   981	 * @memcg: memory cgroup whose slab caches to target
   982	 * @priority: the reclaim priority
   983	 *
   984	 * Call the shrink functions to age shrinkable caches.
   985	 *
   986	 * @nid is passed along to shrinkers with SHRINKER_NUMA_AWARE set,
   987	 * unaware shrinkers will receive a node id of 0 instead.
   988	 *
   989	 * @memcg specifies the memory cgroup to target. Unaware shrinkers
   990	 * are called only if it is the root cgroup.
   991	 *
   992	 * @priority is sc->priority, we take the number of objects and >> by priority
   993	 * in order to get the scan target.
   994	 *
   995	 * Returns the number of reclaimed slab objects.
   996	 */
 > 997	unsigned long shrink_slab(gfp_t gfp_mask, int nid,
   998					 struct mem_cgroup *memcg,
   999					 int priority)
  1000	{
  1001		unsigned long ret, freed = 0;
  1002		struct shrinker *shrinker;
  1003		bool bypass = false;
  1004	
  1005		trace_android_vh_shrink_slab_bypass(gfp_mask, nid, memcg, priority, &bypass);
  1006		if (bypass)
  1007			return 0;
  1008	
  1009		/*
  1010		 * The root memcg might be allocated even though memcg is disabled
  1011		 * via "cgroup_disable=memory" boot parameter.  This could make
  1012		 * mem_cgroup_is_root() return false, then just run memcg slab
  1013		 * shrink, but skip global shrink.  This may result in premature
  1014		 * oom.
  1015		 */
  1016		if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
  1017			return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
  1018	
  1019		if (!down_read_trylock(&shrinker_rwsem))
  1020			goto out;
  1021	
  1022		list_for_each_entry(shrinker, &shrinker_list, list) {
  1023			struct shrink_control sc = {
  1024				.gfp_mask = gfp_mask,
  1025				.nid = nid,
  1026				.memcg = memcg,
  1027			};
  1028	
  1029			ret = do_shrink_slab(&sc, shrinker, priority);
  1030			if (ret == SHRINK_EMPTY)
  1031				ret = 0;
  1032			freed += ret;
  1033			/*
  1034			 * Bail out if someone want to register a new shrinker to
  1035			 * prevent the registration from being stalled for long periods
  1036			 * by parallel ongoing shrinking.
  1037			 */
  1038			if (rwsem_is_contended(&shrinker_rwsem)) {
  1039				freed = freed ? : 1;
  1040				break;
  1041			}
  1042		}
  1043	
  1044		up_read(&shrinker_rwsem);
  1045	out:
  1046		cond_resched();
  1047		return freed;
  1048	}
  1049	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
