Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F727EFE3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 01:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772934996; cv=none; b=LGGsSZK5M8DTcqgrsbfNwljWrGi0Yms1mLzndY+DHMh2qPBJkhVRTlq4M2jn7iNx1OWY8r1dVCB/dzEOfAsxzLTwzP3W3wNYMHS3gIdbGFpYLydXCc+zhzQG0Y5oTEAxZvvWR4HHHyiqKDF9BfNvjhJxdiLDzBqjjZpIunhaR3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772934996; c=relaxed/simple;
	bh=+x1+dHBPtS/ekzgmk5vZVoDbkJoz4soQ57KrmGE/3f0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S9NpxaZ8MTFh+LSn38q5U0SHc1gMGizJmktDGpcEeL5fZZ6hTZMyaZWi6gdGU2QcOx6Yj7y5qqep/AiDJkt4xb3bsZIEVGUQFfx1hCvVpXy50Jb8l3hrnLbDFa9tylBD5HUzu3sP0u/BGgHd2inDqsWA8LYF8p29UW3dT1G88VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVRQVgcl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVRQVgcl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772934995; x=1804470995;
  h=date:from:to:cc:subject:message-id;
  bh=+x1+dHBPtS/ekzgmk5vZVoDbkJoz4soQ57KrmGE/3f0=;
  b=gVRQVgclQEaxJhe1NHalim3jpFZZQNK+JbkxH4XyRm22fKpI86usY2o5
   icgy+JfETthCiY6k1syb5eeary0xD1d9E+dvOZlYAvTQ2z0NHDG1eYVSY
   8s7itL/2ZulMKan0a0IDbajI1LpnVFFsmEio256Nwdfqlz9+Mpah9osYb
   gRBtKO6qEqE9YK17fODivphkSckcYncNv6b9R73wm4lY569dqU1Sj2qcX
   yAbFpmsbKMby5VlEqatPFStjRLh6yEqkQMrmvoH9f1SKJBkUbhrkKOiqS
   scXstDKkq5RF/qo71Gr+e6JJ43sEiAEGwbTtuzLE9yY0ylNblR2Xd+7Z9
   Q==;
X-CSE-ConnectionGUID: mvUBSxSoQ2Onxf6B9ir4lA==
X-CSE-MsgGUID: OdakQkU+QlGSr2NkxeNWXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74191313"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="74191313"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 17:56:35 -0800
X-CSE-ConnectionGUID: wpIGpzBITvCD+SIwqGoWOw==
X-CSE-MsgGUID: 0rXwt3uyT4mcAqjNO9enxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="217058589"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Mar 2026 17:56:33 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz3Nf-000000002or-0xWu;
	Sun, 08 Mar 2026 01:56:31 +0000
Date: Sun, 08 Mar 2026 09:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 23/27]
 drivers/char/nvram.c:56:21: warning: unused variable 'nvram_mutex'
Message-ID: <202603080936.1DHaCVZT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   7377229500eab6d62cc816dc95d393e5f4152293
commit: bfb9899afbf6d640773807e13a2ea01a483ae2b0 [23/27] locking/mutex: Remove the list_head from struct mutex
config: powerpc64-randconfig-r071-20260308 (https://download.01.org/0day-ci/archive/20260308/202603080936.1DHaCVZT-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080936.1DHaCVZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080936.1DHaCVZT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/nvram.c:56:21: warning: unused variable 'nvram_mutex' [-Wunused-variable]
   static DEFINE_MUTEX(nvram_mutex);
                       ^
   1 warning generated.


vim +/nvram_mutex +56 drivers/char/nvram.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  55  
613655fa39ff69 Arnd Bergmann  2010-06-02 @56  static DEFINE_MUTEX(nvram_mutex);
^1da177e4c3f41 Linus Torvalds 2005-04-16  57  static DEFINE_SPINLOCK(nvram_state_lock);
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  static int nvram_open_cnt;	/* #times opened */
^1da177e4c3f41 Linus Torvalds 2005-04-16  59  static int nvram_open_mode;	/* special open modes */
d5bbb5021ce8d9 Finn Thain     2019-01-15  60  static ssize_t nvram_size;
^1da177e4c3f41 Linus Torvalds 2005-04-16  61  #define NVRAM_WRITE		1 /* opened for writing (exclusive) */
^1da177e4c3f41 Linus Torvalds 2005-04-16  62  #define NVRAM_EXCL		2 /* opened with O_EXCL */
^1da177e4c3f41 Linus Torvalds 2005-04-16  63  

:::::: The code at line 56 was first introduced by commit
:::::: 613655fa39ff6957754fa8ceb8559980920eb8ee drivers: autoconvert trivial BKL users to private mutex

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
