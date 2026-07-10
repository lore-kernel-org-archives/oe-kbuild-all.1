Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C9B1F4C8E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 05:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783662789; cv=none; b=fUiDOsfWv/tFL0FaD65eITZCDUCOdzj3sc2KVJ5ftmZYrSE442K2KsSU3tSwbN8IwzLVYXGnpUkjM3EDzewORoMXu/C+wYzX8t1sih55JXcEnbd6oIyrPiOXWeDWFj+3jKBpRbVwVe6k2HNu/oMxZ9E0q6b6qu8PtMsireqoLHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783662789; c=relaxed/simple;
	bh=ImScqPmTO3TSZqqnaXGgakQTYrKssLZDlloRkziqQeo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O8YRiLJabgJFfQ/r5dx2xm9JiaaWVIYI2tIw5syS/6t5uiciRswIGKJ/Ex/8dkxEN/kfH/ZQdMxKTX9BBmODOxVFBwfDx8MDf/FjtSncTPjkPKvmXe0XsSXTs4KHyg1pVzU8qcMtWTHM+CPpqbttYvqxkV4Ff6+eQk4aAMopAGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvNlK3V5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvNlK3V5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783662787; x=1815198787;
  h=date:from:to:cc:subject:message-id;
  bh=ImScqPmTO3TSZqqnaXGgakQTYrKssLZDlloRkziqQeo=;
  b=BvNlK3V58bgePCp0Lqlt1YiIXpq5jPU4TUIiqFyhhMgPYMmPUkgwyxBB
   5ydozkaxwCY06fc8Ot9rNZYmC/4hkbGKBjKLSTPpC1KpV/emXAF4v61+9
   ALCEtU8DHV1lHweop0xpI6ttStZxmFWz/YMq90XhNa96X2eD4HU4A+ebc
   V/psccOQrZPtB0PqC/svl7efqT00NJlmHgKPJxagetAKBECop8ig906/K
   XZs4ko9/l+3dSLIWJdBbPm5ToJ7jgcanOHaOW1fZ1vdsv5/Je3Sw/CtL2
   UCMxfbFi9xzsFXPCTya4Iw3AUp+Im230Q3AMwjSKu/olwJd8y3T+pZJML
   g==;
X-CSE-ConnectionGUID: pznLrjkVTGuKQKZXMlvmJA==
X-CSE-MsgGUID: CLwxtPYIQAeHt4/pBBlY/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84216855"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84216855"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 22:53:07 -0700
X-CSE-ConnectionGUID: UElf6gDARQeqzPIwfNjPtA==
X-CSE-MsgGUID: NJBkLHaoRrqpCxCjoLXRIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254304470"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2026 22:53:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wi4AY-00000000IXf-1oms;
	Fri, 10 Jul 2026 05:53:02 +0000
Date: Fri, 10 Jul 2026 13:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 13/19] mm/slub.c:2098:1: error:
 expected identifier or '(' before '{' token
Message-ID: <202607101305.lJoXn72D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vlastimil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git objext_split
head:   c4923e2e532497a14255f7a0ff21e2a0c2b79445
commit: 9028e3e3942a1f9fcdfe06b498814fae5e3171b0 [13/19] mm/slab: abstract slabobj_ext.ref access
config: nios2-randconfig-001-20260710 (https://download.01.org/0day-ci/archive/20260710/202607101305.lJoXn72D-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607101305.lJoXn72D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607101305.lJoXn72D-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/slub.c:2098:1: error: expected identifier or '(' before '{' token
    {
    ^
>> mm/slub.c:2096:20: warning: 'handle_failed_objexts_alloc' used but never defined
    static inline void handle_failed_objexts_alloc(struct slab *slab,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2098 mm/slub.c

0bedcc66d2a43a Vlastimil Babka        2023-10-03  2095  
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08 @2096) static inline void handle_failed_objexts_alloc(struct slab *slab,
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2097) 		unsigned long obj_exts, struct slabobj_ext *vec);
0bedcc66d2a43a Vlastimil Babka        2023-10-03 @2098  {
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2099) 	vec = slab_obj_ext_shift_codetag_ref(slab, vec);
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2100) 
0bedcc66d2a43a Vlastimil Babka        2023-10-03  2101  	/*
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2102  	 * If vector previously failed to allocate then we have live
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2103  	 * objects with no tag reference. Mark all references in this
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2104  	 * vector as empty to avoid warnings later on.
0bedcc66d2a43a Vlastimil Babka        2023-10-03  2105  	 */
7612833192d56a Alexei Starovoitov     2025-09-08  2106  	if (obj_exts == OBJEXTS_ALLOC_FAIL) {
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2107  		unsigned int i;
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2108  
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2109) 		for (i = 0; i < slab->objects; i++)
9028e3e3942a1f Vlastimil Babka (SUSE  2026-07-08  2110) 			set_codetag_empty(&vec[i]._ctref);
0bedcc66d2a43a Vlastimil Babka        2023-10-03  2111  	}
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2112  }
09c46563ff6d5f Suren Baghdasaryan     2024-03-21  2113  

:::::: The code at line 2098 was first introduced by commit
:::::: 0bedcc66d2a43a50ab660273842f4737a293dd8a mm/slab: move memcg related functions from slab.h to slub.c

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
