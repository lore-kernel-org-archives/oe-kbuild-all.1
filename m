Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C02B62F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 01:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ft9bH2xv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697073361; x=1728609361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BNZMPmzSceKZNyT8o3uWyGI/jup6qFsUAkygsf7FpeU=;
  b=ft9bH2xvwYBVUYkCMd703W7AXvgcw6g/UDfPIW3aAYU+rndTGFz8KMwx
   e/IG0ILnD3o+wRl6sAYGpZXKUPY8LthLG2kdVzbkudWEep5HMwoVklUaT
   mVW1e57NUJM047i19unF4BeQ+7x2lg9laEJ6BGPg4/3ikkxSO7KBJreNg
   KXN23DbXO3tEud++W/wzXzrt4ONAhTcJ8f75U1NKw6orBLTE2V2cABVaz
   vVC2OaHsmEp0heDzHVrT+YW+BdEqV0/fZ1uOFT/YoWR7twoTiPGRYM9dK
   PLEvgziSEiDQWV7y4tX5gpvXl81oK5cPqWADHNB4O46eP1oinpL709b/I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364174659"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="364174659"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 18:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747684908"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="747684908"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 18:15:55 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqkIr-0002wv-2B;
	Thu, 12 Oct 2023 01:15:53 +0000
Date: Thu, 12 Oct 2023 09:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 53/269] checkpatch: ERROR: Macros with
 complex values should be enclosed in parentheses
Message-ID: <202310120900.um0K4KPR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git inode-refactor
head:   5d7848682f41b20567e9d24b7c29a6d3964f0de6
commit: 0acc3cae84776e77a96dd008b0fdc7422423e6b4 [53/269] xfs: teach scrub to check file nlinks
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120900.um0K4KPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120900.um0K4KPR-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:COMPLEX_MACRO: Macros with complex values should be enclosed in parentheses
#53: FILE: fs/xfs/libxfs/xfs_da_format.h:162:
+#define XFS_DIR3_FTYPE_STR \
+	{ XFS_DIR3_FT_UNKNOWN,	"unknown" }, \
+	{ XFS_DIR3_FT_REG_FILE,	"file" }, \
+	{ XFS_DIR3_FT_DIR,	"directory" }, \
+	{ XFS_DIR3_FT_CHRDEV,	"char" }, \
+	{ XFS_DIR3_FT_BLKDEV,	"block" }, \
+	{ XFS_DIR3_FT_FIFO,	"fifo" }, \
+	{ XFS_DIR3_FT_SOCK,	"sock" }, \
+	{ XFS_DIR3_FT_SYMLINK,	"symlink" }, \
+	{ XFS_DIR3_FT_WHT,	"whiteout" }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
