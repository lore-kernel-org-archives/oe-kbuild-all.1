Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80403158534
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718558; cv=none; b=iMS7CfeeJKrsClx82mhojUiqrcKoc5ZOI55Mu/Mx+h0OETL+J5a2lgVWPba4BbcqONhLSnXP69f+FULEetCHzZ7ftuLGccLKkgy2ePthLTHT0iOs6VQJxWC5Q21fk+89FCmFupHfUgdBX9iQNx3z/6L4v+2KDRhHBzLyv9w81yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718558; c=relaxed/simple;
	bh=KO7uUCq/71/ZH0W7z9rJy/ngab7kRXQqitFcahstPlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/Kqiqp58m93FXHf8R0TzoZ4XygJ3RBumLyb7KqFK+UULNspoe2cn5IP+A31sicOS25LzgG9hnMuf6ka5KLQT+P35pWYjgQdsHZp2/XWNyXyNHxQ2qGXjiG07GBBsZpXXN9+jlTsydd4b8SDlCmYHviZa1pumD7P+ceV020u5so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OK4xWlWk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OK4xWlWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718556; x=1765254556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KO7uUCq/71/ZH0W7z9rJy/ngab7kRXQqitFcahstPlw=;
  b=OK4xWlWkoxyyk6VpmS33mtRUkCY4euhbWosraLqAhWmIxu8r3DnOXqrx
   O4QkjULkT3zCDhV3rSnj1AIj+yezV/WtMsrbNlg2Re25ZAgWHpBoaw1bn
   k4Skm4tQLMOXVsi3NibFbpi4NXDQ00i+Lc08wSNyJSlPFxnS6mleJxn/Z
   MDXNe4b5wCZn8MlaHWRaawLDKNt6JW13j7g2edaj5V4QhwCO9w9Mjepdo
   3CI9gQxdUk7Yu/HdrKySlcSSy9uyZ8pGN9M1g59GjrVoYzIhtlKEsTmJ7
   CILgvZlPb+lv/LO7M11HD2/nszmvNHjC74Jk8jRckPUhYVmTHJ5cei2SF
   Q==;
X-CSE-ConnectionGUID: RFArdPAHTY6MSqoRYaSumg==
X-CSE-MsgGUID: aiqVf2igSi6figO45TPv+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34236745"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34236745"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:29:16 -0800
X-CSE-ConnectionGUID: PHpOK1PKRDObrNagMxRdJw==
X-CSE-MsgGUID: SzilWgWXSnuOoB1K7f/riQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95429284"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Dec 2024 20:29:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVOT-0003rJ-07;
	Mon, 09 Dec 2024 04:29:13 +0000
Date: Mon, 9 Dec 2024 12:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/5]
 include/trace/hooks/dmabuf.h:25:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202412080359.fwndipYj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f10cf63d3ff9411bbd227f76d9ac8f4ca543918e
commit: 549f6fcc90a8a3a2640805bf1753de21a074c17f [2/5] ANDROID: dma-buf: Add vendor hook for deferred dmabuf sysfs stats release
config: x86_64-randconfig-122 (https://download.01.org/0day-ci/archive/20241208/202412080359.fwndipYj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080359.fwndipYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080359.fwndipYj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-buf-sysfs-stats.c: note: in included file:
>> include/trace/hooks/dmabuf.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +25 include/trace/hooks/dmabuf.h

    13	
    14	DECLARE_HOOK(android_vh_dmabuf_page_pool_free_bypass,
    15			TP_PROTO(struct page *page, bool *bypass),
    16			TP_ARGS(page, bypass));
    17	DECLARE_HOOK(android_vh_dma_heap_buffer_alloc_start,
    18			TP_PROTO(const char *name, size_t len,
    19				u32 fd_flags, u64 heap_flags),
    20			TP_ARGS(name, len, fd_flags, heap_flags));
    21	DECLARE_HOOK(android_vh_dma_heap_buffer_alloc_end,
    22			TP_PROTO(const char *name, size_t len),
    23			TP_ARGS(name, len));
    24	struct dma_buf_sysfs_entry;
  > 25	DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
