Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8C5249E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 23:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nE8l2sk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697066573; x=1728602573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pFL+6vWCNheFY+5NEyg5BtwwgslyxYWLB3M6vyDIIoA=;
  b=nE8l2sk4u4gImrdLqV/4w17rusMFmimEtzmKIrnW2pfzjFcPGb0oACJh
   BaAZzskJJOPqbyoUJ9r6LBhd0lLRoF4RsxuUbJRXNuplenVTVHlX9OQtu
   FRl6iF62Dg7lXeX/KCKz2rEJWadUOBg05djecaHL6U7W0iYRYMjEf1BWy
   2mlNHSWzulRl8ccQ+jhq/cU8L/B/39TBDtp1LK7jZQtYLpX7vU7x8VE6Z
   GLTbUNb9mnK0LwYTkLpMxpI/lR2HmKNkbPxTukC1JaDUcsYoXD5UXHx8e
   jOt/cGESse+YOQqqy6Ka0chKmvfiOsX2Gviz4zEeVVV1PeNeWvw6Pptae
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384641658"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="384641658"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 16:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870338201"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="870338201"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 16:22:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqiX7-0002qE-2T;
	Wed, 11 Oct 2023 23:22:29 +0000
Date: Thu, 12 Oct 2023 07:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:inode-refactor 22/269] checkpatch: WARNING: Possible
 repeated word: 'the'
Message-ID: <202310120752.YPapBKLr-lkp@intel.com>
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
commit: 77c321cf32c126be6bd0a272b2fd045b76091fbd [22/269] xfs: zap broken inode forks
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120752.YPapBKLr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120752.YPapBKLr-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#873: FILE: fs/xfs/scrub/inode_repair.c:921:
+			 * empty space here so that the the data fork bmap

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
