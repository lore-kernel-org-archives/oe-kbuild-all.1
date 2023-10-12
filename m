Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525562F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 00:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhrGKZ2X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697072028; x=1728608028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bfKhHnXfGky8sRuYC6mN86B9GAT3efO7aCwp/DHyU2Q=;
  b=HhrGKZ2XisOqP3UaLjgCAADoNfjuqGzZdD+3JBABaXyuC6Y/QPZK9bt+
   Q47c5GPApGbvaE9ZzJI6Y2D/C3gRJPpuKJmXDfAfiYNek0KDRpydV6u03
   ihmNJwqm33PBM8SWBi/hUUi4b4PvaFaXEC2X40AQc76gVtC//jDIGHkif
   yduVyt4YUrCWXBT5WZEgHaL4Xg5FcuQlH76z8myLozj90Znf8acEplHzd
   tqYoDNr2ny2H5bnSU4i5F62QL9XQPQxmD8T/fJXV4vfajheAYM2oz9dN+
   0PXFt+rtT7Mb3POO5G+wbDM2bvSUJskmkJTwqXZ5uQRpmupqRFXHYGSco
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="415854514"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="415854514"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 17:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="897874054"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="897874054"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2023 17:52:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqjxQ-0002vR-2t;
	Thu, 12 Oct 2023 00:53:44 +0000
Date: Thu, 12 Oct 2023 08:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 45/269] checkpatch: ERROR: space required
 before the open brace '{'
Message-ID: <202310120853.nUJBdL4A-lkp@intel.com>
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
commit: 40469312593f8d635a5c45892c123caf57c3058b [45/269] xfs: cache a bunch of inodes for repair scans
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120853.nUJBdL4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120853.nUJBdL4A-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#257: FILE: fs/xfs/scrub/iscan.c:509:
+	for (i = 0; i < XFS_INODES_PER_CHUNK; i++){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
