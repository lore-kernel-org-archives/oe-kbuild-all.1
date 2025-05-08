Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B0525291C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718336; cv=none; b=u+xX/UvykBIAnn41zj6vs4nPpc1+tk5kfnNMnMYrwDCknT+uwdRQH2FOM+LGbzCG7ylrEHMgaRru/9WoQy98tT4IMRAYaMJVmUDLOuxv1C0ZFKDomn3gOLEn6GsQH3JFuOFxPL0nNdM2g6K8cYpasDiUf4Nk3nuLoloxqn88tAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718336; c=relaxed/simple;
	bh=KXmSsEVWXbDBYFjZXJ+BVtjuIwOgsLGdnB96vnEe0pA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qizz86WBBC3N4hBgsBVwwoB6fOkUaEPEMMrsY/W2GlSGQqDY1hIL3zIYKCqr5KHogZYKfaL0zD6QJcWFBDjaltUEn7iJiL4r3Z88FRACs+SRyC4r1L3lCdPiC4SEZCSKIb5WZIvaec3/+/qNeGdnk/okSOd6h33Dlnu3N9lTSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sgs3KdMx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sgs3KdMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746718335; x=1778254335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXmSsEVWXbDBYFjZXJ+BVtjuIwOgsLGdnB96vnEe0pA=;
  b=Sgs3KdMxlD8+zuiE1HcJxYsjGgo5glszGSGw6fPL6HzjhxLew655I1WE
   bT8Xw3UxuFXgByEu6V9dRPjF1p8Nndtfj5kfgK4rYpvFqEgTsECNF6Fue
   iQUAlGH9b6Fg4k7Bcr4Xf/OK0y2aF6HVcFPlrjJUpwFPJ0g4C1RINwHpN
   cpN80H/tOoh+n2794r0veXVIdZy1OMDKKBG8v5cGs1aag02gOK0PX8n/6
   ljgKMQ4p8QVOqFJvZoqxTRshUXkqtwxSIRvAwUz5cShd7JfPYFxGdM2EH
   vZsQtg0ff1kY4katcFd7sxTXYd78GIu8GG2EXo9buL5eey1ZFrtpCscqP
   Q==;
X-CSE-ConnectionGUID: yM+W8grSQXK2MM4mQWCChw==
X-CSE-MsgGUID: a+BvfpjuRm6IDsdC+BLQmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58721697"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="58721697"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 08:32:15 -0700
X-CSE-ConnectionGUID: wTBMEWhmRF2UtiVEtXk+RQ==
X-CSE-MsgGUID: d8GbY3ITQbiNjmjX9LZpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="137257447"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2025 08:32:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD3EI-000B6J-35;
	Thu, 08 May 2025 15:32:10 +0000
Date: Thu, 8 May 2025 23:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] mm/gcma.c:459:9: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202505082349.IyQAy9uI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   46aa903098c6fecedccae50264ae2eedb7686512
commit: ccf872ebe474a33123adc0f822915b4cea59e684 [2/2] ANDROID: mm: introduce GCMA
config: x86_64-randconfig-r132-20250508 (https://download.01.org/0day-ci/archive/20250508/202505082349.IyQAy9uI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505082349.IyQAy9uI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082349.IyQAy9uI-lkp@intel.com/

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
