Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D230BBE58
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 05:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDXl08DR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697520376; x=1729056376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1afU6ys5+xJ0uL+AAgtPNrymC+uQFdJTJCiB8L+Iaak=;
  b=HDXl08DRuh/YqtHzxae/h+RtibWd3140WokqGlMaVh4wZWs8IpwvVquA
   BFKMqt5Nlsm3HodfpyAwkzY9dIRNK8o1dZYzbMnL5ZdFtVpKjwYFusQ4l
   GybQiFSomVfXk+JkJRks2OscM3057hJCyUE/znTTuFaoJgKcFUuJBoj5e
   0DlFKkLPw0wUwTMKDLmUUQlpNYm9Qtjl/FRXSa181wAcZvJXPF9k3/QOj
   +aRIbGdfzaitsPlUEa7h3SpT2eSSTiriYOpRE1TidohPmPo7n1AKvUUIJ
   nSUOu8N7+hz6fAE3s5wItZIke3zabfLGa0x3jNu1cvcF6vBT7aqPW+eq+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="452179777"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="452179777"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 22:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="755966406"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="755966406"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Oct 2023 22:26:15 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsca7-00093H-0e;
	Tue, 17 Oct 2023 05:25:45 +0000
Date: Tue, 17 Oct 2023 13:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:refactor-rt-unit-conversions-6.7 14/21] checkpatch:
 WARNING: Missing a blank line after declarations
Message-ID: <202310171351.2CGBgz13-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git refactor-rt-unit-conversions-6.7
head:   f60b96941aa23f71e50fb4d64e9a789e93146d9b
commit: d77a09d2f1cd66d6f4d33311b30922f34f13c3b0 [14/21] xfs: convert rt extent numbers to xfs_rtxnum_t
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171351.2CGBgz13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171351.2CGBgz13-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#36: FILE: fs/xfs/libxfs/xfs_rtbitmap.c:100:
+	xfs_rtxnum_t	limit,		/* last rtext to look at */
+	xfs_rtxnum_t	*rtx)		/* out: start rtext found */

WARNING:LINE_SPACING: Missing a blank line after declarations
#98: FILE: fs/xfs/libxfs/xfs_rtbitmap.c:275:
+	xfs_rtxnum_t	limit,		/* last rtext to look at */
+	xfs_rtxnum_t	*rtx)		/* out: start rtext found */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
