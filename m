Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D345298CBC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775196; cv=none; b=OzIdLmz1hqfE9vbBcMHBRRROD60ZDlt6F6cyIGaBwbfW49ovxZmGBfs7xYMeEge+gvOET5eIdNrerqaDx4qS30G3Ss4l2T09DsMnn9QmFJz5zoKYRn9BhLw6u/z+kijP8M0lknudXasXL/TZ8cXDmqJn04ICGMk9qIZNe1dgDJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775196; c=relaxed/simple;
	bh=2vg7fRWH1aAJPYXLveKl87rr40YwkSZVt/k5rYDnJEM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gM12EBQepvRxMqaDnkzE0vbOk7NAA00jAMGA2x1IrFH7WBtyZC28+LashIywyhMhCaR/mlkD2k8C8omoL4cebyXyYTblA6tDyWPD14D1bYzVnznNoFyGLJiSt7xFD9cU54Wk9iHwl2cyIjMdE0o0cTAlesu+3+PdIgvXWK0xELU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YyugVO1r; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YyugVO1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769775194; x=1801311194;
  h=date:from:to:cc:subject:message-id;
  bh=2vg7fRWH1aAJPYXLveKl87rr40YwkSZVt/k5rYDnJEM=;
  b=YyugVO1rCOrh51unPoqhmrenYW+EkbtuS2y15PmkpLKEsc0dei/113ou
   OHx+P+tRVFTtC3OQpRFeZPAcRYJ9yLXSu21p76gdzZ61jyDe0MoImLIPu
   7D/gzbjhM48LFD3qm3FgQtAA9hug5aJFbCqGEayVFToQF+dySg7i8kCV/
   8puHxiZwUtJYIso4m5aHL7CtFQLtSb58yjV+yNwu0+RRzKcUXwtCvEAIy
   1uXY1dYZfc+GcjFrNq2U/FfbuvjCw36XtmknjpiqoLtiS5n7SaUlH7kdb
   +S+HbePsf30U288Bymj7eB2cflapep3N8pTdLxS3BVYEAKl4NJ4fNCYgs
   w==;
X-CSE-ConnectionGUID: JvBq43ZXTfWdlKWD4Ge6eg==
X-CSE-MsgGUID: XHGpQIMFRUyYwMI9U+EuAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81758115"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="81758115"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 04:13:13 -0800
X-CSE-ConnectionGUID: pU4FEAqeTX2N3cvc8mMxTg==
X-CSE-MsgGUID: bDsS6OazTcemWEpsIMUQ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="213369011"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2026 04:13:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlnN7-00000000cxU-0Db0;
	Fri, 30 Jan 2026 12:13:09 +0000
Date: Fri, 30 Jan 2026 20:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 1/5] fs/f2fs/checkpoint.c:2195:2:
 error: unterminated argument list invoking macro 'if'
Message-ID: <202601302037.v4nJzEKH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   6c41a3391b747e9a5e8c6fe63003d2a8157d2610
commit: ea581585794290038e10ac4f1343bb1f5013cc60 [1/5] f2fs: fix lock priority inversion issue
config: arc-randconfig-002-20260130 (https://download.01.org/0day-ci/archive/20260130/202601302037.v4nJzEKH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601302037.v4nJzEKH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601302037.v4nJzEKH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/f2fs/checkpoint.c: In function 'need_uplift_priority':
>> fs/f2fs/checkpoint.c:2195:2: error: unterminated argument list invoking macro 'if'
    2195 | }
         |  ^
>> fs/f2fs/checkpoint.c:2196: error: expected '(' at end of input
   fs/f2fs/checkpoint.c:95:9: note: '-Wmisleading-indentation' is disabled from this point onwards, since column-tracking was disabled due to the size of the code/headers
      95 |         if (!(sem->sbi->adjust_lock_priority & BIT(sem->name - 1))
         |         ^~
>> fs/f2fs/checkpoint.c:95:9: error: expected declaration or statement at end of input
   fs/f2fs/checkpoint.c:95:9: warning: no return statement in function returning non-void [-Wreturn-type]
   fs/f2fs/checkpoint.c: At top level:
>> fs/f2fs/checkpoint.c:93:13: warning: 'need_uplift_priority' defined but not used [-Wunused-function]
      93 | static bool need_uplift_priority(struct f2fs_rwsem *sem, bool is_write)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/if +2195 fs/f2fs/checkpoint.c

261eeb9c1585de4 Daeho Jeong 2021-01-19  2183  
261eeb9c1585de4 Daeho Jeong 2021-01-19  2184  void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi)
261eeb9c1585de4 Daeho Jeong 2021-01-19  2185  {
261eeb9c1585de4 Daeho Jeong 2021-01-19  2186  	struct ckpt_req_control *cprc = &sbi->cprc_info;
261eeb9c1585de4 Daeho Jeong 2021-01-19  2187  
261eeb9c1585de4 Daeho Jeong 2021-01-19  2188  	atomic_set(&cprc->issued_ckpt, 0);
261eeb9c1585de4 Daeho Jeong 2021-01-19  2189  	atomic_set(&cprc->total_ckpt, 0);
261eeb9c1585de4 Daeho Jeong 2021-01-19  2190  	atomic_set(&cprc->queued_ckpt, 0);
e65920661708b7c Daeho Jeong 2021-01-21  2191  	cprc->ckpt_thread_ioprio = DEFAULT_CHECKPOINT_IOPRIO;
261eeb9c1585de4 Daeho Jeong 2021-01-19  2192  	init_waitqueue_head(&cprc->ckpt_wait_queue);
261eeb9c1585de4 Daeho Jeong 2021-01-19  2193  	init_llist_head(&cprc->issue_list);
261eeb9c1585de4 Daeho Jeong 2021-01-19  2194  	spin_lock_init(&cprc->stat_lock);
261eeb9c1585de4 Daeho Jeong 2021-01-19 @2195  }

:::::: The code at line 2195 was first introduced by commit
:::::: 261eeb9c1585de4515a770b48a3c89672c08ae7f f2fs: introduce checkpoint_merge mount option

:::::: TO: Daeho Jeong <daehojeong@google.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
