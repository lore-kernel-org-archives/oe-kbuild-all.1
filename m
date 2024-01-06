Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146A7DDB2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 17:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SM24lSTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704562933; x=1736098933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UOWNkhue9MomgSfp3RSCQ5H6UrOZJ0RcIj6sSREhIZg=;
  b=SM24lSTBUOBRyOGQY5JKd5uukbWXvkVu6ZrFfs9KmIknjkAQSfnwKTPl
   E8kQGSQGIRM1yGNe9qJVorPnXkXdonaUlGD8ukOwVjpAnHQEaWF4DDRKs
   QKen40c+XZBJx98NfkWFlZABEiZB5U94JP9y9Jw5CLYOcSNtzyvpA901h
   FhmhV2HXSSkn3yD5maX+SRRc53Ri6S9zW/vJBEQgM/nWRpZeoebYEQaef
   xSHosaZ7Y1xoyrI17de2hBCjoH++lyrpdUT+h1eSF3mHZf6r6vHOQQ9n8
   ywg1YJVN9SKcDvB5OmLM7Xj6P0ndYNtaJ52enmA3Xxf0hl9gJPzDElC2A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="11157759"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="11157759"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 09:42:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="871491295"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="871491295"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jan 2024 09:41:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMAgG-0002op-1x;
	Sat, 06 Jan 2024 17:41:57 +0000
Date: Sun, 7 Jan 2024 01:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 97/223] fs/xfs/scrub/common.c:257:2:
 error: call to undeclared function 'trace_xchk_qcheck_error'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202401070107.4QTBRZgc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   45b903e0e402a62723d43483a33cac8f3d9a4073
commit: a13409e8c652b4fce3d5741a68a85d4427a8d569 [97/223] xfs: implement live quotacheck inode scan
config: i386-randconfig-012-20240106 (https://download.01.org/0day-ci/archive/20240107/202401070107.4QTBRZgc-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401070107.4QTBRZgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401070107.4QTBRZgc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/common.c:257:2: error: call to undeclared function 'trace_xchk_qcheck_error'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     257 |         trace_xchk_qcheck_error(sc, dqtype, id, __return_address);
         |         ^
   1 error generated.


vim +/trace_xchk_qcheck_error +257 fs/xfs/scrub/common.c

   248	
   249	/* Record a corrupt quota counter. */
   250	void
   251	xchk_qcheck_set_corrupt(
   252		struct xfs_scrub	*sc,
   253		unsigned int		dqtype,
   254		xfs_dqid_t		id)
   255	{
   256		sc->sm->sm_flags |= XFS_SCRUB_OFLAG_CORRUPT;
 > 257		trace_xchk_qcheck_error(sc, dqtype, id, __return_address);
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
