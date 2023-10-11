Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358342B741
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afoHYQdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697067814; x=1728603814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0/O+HP8TBw8AYpOGEqMyWGQrZ3uaKIr4iIJvj9FDsZg=;
  b=afoHYQdA42zK0K7nJ+E6PEMUim2OsC4eKzaGDpMpHiogfmQ8jaDsX49q
   t/Bd7OGyrHLve6xeHybKbWfbN2wTtQ9YyLZgV4AIFyFnhBAlY0aSf0WSZ
   RoWW5Q0wyBBrHrpXGe4+b0w82HsTA+SUZnL4tLO412moc4TrqobmQHOZE
   KDOWTXGV7UTVKD4bCX/huhaQdUVrihV5nCAdYDp/jT1gOblWcm9UuY7WB
   k9lKy4wNNxwtFr/G3+b90OF9W7SMySwR84uvZNLf3O/YRA6RmARkXi+Zg
   uQZ0FejtEzp3+5k2zhFQ1vh939QzmOZJepv5CUcbHmetnUL80KtubXrgu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384648159"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="384648159"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 16:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870343924"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="870343924"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 16:43:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqirS-0002rF-0v;
	Wed, 11 Oct 2023 23:43:30 +0000
Date: Thu, 12 Oct 2023 07:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 27/269] checkpatch: WARNING: Missing a
 blank line after declarations
Message-ID: <202310120750.C9qVOr0W-lkp@intel.com>
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
commit: 7a73b10c73146a937f95c8421cdc4d88af0d79cf [27/269] xfs: repair inode fork block mapping data structures
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120750.C9qVOr0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120750.C9qVOr0W-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:LINE_SPACING: Missing a blank line after declarations
#125: FILE: fs/xfs/libxfs/xfs_bmap_btree.c:579:
+	struct xfs_inode	*ip,		/* inode owning the btree */
+	int			whichfork)	/* data or attr fork */

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#179: FILE: fs/xfs/libxfs/xfs_bmap_btree.c:642:
+	static const short	brootflag[2] =
+		{ XFS_ILOG_DBROOT, XFS_ILOG_ABROOT };

ERROR:OPEN_BRACE: that open brace { should be on the previous line
#181: FILE: fs/xfs/libxfs/xfs_bmap_btree.c:644:
+	static const short	extflag[2] =
+		{ XFS_ILOG_DEXT, XFS_ILOG_AEXT };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
