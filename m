Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DFA4AA595
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859774; cv=none; b=ryD4YW05mJvQf5USs7AvprztwdmJfderA6taKjo7/Ry2OQfNXuCjCYJZehz8AZ42mktN8T3l/mmUOVhF5rQDOYZzb4/CwJepV9SSWaMH96HZ7Ua409fsGqI/fTx7ZC7amg/53D6pEs9TMqp1fzoHAogxTr3NHBHVIHPF5cEppH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859774; c=relaxed/simple;
	bh=iD5xiBKD8tVXmzZT4ELily6Pzq4/9dMpwFEHkrw8r3U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zg2f35+deT21G7yooo0+MiACWy50Sce6sZNgPxLt5XCHiZistYVyxtOKXaqsE5fMaP0+2hgdyICHJQgIbZOBCA1J97qwkSN+7nCPgnVGpWNW4S19BP+EY4HbXNHy+dOITeFKrqMf5zQDb0eIcwZNaAo3NvOB7tBCErzci8gAxHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsEsJHYb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsEsJHYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788859773; x=1820395773;
  h=date:from:to:cc:subject:message-id;
  bh=iD5xiBKD8tVXmzZT4ELily6Pzq4/9dMpwFEHkrw8r3U=;
  b=HsEsJHYbyoV0MCU74Bvbp9iY6EBbgDaOBPrACVGOrkmrJPPJUGxM9o64
   gSV6Zc8epopClO36UoZEXbJo7LlM0NTdKw2OrLV9yHc2uc+zfFTpg5lxw
   iZSVWSOUqs4F31aa7pYCIpykR5ev8rq/feXP1qE0JOKBIxQ+QoOdTElVk
   ZSFMUmuwnVH/5M5e/Xr/RiqGSvQozyMWh8VGNkhN4rv2o4xq9926IXh+y
   Z6a198OPClju0WSmWCF/rchXHE7qd2+WYMAEgDS5osp1/R/AQKUzcJvma
   SOsqc5Kt9fGcbDaWoykshap9CcMJADUj7igFSTn8xYv1csVTQOssSCa6B
   Q==;
X-CSE-ConnectionGUID: Xbf73WdjTFSlLVJehcmTMg==
X-CSE-MsgGUID: 9BwcnpHoTDmxq3kihpdEpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114796381"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="114796381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:29:32 -0700
X-CSE-ConnectionGUID: LiNRrzf8Qm6Jt4tZzZG5DA==
X-CSE-MsgGUID: cyXScH3NT2mqnt9Q/5Woiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="276204486"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2026 02:29:31 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3s8v-000000000e2-0xx8;
	Tue, 08 Sep 2026 09:29:29 +0000
Date: Tue, 08 Sep 2026 11:29:18 +0200
From: kernel test robot <lkp@intel.com>
To: Bo Zhang <zhangbo56@xiaomi.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/android/binder_alloc.c:234:21: warning:
 'binder_page_lookup' defined but not used
Message-ID: <202609081155.54SVIR98-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bo-Zhang/binder-switch-alloc-mutex-to-spinlock-for-buffer-metadata/20260904-190447
head:   0eaa7c96e838c958ee4182433326639329ee3733
commit: 0eaa7c96e838c958ee4182433326639329ee3733 binder: add install_mutex to serialize page install and shrinker zap
date:   2 days ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260908/202609081155.54SVIR98-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081155.54SVIR98-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081155.54SVIR98-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/android/binder_alloc.c:234:21: warning: 'binder_page_lookup' defined but not used [-Wunused-function]
     234 | static struct page *binder_page_lookup(struct binder_alloc *alloc,
         |                     ^~~~~~~~~~~~~~~~~~


vim +/binder_page_lookup +234 drivers/android/binder_alloc.c

072010abc3ad98b Carlos Llamas 2024-12-10  233  
9e2aa76549b9fd2 Carlos Llamas 2024-12-10 @234  static struct page *binder_page_lookup(struct binder_alloc *alloc,
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  235  				       unsigned long addr)
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  236  {
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  237  	struct mm_struct *mm = alloc->mm;
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  238  	struct page *page;
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  239  	long npages = 0;
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  240  
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  241  	/*
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  242  	 * Find an existing page in the remote mm. If missing,
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  243  	 * don't attempt to fault-in just propagate an error.
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  244  	 */
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  245  	mmap_read_lock(mm);
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  246  	if (binder_alloc_is_mapped(alloc))
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  247  		npages = get_user_pages_remote(mm, addr, 1, FOLL_NOFAULT,
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  248  					       &page, NULL);
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  249  	mmap_read_unlock(mm);
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  250  
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  251  	return npages > 0 ? page : NULL;
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  252  }
9e2aa76549b9fd2 Carlos Llamas 2024-12-10  253  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
