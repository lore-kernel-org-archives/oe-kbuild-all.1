Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3968A137930
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733775607; cv=none; b=UuE2S1FyzCM61RDcC6kiVEXVrM0S10CzIEXKMetr+85Bf/wC/4GSel1xAUUdE1b+aMlOnS1gv65flXq+nT4Je1quQxIgMZgeciYHYatC7LoWSE3ebkGQRCEnLhngi/jZewnq/YOaia4MwE9Mzn/96MzLXTfz5JLjSP0E+tC6AaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733775607; c=relaxed/simple;
	bh=8zefO2+rCBG2rMdufWGjmhG70a+T9T1mtueeWlsKo1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3cj0ESbDu7PE0jkoZuYc4aifm5enM4dLE9ArVurVFSCbvaKl1cFTqXdaAsy4S7vxkARhdinu3UsbovEdCe9wCJxP0pBLw4JZyP81OXEbPflYpPxs7GV5TXNrUEtbWA4z2XBzWbJRbHDZKDfskUoZhtyejCKraO5Wy0G7q2DgSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOEyjMh2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOEyjMh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733775605; x=1765311605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8zefO2+rCBG2rMdufWGjmhG70a+T9T1mtueeWlsKo1Y=;
  b=WOEyjMh2MlMpOSPgcel0/+YbXzxMWLXVfQxAgaKWCLqo1S3HsbZKp0OQ
   bpwN4VdgofxwTJwMwwPYSBys0PnOTxwP6qIGyFQo6+3GmPVUCe5tgpWkK
   AylArSKGSuyVZ1bd3oazI4ilJXZqcNNqYECb2wVDbDy3UgDHBqroscgBP
   q4mQZ2xA+GitZaI/aZ6TCVCwiDatlinJvJ63crvmztp7HjBgpaVbHDqNC
   WfXMilELyvsSlvwPuNRUxkkYYXhTwSHdoLT4HscTgjSgTRZExl6QFFHBr
   wyCm0XIAy/ZrVZGpBhs+ZphXKasP9LtdfFcvfGYURqf4qH8kw/nH26KWk
   Q==;
X-CSE-ConnectionGUID: OHdKC9dUSImNeppYKn2iDg==
X-CSE-MsgGUID: bWDMr+GCTsK/N3FEzrSgMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="36932802"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="36932802"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 12:20:04 -0800
X-CSE-ConnectionGUID: 1NrS0RzcRQeUuc+Cn2AXOw==
X-CSE-MsgGUID: GuBQPPNbSU+2+GySvrCF9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="100230065"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Dec 2024 12:20:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKkEb-0004mp-0U;
	Mon, 09 Dec 2024 20:20:01 +0000
Date: Tue, 10 Dec 2024 04:19:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liao Chen <liaochen4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] arch/arm64/kernel/ipi_nmi.c:39:2:
 error: call to undeclared function '__printk_safe_enter'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202412100446.uHjEIMnM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 5e3e94b1477ca3f6cb47ae8137a4a99fe0ef6147 [1613/1613] arm64: Add non nmi ipi backtrace support
config: arm64-randconfig-003-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100446.uHjEIMnM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100446.uHjEIMnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100446.uHjEIMnM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/ipi_nmi.c:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/ipi_nmi.c:39:2: error: call to undeclared function '__printk_safe_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      39 |         __printk_safe_enter();
         |         ^
>> arch/arm64/kernel/ipi_nmi.c:41:2: error: call to undeclared function '__printk_safe_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      41 |         __printk_safe_exit();
         |         ^
   5 warnings and 2 errors generated.


vim +/__printk_safe_enter +39 arch/arm64/kernel/ipi_nmi.c

    35	
    36	#ifdef CONFIG_NON_NMI_IPI_BACKTRACE
    37	static void ipi_cpu_backtrace(void *info)
    38	{
  > 39		__printk_safe_enter();
    40		nmi_cpu_backtrace(get_irq_regs());
  > 41		__printk_safe_exit();
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
