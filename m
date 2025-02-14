Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527A224501F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528037; cv=none; b=EkkGOfjjhU4/HD6DYnaBKtIn7QKiQeFQRztF9UmE70eZdpyaOF6abyeTeSTA4b5aaWW2tJ18dMi5NCS0SY7p4lAeRywv+z68S4yj4YXCTwMTXR8a6KZzHib9lz+j+qapFsH3r+sMByQRdmkeLZxFXTo3zKaoD2wVXHa1bUXotv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528037; c=relaxed/simple;
	bh=mF6HRRtkuRQNqSnmnCd35xOyirrG2z58LaSLjXBoJLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SDJbuQfe3VnPeQaG//AgR5WsycSAix1hY0bY8icXBJrE0bOUAlyPSoBeXYlj/mkyl9hL2Wjr6wiMC+SNiOZVV5yS3tuKN17y69HFKrSoTzMZAtlRcAWBxWB+hUub/Usdpq48wi9ptk/EBXvgZKLwKXyAicPYsWXnTRVmkaScMGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X4EQ+ja9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X4EQ+ja9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739528035; x=1771064035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mF6HRRtkuRQNqSnmnCd35xOyirrG2z58LaSLjXBoJLI=;
  b=X4EQ+ja9mmvBDYuwbwvMFR11+xdnZb5U24SkxER3nBB91mwpBuDOtlCA
   u1CNpKM89aWgIuOuR2/UCVLHNHu7+yioonURg22QXwT+c1hTzppiBO4Jt
   dDjtp8yOnYBqJqU5jgBBJjVEWAsU9yTIZ2KTCBYABFHIT8FGljH+E771S
   jT3Jg8mhh7sUnYQaTjBc1wKWhiVtxkJqv3iJxyWcxmh2xjHSa1BlYdUJ+
   q2YuxYwS6c0JoqVwSGhiLj+bcgdXVsVuRS3o1xEQroacCyZ8wsyYglveZ
   o8YC6Dy1wif/yGMc0SS/YY5V/CP13YqbH/BtPqn1CTdWCeHTgf2Xed3PD
   A==;
X-CSE-ConnectionGUID: VCcgpGwBRCuQmt/LPsosEA==
X-CSE-MsgGUID: qJF4PXmeQ9ubhF5HXA3/iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40143790"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="40143790"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 02:13:55 -0800
X-CSE-ConnectionGUID: fwDb2pGDQJi3kCw9KwbZSw==
X-CSE-MsgGUID: ZrCGDHHmQjOIWqPB9aucBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113278640"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2025 02:13:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tishj-0019ND-0x;
	Fri, 14 Feb 2025 10:13:51 +0000
Date: Fri, 14 Feb 2025 18:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 249/249] mm/vmscan.c:997:15:
 warning: no previous prototype for 'shrink_slab'
Message-ID: <202502141827.q7PE7oFI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d2ae202da688a9a795c238142e01da921b3e4b81
commit: 09ab235661116880b7ea9b4deb705802f2c19ab4 [249/249] ANDROID: vendor_hooks: export shrink_slab
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250214/202502141827.q7PE7oFI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141827.q7PE7oFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141827.q7PE7oFI-lkp@intel.com/

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
