Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1071C287
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 20:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712867014; cv=none; b=YVhu+RgdKrZjBDFu1URVK4Fr5+JyVtEohJwEKnS1W/NsKxacpIx0jN0hmdMyAxSoLdFiHIZpbnyhSKYAjn4NzlU24y3zSSBpx67W7Cf+oZQERA0GYu2rdHbBHXUO2Bcbi6blFNe+TKDX65TRdSYC4d7TdaxalmlJ+lrSeCt/Z2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712867014; c=relaxed/simple;
	bh=neRzEozaZmSXBZj7Qmaeep1MIisoFN3AEWdJCdqjYRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OSqpgF5QoZcrWPsx/hRuaSsgKAU4kc5z0yRf174nTvPhQwfCIbzVIFTPT7JK6MCFn1SGtGlG1nti+mSFy1pNgkKbTGoTZmuzO4YYkaqWKw5ik4RwtRFN3B2DfrlTCi3Yy2INn99nqM/ZkB6408vC88DBzR4EKyFeqhar5veNmo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D2XUMZJo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D2XUMZJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712867012; x=1744403012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=neRzEozaZmSXBZj7Qmaeep1MIisoFN3AEWdJCdqjYRY=;
  b=D2XUMZJonnXkC7jm4mwz+zoLW5/ErrZfyK0NH5MvhVR8vB2P6NjHaYGL
   PW1/hZUq79YvlDrkL+6LmIycDCJnXDFKXqtvQK4OEi7SHM9Lju4njqDgL
   nFlVfOpHU/39tflegjnsoRlwxJLoxmnyuyK1KABYjR8cXYkDsKypt+imk
   9c+FcHrD/SOCYE3vEs4phs1L/SSwALPiD3d2KjCNJ7gymh2VKAa8jPSdh
   e8X+J0kAd4Iayx/3XNTjNJtKZsRqynngDadJ/OeJTrDYNlIp2WBR9m9eU
   Ytu83/24s22IHqBhQGfxLeDZf2ohKBdMHR7IiXT/YhfERCn9f+YwLRpVO
   A==;
X-CSE-ConnectionGUID: Y0I8Eo9uTkWgTUY4R85iFQ==
X-CSE-MsgGUID: ilQdHBJDRiOAHnpdA89QEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8157750"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="8157750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 13:23:32 -0700
X-CSE-ConnectionGUID: jYZW7lqXTte+5UX9jpMSFA==
X-CSE-MsgGUID: caRYsZHBQT+SnyE8x8jcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="25661994"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2024 13:23:30 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv0xD-0008xb-0u;
	Thu, 11 Apr 2024 20:23:27 +0000
Date: Fri, 12 Apr 2024 04:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1835/7374] mm/page_cache_limit.c:94:5: sparse:
 sparse: symbol 'cache_limit_mbytes_sysctl_handler' was not declared. Should
 it be static?
Message-ID: <202404120434.Ta6yim1A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8f7c77eb69ee331fb66fad8eec5ca81b8843eaf3
commit: 7d1031b36ebd6c273d9aad316fd9e3e2daa01a85 [1835/7374] mm: support pagecache limit
config: x86_64-randconfig-123-20240412 (https://download.01.org/0day-ci/archive/20240412/202404120434.Ta6yim1A-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404120434.Ta6yim1A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120434.Ta6yim1A-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_cache_limit.c:61:5: sparse: sparse: symbol 'cache_reclaim_enable_handler' was not declared. Should it be static?
   mm/page_cache_limit.c:77:5: sparse: sparse: symbol 'cache_reclaim_sysctl_handler' was not declared. Should it be static?
   mm/page_cache_limit.c:103:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/page_cache_limit.c:103:52: sparse:     expected void *
   mm/page_cache_limit.c:103:52: sparse:     got void [noderef] __user *buffer
>> mm/page_cache_limit.c:94:5: sparse: sparse: symbol 'cache_limit_mbytes_sysctl_handler' was not declared. Should it be static?
   mm/page_cache_limit.c:187:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/page_cache_limit.c:187:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/page_cache_limit.c:187:35: sparse:     got int ( * )( ... )

vim +/cache_limit_mbytes_sysctl_handler +94 mm/page_cache_limit.c

    93	
  > 94	int cache_limit_mbytes_sysctl_handler(struct ctl_table *table, int write,
    95			void __user *buffer, size_t *length, loff_t *ppos)
    96	{
    97		int ret;
    98		unsigned long vm_cache_limit_mbytes_max;
    99		unsigned long origin_mbytes = vm_cache_limit_mbytes;
   100		int nr_retries = MAX_RECLAIM_RETRIES;
   101	
   102		vm_cache_limit_mbytes_max = totalram_pages() >> (20 - PAGE_SHIFT);
   103		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   104		if (ret || !write)
   105			return ret;
   106	
   107		if (vm_cache_limit_mbytes > vm_cache_limit_mbytes_max) {
   108			vm_cache_limit_mbytes = origin_mbytes;
   109			return -EINVAL;
   110		}
   111	
   112		if (write) {
   113			while (should_reclaim_page_cache() && page_cache_over_limit() &&
   114					nr_retries--) {
   115				if (signal_pending(current))
   116					return -EINTR;
   117	
   118				shrink_memory(node_reclaim_num(), false);
   119			}
   120		}
   121	
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
