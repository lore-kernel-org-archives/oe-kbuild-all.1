Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549762E3F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYxGMFDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702743623; x=1734279623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6NYMgRDCagifekraobROb8DHj93vFRFzpqd+uy4QSic=;
  b=mYxGMFDFbNXAaUEyQrxUNuQKAO+M5jSfwRCVsFVFkXpuRh4YuHgNjA38
   7GCyUtwLOpmsIgA8IN3hld9GL8eyqdzMRGzqCffC/eqfuNgJA0Q2Mk9sY
   Sx3e3YYttWnCPtWtCCpN3yVaXUGDT4WSYPcjFKd6vQ1aEWqMih7EiIQIP
   Xva9/tQwOZbuXqUELn2owkMSWVlsoQ9lrPAJPkAWkK6IU95+1rrSdKMUo
   pDByIum0VqSO4gqBIPalZfePMQ9GXTS3zAc20Pf+3xUjlIfh8leVjdtxY
   0lmGECQo2uUq9RolPyUi3bohSPmNsBmxSgffplD5nyxkbBOCWglSBWMIc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="398166440"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="398166440"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 08:20:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="918776852"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="918776852"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2023 08:20:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEXOk-0001qe-0k;
	Sat, 16 Dec 2023 16:20:18 +0000
Date: Sun, 17 Dec 2023 00:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:rmap-intent-cleanups 406/417] ld.lld: error: undefined
 symbol: xfs_rtextent_free_defer_type
Message-ID: <202312170055.1DUxwZcs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rmap-intent-cleanups
head:   411607390a8a5b6192ee48c8d3d2bde3783ceb3c
commit: 867b4ce1c59ec3738e2c01e127ac5733c2f4408a [406/417] xfs: support logging EFIs for realtime extents
config: i386-randconfig-014-20231216 (https://download.01.org/0day-ci/archive/20231217/202312170055.1DUxwZcs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170055.1DUxwZcs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170055.1DUxwZcs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_rtextent_free_defer_type
   >>> referenced by xfs_extfree_item.c:474 (fs/xfs/xfs_extfree_item.c:474)
   >>>               fs/xfs/xfs_extfree_item.o:(xfs_extent_free_defer_add) in archive vmlinux.a
   >>> referenced by xfs_extfree_item.c:859 (fs/xfs/xfs_extfree_item.c:859)
   >>>               fs/xfs/xfs_extfree_item.o:(xlog_recover_efi_commit_pass2) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
