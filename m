Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE03B52F9A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Mar 2024 11:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711452239; cv=none; b=kkwtHSdeU2xWapZ+YGd/KqE19QOi2sP8hPhDpoHvGwI5GSr04bCBOSdOv5McXPR1aay6SGgEigxe3C0Yk5zOrMsfXZfuG8Z9LTQ2Lj1Q39jiZJiWYrXGHEpi5jEX7NaBPrwEgMO0SiXZoTc2OgLFHeBEgHgAbdIwDT2PO5A6siA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711452239; c=relaxed/simple;
	bh=SrD+xmYisZ1lFSvgEQ2+QwiKv+aqsYMsfUt7ldyj4yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P0DCt5VzXCqQSl5YzJTq0yRf849chdRu6Ohz9l29KOIkP0LJShAQa0+hpOtT0W9Dd38CGkNnZQNTbZzu5pRUHHwytne4I5w+iL75bS+ad3aN2SFCDq/xgXnn2tzWC9DNW10KeJNIwjUY5wK9xlqWRZSDOrmwA9uy7wMTM2lM+Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BP1FGBMG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BP1FGBMG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711452238; x=1742988238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SrD+xmYisZ1lFSvgEQ2+QwiKv+aqsYMsfUt7ldyj4yw=;
  b=BP1FGBMG6V66x7fdKcCtxbXqOwfDzd8V2HFmQKQ1Y6hvuZMXeTWkZlYd
   lZ2I1rmEIxgennvQ14FOVh1ddjxQQkCGQhU06fy94SM11FICvoDAE9jlq
   rDpjsBsxZ93zUYlt4uXyyqtjtPsEAh8OgNMOdTjzwf9+qKkeCSPRK1zWy
   Vyo3Tn8OlhrxhCb0/4sroXu8tgwFitqMhiNwSjNfjrV9wmhFNgEa9iHKq
   /Uv8jwP8rb5PKeq8cGjKAPyJBHMia2PgvskAe3JHdvQUuUa4Kq4X83Fo7
   vN4pxDKfQBby1H8gfkZfmvQRzhaTZck8byk7cwmRzOhXbWWGBRfzI2s/J
   A==;
X-CSE-ConnectionGUID: bggkfhKeS9uhRVhihvcyDA==
X-CSE-MsgGUID: UoXp3lDUR262w3R2lUTyfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="23984543"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="23984543"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 04:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="15985213"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Mar 2024 04:23:56 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rp4uH-000NKa-2s;
	Tue, 26 Mar 2024 11:23:53 +0000
Date: Tue, 26 Mar 2024 19:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1398/4922]
 drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member
 'refcount' not described in 'dma_heap'
Message-ID: <202403261908.BRsMs9AW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   a1789984ea477a3d4b08364d2a38bb9f8e957236
commit: c700bdd2233e000f089ce54556f987acfc391c7b [1398/4922] ANDROID: dma-heap: Add proper kref handling on dma-buf heaps
config: i386-buildonly-randconfig-004-20240326 (https://download.01.org/0day-ci/archive/20240326/202403261908.BRsMs9AW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403261908.BRsMs9AW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403261908.BRsMs9AW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'heap_cdev' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'minor' not described in 'dma_heap'
>> drivers/dma-buf/dma-heap.c:45: warning: Function parameter or struct member 'refcount' not described in 'dma_heap'


vim +45 drivers/dma-buf/dma-heap.c

c02a81fba74fe3 Andrew F. Davis 2019-12-03  25  
c02a81fba74fe3 Andrew F. Davis 2019-12-03  26  /**
c02a81fba74fe3 Andrew F. Davis 2019-12-03  27   * struct dma_heap - represents a dmabuf heap in the system
c02a81fba74fe3 Andrew F. Davis 2019-12-03  28   * @name:		used for debugging/device-node name
c02a81fba74fe3 Andrew F. Davis 2019-12-03  29   * @ops:		ops struct for this heap
c02a81fba74fe3 Andrew F. Davis 2019-12-03  30   * @heap_devt		heap device node
c02a81fba74fe3 Andrew F. Davis 2019-12-03  31   * @list		list head connecting to list of heaps
c02a81fba74fe3 Andrew F. Davis 2019-12-03  32   * @heap_cdev		heap char device
c02a81fba74fe3 Andrew F. Davis 2019-12-03  33   *
c02a81fba74fe3 Andrew F. Davis 2019-12-03  34   * Represents a heap of memory from which buffers can be made.
c02a81fba74fe3 Andrew F. Davis 2019-12-03  35   */
c02a81fba74fe3 Andrew F. Davis 2019-12-03  36  struct dma_heap {
c02a81fba74fe3 Andrew F. Davis 2019-12-03  37  	const char *name;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  38  	const struct dma_heap_ops *ops;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  39  	void *priv;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  40  	dev_t heap_devt;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  41  	struct list_head list;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  42  	struct cdev heap_cdev;
c700bdd2233e00 John Stultz     2020-07-25  43  	int minor;
c700bdd2233e00 John Stultz     2020-07-25  44  	struct kref refcount;
c02a81fba74fe3 Andrew F. Davis 2019-12-03 @45  };
c02a81fba74fe3 Andrew F. Davis 2019-12-03  46  

:::::: The code at line 45 was first introduced by commit
:::::: c02a81fba74fe3488ad6b08bfb5a1329005418f8 dma-buf: Add dma-buf heaps framework

:::::: TO: Andrew F. Davis <afd@ti.com>
:::::: CC: Sumit Semwal <sumit.semwal@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
