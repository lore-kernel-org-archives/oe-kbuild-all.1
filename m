Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801F4311C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 03:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YLNV5MzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697600798; x=1729136798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MV0Q+Wmda2r4+O4o+Q/vcSqwbN8R+dKPqVF0nPBK92o=;
  b=YLNV5MzIyTgsLfQi0CmNrweO4frwM2kjwS2l7X8Fv+zRMgW42J5dYtyp
   I/Oq8j3XqjL4aTjAer8s8+Zev+Hlt5PsLTOs0IJ+QPE5GaE1q67VVdRar
   xVlP/x1UWOJqP1FP7SgG4+rwf0f6wcXoU6qfyqyoNDNj0LVQq5MhKRz1e
   hbZJonkHr26zDouMhrAC1xXz0c44on7qj+hjkzcSVRM4Uw3A2/AMTXfUe
   YZOCRUF/feWI48Uz0HMn3NVrzdX+boLl7H+DK7k4nMxZb0+5QQxp0qnXD
   +/N7dhOD+1w97Kq8igtb+82oKIjJrH8d2DBXrgqdGrJG/MPP6OTxLgK3H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="370992373"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="370992373"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 20:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="872846488"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="872846488"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2023 20:46:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsxVy-000ATL-1A;
	Wed, 18 Oct 2023 03:46:34 +0000
Date: Wed, 18 Oct 2023 11:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:refactor-rtbitmap-accessors-6.7 2/28] checkpatch:
 WARNING: ENOSYS means 'invalid syscall nr' and nothing else
Message-ID: <202310181128.aDhOAJp2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git refactor-rtbitmap-accessors-6.7
head:   bbfd98d868d78ca1a2e579e8a141932302fb8503
commit: 6c664484337b37fa0cf6e958f4019623e30d40f7 [2/28] xfs: hoist freeing of rt data fork extent mappings
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310181128.aDhOAJp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181128.aDhOAJp2-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:ENOSYS: ENOSYS means 'invalid syscall nr' and nothing else
#127: FILE: fs/xfs/xfs_rtalloc.h:146:
+# define xfs_rtfree_blocks(t,rb,rl)			(ENOSYS)

ERROR:SPACING: space required after that ',' (ctx:VxV)
#127: FILE: fs/xfs/xfs_rtalloc.h:146:
+# define xfs_rtfree_blocks(t,rb,rl)			(ENOSYS)
                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#127: FILE: fs/xfs/xfs_rtalloc.h:146:
+# define xfs_rtfree_blocks(t,rb,rl)			(ENOSYS)
                                ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
