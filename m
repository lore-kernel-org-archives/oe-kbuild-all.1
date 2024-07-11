Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10212335B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720722642; cv=none; b=PZdONIM9E2tSbZ2KESqAzMPONuL+yBbgkHWWQoTnPpJt0tghXVIw+q2KyPyWkxsa7OpGnJx0PQyLDpHwiJ3WQisMWao8VDPS2QPigTXmJvxdp1WNrNn2XHeb51kvpQoURZ7+DGmJz0BL0c6tD1yBo2zXSdFHZJwHDf3TA36/RgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720722642; c=relaxed/simple;
	bh=At2h2sAPkdWuz23mMw5rwIgk6o5SyCCw1dUU0Ys4vmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rlH9aghMcX3CnkcMBrb/h8gowW8LRGtlYjibVB8EAql5ExqoWZawvv54/0V4o5W4ZjR+EVKE5UZqEC9VL4Hh4t1XSRI+4AG4gBuxNMbHBeJhfgI76H3MyD9vufhR8AwW98E2ShtT7TCn+jzHJHbEk6K0qKWFlI1zxVT0MBMPmeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIiqV9+H; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIiqV9+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720722640; x=1752258640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=At2h2sAPkdWuz23mMw5rwIgk6o5SyCCw1dUU0Ys4vmY=;
  b=UIiqV9+Hb8U/CvQGIDwZAfKAM7fhNqqwm4XLV0Kd8UWTCk6byHjJi0Iz
   d8sEyn9Zeo4whG0wsMMA7BqaS8EUigc0ksbJVrvTrAhWVuOr1RUBhf8zQ
   SS045PredK7grcPo1PqbtfGXpOFSA2PpKGP7nG6Q5NHK9TkmZHZemv4Jt
   J2QQeRMSmjtq6JrccC9mxQ0smEY2YaVV0nwDFYhxcNub56A1ihS2OfXsQ
   B3EQG6auaktjxgtopm429Mz+mGG+3z8XKI2AwaOv9AWZUeMoqpoCUj3I6
   ddsyQY53qQEf/w6xxcGGkXKFB9CD/8PQsgUiPubKEONt/x/7jgR2rWM/0
   A==;
X-CSE-ConnectionGUID: 2zBleVNARvWM1bZJlZe01g==
X-CSE-MsgGUID: THptRZaCS06Ffx4X/mMf6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29542699"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="29542699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 11:30:40 -0700
X-CSE-ConnectionGUID: 58IlXY75SMKMhQugUjJECA==
X-CSE-MsgGUID: AMSOduk/RtGIOl3SbyIEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="53246319"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jul 2024 11:30:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRyYu-000Zeg-1O;
	Thu, 11 Jul 2024 18:30:36 +0000
Date: Fri, 12 Jul 2024 02:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:write-end 44/44]
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c:497:28: error: incompatible
 pointer types passing 'struct page *' to parameter of type 'struct folio *'
Message-ID: <202407120223.xNBA2P4Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache write-end
head:   b88b8f43ca6661a6ee5e9cef00e15cdf93141141
commit: b88b8f43ca6661a6ee5e9cef00e15cdf93141141 [44/44] fs: Convert aops->write_end to take a folio
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240712/202407120223.xNBA2P4Z-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120223.xNBA2P4Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120223.xNBA2P4Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:497:28: error: incompatible pointer types passing 'struct page *' to parameter of type 'struct folio *' [-Werror,-Wincompatible-pointer-types]
     497 |                                       len - unwritten, page, data);
         |                                                        ^~~~
   drivers/gpu/drm/i915/gem/i915_gem_shmem.c:691:11: error: incompatible pointer types passing 'struct page *' to parameter of type 'struct folio *' [-Werror,-Wincompatible-pointer-types]
     691 |                                       page, pgdata);
         |                                       ^~~~
   2 errors generated.


vim +497 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

