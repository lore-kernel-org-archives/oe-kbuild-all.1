Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BBFAD4F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 11:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlEE3Xgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699182173; x=1730718173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l31qdzbjQMxKYeOuI5pACXx4tKvJRALccoweRZYiZVc=;
  b=hlEE3XgmsPTQ/KdHI/QjobD7rahcHMt1F1AsFZOWCVnnXwL0xfJ8im9l
   3pSoBkYU1Vc+rJcF6jJBYEboAIa+jsKF/Iy6ftbY/sX8Yw0yDwLeK2UC3
   N3+c4iYlVweFMJBBwUInjtV/ijOLJA1LDB657XyGqeOq1hik6VBaYSSsx
   qIO6lwAR2FNSX9ksTx67CGEJtrkZVPv/7RopFEWZA/indZPum3tPGPcGJ
   669VO7+5YYpWY51e5Zq2wDrPFMorY1tft6oNwFKuwExpP68UU1oqT8i1W
   j85tTHeOJgeqYvqYo4BIyjQG4JOyOBdTJbxb19GEWruUS//67tJKStZRD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="388959767"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="388959767"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 03:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10183747"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2023 03:02:51 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzau1-0005LL-0e;
	Sun, 05 Nov 2023 11:02:49 +0000
Date: Sun, 5 Nov 2023 19:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1] mm/oom_kill.c:729: warning:
 Function parameter or member 'tsk' not described in '__mark_oom_victim'
Message-ID: <202311051848.hG1iySMF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   85ccc4a25c6007d2ac4284565b1864f9abd44808
commit: 561fe20b66d9e2f4b1f3ac725db0cf435983e2b8 [1/1] ANDROID: signal: Add vendor hook for memory reaping
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231105/202311051848.hG1iySMF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051848.hG1iySMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051848.hG1iySMF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:729: warning: Function parameter or member 'tsk' not described in '__mark_oom_victim'
   mm/oom_kill.c:729: warning: expecting prototype for tsk(). Prototype was for __mark_oom_victim() instead


vim +729 mm/oom_kill.c

   723	
   724	/**
   725	 * tsk->mm has to be non NULL and caller has to guarantee it is stable (either
   726	 * under task_lock or operate on the current).
   727	 */
   728	static void __mark_oom_victim(struct task_struct *tsk)
 > 729	{
   730		struct mm_struct *mm = tsk->mm;
   731	
   732		if (!cmpxchg(&tsk->signal->oom_mm, NULL, mm)) {
   733			mmgrab(tsk->signal->oom_mm);
   734			set_bit(MMF_OOM_VICTIM, &mm->flags);
   735		}
   736	}
   737	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
