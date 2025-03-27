Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D8C25569
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 00:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743036262; cv=none; b=XjH/5bucmLjwp2bzlqc9lHp0o3F68O2f7YLqqpDWpKbPYkC6ptw1f/29Bb9Gm+yugjicHazb3MDMFUsOe6bgB0uS9J2+u15jMzChPyWRgiXikV06XTYRQeJdOxqumyLB/4lo6yBSjlsxfQFGtYKLa1PlUrVK5iHcH1/FAu4Rnz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743036262; c=relaxed/simple;
	bh=kfRFT3n4kIAFvG+D7s75VgwXZFXdmPeIdXhFTtc2Pjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cBH7f9wtcu8AJ7Lm5I5r7Yy+3ZLlJdEANdcfDOmZ/GZyetA0V5L9N6U+5mD07fGBGv6Jv3fC3dUSqqMRNU1Lwb7A4jV3Tw3mDbwv/t6N92uHJyX4wOUOs+K16gn8m63Dxft82HeSlxujpQI8KaIWAiQhjVo0gT93rtWiw7sSo4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcV3Gl4+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcV3Gl4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743036261; x=1774572261;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kfRFT3n4kIAFvG+D7s75VgwXZFXdmPeIdXhFTtc2Pjs=;
  b=HcV3Gl4+eKugSk7/vvquXBWp/iD1r32VcaOWXCHBg2raOdLyOaNRhx9s
   C5tee3TbdL9loyau+tn7OjSgwJb5uV6XPi6uKIXMoZ6ZF/Tgm20C96uJ6
   1ZvR7+WBY9y8R4FWgu6JXvxf69u2PBF7fqBuANCh6w8UPST4bmYtEM1tM
   HYuwOimOGObC5rXMKoIEAZ7uSoc4F6Da6jKM1F7RmQUTKt8xp+x+9skYc
   qY/q/Ec5tgGdr9c6l8cWkU/svSvtVy6ujOfR9nJglayflQ/hijCV8GUsb
   bj5AzgeFp1a8eaSxEPbLl1CpXrPKMRerJMGG8Put5zQJZI7EYqAoTewKZ
   A==;
X-CSE-ConnectionGUID: z+S5AQiNSVetqOsjrfIGCA==
X-CSE-MsgGUID: JM43iLjSRtCDrwhTTT/DlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61877660"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="61877660"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 17:44:20 -0700
X-CSE-ConnectionGUID: GNamC+dJQT28iFGne8XA6A==
X-CSE-MsgGUID: VupAAq7BRbev1Izs1rjXOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="155949002"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 26 Mar 2025 17:44:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txbM1-0006FB-0t;
	Thu, 27 Mar 2025 00:44:17 +0000
Date: Thu, 27 Mar 2025 08:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 501/501]
 drivers/dma-buf/dma-heap.c:430:6: warning: no previous prototype for
 function 'dma_heap_try_get_pool_size_kb'
