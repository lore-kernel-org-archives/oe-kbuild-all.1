Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813B9142659
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 03:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742613836; cv=none; b=N884eO9yqw0gR7HtVFe3ztFOYkBanS96GboShsTZJpyi2TrevGVNGgkrS8QHnyqrpAcQCbWpNnGBaQ/l3ft270+1QfVrR7YDFb2t5seKroMOkjaYUvDd3YQiK4inAohSnLjq2b8Hm92PTjqhOIbERueS7ExEOBkBWSs/nq+l0A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742613836; c=relaxed/simple;
	bh=0vQAZF6AeuWQf3CLNtg2AX5YLhlDx53ZybnDKQPYuvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nU5x74Busav27S1xRhrXepb0QAHzcj6XTfJ+CfNShA3btS+XqK9m8UUrhhDGE7/X605MyumR8NsgpTBNKiQMfrDL1e2nVFIQB9IFKgYBD9RTAY3/mD41Au6aUD38W68tKmS3ZUgXdWCVMeBjEnR9IKaJivX4/9eyAoWmJMrLWW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZjgbdZs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZjgbdZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742613834; x=1774149834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0vQAZF6AeuWQf3CLNtg2AX5YLhlDx53ZybnDKQPYuvk=;
  b=XZjgbdZsBNx6JjdQE1Zhkm5sy5h7nAuiE7VM6P1AbMIJxcLqBKOi2zIT
   nqQgGcx+CyoeA05TDAAzQE8I6UTOimlz30dpUuuNgaQ64TqsiUaKuZhs4
   2+u79p4BrrBetoumoX5NmvGQ8kQ7mvs2vj8jeHZH+reytoHPI48Jd5Dur
   cF61dpjKSjYHv6p85SgENnTQbhxVzn8IX+AMTBIN38627UCEZjkppHZjl
   /yuqJ0obvYQr23NxKCvFLNFEgtB1b3xUtoTj6WCXJrjm3oIGBsqBvXjRC
   SyQ9uE7R13lQCvEBInZRMXF2VNz9k152msbhEXMGFFkZ11gHNdVqEqDOw
   Q==;
X-CSE-ConnectionGUID: oAspUDrLTeG4v0MA/JfILw==
X-CSE-MsgGUID: oeUnvx2XRvuNhW9bVT2Jvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="44075652"
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="44075652"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 20:23:54 -0700
X-CSE-ConnectionGUID: 4WdnfDmiSzaMMJh9/S7C6A==
X-CSE-MsgGUID: 8Agga5ybSHaFsSdxe/pEQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,266,1736841600"; 
   d="scan'208";a="128672866"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2025 20:23:53 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvpSg-0001u7-2h;
	Sat, 22 Mar 2025 03:23:50 +0000
Date: Sat, 22 Mar 2025 11:23:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1510/1510] block/blk-merge.c:688:16:
 sparse: sparse: symbol 'blk_try_req_merge' was not declared. Should it be
 static?
Message-ID: <202503221140.40xnocXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   db5f05c237bbdb9b4d5862fc59bdbdafa8f72a73
commit: 5f100bc6aabbe30e55cf20af8e163bb6dba3a3aa [1510/1510] block: fix the DISCARD request merge
config: arm64-randconfig-r132-20250322 (https://download.01.org/0day-ci/archive/20250322/202503221140.40xnocXZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250322/202503221140.40xnocXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221140.40xnocXZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-merge.c:688:16: sparse: sparse: symbol 'blk_try_req_merge' was not declared. Should it be static?
   block/blk-merge.c:688:16: warning: no previous prototype for 'blk_try_req_merge' [-Wmissing-prototypes]
     688 | enum elv_merge blk_try_req_merge(struct request *req, struct request *next)
         |                ^~~~~~~~~~~~~~~~~

vim +/blk_try_req_merge +688 block/blk-merge.c

   687	
 > 688	enum elv_merge blk_try_req_merge(struct request *req, struct request *next)
   689	{
   690		if (blk_discard_mergable(req))
   691			return ELEVATOR_DISCARD_MERGE;
   692		else if (blk_rq_pos(req) + blk_rq_sectors(req) == blk_rq_pos(next))
   693			return ELEVATOR_BACK_MERGE;
   694	
   695		return ELEVATOR_NO_MERGE;
   696	}
   697	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
