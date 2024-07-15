Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA6322626
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jul 2024 23:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721085523; cv=none; b=ZGuOWJDe547CkUvyL8Yv2zSiQE4opgl45Zbfit+aUv8k7X8vxzjCl0NP1HCBg8dbR04yXYDN0nULvMkzypq5zCFQM4YFON8V1/1A280XEuiyeGyWM2b/YWy/9A/wm6mdUbK3s/5Vz1v7TezmlBe1G2oTEtV11DzXkRYe+vpCMys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721085523; c=relaxed/simple;
	bh=Y8nEyhmKQKpF+IYJ4xX6nv1nO32P4KfvNtikpGojRlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buwoGk3c3Eu5gPJ8YE+2Ja6Nn6IEz7fqQllusPeurHz5wJx4UlY3vfCZg6RCjVr+P0ZZuVlPkewjtoEHtUchBAOXh3GlZ7hHgVnDVz7Jm0lN4NxezkD+gB7KpuUZQVEbvjmfH+GcduYGuhFGedhcppF435e+B6qhHm+Tx12TWw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJvl8Hct; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJvl8Hct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721085521; x=1752621521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y8nEyhmKQKpF+IYJ4xX6nv1nO32P4KfvNtikpGojRlU=;
  b=lJvl8HctAZtakatHriXdwgWkMw/JlmUXYVIvX5CnjHG2oj1ySGTqXwUt
   5y+rv9Ya2NDAYYYzRPwaZ2x87IALr0NPPG51kqRNkhEnBaLqsY6jxEbiz
   meM6DNxSF7Ojt9YL+yldBhO3vl5b46Fk6ST55bGZSi3AlC9HCkA0J18vF
   G9vidMW7aFkYCb1U4txvOxxC6afA0rdyO3t8tamzjfeFgvk0/XpdNCubz
   6v4bJ2yhKq0bYOfR6dUfxKlh6wtuWOjpLJMnaX0HY2vwaLimmwxuFo0b6
   /TjALKI1Q9HvFfkgOo7ltW06pY8t0FEYtVSzYLm0fNMqKADF96L+oLdR5
   Q==;
X-CSE-ConnectionGUID: AkQfFpinSbiw2/33D+i4Nw==
X-CSE-MsgGUID: RohiY/l6S6SNA5lMW6YC8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22258579"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="22258579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 16:18:41 -0700
X-CSE-ConnectionGUID: 7VOs8iAvSaKfnKDFgnGyhQ==
X-CSE-MsgGUID: 3voCNVnMSaGP/CYNxL8kuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49870367"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 15 Jul 2024 16:18:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTUxp-000ee6-0K;
	Mon, 15 Jul 2024 23:18:37 +0000
Date: Tue, 16 Jul 2024 07:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:write-end 52/52]
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c:461:9: error: 'offset' undeclared;
 did you mean 'off_t'?
Message-ID: <202407160701.ou1rVC76-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache write-end
head:   a875d4f14434467d21cd6cbe9a5e2366d6405a85
commit: a875d4f14434467d21cd6cbe9a5e2366d6405a85 [52/52] fs: Convert aops->write_begin to take a folio
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240716/202407160701.ou1rVC76-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407160701.ou1rVC76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407160701.ou1rVC76-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_shmem.c: In function 'shmem_pwrite':
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:461:9: error: 'offset' undeclared (first use in this function); did you mean 'off_t'?
     461 |         offset = arg->offset;
         |         ^~~~~~
         |         off_t
   drivers/gpu/drm/i915/gem/i915_gem_shmem.c:461:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:485:42: error: 'folio' undeclared (first use in this function)
     485 |                                         &folio, &data);
         |                                          ^~~~~
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:466:30: warning: unused variable 'page' [-Wunused-variable]
     466 |                 struct page *page;
         |                              ^~~~
   drivers/gpu/drm/i915/gem/i915_gem_shmem.c: In function 'i915_gem_object_create_shmem_from_data':
>> drivers/gpu/drm/i915/gem/i915_gem_shmem.c:678:32: warning: unused variable 'vaddr' [-Wunused-variable]
     678 |                 void *pgdata, *vaddr;
         |                                ^~~~~


vim +461 drivers/gpu/drm/i915/gem/i915_gem_shmem.c

