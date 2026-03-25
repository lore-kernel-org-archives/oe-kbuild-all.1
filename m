Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4679219A8A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774468412; cv=none; b=DlSspe8mnb10f6WWqyo452LJQaZgOHftppzBrkkA3KOgUe/rML9NOKUaLKvIyhafmQSli7S4YbTMwQY+ZJ7vICIbZK6shVXVTjCZFUuDGgCKq9hgeIV03IKkE9wrrmZy4qhNwPTPZWV+al+E5gIfh9H3vW6vzOn7J+7JoFmOamo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774468412; c=relaxed/simple;
	bh=m7h2Ib92dPe1KkQt+vKIodMx6DIT3z5tfTO9XzoGxPM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ha5VxDZ9V5VfJyMmtmAN9bvVuAvysD+hYbhtSP3irq1QlPTUTnZyb1Z31wG7h0sBhYnEeKpF97nIDKGu56s1js1bfK42RcAdjuuAQ5qs7kZRtcYn9NSdt4x6kceUiC8jnwTEl98PwxR8cdaeWFkjX9bUTaY4kuFDA3a9Cw9C9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqmAK78u; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqmAK78u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774468411; x=1806004411;
  h=date:from:to:cc:subject:message-id;
  bh=m7h2Ib92dPe1KkQt+vKIodMx6DIT3z5tfTO9XzoGxPM=;
  b=nqmAK78ufgdOBDmK8LRWtTUvYn2n8tKa5i9CmCpabe033LykOv54F4Sh
   XKG3cdDzpw4dQTwl1bbFIvObEnVm8XnpbMhHHM6u/YyJjDZkOedFI/Yns
   53M4C3RC27DfcGxv10SsMK/f4VCFIFgliFNY3jdfvWqK8IJRzz/hPKyog
   LlqrDor5x3W0C58T1PsQweH0Clvy3kE8eABk6E7/xu2H0i5G3CtB5iyCy
   tRd23Il2IiD/VAjMnUySMJ8+BC3WuWzKT0ZQs18KXyhhKJ/FHnrpuMptP
   WmT0iIjFfGLrIL7mcqJy79zRIjAs8NutlclgkqYYwDUWasRVZs7pDoJt2
   Q==;
X-CSE-ConnectionGUID: iAAVvYqaT56GPCACSXDx3A==
X-CSE-MsgGUID: t2Xm5IuNQSesIPduuNbVOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="98138736"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="98138736"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 12:53:31 -0700
X-CSE-ConnectionGUID: wMWQDf8WSE+JvdMxX6vGxw==
X-CSE-MsgGUID: v2I7DinCRx6BiJwTku76jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="226414921"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Mar 2026 12:53:29 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5UIA-000000007cD-2gAH;
	Wed, 25 Mar 2026 19:53:26 +0000
Date: Thu, 26 Mar 2026 03:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/dma-buf/heaps/page_pool.c:46: warning: Function parameter or member
 'count' not described in 'dmabuf_page_pool'
Message-ID: <202603260314.9lWlkJzi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: bbfbad63bb7babae84bb178a0b335880406847d1 [1/1] ANDROID: dma-buf: heaps: Move dmabuf_page_pool struct out of the KMI
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260326/202603260314.9lWlkJzi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260314.9lWlkJzi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260314.9lWlkJzi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/heaps/page_pool.c:46: warning: Function parameter or member 'count' not described in 'dmabuf_page_pool'
>> drivers/dma-buf/heaps/page_pool.c:46: warning: Function parameter or member 'items' not described in 'dmabuf_page_pool'


vim +46 drivers/dma-buf/heaps/page_pool.c

    26	
    27	/**
    28	 * struct dmabuf_page_pool - pagepool struct
    29	 * @count[]:		array of number of pages of that type in the pool
    30	 * @items[]:		array of list of pages of the specific type
    31	 * @lock:		lock protecting this struct and especially the count
    32	 *			item list
    33	 * @gfp_mask:		gfp_mask to use from alloc
    34	 * @order:		order of pages in the pool
    35	 * @list:		list node for list of pools
    36	 *
    37	 * Allows you to keep a pool of pre allocated pages to use
    38	 */
    39	struct dmabuf_page_pool {
    40		int count[POOL_TYPE_SIZE];
    41		struct list_head items[POOL_TYPE_SIZE];
    42		struct spinlock lock;
    43		gfp_t gfp_mask;
    44		unsigned int order;
    45		struct list_head list;
  > 46	};
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
