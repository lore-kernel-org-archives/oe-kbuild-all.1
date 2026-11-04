Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830741;
	b=y2zt39ssjadQOmRmg6OXi2SWI/03ySvoVxgnPReFsymkJ2eo+scxv9vwod+QDK+OBQap
	 Zljv6amJR6zi543WMT41qAiOk7YZ75Yzp6UKQp+qMZC0uvxRWyOklwkmsYyGzGEjSKHs4
	 93JSw+alRm+mUHV5nfkUlVL9QvnNKOyP3ptGBJBvJI47aXLOSOlQduK/hC3Go0Hr8JIuh
	 CIl26+n2oArpJ2xhj+2w67JsNvvA4C0sB7IdkggXbWLK0e9rNxonYDcfh9uiknigbycFn
	 oYhkTNARxcM2xCQEtCqPa8KrrGJxzwnvHinLt1MzutwBv8KhQiyrukHJ/vVGSDvbjkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830741;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=RDSg9N8LyX9mf31fseZb+BEXyymhtjS9ASWPpjQC+ME=;
	b=LuZ9bMBuBitXqxp9atkE6+9CVq/eXiFKr4Eqkr3rVp6Rm/hp0t6kp64e3O13FlHwQTgL
	 kQCUAW0eAuMb6o/hyL/4mYis1XUR/KZLY34WGfP4TpYPHxx9bFnx9MZIP9mU8+9QR3y4T
	 WOcp8/yytjxjiBnl1Eyvxt45abuQu6TANKZYyNaElbN5MXG6rCmZdAwp13RhEzk/hghbK
	 9CHd/YRkeyJ1OzljND7PyBM9me2HseBF0awgCffWYlkpsSB4s1DYM4Qj1zGydyTHxB+gG
	 TxDzS4vfaAyaXpHMElWUtUXQJ+3Ih/m7g8r/2eSwCNYXhDzAWPRdgZkplOmJldsgzGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O6hGc0hk;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B0606AC0E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 22:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4B0606AC0E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O6hGc0hk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793830740; x=1825366740;
  h=date:from:to:cc:subject:message-id;
  bh=4WV4FxP+9ZtG55NfJHLRfizbeg7mWCH6HmeAxJTxW7s=;
  b=O6hGc0hkbOtjKlCiZdAw+88O01kWkV/SIub3aetpGuyO8Sg0gcoylnHe
   3Zl8Gbau6zlxuHYQGJDvJ+kN4X3qO/n1ZrZ7QwRz2sCXUtx7AkgGbl//a
   CIcjhIBSiab1V7Y+KG5kJWrPEr7FvU9T/lgGKGwuPS1ZG4/28+SKBmZ9h
   LNYeBDgW1uT5Wyiatjp/MsPrzXL/9ixXADlB93zi5aKHzIa1uqM6WUwXD
   6k0PX/35Rr552QE5nWZ00WORtHga7rzVsBDNTGgoL9XV25b0BlktkDAd9
   3q8RyKzCGxRV+deGBXuDegNaU1/wWnpKcu1+mPsihIfGrDSJEvh6qBtqI
   Q==;
X-CSE-ConnectionGUID: 6CXM7SSDSBql7YHpfLRTRw==
X-CSE-MsgGUID: gLyevxThRGylO8em7v+eTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2598626"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2598626"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 14:18:59 -0800
X-CSE-ConnectionGUID: sLRbVhGbT4yjop6QOKOF4Q==
X-CSE-MsgGUID: nF+wAq93SuWiUkPEGpW9yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7149168"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2026 14:18:58 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOjJo-000000009HD-0x64;
	Wed, 04 Nov 2026 22:18:56 +0000
Date: Wed, 04 Nov 2026 23:18:46 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 8/8] mm/gcma.c:459:9: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202611042335.Ib92ULSO-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   0ded20fe17312e3beb85ae8d0d95984036fe32cd
commit: 5019ce82e0f28db9c8d3a45e77b3efcafb366bbd [8/8] ANDROID: mm: introduce GCMA
config: arm64-randconfig-r2304-20261104 (https://download.01.org/0day-ci/archive/20261104/202611042335.Ib92ULSO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611042335.Ib92ULSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611042335.Ib92ULSO-lkp@intel.com/

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
