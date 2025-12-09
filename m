Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3EA2745C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765322958; cv=none; b=c8162NimeW+Pk5B1kK7eGLtN6wNfGXEfTCS+Tu4SlJwYo7JPf5hJGYVKqAbX6Ncl1Z5V1qnkpHqJkk0osu9QeN7j6UNl7CCY0DFh4K1kCg/+vlmBCjNcfZn8vwQ7w6zq6gdictQBYd5WKLyLTBrpQ7nRDYDrRyZtaGywcIsvikM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765322958; c=relaxed/simple;
	bh=s6UP2xCCcZ36QGKmHWcCt7umNWgpEFM3+kGXkpXW+9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMFlGwwHa9McC3kXllOB5TPA8QiEk2/8Gxol8R4ntjbxrU+HXAokne392Dob9Bnji6LDYw2fCt96gsDsb2tRejmkYvjCoDeGvEchI98OetHpqsxLFL5faqjZCyYJ1Ooc95xG0qJpbwiWLzfN4NKVBjWtIL4l8XEzDNTtOhmChuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsstWSV3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsstWSV3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765322956; x=1796858956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s6UP2xCCcZ36QGKmHWcCt7umNWgpEFM3+kGXkpXW+9A=;
  b=TsstWSV3RBDhR4B53QUgyocyDXvvA2xkocYrCangzgXcnM15dnQlLnpf
   EYNVl6uEIjn/mR0/XBaFh76YHI7tppQmtgncpazKqeAi9o/JOnhNXLu1t
   Yz8iEZ+nriKePHjJLKZ+HULTYc1QQDljSr0k8QmsipWkIlNyhJBivVisL
   6zXpSR7DpJHKkwslAdX38c0+TwM7ptU/Gf8g/RQsToZos0MJfQXoxrhJn
   BMd1DNe2VfaLQwHl7MWp3ZKhxaKlZmnXQeq0Y2fY+vJxtr4Mu1uExWN7V
   BZK9TWEAKVqjxlPOJGGSBF7IGvLNxEqGqqfJ+1dsqmYjxgIwWZk5+ETEj
   Q==;
X-CSE-ConnectionGUID: QAZ3/pMOQn6sTAYzf93owg==
X-CSE-MsgGUID: Sd+R/knuTfGP/XF7WaEahQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84703433"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="84703433"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 15:29:16 -0800
X-CSE-ConnectionGUID: yQa5mC0YQnG88Koml7fttg==
X-CSE-MsgGUID: sSwL6jKfRkKDLrXVTeH7vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196408510"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Dec 2025 15:29:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT78r-000000002Lp-20DW;
	Tue, 09 Dec 2025 23:29:13 +0000
Date: Wed, 10 Dec 2025 07:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 8/8] mm/gcma.c:459:9: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202512100705.v8XMXPej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   26ebc372eabce9c490a5186c997d9394a09dd9e5
commit: ccf872ebe474a33123adc0f822915b4cea59e684 [8/8] ANDROID: mm: introduce GCMA
config: x86_64-randconfig-r132-20251210 (https://download.01.org/0day-ci/archive/20251210/202512100705.v8XMXPej-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100705.v8XMXPej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100705.v8XMXPej-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/gcma.c:459:9: sparse: sparse: Using plain integer as NULL pointer
>> mm/gcma.c:995:23: sparse: sparse: symbol 'gcma_cleancache_ops' was not declared. Should it be static?
   mm/gcma.c:327:9: sparse: sparse: context imbalance in 'page_area_lock' - wrong count at exit
   mm/gcma.c:331:13: sparse: sparse: context imbalance in 'page_area_unlock' - unexpected unlock

vim +459 mm/gcma.c

   449	
   450	static void gcma_erase_page(struct gcma_inode *inode, unsigned long index,
   451				    struct page *page, bool put_page)
   452	{
   453		void *old;
   454	
   455		lockdep_assert_held(&inode->pages.xa_lock);
   456	
   457		/* The inode refcount will decrease when the page is freed */
   458		old = __xa_erase(&inode->pages, index);
 > 459		VM_BUG_ON(old == 0);
   460		delete_page_from_lru(page);
   461		if (put_page)
   462			gcma_put_page(page);
   463	
   464		check_and_remove_inode(inode);
   465	}
   466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