a85fffe3032d99 Maarten Lankhorst       2021-03-23  419  
8475355f7a2645 Chris Wilson            2019-05-28  420  static int
8475355f7a2645 Chris Wilson            2019-05-28  421  shmem_pwrite(struct drm_i915_gem_object *obj,
8475355f7a2645 Chris Wilson            2019-05-28  422  	     const struct drm_i915_gem_pwrite *arg)
8475355f7a2645 Chris Wilson            2019-05-28  423  {
8475355f7a2645 Chris Wilson            2019-05-28  424  	struct address_space *mapping = obj->base.filp->f_mapping;
c5edd542aa548d Matthew Wilcox (Oracle  2022-03-03  425) 	const struct address_space_operations *aops = mapping->a_ops;
8475355f7a2645 Chris Wilson            2019-05-28  426  	char __user *user_data = u64_to_user_ptr(arg->data_ptr);
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15  427) 	u64 remain;
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15  428) 	loff_t pos;
8475355f7a2645 Chris Wilson            2019-05-28  429  	unsigned int pg;
8475355f7a2645 Chris Wilson            2019-05-28  430  
8475355f7a2645 Chris Wilson            2019-05-28  431  	/* Caller already validated user args */
8475355f7a2645 Chris Wilson            2019-05-28  432  	GEM_BUG_ON(!access_ok(user_data, arg->size));
8475355f7a2645 Chris Wilson            2019-05-28  433  
a61170975718d5 Maarten Lankhorst       2021-03-23  434  	if (!i915_gem_object_has_struct_page(obj))
a61170975718d5 Maarten Lankhorst       2021-03-23  435  		return i915_gem_object_pwrite_phys(obj, arg);
a61170975718d5 Maarten Lankhorst       2021-03-23  436  
8475355f7a2645 Chris Wilson            2019-05-28  437  	/*
8475355f7a2645 Chris Wilson            2019-05-28  438  	 * Before we instantiate/pin the backing store for our use, we
8475355f7a2645 Chris Wilson            2019-05-28  439  	 * can prepopulate the shmemfs filp efficiently using a write into
8475355f7a2645 Chris Wilson            2019-05-28  440  	 * the pagecache. We avoid the penalty of instantiating all the
8475355f7a2645 Chris Wilson            2019-05-28  441  	 * pages, important if the user is just writing to a few and never
8475355f7a2645 Chris Wilson            2019-05-28  442  	 * uses the object on the GPU, and using a direct write into shmemfs
8475355f7a2645 Chris Wilson            2019-05-28  443  	 * allows it to avoid the cost of retrieving a page (either swapin
8475355f7a2645 Chris Wilson            2019-05-28  444  	 * or clearing-before-use) before it is overwritten.
8475355f7a2645 Chris Wilson            2019-05-28  445  	 */
8475355f7a2645 Chris Wilson            2019-05-28  446  	if (i915_gem_object_has_pages(obj))
8475355f7a2645 Chris Wilson            2019-05-28  447  		return -ENODEV;
8475355f7a2645 Chris Wilson            2019-05-28  448  
8475355f7a2645 Chris Wilson            2019-05-28  449  	if (obj->mm.madv != I915_MADV_WILLNEED)
8475355f7a2645 Chris Wilson            2019-05-28  450  		return -EFAULT;
8475355f7a2645 Chris Wilson            2019-05-28  451  
8475355f7a2645 Chris Wilson            2019-05-28  452  	/*
8475355f7a2645 Chris Wilson            2019-05-28  453  	 * Before the pages are instantiated the object is treated as being
8475355f7a2645 Chris Wilson            2019-05-28  454  	 * in the CPU domain. The pages will be clflushed as required before
8475355f7a2645 Chris Wilson            2019-05-28  455  	 * use, and we can freely write into the pages directly. If userspace
8475355f7a2645 Chris Wilson            2019-05-28  456  	 * races pwrite with any other operation; corruption will ensue -
8475355f7a2645 Chris Wilson            2019-05-28  457  	 * that is userspace's prerogative!
8475355f7a2645 Chris Wilson            2019-05-28  458  	 */
8475355f7a2645 Chris Wilson            2019-05-28  459  
8475355f7a2645 Chris Wilson            2019-05-28  460  	remain = arg->size;
8475355f7a2645 Chris Wilson            2019-05-28 @461  	offset = arg->offset;
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15  462) 	pg = offset_in_page(pos);
8475355f7a2645 Chris Wilson            2019-05-28  463  
8475355f7a2645 Chris Wilson            2019-05-28  464  	do {
8475355f7a2645 Chris Wilson            2019-05-28  465  		unsigned int len, unwritten;
8475355f7a2645 Chris Wilson            2019-05-28 @466  		struct page *page;
8475355f7a2645 Chris Wilson            2019-05-28  467  		void *data, *vaddr;
8475355f7a2645 Chris Wilson            2019-05-28  468  		int err;
ab438a61e4c367 Jani Nikula             2023-05-26  469  		char __maybe_unused c;
8475355f7a2645 Chris Wilson            2019-05-28  470  
8475355f7a2645 Chris Wilson            2019-05-28  471  		len = PAGE_SIZE - pg;
8475355f7a2645 Chris Wilson            2019-05-28  472  		if (len > remain)
8475355f7a2645 Chris Wilson            2019-05-28  473  			len = remain;
8475355f7a2645 Chris Wilson            2019-05-28  474  
8475355f7a2645 Chris Wilson            2019-05-28  475  		/* Prefault the user page to reduce potential recursion */
8475355f7a2645 Chris Wilson            2019-05-28  476  		err = __get_user(c, user_data);
8475355f7a2645 Chris Wilson            2019-05-28  477  		if (err)
8475355f7a2645 Chris Wilson            2019-05-28  478  			return err;
8475355f7a2645 Chris Wilson            2019-05-28  479  
8475355f7a2645 Chris Wilson            2019-05-28  480  		err = __get_user(c, user_data + len - 1);
8475355f7a2645 Chris Wilson            2019-05-28  481  		if (err)
8475355f7a2645 Chris Wilson            2019-05-28  482  			return err;
8475355f7a2645 Chris Wilson            2019-05-28  483  
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15  484) 		err = aops->write_begin(obj->base.filp, mapping, pos, len,
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15 @485) 					&folio, &data);
8475355f7a2645 Chris Wilson            2019-05-28  486  		if (err < 0)
8475355f7a2645 Chris Wilson            2019-05-28  487  			return err;
8475355f7a2645 Chris Wilson            2019-05-28  488  
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15  489) 		vaddr = kmap_local_folio(folio, offset_in_folio(folio, pos));
756eed0f2602f7 Zhao Liu                2023-12-03  490  		pagefault_disable();
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15  491) 		unwritten = __copy_from_user_inatomic(vaddr, user_data, len);
756eed0f2602f7 Zhao Liu                2023-12-03  492  		pagefault_enable();
756eed0f2602f7 Zhao Liu                2023-12-03  493  		kunmap_local(vaddr);
8475355f7a2645 Chris Wilson            2019-05-28  494  
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15  495) 		err = aops->write_end(obj->base.filp, mapping, pos, len,
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15  496) 				      len - unwritten, folio, data);
8475355f7a2645 Chris Wilson            2019-05-28  497  		if (err < 0)
8475355f7a2645 Chris Wilson            2019-05-28  498  			return err;
8475355f7a2645 Chris Wilson            2019-05-28  499  
8475355f7a2645 Chris Wilson            2019-05-28  500  		/* We don't handle -EFAULT, leave it to the caller to check */
8475355f7a2645 Chris Wilson            2019-05-28  501  		if (unwritten)
8475355f7a2645 Chris Wilson            2019-05-28  502  			return -ENODEV;
8475355f7a2645 Chris Wilson            2019-05-28  503  
8475355f7a2645 Chris Wilson            2019-05-28  504  		remain -= len;
8475355f7a2645 Chris Wilson            2019-05-28  505  		user_data += len;
a875d4f1443446 Matthew Wilcox (Oracle  2024-07-15  506) 		pos += len;
8475355f7a2645 Chris Wilson            2019-05-28  507  		pg = 0;
8475355f7a2645 Chris Wilson            2019-05-28  508  	} while (remain);
8475355f7a2645 Chris Wilson            2019-05-28  509  
8475355f7a2645 Chris Wilson            2019-05-28  510  	return 0;
8475355f7a2645 Chris Wilson            2019-05-28  511  }
8475355f7a2645 Chris Wilson            2019-05-28  512  

:::::: The code at line 461 was first introduced by commit
:::::: 8475355f7a2645a022288301c03555c31fb4de17 drm/i915: Move shmem object setup to its own file

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
