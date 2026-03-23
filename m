Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9398383C78
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 22:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774306523; cv=none; b=B591rpJqmkQ3f2O7oSmfWDTtf6Qo9gD+3yqzYgPeo0atXDt7xDgZqTCLrleOManR1VDB+AGegqGCyvrTcLrt5EbKRJ8vjpTcy7bzXb9l+fm3fMyqIUsHlXZKKLO0cb24GL/+7GBo9IBpQFxzL7I0/JceAHTr910a4K7EiXMuqOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774306523; c=relaxed/simple;
	bh=8vkcENjgQqFXNlFECp/e0yeDGOKHLRKYyrGr/ZfpEYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zp77hB0JV6Lu+Ut+1S4+yH7kihhgzdbtmFbUy/Eg6dR8NeJrTMphPg1UKZmtvl4nLvPgQYpPvo/wgJ96dhQVnNqWrJ6m0zYSUT6dAkVPgtqj70fpHdIp/0JIJ4X9JfXU5CM4OMQDOhFuH95wI+Go+aXPCr1PLGxQ3RF1vMHv4n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PEaXMLH0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PEaXMLH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774306521; x=1805842521;
  h=date:from:to:cc:subject:message-id;
  bh=8vkcENjgQqFXNlFECp/e0yeDGOKHLRKYyrGr/ZfpEYU=;
  b=PEaXMLH0t9zpuhz6vqF30xFgvEhC5s18F7d62kH/RegZ67erLtF9PEC7
   5ZGyofELC5KicY+DKUKefgPnSrzt4KfBShbLFVF0yg4kUgKB0ZMMDWS8p
   Xc7AoYiwdwJ9KlxXyHM4c+a5/fUxUy7PAyyxPxR8O/EnrUNCSZfhmBt48
   Kp09RiwHGZ/gktNff4k/6VXQ17KHytueWzzvkyZOaELbBjB1A7IaUw0e5
   mMG+9w5DNzWvrxzUpWJnXURhQ4K25T6cEV5hBlxcLHuZUsE78niX/8hfO
   oi2nlfH5gvLw+IehiX2cWWpkjFKId/UeiVPD1vJG9QsnPB+8hTFYPw17G
   Q==;
X-CSE-ConnectionGUID: Nygxfr4MTvOloIsd5aUzqg==
X-CSE-MsgGUID: pSqER6WUSQ6UVXsDYhqcBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86685644"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86685644"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 15:55:21 -0700
X-CSE-ConnectionGUID: 3SS9XGXoQO25fvbiHGCnVQ==
X-CSE-MsgGUID: 30swnMIMTIiPH5uQCeeJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="262085543"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Mar 2026 15:55:19 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4oB3-000000003MZ-1ooy;
	Mon, 23 Mar 2026 22:55:17 +0000
Date: Tue, 24 Mar 2026 06:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 5/5] mm/gcma.c:459:9: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202603240637.XGF1PHKY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   14b4f4e6ece41c19c9f4f6c76b62f8f9690d3e33
commit: ccf872ebe474a33123adc0f822915b4cea59e684 [5/5] ANDROID: mm: introduce GCMA
config: i386-randconfig-r121-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240637.XGF1PHKY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240637.XGF1PHKY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240637.XGF1PHKY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/gcma.c:459:9: sparse: sparse: Using plain integer as NULL pointer
>> mm/gcma.c:995:23: sparse: sparse: symbol 'gcma_cleancache_ops' was not declared. Should it be static?
   mm/gcma.c:321:13: sparse: sparse: context imbalance in 'page_area_lock' - wrong count at exit
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
