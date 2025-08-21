Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711332EF647
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769430; cv=none; b=dXC5P6Ks7dWeZh8l5b2ZISe8nZtd/39qVFLeFcNHHQL9HPVml3otHj/tqpHPkGR2DchIUulTsK6zAy8eZkQ6lgh51dtmsoOHUCg277IJEbhU9HXJ3wLzjVTMs5dY7hvM7D209qcTirAWG6T7j5nimE6vzuVPXcU1qqp9J6WiRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769430; c=relaxed/simple;
	bh=Yi4yP/dAKMQb71ykPMOVkOyUJGGCArjcYWUGLnnS7qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jHlm1LFuJu1WQyAvr2SOICFVZIthsNUkCOpsboNUFWnITuy8q7bwqodo+QxDe48AleD1uJRcnqaDLsirwj3f+4pbzat7xxh3IT5rsf55h6Vskuchyca5yFFBXrpWNZhvAu1bRjSWGEQW8fsdHteSRHejq68H/OSKnkIP8Ocj3Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmqiS9Yf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmqiS9Yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755769428; x=1787305428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yi4yP/dAKMQb71ykPMOVkOyUJGGCArjcYWUGLnnS7qQ=;
  b=CmqiS9YfxR4B9KnieCdSMemVBHcakGpz/Zg60MoI95ylSseMzR8MV5Ok
   FftexHke6U5dim5NGR3+qeh9XeIMWgraYHq3TkZ/gwzXSYzi52Sq8ijba
   1AWq/ubVkedFSZemaz3ZAuvKIbs2iVpFQshF6HSkrGXovCIKFpDPDGSmz
   PCVqo5XmwrVkdwgMaCEEYQ46ezHhx/JmRLIMDBgHBMb5ycGhwUUcDZ9yG
   q1pCvn7oBm2d3xTI6wU8akSkO2DrKfsD7r9I8GXZvcdEedEfI2/Bo8kTr
   m5t/I2z/laSkKXNGBfWxzUBLhP0CkSv83i1OT+Mdh9Ls6qzazRXks9vOw
   g==;
X-CSE-ConnectionGUID: Qjyoz0XVR2ehei0CT7CWAA==
X-CSE-MsgGUID: ctHzEE6LQpKTbu4L5rbY+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68323351"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="68323351"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:43:48 -0700
X-CSE-ConnectionGUID: m5zCssh8RQC22026GY3ntQ==
X-CSE-MsgGUID: hvRsMFHIRzGSmP6IIbjwIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="167877201"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2025 02:43:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up1pP-000KA7-1e;
	Thu, 21 Aug 2025 09:43:36 +0000
Date: Thu, 21 Aug 2025 17:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3382/3950] mm/zswap.c:48:15: sparse: sparse:
 symbol 'zswap_stored_incompressible_pages' was not declared. Should it be
 static?
Message-ID: <202508211706.DnJPQQMn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa4d8dc380fbd81a9d702a855c50690c9c6442c
commit: 6d522abd7b4fc78d51934e6c9a53d8e2349f5d3e [3382/3950] mm/zswap: store <PAGE_SIZE compression failed page as-is
config: arc-randconfig-r123-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211706.DnJPQQMn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250821/202508211706.DnJPQQMn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508211706.DnJPQQMn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/zswap.c: note: in included file (through arch/arc/include/asm/cacheflush.h, include/linux/cacheflush.h, include/linux/highmem.h):
   include/linux/mm.h:80:9: sparse: sparse: preprocessor token PAGES_TO_MB redefined
   mm/zswap.c: note: in included file (through arch/arc/include/asm/irqflags-compact.h, arch/arc/include/asm/irqflags.h, include/linux/irqflags.h, ...):
   arch/arc/include/asm/arcregs.h:155:9: sparse: this was the original definition
>> mm/zswap.c:48:15: sparse: sparse: symbol 'zswap_stored_incompressible_pages' was not declared. Should it be static?
   mm/zswap.c:1250:23: sparse: sparse: context imbalance in 'shrink_memcg_cb' - unexpected unlock

vim +/zswap_stored_incompressible_pages +48 mm/zswap.c

    41	
    42	/*********************************
    43	* statistics
    44	**********************************/
    45	/* The number of pages currently stored in zswap */
    46	atomic_long_t zswap_stored_pages = ATOMIC_LONG_INIT(0);
    47	/* The number of incompressible pages currently stored in zswap */
  > 48	atomic_long_t zswap_stored_incompressible_pages = ATOMIC_LONG_INIT(0);
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
