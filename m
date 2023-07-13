Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB021ED43
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jul 2023 15:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689262141; x=1720798141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/NgH8moqjFiH34uOFh81m4SWRBOjmUAG5RZAjgKw85k=;
  b=QMxMNv5IRm7P2wWKEhgFtxQIYAUZhrFWRpP2nKboGrZi18ofP8L6m2k+
   AZn/ZvyWNkw4Gj5v1ViU1K0lADbWnL78udz69ULBmur218WBXFcupTaaU
   YZaUSGA/VzqnG1U6etVT2un3LuEl09tEnaEeZV/tqagOy7csxcGHVYOjd
   Z62by0QiFQMs9/ei6FyG0VktamDr6Tgq7mr95zzZYiJYXYlIk4bvS51fe
   DumXEIZ22vGcaZTH3QIxCSQ4UxaHwCT+APC5SSHeiY3dgrUWkexjv2Wm0
   Er0rOGf+0EjeVtiNZWUxMEljdcZbFt6a3kmoKISde/yx5jc5ASKxOf0DV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396026659"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="396026659"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 08:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757204898"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="757204898"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Jul 2023 08:28:59 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJyFX-0006i5-0i;
	Thu, 13 Jul 2023 15:28:59 +0000
Date: Thu, 13 Jul 2023 23:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 49/219] fs/xfs/scrub/repair.c:60:27:
 error: implicit declaration of function 'xchk_stats_elapsed_ns'; did you
 mean 'xchk_stats_elapsed_ms'?
Message-ID: <202307132353.zyoAtdGk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   f1829956dc4905fa58fc02ea84b6a020e3f5a7c8
commit: 613443e2e3831d4b3da1a8b0c3a2abd3d420ac5a [49/219] xfs: track usage statistics of online fsck
config: csky-randconfig-r053-20230713 (https://download.01.org/0day-ci/archive/20230713/202307132353.zyoAtdGk-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132353.zyoAtdGk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307132353.zyoAtdGk-lkp@intel.com/

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
