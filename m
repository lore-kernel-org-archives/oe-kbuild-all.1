Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDDD1CEEAE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 23:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732577162; cv=none; b=I4pfNxuFbHr48tPy/JkvUkl12+SHBeJiK8EzrushHtOrxeOsjaJA6itzJk4ail0bsUYXiUFfOtPnfC4ZIS+ccF61puUzWkPSgqc5iXV9AmIohL4KEU9QrFRloOk8AGTFbHLhdwxp6GotWLzqm5lo/B9aXFjiyBEyTG5iyYoJXCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732577162; c=relaxed/simple;
	bh=jLaaTTpWEqqli6/KxA8otJLPmkk0As60N7BcDXD4qUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CQHdx24BEfxKMMbTwXpi5oSm9UIpFfCVBEOORmlk+Im9Tn8ibj5FHdkPyd8adohqmVZe3GgLIk7FAy3NIuayS4zamI0p0RTcfMWB4cWdXiDEH8gEO4AA32kjF+00h/dAHhvoiBF4U8ilfi2PhtyT4FaelYXfmpzkC8PBLchTNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEUMjuEI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEUMjuEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732577161; x=1764113161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jLaaTTpWEqqli6/KxA8otJLPmkk0As60N7BcDXD4qUc=;
  b=JEUMjuEIoJlAiNcIRgXipYs+AszsKGy8/O6N74rCxqPkAUP7hocsXSxN
   abf6q+7KBgIJwG3flqho7fU/YLWnTgbgn5/B/glZHaTc11Mtac9VyPREY
   smo7JLo+GpdWNEiiSYu762tI8DZmoK3pHXIjHtHerpPxH1Suezrj76EEx
   QgZ2E2L6Feo4Nyo/0SomK2/0qUFQMQdtHDHAMBo/zj9783U2/0OS+1QGU
   GI3KEnx9JXqp8gmr7eszBtNJbHR+o8evYDufJ29yFIxk126Hx2RVUpA9u
   zjPOKosX8S1mHB6N01iQgIlvK11zMiuRfkbG7ZYDrOu+WBhV8VlX2mOAN
   g==;
X-CSE-ConnectionGUID: 67OLqbb5Tn2XVTHYH3zmvg==
X-CSE-MsgGUID: 4QyAhj9JQqOcKODQIX+yCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32081907"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32081907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 15:26:00 -0800
X-CSE-ConnectionGUID: F4PE19KCTP2XBB11qbhtoA==
X-CSE-MsgGUID: yUxg9ou2RbeExuSjnLxWnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="91551471"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2024 15:26:00 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFiSq-0006tf-1F;
	Mon, 25 Nov 2024 23:25:56 +0000
Date: Tue, 26 Nov 2024 07:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 38/245] mm/page_alloc.c:191:1: sparse:
 sparse: symbol 'restrict_cma_redirect' was not declared. Should it be
 static?
Message-ID: <202411260742.kpp8UQL3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e2fbfb2efc8d61bff3b6ca9212c57cd9568f6442
commit: 1c8aebe4c072bf18409cc78fc84407e24a437302 [38/245] ANDROID: cma: redirect page allocation to CMA
config: x86_64-randconfig-121-20241112 (https://download.01.org/0day-ci/archive/20241126/202411260742.kpp8UQL3-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260742.kpp8UQL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260742.kpp8UQL3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:191:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   mm/page_alloc.c:2507:9: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2590:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   mm/page_alloc.c:2816:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4484:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +/restrict_cma_redirect +191 mm/page_alloc.c

   180	
   181	/*
   182	 * By default, when restrict_cma_redirect is false, all movable allocations
   183	 * are eligible for redirection to CMA region (i.e movable allocations are
   184	 * not restricted from CMA region), when there is sufficient space there.
   185	 * (see __rmqueue()).
   186	 *
   187	 * If restrict_cma_redirect is set to true, only MOVABLE allocations marked
   188	 * __GFP_CMA are eligible to be redirected to CMA region. These allocations
   189	 * are redirected if *any* free space is available in the CMA region.
   190	 */
 > 191	DEFINE_STATIC_KEY_FALSE(restrict_cma_redirect);
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
