Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8720022A4D5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761551353; cv=none; b=YLRrMigylM1yhi5XXs8cj+d441jqrFoV8TF7/+rvv73Am8SvjlgqWjxKcjc9gm+GZLOjQtDH4iv0eTMHZOV59pI++iAsze0k1iudXkKQ3bQiIFWPE8rDAbbHsrSITfj+NLZkUfz/qozgKk6MEcP/afmhnugt/+hpb9cWT1XEQ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761551353; c=relaxed/simple;
	bh=Jt0S6o7JSZJ6hu9/wj7V9RW04xD7iZQDy9RpCuXa3Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oNQclSfQzCZUt6ivbIhplSVCydJoSeuf48FmI5fVsXnxJGW1okgj//CigSopBUB79ZzTId9gAiWLIFMPoZLMk0BN7PRWDQ4QVLFp1TOUuGebrqdq7YMiNFppYzs0c8j+Jtp5n4YXhxd+wS+x1f3YgWDbTyghpXgDBhXCIHSYb+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SfY3zSSs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SfY3zSSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761551352; x=1793087352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jt0S6o7JSZJ6hu9/wj7V9RW04xD7iZQDy9RpCuXa3Ic=;
  b=SfY3zSSsOKDmdbTSSshcqx0PjCN/01cxkKuBRH3Bc63k//r9Dsq0MAQ3
   5Z7W1wxSRwHZcscGl8NaSKdz3RA+tfswU3kWqGem3K3J5OAFoesOO4Rka
   WPItBNFBLF2DkWTT7crkWxu23n3KEZr7P9wCSacpJ/sam0Jra8MpmJL38
   lcIGUFC+l0qIPNFYwLc3I3hbRob1KFqpXa8rVN0yjpJXENI/oHkNczLcZ
   1x4fcylfkkvk5KPPSG4J79MNQIJEqRp5dS2GMgI18qns5eijX9IdqxzzI
   oFNZsxwCuB0bcdJ8dMhbwwWyNdo0hma8wzsR643FTTtFIPHn+/saEwSik
   A==;
X-CSE-ConnectionGUID: vH7BTtaWQ+WJVvsaXgOu9w==
X-CSE-MsgGUID: 8voN5Vh8TnmbxXjn+VnuDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73914095"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="73914095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 00:49:12 -0700
X-CSE-ConnectionGUID: x9hOzmx8R5+ak+WpU4iHCw==
X-CSE-MsgGUID: MuWqNs+cQ4iY+e7dlJ8qQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189289836"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2025 00:49:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDHyV-000Gbl-2G;
	Mon, 27 Oct 2025 07:49:07 +0000
Date: Mon, 27 Oct 2025 15:48:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3045/3045] drivers/pci/pci.c:177:17: error:
 expected ')'
Message-ID: <202510271529.3vEp7o79-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jianmin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9094437bec1ace7378abfe84597e722209d03f85
commit: 1f46f3a128f21c190281c72cad99267bcc177e34 [3045/3045] PCI: PM: fix pcie mrrs restoring
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251027/202510271529.3vEp7o79-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271529.3vEp7o79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271529.3vEp7o79-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci.c:11:
   In file included from include/linux/acpi.h:14:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/loongarch/include/asm/elf.h:13:
   In file included from arch/loongarch/include/asm/vdso.h:10:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/pci/pci.c:177:17: error: expected ')'
     177 | suspend_state_t pm_suspend_target_state;
         |                 ^
   include/linux/suspend.h:341:34: note: expanded from macro 'pm_suspend_target_state'
     341 | #define pm_suspend_target_state (PM_SUSPEND_ON)
         |                                  ^
   include/linux/suspend.h:36:51: note: expanded from macro 'PM_SUSPEND_ON'
      36 | #define PM_SUSPEND_ON           ((__force suspend_state_t) 0)
         |                                                            ^
   drivers/pci/pci.c:177:17: note: to match this '('
   include/linux/suspend.h:341:34: note: expanded from macro 'pm_suspend_target_state'
     341 | #define pm_suspend_target_state (PM_SUSPEND_ON)
         |                                  ^
   include/linux/suspend.h:36:24: note: expanded from macro 'PM_SUSPEND_ON'
      36 | #define PM_SUSPEND_ON           ((__force suspend_state_t) 0)
         |                                 ^
   drivers/pci/pci.c:177:17: error: redefinition of 'suspend_state_t' as different kind of symbol
     177 | suspend_state_t pm_suspend_target_state;
         |                 ^
   include/linux/suspend.h:341:34: note: expanded from macro 'pm_suspend_target_state'
     341 | #define pm_suspend_target_state (PM_SUSPEND_ON)
         |                                  ^
   include/linux/suspend.h:36:34: note: expanded from macro 'PM_SUSPEND_ON'
      36 | #define PM_SUSPEND_ON           ((__force suspend_state_t) 0)
         |                                           ^
   include/linux/suspend.h:34:23: note: previous definition is here
      34 | typedef int __bitwise suspend_state_t;
         |                       ^
   1 warning and 2 errors generated.


vim +177 drivers/pci/pci.c

   175	
   176	#ifndef CONFIG_PM_SLEEP
 > 177	suspend_state_t pm_suspend_target_state;
   178	#define pm_suspend_target_state (PM_SUSPEND_ON)
   179	#endif
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
