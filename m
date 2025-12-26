Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497F3286415
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Dec 2025 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766750481; cv=none; b=jlKFVIKttVPvXm6xgLbZ1PVf8U0/Kvh3Yga8Kg7tpaRQZ9YM/7zg38HPeL18oXnsGvyMsYXRLjGTeZ4HF27otF/meAQsATvwtrzcDPnPt+Vs4siRgxK7IiFKHhISSu6uVnUg9BRsSdDFoEXKOJ95lBw3xrHOJinsi+RbGeQc/1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766750481; c=relaxed/simple;
	bh=JW2TCrHv7daZsahQhyE6mfUGa1jpcScJVByV5ojSYt0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fJvQXYN8/tB5NCsyb+mBexuB82q6xRhXTvmaTQ4ZAXTLlYE7e84lkh0IJiwCli/qrXd9ZOFbT4XIIoJFF2Y8X0m/Tx+jRqb6hyyp5y85L23kVAx655G4jsVVdVjvJ4aJ0FInm9Ld8RIG/pZpj2VDBH0c8Y0bvtJKDMZ3pITKHAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/+f8RCq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/+f8RCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766750480; x=1798286480;
  h=date:from:to:cc:subject:message-id;
  bh=JW2TCrHv7daZsahQhyE6mfUGa1jpcScJVByV5ojSYt0=;
  b=F/+f8RCq1eUZfby+J/tQTQ5epHh7IykMCVIUfDJh4kje/B5+HRzBwe8O
   KkqM8Ewf49nD1kG7YCJYBfvH0Vts2qhlqu4ZkLB231RJXSwz2jbe67VdE
   X4jCsLPqS3TASLwTHCFlR0pIVDu5Qimgs+AnUSyEc7ZZaA6lZE/KK6pO6
   Cnrk8GwmRj+CPAbQpgy3DvovKXb03/WisMqcDqHpjr7U29MfxjC3o5j9Z
   2FEoooaTpGLvE6AoDVrPbJqjZ6RGJZ4U7MZ3iwv+qNnLSdXKQdZrJhoJD
   APFKsQLQEtb/o9BdbzcjGU2DxNAKEDQIVrcbbwx3yADQMEhGQ7B1BUsba
   Q==;
X-CSE-ConnectionGUID: DROtK7FKSGG1W4ecIngTzw==
X-CSE-MsgGUID: tzpm113sQiCNX7LctWO9OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68441877"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68441877"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 04:01:19 -0800
X-CSE-ConnectionGUID: MmcPScLaS0iVk+QCL2nswA==
X-CSE-MsgGUID: X/l4X2BqQMCxZs5Ots7XHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200124705"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Dec 2025 04:01:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ6VP-00000000511-0CZo;
	Fri, 26 Dec 2025 12:01:15 +0000
Date: Fri, 26 Dec 2025 20:00:49 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 101/108] mm/memory.c:7487:1: sparse: sparse:
 symbol 'faults_monitor_controls_lock' was not declared. Should it be static?
Message-ID: <202512261908.fhV5eWFj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   777b25c5baaa9e69b7ed0f963d0db781b36776c7
commit: e874404e9937c662290222d6cd67b7e07b82420a [101/108] mm/memory: implement functions and data structures for page faults monitoring
config: microblaze-randconfig-r123-20251226 (https://download.01.org/0day-ci/archive/20251226/202512261908.fhV5eWFj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261908.fhV5eWFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512261908.fhV5eWFj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memory.c:7487:1: sparse: sparse: symbol 'faults_monitor_controls_lock' was not declared. Should it be static?
   mm/memory.c:1332:9: sparse: sparse: context imbalance in 'copy_pte_range' - unexpected unlock
   mm/memory.c:2221:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:2327:9: sparse: sparse: context imbalance in 'insert_page' - unexpected unlock
   mm/memory.c:2612:9: sparse: sparse: context imbalance in 'insert_pfn' - unexpected unlock
   mm/memory.c:3194:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   mm/memory.c:3827:42: sparse: sparse: context imbalance in 'wp_page_copy' - different lock contexts for basic block
   mm/memory.c:3866:19: sparse: sparse: context imbalance in 'finish_mkwrite_fault' - different lock contexts for basic block
   mm/memory.c:3897:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3923:17: sparse: sparse: context imbalance in 'wp_page_shared' - unexpected unlock
   mm/memory.c:4089:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c:4351:9: sparse: sparse: context imbalance in 'remove_device_exclusive_entry' - different lock contexts for basic block
   mm/memory.c:4392:19: sparse: sparse: context imbalance in 'pte_marker_clear' - different lock contexts for basic block
   mm/memory.c:4646:12: sparse: sparse: context imbalance in 'do_swap_page' - unexpected unlock
   mm/memory.c:5263:9: sparse: sparse: context imbalance in 'do_anonymous_page' - different lock contexts for basic block
   mm/memory.c:5495:12: sparse: sparse: context imbalance in 'finish_fault' - different lock contexts for basic block
   mm/memory.c:5879:9: sparse: sparse: context imbalance in 'do_fault' - different lock contexts for basic block
   mm/memory.c:6008:17: sparse: sparse: context imbalance in 'do_numa_page' - unexpected unlock
   mm/memory.c:6225:17: sparse: sparse: context imbalance in 'do_damon_page' - unexpected unlock
   mm/memory.c:6299:34: sparse: sparse: context imbalance in 'handle_pte_fault' - unexpected unlock
   mm/memory.c:6782:5: sparse: sparse: context imbalance in 'follow_pfnmap_start' - different lock contexts for basic block
   mm/memory.c:6868:28: sparse: sparse: context imbalance in 'follow_pfnmap_end' - unexpected unlock

vim +/faults_monitor_controls_lock +7487 mm/memory.c

  7485	
  7486	static LIST_HEAD(faults_monitor_controls);
> 7487	DEFINE_SPINLOCK(faults_monitor_controls_lock);
  7488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
