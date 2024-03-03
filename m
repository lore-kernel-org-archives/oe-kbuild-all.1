Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7653B65C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709465933; cv=none; b=pBoEJE2MZjVNAZWLa6UdUGrz57gwsIw+Eyzx6Mr1oUIIqIR1dC7j6MbGA2Feja3M3j9xxxlfhDEdIJQsibjg5wpehPgFyQPNPIGcnRqAoN40Y1sYaOhu2idUYSG9LT90XTKfUc7BfSVkmrBYh34zm0NIO2Jj83a+dsb5FFXbKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709465933; c=relaxed/simple;
	bh=z2qDJygLlc45+PsDPYUEnz9fD3fIRf8snyhSuRtyYck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CksYtb0hzMmpt36h0h42RjGH0YLnGOJfdH3TFyQXjkayvf70fMSrR7Qq14NzJnGUT+W5QwcEUwGBYY/mtx+cHjQB9z3vQRRpF3QFBy7Q7CgGWoV1YNkW2e53I7xfU7RkybBNJaI7R0KyG3gaROap1i2F3MQvN4iyxHPOgYpVAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMwsjE3p; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMwsjE3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709465931; x=1741001931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2qDJygLlc45+PsDPYUEnz9fD3fIRf8snyhSuRtyYck=;
  b=DMwsjE3p2OA0DuH3bj2W4kPl97MXvI2VbF/1qpGVf0ejxAN+lE4Oewev
   562AS1HaSyIdwWizb9JDxgns3YOBO70kOxAJ7Li8K9AUSBTScUYXjE4/1
   pFfzT6oh9vYGFjDkFLZ5pGrfAboJhVc/YYxbqQX8EyYObvEA1cBbaShNo
   WqSjqiNfFPrEnRoBb9PvOHm8xUKNcYs0EvZxI8eifasyC8eKvxtp4eqol
   VLKIBaLc6vD/rQm4oE05xsIoJG4nY4E4gwJRctaHDg6sDtTHAiKwRL0VP
   xlnw/Afbj540XJR+kPvBRxJ6qAVF/rS2MZgrXrv1b1LGbR2Fbi7qjb7pZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14539601"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="14539601"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 03:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="39531164"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Mar 2024 03:38:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgkB2-0001jo-1H;
	Sun, 03 Mar 2024 11:38:44 +0000
Date: Sun, 3 Mar 2024 19:38:21 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/memcontrol.c:3528:15: sparse: sparse: symbol
 'mem_cgroup_pagecache_get_reclaim_pages' was not declared. Should it be
 static?
Message-ID: <202403031950.J6pAfCyy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 06d37efeef4689ee10a610bbe91d85de62b88d6c mm: pagecache limit per cgroup support
date:   2 years, 5 months ago
config: x86_64-randconfig-122-20240303 (https://download.01.org/0day-ci/archive/20240303/202403031950.J6pAfCyy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031950.J6pAfCyy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031950.J6pAfCyy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:3528:15: sparse: sparse: symbol 'mem_cgroup_pagecache_get_reclaim_pages' was not declared. Should it be static?
   mm/memcontrol.c:4244:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4244:21: sparse:    struct mem_cgroup_threshold_ary [noderef] <asn:4> *
   mm/memcontrol.c:4244:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4246:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4246:21: sparse:    struct mem_cgroup_threshold_ary [noderef] <asn:4> *
   mm/memcontrol.c:4246:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4403:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4403:9: sparse:    struct mem_cgroup_threshold_ary [noderef] <asn:4> *
   mm/memcontrol.c:4403:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4497:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4497:9: sparse:    struct mem_cgroup_threshold_ary [noderef] <asn:4> *
   mm/memcontrol.c:4497:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:5082:23: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5118:30: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5119:33: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5120:32: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5121:33: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5122:35: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5123:37: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5124:35: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5125:37: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5126:35: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5302:36: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5303:34: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5304:36: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5305:34: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:5306:34: sparse: sparse: undefined identifier 'mem_cgroup_nr_lru_pages'
   mm/memcontrol.c:6401:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6401:23: sparse:    struct task_struct [noderef] <asn:4> *
   mm/memcontrol.c:6401:23: sparse:    struct task_struct *
   mm/memcontrol.c:2084:19: sparse: sparse: context imbalance in 'lock_page_memcg' - wrong count at exit
   mm/memcontrol.c:2139:17: sparse: sparse: context imbalance in '__unlock_page_memcg' - unexpected unlock
   mm/memcontrol.c:2732:9: sparse: sparse: context imbalance in 'lock_page_lru' - wrong count at exit
   mm/memcontrol.c:2755:24: sparse: sparse: context imbalance in 'unlock_page_lru' - unexpected unlock
   mm/memcontrol.c:6250:28: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:6446:36: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/mem_cgroup_pagecache_get_reclaim_pages +3528 mm/memcontrol.c

  3527	
> 3528	unsigned long mem_cgroup_pagecache_get_reclaim_pages(struct mem_cgroup *memcg)
  3529	{
  3530		unsigned long goal_pages_used, pages_used, pages_max;
  3531	
  3532		if ((!memcg) || (mem_cgroup_is_root(memcg)))
  3533			return 0;
  3534	
  3535		pages_max = READ_ONCE(memcg->pagecache.max);
  3536		if (pages_max == PAGE_COUNTER_MAX)
  3537			return 0;
  3538	
  3539		goal_pages_used = (100 - READ_ONCE(memcg->pagecache_reclaim_ratio)) * pages_max / 100;
  3540		goal_pages_used = max_t(unsigned long, MIN_PAGECACHE_PAGES, goal_pages_used);
  3541		pages_used = page_counter_read(&memcg->pagecache);
  3542	
  3543		return pages_used > pages_max ? pages_used - goal_pages_used : 0;
  3544	}
  3545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
