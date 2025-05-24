Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F0C15AF6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 06:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748066667; cv=none; b=nAUlRyH6/QZO++fvAQ52LQWJbM0eSh/MtMBXDPhrkbOGd36fFnY57JLbRZxF27CJH2KXxqhdwu37NtZZ1GFxW1OwOTrRUMP0pXAJ/DUQHwV4s4RwD36bMR1SLao1MMDELG8yeHF1hM1RLUrPXRYeltiscQWzsfq0cs9szU1FdMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748066667; c=relaxed/simple;
	bh=scZnqimOcJ9PVnLWfNBkb6oslRpIQIwUMF80IMyJnpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=knuF4YTxlZBsNNrg0KjaO1kdYOYQazkA1lOK9kwGudzt6SEVE14RNTqYjRAHa/jMDzMDM2wvgsAg9PgTSCK3lO+jIHCF7XRIhT31hQ6n1BrRETa3YSf0qJFJJ22bZztgydFghc09ADAg6dCiUCjMrXha2zrkV5o51G2J677iR7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKMRSprU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKMRSprU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748066666; x=1779602666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=scZnqimOcJ9PVnLWfNBkb6oslRpIQIwUMF80IMyJnpg=;
  b=MKMRSprUyBC3MTbh75s4iA+wo9Bnj6Tlp1sQtrSHUgwZI0KHr0HsfmXV
   LHUtgJEHAxTEqYxyH2K6+9/AnyKxZGw1Xsf0d7kRvIDFqQF9U29ERTKGp
   iZzSMskyA4t7yhPUaNLeN0u8hf8g2ZkNiuWHR/yjSMAZVmo8LZt9CUrjC
   1ESbiwD1fE1XFa2BozFNJSkmTXdbDZRgzs9lvwd5f7lxSwz+DtGIRrnD2
   rDBPYGSCC0xQxJpe9TSTnejKIL+T+T5bbBBCCBOa6q8Nhjapo1rr2R0p3
   hTBbUYpIxdXHNQM/w5WvV/j8rpBZCHbowdKDTSjFITq9RfOCiIAFFxmxt
   Q==;
X-CSE-ConnectionGUID: igP43rLwSPu18S9T2Vzicw==
X-CSE-MsgGUID: wvrzjxlRQHuXoBRWtj/6Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61525379"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="61525379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:04:25 -0700
X-CSE-ConnectionGUID: FDCfi6S9QeuBLCfLVVDwQQ==
X-CSE-MsgGUID: YlyJ07AsRvyiYV33vHVa6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146635406"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 May 2025 23:04:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIhzZ-000QyW-0X;
	Sat, 24 May 2025 06:04:21 +0000
Date: Sat, 24 May 2025 14:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [jlayton:uek-localio 2037/2262] mm/list_lru.c:356: warning: Function
 parameter or struct member 'lru' not described in 'list_lru_elems_node'
Message-ID: <202505241402.oHWh0V26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: fbc8f7ca2ebf9db96aa3263c657ea2840840bdec [2037/2262] fs/dcache: Estimate the number of negative dentries to prune per filesystem
config: x86_64-buildonly-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241402.oHWh0V26-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241402.oHWh0V26-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241402.oHWh0V26-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/list_lru.c:356: warning: Function parameter or struct member 'lru' not described in 'list_lru_elems_node'
>> mm/list_lru.c:356: warning: Function parameter or struct member 'nid' not described in 'list_lru_elems_node'


vim +356 mm/list_lru.c

   350	
   351	/**
   352	 * list_lru_elems_node() - returns the number of
   353	 * elements in an list_lru for a given node.
   354	 */
   355	long list_lru_elems_node(struct list_lru *lru, int nid)
 > 356	{
   357		long nelems;
   358		struct list_lru_node *nlru = &lru->node[nid];
   359		nelems = atomic_long_read(&nlru->nr_items);
   360		return nelems;
   361	}
   362	EXPORT_SYMBOL_GPL(list_lru_elems_node);
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
