Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07F137930
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 21:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743024689; cv=none; b=WolTMbSkOAun3D1Kqj6GXt087XTgNei2t36qWv36Z6+ShT4HjEBoCC8ZhFmQxLewr+Kc7n+ubf3gow4BWOYlyIYR1H+wFl0UcAndFNx0Bs2TSLqd51FtEZDXIq1kcZIpJl3HFu2/XlWUDIgUCrKQcUKe7oiilug5zr7ZwiZqRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743024689; c=relaxed/simple;
	bh=UgT8W+h7txCXgXZcTekA5GtUyqqIU8FcJLIhLeYGrl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQsYXIWdkYk8QAakECqGdJmyC1g49xp2TT/kVd97Tz+wkVZ7lJDbzaGyQJAtNsjX7gW22NBXh9xXfLpHB7/M9Vvrgj40LZmzWWaE9opVmlqJbGbcByw9lVFNrhsUfJoVD5wCYBC4uIISc85fLODbYnxapScijem+tLGto0lMT9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fG+g5tuU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fG+g5tuU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743024687; x=1774560687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgT8W+h7txCXgXZcTekA5GtUyqqIU8FcJLIhLeYGrl4=;
  b=fG+g5tuUNQM6erZw9nQIMIbSLBaheqvvC1I5qTucTuOjK9YkZdpaiC4v
   f5/SOD6o9SoBHBpn547NvA96ZCxtgHGu+PdxR+4n9E45qibucxUEL67TZ
   9Gu2iB+6REWCMUPoaD6PNelu86ZIHyeOHzAjXQLlY8orhE5QIVnsDUcS0
   tb+ZxrEvvQ19B/yCcRYy2fNckQuLIExRQOKEA/575Cx09K/NgPZk11XuQ
   xUNbq1gltDNnpPLBNFR4i0suyVyZRw37yQqmXyYRfYrVEVcNJds7umFoI
   +Ax16+QMGCSAqXh8eUsp+HGPzq6kCWRvaSapzWgvogSdcDOCo6ste+giy
   A==;
X-CSE-ConnectionGUID: PS4JFWMoR7eKGNRM4SDCHQ==
X-CSE-MsgGUID: 2s+5zfL1RWSLt5Co7JQm8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44458492"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="44458492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 14:31:26 -0700
X-CSE-ConnectionGUID: E5KTKfbJQ0+o44Eb4G7gRw==
X-CSE-MsgGUID: etLmXy61Rh6qFMAa+R4xxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="125430136"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2025 14:31:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txYLL-00065b-03;
	Wed, 26 Mar 2025 21:31:23 +0000
Date: Thu, 27 Mar 2025 05:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 501/501]
 drivers/dma-buf/dma-heap.c:430:6: warning: no previous prototype for
 'dma_heap_try_get_pool_size_kb'
Message-ID: <202503270519.EGEfuzGt-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-005-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270519.EGEfuzGt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270519.EGEfuzGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270519.EGEfuzGt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:56:18: warning: no previous prototype for 'dma_heap_find' [-Wmissing-prototypes]
      56 | struct dma_heap *dma_heap_find(const char *name)
         |                  ^~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:74:6: warning: no previous prototype for 'dma_heap_buffer_free' [-Wmissing-prototypes]
      74 | void dma_heap_buffer_free(struct dma_buf *dmabuf)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:80:17: warning: no previous prototype for 'dma_heap_buffer_alloc' [-Wmissing-prototypes]
      80 | struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:108:5: warning: no previous prototype for 'dma_heap_bufferfd_alloc' [-Wmissing-prototypes]
     108 | int dma_heap_bufferfd_alloc(struct dma_heap *heap, size_t len,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:287:16: warning: no previous prototype for 'dma_heap_get_dev' [-Wmissing-prototypes]
     287 | struct device *dma_heap_get_dev(struct dma_heap *heap)
         |                ^~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:400:13: error: redefinition of 'dma_heap_release'
     400 | static void dma_heap_release(struct kref *ref)
         |             ^~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:253:13: note: previous definition of 'dma_heap_release' with type 'void(struct kref *)'
     253 | static void dma_heap_release(struct kref *ref)
         |             ^~~~~~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:420:6: error: redefinition of 'dma_heap_put'
     420 | void dma_heap_put(struct dma_heap *heap)
         |      ^~~~~~~~~~~~
   drivers/dma-buf/dma-heap.c:268:6: note: previous definition of 'dma_heap_put' with type 'void(struct dma_heap *)'
     268 | void dma_heap_put(struct dma_heap *h)
         |      ^~~~~~~~~~~~
>> drivers/dma-buf/dma-heap.c:430:6: warning: no previous prototype for 'dma_heap_try_get_pool_size_kb' [-Wmissing-prototypes]
     430 | long dma_heap_try_get_pool_size_kb(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for NET_DEVLINK
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y] && 64BIT [=y]


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
