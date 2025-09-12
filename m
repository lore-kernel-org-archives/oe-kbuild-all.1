Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B5D2AC17
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757692133; cv=none; b=Tm6iAT6IwNDXTH778YkKeluQAymjfYUrnIkC1iq4ZKEzmFFGC3YaDupJigaQMuQZDKKcNV30J+1D5/qsWLmA5Z8zQDB/C/aX8z/VqUSy5FV4sarBuvkXVDN5VfXqw2xc6MUmu6K7jO0gVYbPDmdz1QiL0nTAksp3/IJAnJCOTus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757692133; c=relaxed/simple;
	bh=a3uHFou/bodWcidfn2B4XQvNH6OHmVvKIrRAgpQc+7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KmZF+pt9CuaasnEvOWr0rBz2OPc3PP8r31njXyKRYt0XfrObFBgDk9pYZPQO0tGnY35f0DRN50+cLVvljst9AKqpP5CbLGVpJp220pRoyLEhcPLFIT9DFszFA6vZAFD/IfcvYAMTn4toSQyK1hodpN4QWolE0ozTgOG/YvCwTn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hl3CDG5J; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hl3CDG5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757692132; x=1789228132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3uHFou/bodWcidfn2B4XQvNH6OHmVvKIrRAgpQc+7w=;
  b=Hl3CDG5JxHl+tG+x0mDmRLkksrRPWzqQmB8eWdzwBeaFqtLUX0bBKMlt
   2W0v1dlsp0JMaEK6URQ2AeFjdEoVPbEICXq/qOwRcypQKsplwn+ofHY4Q
   0WRPaZTkpUduC4kE7bzsfDjshAlkWBajU4skf5dC4nMBJIf3vSY7mLsia
   2bZr5XfdfA1ZpEHEwpi8AY6iX/8iUSYPD1RSYws7LfC7iHkmezfYbb3Xo
   8ShIX9HyzSmjpTw81jHLc5gBBTWmYUCgDeXDd16x29DA2VbwW9FqQ8oQs
   JhpZUIohdiLCtcXuT3f2Z1BZaT/hlpQksDa7FenJrWizdYRVY61RLAhNj
   Q==;
X-CSE-ConnectionGUID: xv0nZyuXQaSp/aXjN2lOtQ==
X-CSE-MsgGUID: XDrd6cJTRK6o/ub9hyF7NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60186279"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="60186279"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 08:48:51 -0700
X-CSE-ConnectionGUID: k4sURMV/TLygRkxsqTpqnw==
X-CSE-MsgGUID: tws2Kvh4T9OSzS6Oi1hK1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="173911331"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 12 Sep 2025 08:48:50 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux60x-000152-3C;
	Fri, 12 Sep 2025 15:48:45 +0000
Date: Fri, 12 Sep 2025 23:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2885/2885] drivers/pci/pci.c:177:17: error:
 expected ')'
Message-ID: <202509122354.VZ9a8UaA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea2f61405cf31bc46bf79f5297ca294ea5a7a9c7
commit: 1f46f3a128f21c190281c72cad99267bcc177e34 [2885/2885] PCI: PM: fix pcie mrrs restoring
config: loongarch-randconfig-002-20250912 (https://download.01.org/0day-ci/archive/20250912/202509122354.VZ9a8UaA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509122354.VZ9a8UaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509122354.VZ9a8UaA-lkp@intel.com/

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
>> drivers/pci/pci.c:177:17: error: redefinition of 'suspend_state_t' as different kind of symbol
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
