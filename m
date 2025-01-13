Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69E16EC19
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 23:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736811343; cv=none; b=pztNj7AQrqTv2En9TMmC61BJIKzjhhlw9GeMhCOuwRb/SZk1EIeaPq8qhUJodxamsLbcFgp2XKjkJiUMRtysO6Ie+Yo4+Fy04ANYhINERMUs+CifpVGdPGtAS4mF6XxBp9Y3e76bAnfCQ0j+TLrqTicdHHyF4cHecQuE0xvLZ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736811343; c=relaxed/simple;
	bh=wjLoVp0NSOCIkL+w5LhvrqBzkGv5WMCnPx6OjEbRH9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bC2QmVUg5lzuf4E52P4lAhxieYC2SnM2cFc24ze0U13oC9DppJRHrT9yzoo9BAjWi8H/NJwMHGXRTw3j1fVk0QqNnHEmuCp2FJQE97dmswDgvEGFWOuArEs71BRdLsRoVSYFLbQy/vqhRcgZ/y+61sHr1UgfAY9IlrFoubQOz0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bysDkCbI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bysDkCbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736811342; x=1768347342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjLoVp0NSOCIkL+w5LhvrqBzkGv5WMCnPx6OjEbRH9U=;
  b=bysDkCbIFhctohDT1AO9yD0vWwlSEDx+iM04/RnjdVLdLJGUZlxAFaaY
   pwg4EXiCnGrfesWfnqRnoVBC395vK1oYHeDpsLOm4T4rrHcWa5+tVwD5C
   0pQ6BIicR+sZmCy7jHHCFCMhdwj7CDQM/IFyUMbL/Xg52JxtWFC/uHNPk
   AWJJserMZ0e3q7ZJftPUC8B5Vqy6Z0UtBHs/RMr5wQYQQB/qfRT6hfzrG
   2YOPAUrLDih8Js/Kd3MW7f8cjl7T6HPPMt2olrcyAmXAFJ/JvgEATzlIV
   JfhImIiVtsKavxyCJlX5ilSgujxPai0DP6oBJeVd/15RmiG8bWmYmOdoZ
   w==;
X-CSE-ConnectionGUID: fVQN7wi9QrWQWw/rWSyVuQ==
X-CSE-MsgGUID: rVhtOFRrQHG9E8qctWerCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47758812"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="47758812"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 15:35:41 -0800
X-CSE-ConnectionGUID: kQZJz4FZS9mu8pdXtPoLhg==
X-CSE-MsgGUID: wGY12nI8TiWFQNvAe8YMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="104588000"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Jan 2025 15:35:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXTy5-000NqK-2B;
	Mon, 13 Jan 2025 23:35:37 +0000
Date: Tue, 14 Jan 2025 07:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1823/1823] drivers/irqchip/irq-gic-v3.c:1086:43:
 error: incompatible integer to pointer conversion passing 'int' to parameter
 of type 'void *'
Message-ID: <202501140732.yHKX6wmK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4fbc633527d173d6e350da6be39009c6a449a802
commit: 63f9ef213a477c796c6b343010762513f6315f83 [1823/1823] arm64: Add debugfs dir for xint
config: arm64-randconfig-004-20250114 (https://download.01.org/0day-ci/archive/20250114/202501140732.yHKX6wmK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501140732.yHKX6wmK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140732.yHKX6wmK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-gic-v3.c:25:
   In file included from include/linux/irqchip/arm-gic-v3.h:632:
   In file included from arch/arm64/include/asm/arch_gicv3.h:17:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2247:
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
   drivers/irqchip/irq-gic-v3.c:1042:23: error: call to undeclared function 'pde_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1042 |         int irq = (int)(long)pde_data(file_inode(file));
         |                              ^
   drivers/irqchip/irq-gic-v3.c:1086:43: error: call to undeclared function 'pde_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1086 |         return single_open(file, xint_proc_show, pde_data(inode));
         |                                                  ^
>> drivers/irqchip/irq-gic-v3.c:1086:43: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'void *' [-Wint-conversion]
    1086 |         return single_open(file, xint_proc_show, pde_data(inode));
         |                                                  ^~~~~~~~~~~~~~~
   include/linux/seq_file.h:166:74: note: passing argument to parameter here
     166 | int single_open(struct file *, int (*)(struct seq_file *, void *), void *);
         |                                                                          ^
   drivers/irqchip/irq-gic-v3.c:1089:30: error: variable has incomplete type 'const struct proc_ops'
    1089 | static const struct proc_ops xint_proc_ops = {
         |                              ^
   drivers/irqchip/irq-gic-v3.c:1089:21: note: forward declaration of 'struct proc_ops'
    1089 | static const struct proc_ops xint_proc_ops = {
         |                     ^
   drivers/irqchip/irq-gic-v3.c:1103:2: error: call to undeclared function 'proc_create_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1103 |         proc_create_data("xint", 0644, desc->dir, &xint_proc_ops, irqp);
         |         ^
   drivers/irqchip/irq-gic-v3.c:1111:2: error: call to undeclared function 'remove_proc_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1111 |         remove_proc_entry("xint", desc->dir);
         |         ^
   5 warnings and 6 errors generated.


vim +1086 drivers/irqchip/irq-gic-v3.c

3053668e6b2119 Jinjie Ruan 2024-11-25  1083  
3053668e6b2119 Jinjie Ruan 2024-11-25  1084  static int xint_proc_open(struct inode *inode, struct file *file)
3053668e6b2119 Jinjie Ruan 2024-11-25  1085  {
3053668e6b2119 Jinjie Ruan 2024-11-25 @1086  	return single_open(file, xint_proc_show, pde_data(inode));
3053668e6b2119 Jinjie Ruan 2024-11-25  1087  }
3053668e6b2119 Jinjie Ruan 2024-11-25  1088  

:::::: The code at line 1086 was first introduced by commit
:::::: 3053668e6b211924bb67c19d791a5a532eca2ad8 arm64: Introduce Xint software solution

:::::: TO: Jinjie Ruan <ruanjinjie@huawei.com>
:::::: CC: Jinjie Ruan <ruanjinjie@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
