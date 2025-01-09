Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B20217652
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 14:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431439; cv=none; b=LAt+G6gCCL1sRfkVF0AEhwast/zdWDTa038o/BndFGE2ceUDHbBdGQn/Q7lsvthEq8iQo9VttxTwKJ/VNae8hBPnVB9fSBWEPyi661kK8SVVcRogvXmzN4Iw78kSlurYmTL5AuNfwc16/kg7bOOuSko182MgCvs5nMQdxwhLq6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431439; c=relaxed/simple;
	bh=AsDLFG0ICqao3xTM3lu43bFaV01zpk6AKetbulZzMRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lz5z0Ioda1VMVzAwUSyC99WSYSv7wghDHPvO1VwlgNmJ0O4Ah4+f5WbHbHXYIAX8jdnJjwVfsHwwGv7Qghy0ekm5Eq9fcYkpYDdNQin7dBQhq/dLIR3xZd19jkLOaa77pBowWzU//GBCoa/CFx95nVDAhrweSKlvwEc32eApQ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=berL1E7S; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="berL1E7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736431438; x=1767967438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsDLFG0ICqao3xTM3lu43bFaV01zpk6AKetbulZzMRk=;
  b=berL1E7S2k2ioRDts45PsEVcNt2QAgAc2uJj3KfchHs8UA5/AExf2WTk
   Hab4X3xuPbSRV/5XFbrs4iZxwLNl2gb0nvWCIRdMxPUdU7TVQMfpieCmE
   4aeCkP0FBJIsY/tPAU9ZXvFgmff6LJo2Lr/w2hBOk7gZrJHhujkJOYJBB
   y8UCNob1sDu33yTTnGh3nO8e646hrP1Pt07LoRtKj4kGBDJjERqk/TkuI
   +GEJRnCu6Ig764/4NE62CGHvFTBiExQBZAf4KO8m4qX9VwaXoelWNFGTs
   NJHIiHLOUJNV/fq+5QZYDG7Ssll3OOHWizf0lpGJ/DuMRuWHYs+VmASoL
   g==;
X-CSE-ConnectionGUID: +CclRZjKTEq/1vU7SD5WFA==
X-CSE-MsgGUID: QTfjRrYsTvCUYtv5UhBxQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40458705"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="40458705"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:03:57 -0800
X-CSE-ConnectionGUID: DobRp6HMSXOQQhYLtHT9TA==
X-CSE-MsgGUID: DJI7Ez1wQwGVWKvw4wcN1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126707405"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 06:03:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVt8c-000Hdh-0v;
	Thu, 09 Jan 2025 14:03:54 +0000
Date: Thu, 9 Jan 2025 22:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1402/1402] block/blk-merge.c:688:16:
 warning: no previous prototype for 'blk_try_req_merge'
Message-ID: <202501092100.YDIEEEHw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: 5f100bc6aabbe30e55cf20af8e163bb6dba3a3aa [1402/1402] block: fix the DISCARD request merge
config: x86_64-buildonly-randconfig-006-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092100.YDIEEEHw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092100.YDIEEEHw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092100.YDIEEEHw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-merge.c:688:16: warning: no previous prototype for 'blk_try_req_merge' [-Wmissing-prototypes]
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
