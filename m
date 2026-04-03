Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184F8236A73
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205780; cv=none; b=KdQlOufI5OeGzUbq0zDsLWE3xcXYqWOZJqvp9fuWRYnzmEDMJg2sDcM+1lf6WSM0axnJnIa/3uCfr4bB5N6myJaSI3Z1722c/mQZRcY3a79iVd6q2crIjfyTrIjAOk8mMXwpEP1U+mvmWjx+C/IO3KTHiliqynpiY5sFlL+lz10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205780; c=relaxed/simple;
	bh=CLoU3k9g2f56NvG8vLJpsRda9ezDmJ+55UL+YBlnkx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HcKLh64YKwxkFA6lHZmCeOKmxot1Bhvfcyf6ws8rmYqUknFkV/m67vPa9/q8nqmgAx/RcBGzjFTf7nIU7shBbAIRhJs3oe7cf+HSa0I+vZhYdDP1Pqo2SQKvcbeLGNSS481NzfJEYRzM4ObqROpixDodouCsmeHdqwkmj1N2wko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZS1dJ7y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZS1dJ7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205779; x=1806741779;
  h=date:from:to:cc:subject:message-id;
  bh=CLoU3k9g2f56NvG8vLJpsRda9ezDmJ+55UL+YBlnkx8=;
  b=AZS1dJ7yJVasoEmScfONrrIXruutoXVS9yDPr/Vi2bGIEb9tBuEUxiaS
   XIH2vv9TuHwXd/ddirp7OzQZ4udZpQ/7lKtk2pRmTOisQ2G9GakcEuZIB
   f4szLI2lDs8YQxlWvwtbCyDgXYL2FwN0qYyCoI71OvuhrLsgVHt+FzR/N
   NFAruGWmWIb2P4YYd77hAPVutEbFKAsgMRAAovNei1jC3onI7YFTdCIr8
   BcF3r8qRSrm9aXKHf2ryZYh4VthuKNeNsL7SJblvEVg0/k/SXi3qI8C6J
   imS3V903xtp8WwWaX5DwWKploKUQB5jH+haNIdgAZzPvDqpxQ5Eju+En5
   g==;
X-CSE-ConnectionGUID: Ua5aD1zRTm6g/OluzqW3+Q==
X-CSE-MsgGUID: tiwxPlQ6STKBELA1PhCuTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="75311886"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="75311886"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:42:58 -0700
X-CSE-ConnectionGUID: eGmkyxUxTsewOgD4gFi0vQ==
X-CSE-MsgGUID: O5sVoPIoSvyCTU/eq0QHCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="250286592"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Apr 2026 01:42:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a7D-0000000013V-0B6O;
	Fri, 03 Apr 2026 08:42:55 +0000
Date: Fri, 03 Apr 2026 16:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 28/28]
 mm/vmscan.c:997:15: warning: no previous prototype for 'shrink_slab'
Message-ID: <202604022306.IagpbnLU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi huangshaobo1,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   a106900ad13546acde0a828d15c9e6513e6b5f62
commit: 09ab235661116880b7ea9b4deb705802f2c19ab4 [28/28] ANDROID: vendor_hooks: export shrink_slab
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260402/202604022306.IagpbnLU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604022306.IagpbnLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604022306.IagpbnLU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:997:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     997 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~


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
