Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7406415B3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 06:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1ixMoYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702792832; x=1734328832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyP79vRQzMf9ATCo7/NQU+RLUgXq8NbRWIhnkxYO9C8=;
  b=O1ixMoYSc7/lfnO0Y5hqTEYFKPpOmJC25K9IFwyfxXbkBfU7dKBvDge/
   9Yjn4FAmfv3lvcFBje9Re62P/zcwe0IlJ2nPmzPt8FVtwXYvxEqWf3Lin
   nfqhQBjZ2YgfC3dm8hUy8PsnEuVyYo18zfPi1JGQAGtVXv3SeG9KXebiw
   el+l3hksEXI63Z8LV/JIg+9oeTXV8mZO7qtxoUU1C0WJ0F2xAlUmGweBW
   cEP0qVTI6hKgq8wzERfNg90awhiBpp6rq6Eqbhs8UVZ750/6j5lJmNImq
   +vr8Lpi8adkhNje7gBxO/HUWlv9TYCA5dW0rDm6Id/KFooTTtiAvolwKb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="8825996"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="8825996"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 22:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="1022397177"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="1022397177"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 16 Dec 2023 22:00:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEkCR-0002ii-2Q;
	Sun, 17 Dec 2023 06:00:27 +0000
Date: Sun, 17 Dec 2023 14:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:report-refcounts 474/534] ld.lld: error: undefined
 symbol: xfs_rtrefcount_update_defer_type
Message-ID: <202312171345.CGXtUNeq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   9b53da520c1def16c6d9730337bb2c3abb2073c8
commit: f7717f0b75f2dd8c4213e883ae669f5a85633a85 [474/534] xfs: add a realtime flag to the refcount update log redo items
config: i386-randconfig-014-20231216 (https://download.01.org/0day-ci/archive/20231217/202312171345.CGXtUNeq-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171345.CGXtUNeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171345.CGXtUNeq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_rtrefcount_update_defer_type
   >>> referenced by div64.h:0 (arch/x86/include/asm/div64.h:0)
   >>>               fs/xfs/xfs_refcount_item.o:(xfs_refcount_defer_add) in archive vmlinux.a
   >>> referenced by xfs_refcount_item.c:711 (fs/xfs/xfs_refcount_item.c:711)
   >>>               fs/xfs/xfs_refcount_item.o:(xlog_recover_cui_commit_pass2) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
