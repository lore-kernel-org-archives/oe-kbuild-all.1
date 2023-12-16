Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE636B0C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 23:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJJe35B+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702768805; x=1734304805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oWpdb61+Nyj4GqYEURzuWaJkvkhGcxT3cJP19fb2krc=;
  b=oJJe35B+IKsufX0U2Rk9iNSOgoWsH3tv7qBCTwrpbq7JIUd/m6t4rUVs
   HiDCoWZa23ASHdKAaXHEkSVnZFhZuM5pg0aKD82z2WnvJcZ/HmiyEiWiU
   HWM9OWpIOacJRK9d1EdN+LxgofsbtgBjfJVmDep8itX3Dl6tiVNSkIDMi
   MiZIOxwSZF8bX7jBhBcUMMOE9qOREQhquhRTaQltIK3qnF180ET3U0fP9
   9zJ8edvdxq3HiVGKKOJhXYWaOXGAy6amNXva7LzeT1bBdpFhldqRZYyIJ
   ErIzw5QOJQxvZ8/J6zGEIpP8sj9Adch2RxqU9yzZa8jLNSrlObZAxWF5/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="16949199"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16949199"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 15:20:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="893342472"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="893342472"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Dec 2023 15:20:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEdwv-0002Ka-1W;
	Sat, 16 Dec 2023 23:20:01 +0000
Date: Sun, 17 Dec 2023 07:19:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:report-refcounts 425/534] ld.lld: error: undefined
 symbol: xfs_rtrmap_update_defer_type
Message-ID: <202312170757.8kVIXdkV-lkp@intel.com>
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
commit: ba50a1fd4abfb8ac48bf4399707ea3d5320fc5ec [425/534] xfs: add a realtime flag to the rmap update log redo items
config: i386-randconfig-014-20231216 (https://download.01.org/0day-ci/archive/20231217/202312170757.8kVIXdkV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170757.8kVIXdkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170757.8kVIXdkV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_rtrmap_update_defer_type
   >>> referenced by div64.h:0 (arch/x86/include/asm/div64.h:0)
   >>>               fs/xfs/xfs_rmap_item.o:(xfs_rmap_defer_add) in archive vmlinux.a
   >>> referenced by xfs_rmap_item.c:759 (fs/xfs/xfs_rmap_item.c:759)
   >>>               fs/xfs/xfs_rmap_item.o:(xlog_recover_rui_commit_pass2) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
