Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B80A3C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 10:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687689701; x=1719225701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yhcyUyDSF06XGipDQuuuQMVcjukqonP3mu06eszluXQ=;
  b=OyZJjiC7e/xO6lr9NWOK6vuPRMfHtifpIITYQ76/9mXfcdLSByrHQ4Tc
   L6BXVpR0Z5RLWjxP/fW70R3MPlD833r7g3fnaUiW9cGmiXlQdkdIxkZwa
   wS1mGbt9yKRwG2ToCMgJaOeIDPO7I1xri4A4V4AMDFUw8oRLN4QiWaH6G
   xOnW7LZbWWDgZuMHqBs1DbYJ2Qu+olDeOjBqExbs9Bnd0fcAgjlVIGsKZ
   JxctgKsINLiMH+1ro0QS6jVnPWhlYtkxe0DiY8RDrUq00wM8+za+b7mW4
   wO89h6EU1Bv0yyOsJZkscqpGazUtXQIoG6adnKLpSiPb43nVynUQSd4eA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="341390215"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="341390215"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 03:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="839952826"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="839952826"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Jun 2023 03:41:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDNBa-0009yL-0l;
	Sun, 25 Jun 2023 10:41:38 +0000
Date: Sun, 25 Jun 2023 18:41:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 35/202] fs/xfs/scrub/repair.c:60:27:
 error: implicit declaration of function 'xchk_stats_elapsed_ns'; did you
 mean 'xchk_stats_elapsed_ms'?
Message-ID: <202306251846.dz4REKnC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   9f2fc0e8ef147d9fd9c6af47c4ab87427e0d2d19
commit: 5368138492f38c80081b9f8d5fab01f72d755435 [35/202] xfs: track usage statistics of online fsck
config: sparc64-randconfig-r064-20230625 (https://download.01.org/0day-ci/archive/20230625/202306251846.dz4REKnC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251846.dz4REKnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251846.dz4REKnC-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/repair.c: In function 'xrep_attempt':
>> fs/xfs/scrub/repair.c:60:27: error: implicit declaration of function 'xchk_stats_elapsed_ns'; did you mean 'xchk_stats_elapsed_ms'? [-Werror=implicit-function-declaration]
      60 |         run->repair_ns += xchk_stats_elapsed_ns(repair_start);
         |                           ^~~~~~~~~~~~~~~~~~~~~
         |                           xchk_stats_elapsed_ms
   cc1: some warnings being treated as errors


vim +60 fs/xfs/scrub/repair.c

    36	
    37	/*
    38	 * Attempt to repair some metadata, if the metadata is corrupt and userspace
    39	 * told us to fix it.  This function returns -EAGAIN to mean "re-run scrub",
    40	 * and will set *fixed to true if it thinks it repaired anything.
    41	 */
    42	int
    43	xrep_attempt(
    44		struct xfs_scrub	*sc,
    45		struct xchk_stats_run	*run)
    46	{
    47		u64			repair_start;
    48		int			error = 0;
    49	
    50		trace_xrep_attempt(XFS_I(file_inode(sc->file)), sc->sm, error);
    51	
    52		xchk_ag_btcur_free(&sc->sa);
    53	
    54		/* Repair whatever's broken. */
    55		ASSERT(sc->ops->repair);
    56		run->repair_attempted = true;
    57		repair_start = xchk_stats_now();
    58		error = sc->ops->repair(sc);
    59		trace_xrep_done(XFS_I(file_inode(sc->file)), sc->sm, error);
  > 60		run->repair_ns += xchk_stats_elapsed_ns(repair_start);
    61		switch (error) {
    62		case 0:
    63			/*
    64			 * Repair succeeded.  Commit the fixes and perform a second
    65			 * scrub so that we can tell userspace if we fixed the problem.
    66			 */
    67			sc->sm->sm_flags &= ~XFS_SCRUB_FLAGS_OUT;
    68			sc->flags |= XREP_ALREADY_FIXED;
    69			run->repair_succeeded = true;
    70			return -EAGAIN;
    71		case -ECHRNG:
    72			sc->flags |= XCHK_NEED_DRAIN;
    73			run->retries++;
    74			return -EAGAIN;
    75		case -EDEADLOCK:
    76			/* Tell the caller to try again having grabbed all the locks. */
    77			if (!(sc->flags & XCHK_TRY_HARDER)) {
    78				sc->flags |= XCHK_TRY_HARDER;
    79				run->retries++;
    80				return -EAGAIN;
    81			}
    82			/*
    83			 * We tried harder but still couldn't grab all the resources
    84			 * we needed to fix it.  The corruption has not been fixed,
    85			 * so exit to userspace with the scan's output flags unchanged.
    86			 */
    87			return 0;
    88		default:
    89			/*
    90			 * EAGAIN tells the caller to re-scrub, so we cannot return
    91			 * that here.
    92			 */
    93			ASSERT(error != -EAGAIN);
    94			return error;
    95		}
    96	}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
