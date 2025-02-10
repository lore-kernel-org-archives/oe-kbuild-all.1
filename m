Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77393204879
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197240; cv=none; b=CRrmwVVsjMkBhcd9fNTpdFsPFv2mK9G85aYtJI4zS1+LtTz2qFX6vGydP37xms4nD84QRwEEdxyr3EVqaY8IiTXfLkTa+CVrSOzNa6CkP0cuSqD7w89bg4yZt9NEUZHfHt3ZLheh/aKs8JHltZsThzL/USDA+uoiaO4LpRnYYF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197240; c=relaxed/simple;
	bh=Id7O3wQRQWOE4tb7hDKAB68MxniMTeTjFJiBVBa8gsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KEygV0uqoaHZgrhkE3l5jZecYR3eXc5MdU9DkQHvWpc6m6QUMcxKPnDDL0syuKn7fe9z6oqate5SXqzmFusS1Hat+bj3Jdx4OP1pkXHrI36w2itDk/q996PvgeKNgYSgwyDzDps8++ouAzOETfKgqtvZcs0t77r2ke0j+npzCW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtFmw+RO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtFmw+RO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739197238; x=1770733238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Id7O3wQRQWOE4tb7hDKAB68MxniMTeTjFJiBVBa8gsY=;
  b=jtFmw+ROI0mhjUKaULW239aDWBeNPJtODCNFBOUlF1LrApFM1C7yMu5n
   zhoQ8cjIVVNDfz04FRBgiTfEkT6VVuAemJ/vPhGBc1WBhJk0pLNtQoEPh
   o85dkOLAEzHm+Pzual6QhiR0sBSmc7YgwPOpqKzjdL69intIx1uQu7g4c
   dhsebsvzDOktmD2cXCZKw2tS23WClnzvOI114bNa8FHCf+rLXohmM0SPj
   nygdY8247hciqcjs74mAEGMBMJYv2UBcvkasnmkfEEQ1wJhnEqWGMkyjb
   TzlmH0Pwfx0ZJDSRHMmoB5NjipkIfJr5V5Ntb8EoXWC/riq0pt5rqesCj
   g==;
X-CSE-ConnectionGUID: 2Ih7irpWQYCzj8l2O0GC1g==
X-CSE-MsgGUID: 7LH4YAINRc+GRhckv2NAZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43704985"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="43704985"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:20:27 -0800
X-CSE-ConnectionGUID: ti/NEqACRhOZv6BxTRdOzw==
X-CSE-MsgGUID: 9zpwNT/8T9WJLKKQO2emFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112046359"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Feb 2025 06:20:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thUe7-0012sF-2U;
	Mon, 10 Feb 2025 14:20:23 +0000
Date: Mon, 10 Feb 2025 22:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2735/2735]
 arch/x86/kernel/cpu/resctrl/rdtgroup.c:1504:6: warning: variable 'h' set but
 not used
Message-ID: <202502102259.fAt19b0s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d0165578d0df9962ea30fbabcf76cf41f8789d27
commit: 540e1ae2f7aca5a427a52f12bef657b1e3e81fc1 [2735/2735] x86/resctrl: Add interface to read mbm_total_bytes_config
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250210/202502102259.fAt19b0s-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102259.fAt19b0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102259.fAt19b0s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/resctrl/rdtgroup.c:19:
   In file included from include/linux/fs_parser.h:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:1587:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:1504:6: warning: variable 'h' set but not used [-Wunused-but-set-variable]
    1504 |         u32 h;
         |             ^
   6 warnings generated.


vim +/h +1504 arch/x86/kernel/cpu/resctrl/rdtgroup.c

  1499	
  1500	static void mon_event_config_read(void *info)
  1501	{
  1502		struct mon_config_info *mon_info = info;
  1503		unsigned int index;
> 1504		u32 h;
  1505	
  1506		index = mon_event_config_index_get(mon_info->evtid);
  1507		if (index == INVALID_CONFIG_INDEX) {
  1508			pr_warn_once("Invalid event id %d\n", mon_info->evtid);
  1509			return;
  1510		}
  1511		rdmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, h);
  1512	
  1513		/* Report only the valid event configuration bits */
  1514		mon_info->mon_config &= MAX_EVT_CONFIG_BITS;
  1515	}
  1516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
