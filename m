Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8B52D3A9C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 07:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761376472; cv=none; b=XY+Fq3qBSK+/fsbwFALYWPv5zS283VSMH8dPqgMSQZPndwWTrroUUr4eKTEVRZkb+hc1qtq419yAQjGa2rI9wThjD+wLxxnVDHAcGOX4gMCrl7vUmY6/lhYB6DQxe52y5Z3m8MHgPTWTJmvQCl5UfKUrKFtJnn45Qm6bKu7uSH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761376472; c=relaxed/simple;
	bh=SxA2snzsuTpvs/SyvqN4o2OiF27KX3NrJq/pjhCTSqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLXUM2TIQi071NUitesGjNTRBLJYSGj+UvHz097ysOOrcWpBK8lnR89ZTiqgF5DS25GjWE//9HB3HwuVKcFhQZTva/MMiJ/kEB07Z70ztVJifaOZ3GNzlJtj947q91iWUhxi/5AyIidNOLruQ2uJi4cltzukbCP4C+bbF/fWcZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F56TUXoF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F56TUXoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761376471; x=1792912471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SxA2snzsuTpvs/SyvqN4o2OiF27KX3NrJq/pjhCTSqw=;
  b=F56TUXoFWjzqXcoN5fQI+Tc/L8bjybFxdVYzx5XfY+1Jpg5NrwyUJP1L
   6CUCtPsK7HbXCUTgh85pQWfGTwgAvpiIlqgorhiI+m8S7ZeqoqwMeXF0U
   uXo0WeurSDwQagzx0kPIXBvBhm4JIp0vnw3biv+t9Z+VxWn9cXSyFGkFC
   tmBCj65hku6I7EQU0u7VPQjiCzh7eSASbj5m2HtoEW5cCb9wzMM3BG2RR
   DGXcuS8Gz2gQ0mj1DjtMs3ENMgDv2GiUqquxxv5aYnTMA3Ux3JSLyAY3l
   vt+MQyboK54xVbcInviCAJjWqDpTP8eU+fxPn0G3u2xIKPHw5eaUgoWDT
   w==;
X-CSE-ConnectionGUID: QM5oGX+cQHWEDZNGvOG8rw==
X-CSE-MsgGUID: cOiAGN6CTvOhpWNzAxJ7Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63245978"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="63245978"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 00:14:29 -0700
X-CSE-ConnectionGUID: KgzygAt1TWS8/xIgPGBnQA==
X-CSE-MsgGUID: qFXrV+q2SHi6Z7HzV/lfqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184968493"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2025 00:14:27 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCYTp-000FAe-0M;
	Sat, 25 Oct 2025 07:14:25 +0000
Date: Sat, 25 Oct 2025 15:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nico Pache <npache@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 173/182] mm/khugepaged.c:113:25: error: variably
 modified 'mthp_bitmap' at file scope
Message-ID: <202510251530.eJulmicR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   752c460b5865d87117095c915addcce7a68296f2
commit: 8387af7962dd62a2a2cdb741e702b476da440ff0 [173/182] khugepaged: introduce mTHP collapse support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20251025/202510251530.eJulmicR-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251530.eJulmicR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251530.eJulmicR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/powerpc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:382,
                    from include/asm-generic/bug.h:5,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from mm/khugepaged.c:4:
>> mm/khugepaged.c:113:25: error: variably modified 'mthp_bitmap' at file scope
     113 |          DECLARE_BITMAP(mthp_bitmap, HPAGE_PMD_NR);
         |                         ^~~~~~~~~~~
   include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMAP'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                       ^~~~
>> mm/khugepaged.c:114:25: error: variably modified 'mthp_bitmap_mask' at file scope
     114 |          DECLARE_BITMAP(mthp_bitmap_mask, HPAGE_PMD_NR);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/types.h:11:23: note: in definition of macro 'DECLARE_BITMAP'
      11 |         unsigned long name[BITS_TO_LONGS(bits)]
         |                       ^~~~


vim +/mthp_bitmap +113 mm/khugepaged.c

   100	
   101	struct collapse_control {
   102		bool is_khugepaged;
   103	
   104		/* Num pages scanned per node */
   105		u32 node_load[MAX_NUMNODES];
   106	
   107		/* nodemask for allocation fallback */
   108		nodemask_t alloc_nmask;
   109	
   110		/*
   111		 * bitmap used to collapse mTHP sizes.
   112		 */
 > 113		 DECLARE_BITMAP(mthp_bitmap, HPAGE_PMD_NR);
 > 114		 DECLARE_BITMAP(mthp_bitmap_mask, HPAGE_PMD_NR);
   115		struct scan_bit_state mthp_bitmap_stack[MAX_MTHP_BITMAP_STACK];
   116	};
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