Message-ID: <202503270849.RBK9EdT1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   762a13f385d861193f9d810f84780bdd56146d74
commit: 39928be70c26ba280233363e634e7bd47da4cd10 [501/501] FROMLIST: dma-heap: Add proper kref handling on dma-buf heaps
config: arm-randconfig-003-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270849.RBK9EdT1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270849.RBK9EdT1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270849.RBK9EdT1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:56:18: warning: no previous prototype for function 'dma_heap_find' [-Wmissing-prototypes]
      56 | struct dma_heap *dma_heap_find(const char *name)
         |                  ^
   drivers/dma-buf/dma-heap.c:56:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      56 | struct dma_heap *dma_heap_find(const char *name)
         | ^
         | static 
   drivers/dma-buf/dma-heap.c:74:6: warning: no previous prototype for function 'dma_heap_buffer_free' [-Wmissing-prototypes]
      74 | void dma_heap_buffer_free(struct dma_buf *dmabuf)
         |      ^
   drivers/dma-buf/dma-heap.c:74:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      74 | void dma_heap_buffer_free(struct dma_buf *dmabuf)
         | ^
         | static 
   drivers/dma-buf/dma-heap.c:95:8: error: call to undeclared function '__PAGE_ALIGN'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      95 |         len = __PAGE_ALIGN(len);
         |               ^
   drivers/dma-buf/dma-heap.c:80:17: warning: no previous prototype for function 'dma_heap_buffer_alloc' [-Wmissing-prototypes]
      80 | struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
         |                 ^
   drivers/dma-buf/dma-heap.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
         | ^
         | static 
   drivers/dma-buf/dma-heap.c:108:5: warning: no previous prototype for function 'dma_heap_bufferfd_alloc' [-Wmissing-prototypes]
     108 | int dma_heap_bufferfd_alloc(struct dma_heap *heap, size_t len,
         |     ^
   drivers/dma-buf/dma-heap.c:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     108 | int dma_heap_bufferfd_alloc(struct dma_heap *heap, size_t len,
         | ^
         | static 
   drivers/dma-buf/dma-heap.c:287:16: warning: no previous prototype for function 'dma_heap_get_dev' [-Wmissing-prototypes]
     287 | struct device *dma_heap_get_dev(struct dma_heap *heap)
         |                ^
   drivers/dma-buf/dma-heap.c:287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     287 | struct device *dma_heap_get_dev(struct dma_heap *heap)
         | ^
         | static 
   drivers/dma-buf/dma-heap.c:400:13: error: redefinition of 'dma_heap_release'
     400 | static void dma_heap_release(struct kref *ref)
         |             ^
   drivers/dma-buf/dma-heap.c:253:13: note: previous definition is here
     253 | static void dma_heap_release(struct kref *ref)
         |             ^
   drivers/dma-buf/dma-heap.c:420:6: error: redefinition of 'dma_heap_put'
     420 | void dma_heap_put(struct dma_heap *heap)
         |      ^
   drivers/dma-buf/dma-heap.c:268:6: note: previous definition is here
     268 | void dma_heap_put(struct dma_heap *h)
         |      ^
>> drivers/dma-buf/dma-heap.c:430:6: warning: no previous prototype for function 'dma_heap_try_get_pool_size_kb' [-Wmissing-prototypes]
     430 | long dma_heap_try_get_pool_size_kb(void)
         |      ^
   drivers/dma-buf/dma-heap.c:430:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     430 | long dma_heap_try_get_pool_size_kb(void)
         | ^
         | static 
   6 warnings and 3 errors generated.


vim +/dma_heap_try_get_pool_size_kb +430 drivers/dma-buf/dma-heap.c

c02a81fba74fe34 Andrew F. Davis 2019-12-03  429  
66c7ba200ce6412 Sooyong Suk     2024-07-04 @430  long dma_heap_try_get_pool_size_kb(void)
66c7ba200ce6412 Sooyong Suk     2024-07-04  431  {
66c7ba200ce6412 Sooyong Suk     2024-07-04  432  	struct dma_heap *heap;
66c7ba200ce6412 Sooyong Suk     2024-07-04  433  	u64 total_pool_size = 0;
66c7ba200ce6412 Sooyong Suk     2024-07-04  434  
66c7ba200ce6412 Sooyong Suk     2024-07-04  435  	if (!mutex_trylock(&heap_list_lock))
66c7ba200ce6412 Sooyong Suk     2024-07-04  436  		return -1;
66c7ba200ce6412 Sooyong Suk     2024-07-04  437  
66c7ba200ce6412 Sooyong Suk     2024-07-04  438  	list_for_each_entry(heap, &heap_list, list) {
66c7ba200ce6412 Sooyong Suk     2024-07-04  439  		if (heap->ops->get_pool_size)
66c7ba200ce6412 Sooyong Suk     2024-07-04  440  			total_pool_size += heap->ops->get_pool_size(heap);
66c7ba200ce6412 Sooyong Suk     2024-07-04  441  	}
66c7ba200ce6412 Sooyong Suk     2024-07-04  442  	mutex_unlock(&heap_list_lock);
66c7ba200ce6412 Sooyong Suk     2024-07-04  443  
66c7ba200ce6412 Sooyong Suk     2024-07-04  444  	return (long)(total_pool_size / 1024);
66c7ba200ce6412 Sooyong Suk     2024-07-04  445  }
66c7ba200ce6412 Sooyong Suk     2024-07-04  446  EXPORT_SYMBOL_GPL(dma_heap_try_get_pool_size_kb);
66c7ba200ce6412 Sooyong Suk     2024-07-04  447  

:::::: The code at line 430 was first introduced by commit
:::::: 66c7ba200ce6412ebf39d89f8f59806a2a48e9cc ANDROID: dma-buf: add dma_heap_try_get_pool_size_kb for vendor hook

:::::: TO: Sooyong Suk <s.suk@samsung.corp-partner.google.com>
:::::: CC: Suren Baghdasaryan <surenb@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
