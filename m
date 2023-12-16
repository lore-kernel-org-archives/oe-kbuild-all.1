Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFAB1C2E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 03:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKZF/GCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702696680; x=1734232680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAF3+4R5+L32cW5GPGxLgKF0k3ca+44KUk4ojfhHUXY=;
  b=dKZF/GCzMmOcyUlVIruUkDKU2zqCmIDxvqo164Ten7n1VZ5s8QF4xryF
   8cwIjmAauqqqMVU4HVIyCwrdwirURZkswqol/KS9w5m5Y9vZCYEqHvrhm
   F7OlxAZdrsg23j6wK9UQGDYUqqZ5tDmPTG4+KbJsrzYvfv3hxnNOJujwT
   rbLSKVLawKfNvBj5ampV5t0lYmg/blBveaqUD3JmXjmat0dvWOD3kgsOn
   FxuAc9xUQWpIukVwMNzGSzazaaM8kXrgmUREXqNAq/1KC14CBBdrlyR41
   XmXZO4Q3v0WzyUrZyHcymmTtYk8AHLeOoSRXhF9QawfGPe1vgumcPGhsy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="461812242"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="461812242"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 19:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="724650667"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="724650667"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2023 19:17:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rELBc-00015o-29;
	Sat, 16 Dec 2023 03:17:56 +0000
Date: Sat, 16 Dec 2023 11:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:rmap-intent-cleanups 321/417]
 fs/xfs/libxfs/xfs_imeta.c:80:1: error: unused function
 'xfs_imeta_path_check'
Message-ID: <202312161139.fW8iUlUE-lkp@intel.com>
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
commit: fc58e7b636ba345338e4538f6866151f43244b63 [321/417] xfs: create imeta abstractions to get and set metadata inodes
config: x86_64-sof-customedconfig-compile-test-defconfig (https://download.01.org/0day-ci/archive/20231216/202312161139.fW8iUlUE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161139.fW8iUlUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161139.fW8iUlUE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_imeta.c:80:1: error: unused function 'xfs_imeta_path_check' [-Werror,-Wunused-function]
   xfs_imeta_path_check(
   ^
   1 error generated.


vim +/xfs_imeta_path_check +80 fs/xfs/libxfs/xfs_imeta.c

    77	
    78	/* Is this path ok? */
    79	static inline bool
  > 80	xfs_imeta_path_check(
    81		const struct xfs_imeta_path	*path)
    82	{
    83		return true;
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
