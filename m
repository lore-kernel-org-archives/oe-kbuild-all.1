Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F021A2545
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 04:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766117992; cv=none; b=GFFHjX3D+HVddFeQdlcuGcmV1660IgXAy4Jw8vMXYBvz6jxT1q3yTQwbGR2mPStwvhIjSQE+BW6UGVSlcF21UoKtnBCYlk1PZoKk50ITZd/PKlWSAkWS/5d7BHNDhqae7sr1KzcDb0O8rTY0dlAaYh/a9Ss8LVFEmI//kOOFxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766117992; c=relaxed/simple;
	bh=kb/q+CxMKxalJ56rYLg94hBhu2VIhCz5KjTsK7miPVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tf+lPCJQy2kRr2xBT0D/Ul2lbxb2RG/DBKf+ROwh93L/kDRCBQ6ZWYjITNBgZJ9JrNSAM7kdO8ZIredf5zxlMHXP3EwubDXOPLEp1EbbAwu33LqlnsTUJZbQRHDmOu75Qs4U/PVXMMekgq/Z0wgBuIR4JPXNp3qkhyWnjngnZKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/FwUyXa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/FwUyXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766117990; x=1797653990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kb/q+CxMKxalJ56rYLg94hBhu2VIhCz5KjTsK7miPVE=;
  b=b/FwUyXaDVsbnvSpSJ/4yvEk2GDzz0gpkel4bAngOwLC06hN38ewMgZi
   nbEbsvQa6KNfdBiDqgMSGnYniE3Fm1ItNo6ahtme0a1I4tRYmAsjhP4du
   O86I+NJMe4KOU3G5ppLYM56QPJ3EVrqcfEl6LUYZKZ7zvljtVgo5sN/Il
   jQuVFsM23WDmrUXYDWXakYhGnx0DFMgLCgtA2JK5A/k1CCAi6Mv99zyiv
   CGuRJ0Qb5TzrhPp8jNcCVyJFIh/ZeuV5SMvAQRHcYNf0n0tHEFnZAqLEi
   noaqJfVTHhB+N37p6jW0tvng+zXPK2617Z/FL72L0ZDvbi716FLxAqP52
   A==;
X-CSE-ConnectionGUID: wS4mSsXeRYyFYwK5L2Av7A==
X-CSE-MsgGUID: JXiSX1JYQy6qBHkO6uAU0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67831605"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67831605"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 20:19:49 -0800
X-CSE-ConnectionGUID: CBmk2z1dRna6EsEWo1qZ0A==
X-CSE-MsgGUID: u1kbjGZ4SnqgP5oztrZFeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="236185460"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Dec 2025 20:19:48 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWRxx-000000002zY-2Q7Q;
	Fri, 19 Dec 2025 04:19:45 +0000
Date: Fri, 19 Dec 2025 12:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-xarray:xarray 3/3] lib/xarray.c:2426:6: warning: no previous
 prototype for function 'xa_dump_index'
Message-ID: <202512191244.8tmkPR7E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/xarray.git xarray
head:   aaf7f456296680f7d1d9c04154a92050cdf5316f
commit: aaf7f456296680f7d1d9c04154a92050cdf5316f [3/3] XArray: Add CONFIG_DEBUG_XARRAY
config: arm-randconfig-004-20251216 (https://download.01.org/0day-ci/archive/20251219/202512191244.8tmkPR7E-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191244.8tmkPR7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191244.8tmkPR7E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/xarray.c:2426:6: warning: no previous prototype for function 'xa_dump_index' [-Wmissing-prototypes]
    2426 | void xa_dump_index(unsigned long index, unsigned int shift)
         |      ^
   lib/xarray.c:2426:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2426 | void xa_dump_index(unsigned long index, unsigned int shift)
         | ^
         | static 
>> lib/xarray.c:2436:6: warning: no previous prototype for function 'xa_dump_entry' [-Wmissing-prototypes]
    2436 | void xa_dump_entry(const void *entry, unsigned long index, unsigned long shift)
         |      ^
   lib/xarray.c:2436:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2436 | void xa_dump_entry(const void *entry, unsigned long index, unsigned long shift)
         | ^
         | static 
   2 warnings generated.


vim +/xa_dump_index +2426 lib/xarray.c

ad3d6c7263e368 Matthew Wilcox 2017-11-07  2425  
ad3d6c7263e368 Matthew Wilcox 2017-11-07 @2426  void xa_dump_index(unsigned long index, unsigned int shift)
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2427  {
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2428  	if (!shift)
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2429  		pr_info("%lu: ", index);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2430  	else if (shift >= BITS_PER_LONG)
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2431  		pr_info("0-%lu: ", ~0UL);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2432  	else
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2433  		pr_info("%lu-%lu: ", index, index | ((1UL << shift) - 1));
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2434  }
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2435  
ad3d6c7263e368 Matthew Wilcox 2017-11-07 @2436  void xa_dump_entry(const void *entry, unsigned long index, unsigned long shift)
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2437  {
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2438  	if (!entry)
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2439  		return;
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2440  
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2441  	xa_dump_index(index, shift);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2442  
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2443  	if (xa_is_node(entry)) {
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2444  		if (shift == 0) {
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2445  			pr_cont("%px\n", entry);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2446  		} else {
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2447  			unsigned long i;
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2448  			struct xa_node *node = xa_to_node(entry);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2449  			xa_dump_node(node);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2450  			for (i = 0; i < XA_CHUNK_SIZE; i++)
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2451  				xa_dump_entry(node->slots[i],
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2452  				      index + (i << node->shift), node->shift);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2453  		}
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2454  	} else if (xa_is_value(entry))
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2455  		pr_cont("value %ld (0x%lx) [%px]\n", xa_to_value(entry),
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2456  						xa_to_value(entry), entry);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2457  	else if (!xa_is_internal(entry))
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2458  		pr_cont("%px\n", entry);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2459  	else if (xa_is_retry(entry))
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2460  		pr_cont("retry (%ld)\n", xa_to_internal(entry));
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2461  	else if (xa_is_sibling(entry))
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2462  		pr_cont("sibling (slot %ld)\n", xa_to_sibling(entry));
9f14d4f1f1045f Matthew Wilcox 2018-10-01  2463  	else if (xa_is_zero(entry))
9f14d4f1f1045f Matthew Wilcox 2018-10-01  2464  		pr_cont("zero (%ld)\n", xa_to_internal(entry));
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2465  	else
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2466  		pr_cont("UNKNOWN ENTRY (%px)\n", entry);
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2467  }
ad3d6c7263e368 Matthew Wilcox 2017-11-07  2468  

:::::: The code at line 2426 was first introduced by commit
:::::: ad3d6c7263e368abdc151e1cc13dc78aa39cc7a7 xarray: Add XArray load operation

:::::: TO: Matthew Wilcox <willy@infradead.org>
:::::: CC: Matthew Wilcox <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
