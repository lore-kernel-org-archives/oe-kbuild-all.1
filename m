Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5632AAC0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326135; cv=none; b=Ud+/eDauJDvZxHvqkbu4a2i+2w7mnoshvUI1LpTbRn+3HdqU+TS4ApuHpPGDjcoPsqoVRX93fl3BY9a1NdqlTnGouXg8VxGz7Up37KwEq/fl3zKniN0Y6NDOqeDTDJdjcBnRlGsKrZ1ZqH5Y8Y3hKPG+A1Pr2U86PF1lDWmKyds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326135; c=relaxed/simple;
	bh=i81azPGahTzOgw/5qfc77hGy/Ut0mm6mQ6LSKeBkoBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aowGnyfV5ST3XR/WrNUZEFTe5Ke5dXYuYD952HE6+xbb149pDBp+U5q12qePrl0HqVQ4xHoxo3hvTsKtGpOuUt3ZUOr1odnM+nx1nX5mO09JOHS70j3OySiI9qS800gSXR8dSgtuYG1Aq955ZRIX+xntFsejIhxFyB4SdXskLZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSinqR51; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSinqR51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770326134; x=1801862134;
  h=date:from:to:cc:subject:message-id;
  bh=i81azPGahTzOgw/5qfc77hGy/Ut0mm6mQ6LSKeBkoBc=;
  b=kSinqR51UeP/LP0tG9o9aHJ1BSLHc9cxhnmFnD2HQE6JJybirRF+r9/v
   LINNl94MwyQEED5fyNU8jrtf6RF7It+VlAdhi5Ycw4SDMnyvZcxEA5THF
   toW7+OMC5ivGICB6inBCVWWZAg72rfdb05ITGz+yu5OfrUXAC+1OMw2En
   skvxhlAEMlKZ7oEN48uydHJ7idwB9yQ36qTCqFplAcSBr1Efr/HEkonLL
   THrp8aG/ASBSwETJC6mrEYdC3Oy4hrZ4jHjN+EGbQrBKwSdvzGk4XCo3y
   UPL0z5yg9Nz6eB4WgRgYmGgyklD77jBfrw4rW18T/3a1jCLol3kR24LqA
   g==;
X-CSE-ConnectionGUID: lEhq/94NTtWp8Ir3rG1EzQ==
X-CSE-MsgGUID: dFGrUl1YQHSUKXuIfbesbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="74135955"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="74135955"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 13:15:33 -0800
X-CSE-ConnectionGUID: SMkI4XM0QaeIxQ5DwOByKw==
X-CSE-MsgGUID: HwWHEQDbQQm6gJErxufrkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="241233285"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2026 13:15:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vo6hF-00000000kDS-48yp;
	Thu, 05 Feb 2026 21:15:29 +0000
Date: Fri, 06 Feb 2026 05:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/ptp/ptp_vmclock.c:448:24: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <202602060513.O7T8iVNH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   6b1c42d783637b473efce598dce9deab5c10ed42
commit: 9e61ba55c416e3551523e3f77305e88155bf8c16 [10/10] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: x86_64-randconfig-r121-20260205 (https://download.01.org/0day-ci/archive/20260206/202602060513.O7T8iVNH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060513.O7T8iVNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060513.O7T8iVNH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ptp/ptp_vmclock.c:448:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/ptp/ptp_vmclock.c:448:24: sparse:     expected restricted __poll_t
   drivers/ptp/ptp_vmclock.c:448:24: sparse:     got int
   drivers/ptp/ptp_vmclock.c:454:31: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/ptp/ptp_vmclock.c:454:31: sparse:     expected restricted __poll_t
   drivers/ptp/ptp_vmclock.c:454:31: sparse:     got int

vim +448 drivers/ptp/ptp_vmclock.c

20503272422693 David Woodhouse 2024-10-06  436  
3b1526ddb25452 Babis Chalios   2026-01-30  437  static __poll_t vmclock_miscdev_poll(struct file *fp, poll_table *wait)
3b1526ddb25452 Babis Chalios   2026-01-30  438  {
3b1526ddb25452 Babis Chalios   2026-01-30  439  	struct vmclock_file_state *fst = fp->private_data;
3b1526ddb25452 Babis Chalios   2026-01-30  440  	struct vmclock_state *st = fst->st;
3b1526ddb25452 Babis Chalios   2026-01-30  441  	uint32_t seq;
3b1526ddb25452 Babis Chalios   2026-01-30  442  
3b1526ddb25452 Babis Chalios   2026-01-30  443  	/*
3b1526ddb25452 Babis Chalios   2026-01-30  444  	 * Hypervisor will not send us any notifications, so fail immediately
3b1526ddb25452 Babis Chalios   2026-01-30  445  	 * to avoid having caller sleeping for ever.
3b1526ddb25452 Babis Chalios   2026-01-30  446  	 */
3b1526ddb25452 Babis Chalios   2026-01-30  447  	if (!(le64_to_cpu(st->clk->flags) & VMCLOCK_FLAG_NOTIFICATION_PRESENT))
3b1526ddb25452 Babis Chalios   2026-01-30 @448  		return POLLHUP;
3b1526ddb25452 Babis Chalios   2026-01-30  449  
3b1526ddb25452 Babis Chalios   2026-01-30  450  	poll_wait(fp, &st->disrupt_wait, wait);
3b1526ddb25452 Babis Chalios   2026-01-30  451  
3b1526ddb25452 Babis Chalios   2026-01-30  452  	seq = le32_to_cpu(st->clk->seq_count);
3b1526ddb25452 Babis Chalios   2026-01-30  453  	if (atomic_read(&fst->seq) != seq)
3b1526ddb25452 Babis Chalios   2026-01-30  454  		return POLLIN | POLLRDNORM;
3b1526ddb25452 Babis Chalios   2026-01-30  455  
3b1526ddb25452 Babis Chalios   2026-01-30  456  	return 0;
3b1526ddb25452 Babis Chalios   2026-01-30  457  }
3b1526ddb25452 Babis Chalios   2026-01-30  458  

:::::: The code at line 448 was first introduced by commit
:::::: 3b1526ddb25452385b52f2588b655f524a57070b ptp: vmclock: support device notifications

:::::: TO: Babis Chalios <bchalios@amazon.es>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