a85fffe3032d99 Maarten Lankhorst       2021-03-23  419  
8475355f7a2645 Chris Wilson            2019-05-28  420  static int
8475355f7a2645 Chris Wilson            2019-05-28  421  shmem_pwrite(struct drm_i915_gem_object *obj,
8475355f7a2645 Chris Wilson            2019-05-28  422  	     const struct drm_i915_gem_pwrite *arg)
8475355f7a2645 Chris Wilson            2019-05-28  423  {
8475355f7a2645 Chris Wilson            2019-05-28  424  	struct address_space *mapping = obj->base.filp->f_mapping;
c5edd542aa548d Matthew Wilcox (Oracle  2022-03-03  425) 	const struct address_space_operations *aops = mapping->a_ops;
8475355f7a2645 Chris Wilson            2019-05-28  426  	char __user *user_data = u64_to_user_ptr(arg->data_ptr);
8475355f7a2645 Chris Wilson            2019-05-28  427  	u64 remain, offset;
8475355f7a2645 Chris Wilson            2019-05-28  428  	unsigned int pg;
8475355f7a2645 Chris Wilson            2019-05-28  429  
8475355f7a2645 Chris Wilson            2019-05-28  430  	/* Caller already validated user args */
8475355f7a2645 Chris Wilson            2019-05-28  431  	GEM_BUG_ON(!access_ok(user_data, arg->size));
8475355f7a2645 Chris Wilson            2019-05-28  432  
a61170975718d5 Maarten Lankhorst       2021-03-23  433  	if (!i915_gem_object_has_struct_page(obj))
a61170975718d5 Maarten Lankhorst       2021-03-23  434  		return i915_gem_object_pwrite_phys(obj, arg);
a61170975718d5 Maarten Lankhorst       2021-03-23  435  
8475355f7a2645 Chris Wilson            2019-05-28  436  	/*
8475355f7a2645 Chris Wilson            2019-05-28  437  	 * Before we instantiate/pin the backing store for our use, we
8475355f7a2645 Chris Wilson            2019-05-28  438  	 * can prepopulate the shmemfs filp efficiently using a write into
8475355f7a2645 Chris Wilson            2019-05-28  439  	 * the pagecache. We avoid the penalty of instantiating all the
8475355f7a2645 Chris Wilson            2019-05-28  440  	 * pages, important if the user is just writing to a few and never
8475355f7a2645 Chris Wilson            2019-05-28  441  	 * uses the object on the GPU, and using a direct write into shmemfs
8475355f7a2645 Chris Wilson            2019-05-28  442  	 * allows it to avoid the cost of retrieving a page (either swapin
8475355f7a2645 Chris Wilson            2019-05-28  443  	 * or clearing-before-use) before it is overwritten.
8475355f7a2645 Chris Wilson            2019-05-28  444  	 */
8475355f7a2645 Chris Wilson            2019-05-28  445  	if (i915_gem_object_has_pages(obj))
8475355f7a2645 Chris Wilson            2019-05-28  446  		return -ENODEV;
8475355f7a2645 Chris Wilson            2019-05-28  447  
8475355f7a2645 Chris Wilson            2019-05-28  448  	if (obj->mm.madv != I915_MADV_WILLNEED)
8475355f7a2645 Chris Wilson            2019-05-28  449  		return -EFAULT;
8475355f7a2645 Chris Wilson            2019-05-28  450  
8475355f7a2645 Chris Wilson            2019-05-28  451  	/*
8475355f7a2645 Chris Wilson            2019-05-28  452  	 * Before the pages are instantiated the object is treated as being
8475355f7a2645 Chris Wilson            2019-05-28  453  	 * in the CPU domain. The pages will be clflushed as required before
8475355f7a2645 Chris Wilson            2019-05-28  454  	 * use, and we can freely write into the pages directly. If userspace
8475355f7a2645 Chris Wilson            2019-05-28  455  	 * races pwrite with any other operation; corruption will ensue -
8475355f7a2645 Chris Wilson            2019-05-28  456  	 * that is userspace's prerogative!
8475355f7a2645 Chris Wilson            2019-05-28  457  	 */
8475355f7a2645 Chris Wilson            2019-05-28  458  
8475355f7a2645 Chris Wilson            2019-05-28  459  	remain = arg->size;
8475355f7a2645 Chris Wilson            2019-05-28  460  	offset = arg->offset;
8475355f7a2645 Chris Wilson            2019-05-28  461  	pg = offset_in_page(offset);
8475355f7a2645 Chris Wilson            2019-05-28  462  
8475355f7a2645 Chris Wilson            2019-05-28  463  	do {
8475355f7a2645 Chris Wilson            2019-05-28  464  		unsigned int len, unwritten;
8475355f7a2645 Chris Wilson            2019-05-28  465  		struct page *page;
8475355f7a2645 Chris Wilson            2019-05-28  466  		void *data, *vaddr;
8475355f7a2645 Chris Wilson            2019-05-28  467  		int err;
ab438a61e4c367 Jani Nikula             2023-05-26  468  		char __maybe_unused c;
8475355f7a2645 Chris Wilson            2019-05-28  469  
8475355f7a2645 Chris Wilson            2019-05-28  470  		len = PAGE_SIZE - pg;
8475355f7a2645 Chris Wilson            2019-05-28  471  		if (len > remain)
8475355f7a2645 Chris Wilson            2019-05-28  472  			len = remain;
8475355f7a2645 Chris Wilson            2019-05-28  473  
8475355f7a2645 Chris Wilson            2019-05-28  474  		/* Prefault the user page to reduce potential recursion */
8475355f7a2645 Chris Wilson            2019-05-28  475  		err = __get_user(c, user_data);
8475355f7a2645 Chris Wilson            2019-05-28  476  		if (err)
8475355f7a2645 Chris Wilson            2019-05-28  477  			return err;
8475355f7a2645 Chris Wilson            2019-05-28  478  
8475355f7a2645 Chris Wilson            2019-05-28  479  		err = __get_user(c, user_data + len - 1);
8475355f7a2645 Chris Wilson            2019-05-28  480  		if (err)
8475355f7a2645 Chris Wilson            2019-05-28  481  			return err;
8475355f7a2645 Chris Wilson            2019-05-28  482  
c5edd542aa548d Matthew Wilcox (Oracle  2022-03-03  483) 		err = aops->write_begin(obj->base.filp, mapping, offset, len,
8475355f7a2645 Chris Wilson            2019-05-28  484  					&page, &data);
8475355f7a2645 Chris Wilson            2019-05-28  485  		if (err < 0)
8475355f7a2645 Chris Wilson            2019-05-28  486  			return err;
8475355f7a2645 Chris Wilson            2019-05-28  487  
756eed0f2602f7 Zhao Liu                2023-12-03  488  		vaddr = kmap_local_page(page);
756eed0f2602f7 Zhao Liu                2023-12-03  489  		pagefault_disable();
8475355f7a2645 Chris Wilson            2019-05-28  490  		unwritten = __copy_from_user_inatomic(vaddr + pg,
8475355f7a2645 Chris Wilson            2019-05-28  491  						      user_data,
8475355f7a2645 Chris Wilson            2019-05-28  492  						      len);
756eed0f2602f7 Zhao Liu                2023-12-03  493  		pagefault_enable();
756eed0f2602f7 Zhao Liu                2023-12-03  494  		kunmap_local(vaddr);
8475355f7a2645 Chris Wilson            2019-05-28  495  
c5edd542aa548d Matthew Wilcox (Oracle  2022-03-03  496) 		err = aops->write_end(obj->base.filp, mapping, offset, len,
c5edd542aa548d Matthew Wilcox (Oracle  2022-03-03 @497) 				      len - unwritten, page, data);
8475355f7a2645 Chris Wilson            2019-05-28  498  		if (err < 0)
8475355f7a2645 Chris Wilson            2019-05-28  499  			return err;
8475355f7a2645 Chris Wilson            2019-05-28  500  
8475355f7a2645 Chris Wilson            2019-05-28  501  		/* We don't handle -EFAULT, leave it to the caller to check */
8475355f7a2645 Chris Wilson            2019-05-28  502  		if (unwritten)
8475355f7a2645 Chris Wilson            2019-05-28  503  			return -ENODEV;
8475355f7a2645 Chris Wilson            2019-05-28  504  
8475355f7a2645 Chris Wilson            2019-05-28  505  		remain -= len;
8475355f7a2645 Chris Wilson            2019-05-28  506  		user_data += len;
8475355f7a2645 Chris Wilson            2019-05-28  507  		offset += len;
8475355f7a2645 Chris Wilson            2019-05-28  508  		pg = 0;
8475355f7a2645 Chris Wilson            2019-05-28  509  	} while (remain);
8475355f7a2645 Chris Wilson            2019-05-28  510  
8475355f7a2645 Chris Wilson            2019-05-28  511  	return 0;
8475355f7a2645 Chris Wilson            2019-05-28  512  }
8475355f7a2645 Chris Wilson            2019-05-28  513  

:::::: The code at line 497 was first introduced by commit
:::::: c5edd542aa548d2a086b117933eedb229768472e i915: Call aops write_begin() and write_end() directly

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Matthew Wilcox (Oracle) <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
