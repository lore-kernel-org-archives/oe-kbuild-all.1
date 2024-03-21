Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36EA56B98
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711051984; cv=none; b=gKVFkn7WQ39i9k32mYilZJFytSGFIb5FoniGHHzSCpAL1Dsj3Ehbnjsbd48QAgHjQXJIyMn3VvtLsUdq0JP//BeWEj32oTaHKKta2/N2qI9fFaP/qgesJcloxT2x4SfAXpRaeG9p/oG8eWNeyjRtfR7mWafCEZ/LTo2gPJ3hsGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711051984; c=relaxed/simple;
	bh=wWPScuGYanjDpysRIIELc2ZMR1R/VHQoSOcfL1i7xxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UX+RHtr+Lc0dkVV3bDPrmS77ZdvbjXx9KLGVt9LOPt0u2yzrbrTCJ7VrKYVOozlfaYRmeG2evZqyShM3IUDI+81VeicwsFtro0BbYqN6nzRsv5AtwaKg7bhfoDkWsbWuX7v/5wa5G19fLkbiQbsQlCKkFLMBa6UrgO6CJMXfElU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaXBr3AZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaXBr3AZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711051982; x=1742587982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wWPScuGYanjDpysRIIELc2ZMR1R/VHQoSOcfL1i7xxQ=;
  b=AaXBr3AZnCXg5y+SEXJsAnbe0gytShCBvcIOZQCfuBbfa6NusKtL1Oyl
   gL6yU8hh9lMZze9Na9XLz7odvLQ6X7yA2PiSX8yyZdw97bVbmSeSVUfCJ
   hjimXDR3Nqc/wUYV0JMtnZQg4WqUz6kHTdFMTKxxJfl9SXE8IFwynJti8
   99DflmO25y1emPYM67ygI77Y/k37opGiLH0AXSOZAwfYeV3ks3KPivXak
   Frn/0n1cHi8r+OnGeXG98mY4euAY7w8wQJ2kkNn25rEWFK/mpsQdzJQvi
   teqlNY8Q62x+k6s8T9rYBCO3gabvWAcVVYGkHveHpxrzWR/AaACbm9se+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6199301"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6199301"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 13:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="19350845"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Mar 2024 13:13:00 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnOmY-000Jkt-0K;
	Thu, 21 Mar 2024 20:12:58 +0000
Date: Fri, 22 Mar 2024 04:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-6.9-fixes 119/160] fs/xfs/libxfs/xfs_btree.c:207:28:
 error: unused function 'xfs_btree_block_errtag'
Message-ID: <202403220424.MJOjxjuN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-6.9-fixes
head:   64c9dc981ef40505b8fa319dd8faaf613290e7c4
commit: 788f179ad205dc50fad3bee9c6a6c03e1336a148 [119/160] xfs: consolidate btree block verification
config: x86_64-sof-customedconfig-amd-defconfig (https://download.01.org/0day-ci/archive/20240322/202403220424.MJOjxjuN-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403220424.MJOjxjuN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403220424.MJOjxjuN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_btree.c:207:28: error: unused function 'xfs_btree_block_errtag' [-Werror,-Wunused-function]
     207 | static inline unsigned int xfs_btree_block_errtag(struct xfs_btree_cur *cur)
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/xfs_btree_block_errtag +207 fs/xfs/libxfs/xfs_btree.c

   206	
 > 207	static inline unsigned int xfs_btree_block_errtag(struct xfs_btree_cur *cur)
   208	{
   209		if (cur->bc_ops->ptr_len == XFS_BTREE_SHORT_PTR_LEN)
   210			return XFS_ERRTAG_BTREE_CHECK_SBLOCK;
   211		return XFS_ERRTAG_BTREE_CHECK_LBLOCK;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
