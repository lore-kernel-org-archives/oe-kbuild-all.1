Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1954012E48
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 02:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725848181; cv=none; b=gSmSVfpr/0M3CRtCTfEil/oHkF2JdUtQDONL5dgXzAYO9n65yYX6yJwT0pV4CthTf2HEiR34uT5XuXpAQf7qxfyoxWzQ9oHrqZ0vgl+x+bn7S8VAZIWxFPRZFpdzNQSc+P96OJlcNfIYjT2W2yvTJXl7YIZJW8do6SJkLlC1c+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725848181; c=relaxed/simple;
	bh=MKToUzK26xsURUeQPiFQ16vpnR1QI9sgL+spWZXTxug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c//TqGy0fQEDOHn9nDms5JjqJzkjRDsIoo8c3SrmEWBBzs8ICEnOKUOOZOZYfCZ2THhH8N46mf/jMUlfeGTvboFVzhAOtH78sD+vIk4x/IhKlwnrzIIRkzfUQ4GzKCq4QNi8urObFaOFxcnVaEUlb8a4adyecqMiZvaGZs6Nlq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+1Rju8A; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+1Rju8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725848179; x=1757384179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MKToUzK26xsURUeQPiFQ16vpnR1QI9sgL+spWZXTxug=;
  b=P+1Rju8AcRgqH/CIuIEGn51lH65oGc8E9gi6Kar4QqYFTmpPNPbAoe3y
   5cBQkNZea3ATPwQZYEHtE7Y6fk3knUaGz1Ovybv0D+sQRaAB1kJnxnr2q
   /vX6KPNBIoZZkgCEf5gBlskTrhsQhbUst9n2wUYM45jvM0TrU7rgnaruE
   CICqDvQn5UMkm/IcQeIRjKSeehSxEUQRswJCncKIxaP2nMp8O3rWOXuz/
   Xruhr1HD5EiBHyR3t6bkq8FkWTeYtlemU6LlpLQtAddgFuEX6iUOhPx1m
   4CUYtOR758MRDl95R6yGC8hCko2pB2dPRY12148BT3JVND+JaMJRA/enJ
   Q==;
X-CSE-ConnectionGUID: ulrDGU31Sb+mXP+i0waxZQ==
X-CSE-MsgGUID: 9Oil+zJVQYSRCFio1jJMRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24632753"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="24632753"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 19:16:18 -0700
X-CSE-ConnectionGUID: IFJ197q2R7aVwSegKvB4qw==
X-CSE-MsgGUID: pfkViTe/RJOkfBtVyLKUSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66506634"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2024 19:16:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snTwt-000ECl-1a;
	Mon, 09 Sep 2024 02:16:15 +0000
Date: Mon, 9 Sep 2024 10:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 4121/30000] fs/xfs/xfs_icache.c:52
 xfs_icwalk_tag() warn: unsigned 'goal' is never less than zero.
Message-ID: <202409091024.XP4R6muy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   3e6d44ea60eb8609ba59273c12276e3236cd76b2
commit: b12b4a14e6dc13b75697ebc80f513fedd068345e [4121/30000] xfs: remove xfs_dqrele_all_inodes
config: x86_64-randconfig-161-20240906 (https://download.01.org/0day-ci/archive/20240909/202409091024.XP4R6muy-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409091024.XP4R6muy-lkp@intel.com/

New smatch warnings:
fs/xfs/xfs_icache.c:52 xfs_icwalk_tag() warn: unsigned 'goal' is never less than zero.

Old smatch warnings:
fs/xfs/xfs_icache.c:534 xfs_iget_cache_hit() warn: missing unwind goto?

vim +/goal +52 fs/xfs/xfs_icache.c

656d89e710ffc0 Darrick J. Wong 2022-01-07  47  
656d89e710ffc0 Darrick J. Wong 2022-01-07  48  /* Compute the inode radix tree tag for this goal. */
656d89e710ffc0 Darrick J. Wong 2022-01-07  49  static inline unsigned int
656d89e710ffc0 Darrick J. Wong 2022-01-07  50  xfs_icwalk_tag(enum xfs_icwalk_goal goal)
656d89e710ffc0 Darrick J. Wong 2022-01-07  51  {
656d89e710ffc0 Darrick J. Wong 2022-01-07 @52  	return goal < 0 ? XFS_ICWALK_NULL_TAG : goal;
656d89e710ffc0 Darrick J. Wong 2022-01-07  53  }
656d89e710ffc0 Darrick J. Wong 2022-01-07  54  

:::::: The code at line 52 was first introduced by commit
:::::: 656d89e710ffc01bc169a476208c84a0048cb554 xfs: pass the goal of the incore inode walk to xfs_inode_walk()

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Zheng Zengkai <zhengzengkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
