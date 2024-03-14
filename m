Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD3C757EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 19:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710443924; cv=none; b=EPwXKZx1wW0b74js6HrarjUwTO+kBk06RX7RX388q7opl/je5qndglmckTCCHRZ48y4NBYR5Ha60mi0HFO+LLPRRG8VbwglWsk/9Mt8As8G7XXvO2/CmMoP020ne+A7GZCT/6B8+n0GenwPGLwOvppuImCVRgA4syHki4uCT1m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710443924; c=relaxed/simple;
	bh=fjGYJQ6Y8DtO0q5NM/RV2nBqw6ZZu6WHWhjyV8m3YI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OJwrLEedigtBKFLOwN+f6kicwK2h27WCTdLfDwrrmFBVefqAIOoMmDr1BWlL1CshKIJyQRuKPQBSph2uQXSpk+ZK5zN4r96SRZrmGdmg6WxuPLMWT7OPmUEBqxm9NSObzoIY6XNqfCnJhIGZ6IEv+3AQ5VuptIsMeYfGHLM/x8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PeZn4JRB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PeZn4JRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710443922; x=1741979922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fjGYJQ6Y8DtO0q5NM/RV2nBqw6ZZu6WHWhjyV8m3YI8=;
  b=PeZn4JRBNKVl1mzs5zniYpdQnmomliCK3WjqgS7zaPY9MhKMNv/JFrnL
   oileoXbVgrVpIMhg9i1+V/+jlYGD1kThGHi9Ie1GFkJ+fVnxsoLX/bTfA
   3/xNg1syqQw58nSP5xPtf8X49LvaYVHMadR4MxF9ICA93r03X6eIf9voG
   OwdlCqz84f1V92DyrgJh6zgsAIpZrxg5OOwTrZYzTl/Mt6JeoK//svzGK
   8UsNAHNi2aSrMjDK21i9JFLaauqSzZJsw5nsLiFi5L30h4TE49Zh4dOJm
   X6IUqBVmSvbgBXt7u2zct+XOWWr0ndT7w47VXJQrPPCVsUtzT746xCZY8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5417243"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5417243"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 12:18:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="12801670"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Mar 2024 12:18:40 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkqb7-000Dit-21;
	Thu, 14 Mar 2024 19:18:37 +0000
Date: Fri, 15 Mar 2024 03:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20368/21864]
 drivers/android/binder_alloc_selftest.c:109:19: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202403150350.Ukv5qJlF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c41e48598c428d3e38e9ce985a698070deb979b
commit: d549e609b8685eb101a4653249ef7e3fe8bb3e99 [20368/21864] binder: use userspace pointer as base of buffer space
config: x86_64-randconfig-r121-20240313 (https://download.01.org/0day-ci/archive/20240315/202403150350.Ukv5qJlF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150350.Ukv5qJlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150350.Ukv5qJlF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/binder_alloc_selftest.c:109:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *page_addr @@     got void [noderef] __user *user_data @@
   drivers/android/binder_alloc_selftest.c:109:19: sparse:     expected void *page_addr
   drivers/android/binder_alloc_selftest.c:109:19: sparse:     got void [noderef] __user *user_data
>> drivers/android/binder_alloc_selftest.c:111:41: sparse: sparse: subtraction of different types can't work (different address spaces)
   drivers/android/binder_alloc_selftest.c:85: warning: Enum value 'LOOP_END' not described in enum 'buf_end_align_type'

vim +109 drivers/android/binder_alloc_selftest.c

   100	
   101	static bool check_buffer_pages_allocated(struct binder_alloc *alloc,
   102						 struct binder_buffer *buffer,
   103						 size_t size)
   104	{
   105		void *page_addr, *end;
   106		int page_index;
   107	
   108		end = (void *)PAGE_ALIGN((uintptr_t)buffer->user_data + size);
 > 109		page_addr = buffer->user_data;
   110		for (; page_addr < end; page_addr += PAGE_SIZE) {
 > 111			page_index = (page_addr - alloc->buffer) / PAGE_SIZE;
   112			if (!alloc->pages[page_index].page_ptr ||
   113			    !list_empty(&alloc->pages[page_index].lru)) {
   114				pr_err("expect alloc but is %s at page index %d\n",
   115				       alloc->pages[page_index].page_ptr ?
   116				       "lru" : "free", page_index);
   117				return false;
   118			}
   119		}
   120		return true;
   121	}
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
