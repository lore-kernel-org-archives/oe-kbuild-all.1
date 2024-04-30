Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1041B96B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714496981; cv=none; b=mTlTMoHagdCYNn7RKUM7c5UxlREmQoqiryhllx1jiZJWCtpps/OeHIPKCHbE4Iwi1EwDLL9SEfoQwG/d2zanARKVCsU/hI2oyVJg1j/SK+aO+YNjgoZ5xT7kkF/j9lrht4nIAqnXGwcA4yqylpclxS0Bhnq2KJk8vmOHlXAXH+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714496981; c=relaxed/simple;
	bh=lGqoyjjQVQKs3MJLgSvMUWgZlZdYkvB/HgtHacEdm88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQ7aV1krnCTUNETToA9/ZBp2XUWwMyOlu2sM688fEZIBuuNJamYImYtCmNZ24kDohaROq/4JqvmyZGLrba4rh54tKwsdD9mNHiArf4t4zNeYBj/FvivZTqDYksJ8J+y1C2iVxR15tm2rgQcKHRfF3RR/xmKSKUGjtvrTW8usFMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKi9Dfo5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKi9Dfo5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714496979; x=1746032979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lGqoyjjQVQKs3MJLgSvMUWgZlZdYkvB/HgtHacEdm88=;
  b=jKi9Dfo5VKwGQ1SMqpzpfQhAREruGQeF+t7T03jKeUI+P6G/2f3Bwfib
   SSIK/SWRZZd91vcP82yLhbLFK5bi+KrdotWGICf7X5608kMszaBhk/8uN
   XlkcgL7Vh4qelvsjqlGShXsU0XQLuS5JwDKgK7dmzPds7XlhBKjDOgOYz
   YZcVlVtUWx6rz4iP48xgD7q/yOkyfqVIhSzWhFoxEPqau8HjLujelxntm
   aDCm1nFswJ2BTE+sPNmRufxHV90Y7fuAVdu9FTWCLxU+6ulSE5tl0Vgvh
   fT7mHsQkTkQq5kJRTMpzZFLz0E9qduHGAhY4z96cw60Pn1NjcYjkZMb5p
   w==;
X-CSE-ConnectionGUID: yHdPVdo6TdqDk9jyI1woww==
X-CSE-MsgGUID: tRqE21/zR5KlDaTRLjg7nA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10088349"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10088349"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 10:09:39 -0700
X-CSE-ConnectionGUID: 24MaF7aAQ6+nToTi1RNewQ==
X-CSE-MsgGUID: DKwhgTwnSg2pz6ANiOoJvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="31327488"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Apr 2024 10:09:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1qz1-0008O3-2a;
	Tue, 30 Apr 2024 17:09:35 +0000
Date: Wed, 1 May 2024 01:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dma-split-v1 2/17] kernel/dma/mapping.c:877:13: error:
 implicit declaration of function 'cc_platform_has'
Message-ID: <202405010152.ZoTs1Ipi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dma-split-v1
head:   b66ed91ccee0e8e645a07f54f0e39fe9ff4f03c9
commit: 0fb1156cba1b25b894e5374c15c3a4f81002c77b [2/17] dma-mapping: query DMA memory type
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240501/202405010152.ZoTs1Ipi-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010152.ZoTs1Ipi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010152.ZoTs1Ipi-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/dma/mapping.c: In function 'dma_get_memory_type':
>> kernel/dma/mapping.c:877:13: error: implicit declaration of function 'cc_platform_has' [-Werror=implicit-function-declaration]
     877 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
         |             ^~~~~~~~~~~~~~~
>> kernel/dma/mapping.c:877:29: error: 'CC_ATTR_MEM_ENCRYPT' undeclared (first use in this function)
     877 |         if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {
         |                             ^~~~~~~~~~~~~~~~~~~
   kernel/dma/mapping.c:877:29: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/cc_platform_has +877 kernel/dma/mapping.c

   865	
   866	/**
   867	 * dma_get_memory_type - get the DMA memory type of a page supplied
   868	 * @page: page to check
   869	 * @type: memory type of that page
   870	 *
   871	 * Set the memory type related to struct page. Users of this API assume
   872	 * that whole buffer which is backed by the page has the same memory type.
   873	 */
   874	void dma_get_memory_type(struct page *page, struct dma_memory_type *type)
   875	{
   876		/* TODO: REwrite this check to rely on specific struct page flags */
 > 877		if (cc_platform_has(CC_ATTR_MEM_ENCRYPT)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
