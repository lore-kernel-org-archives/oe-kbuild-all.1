Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358AD1E379C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733225258; cv=none; b=clk1FWPM7quHCHm73A3vFBl4s+u0wEFFC8zaMR4vA1ySvgKggEFmCkgJDTxjhSTPAvltvOsTpUqXLqKNRLarZStgwNnSnQ8roYfT2xjXZLRw7bo7Ov5uNFHgfkIa45Cqg+IoVE0RENSwALSC4Fs4jNBayQzWpZKl00Z6v/f+V5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733225258; c=relaxed/simple;
	bh=VytObDmsaPBDz2JeWR3UCbGT3IVNr3ry109/r4Kw0Io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p77lhZCNlfcBDqOvvXmQWYEF9mlIXz5UgUopsZJFjjn0q26YfQbBqouElcwewkCu05j6KVpziw/XTzWGdZIUGNcq+9zMcmrypZ8WLEfYOeT8ZR0uf8DLFEGNIWTRw4Nsimo4nKoqtEV2EUWM3oQGqgEW8QBfpHaUx58Q6AkAejE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PkNDwpbm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PkNDwpbm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733225257; x=1764761257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VytObDmsaPBDz2JeWR3UCbGT3IVNr3ry109/r4Kw0Io=;
  b=PkNDwpbmf4yHZw9sG6f3zEsoopiw/vcaTYjh94SU5EeIDel9HukGzbWc
   JoOLv2OqIFK4vlM74S0oBAJBqhvFlQAddc1UoH+jywIYIc+DDpo7/Ce2Y
   /l2uPylLDAfxRflNpxR6qJfDym19dC+/Vr8Xsp3dSOSeYiW4ZUdgA3cDq
   /TNSoiSoe1ubETWIjfG5e+UNBSLGwgO9h7vsQeDHFKTlfKWigZt3NCJbu
   7/gCM3gLcXOe4QJEcXSOdmCl4SjNWQ5/tqinzjAwFnClH8NfsMCENxETU
   seWUjZHDwwveyuOMuUOOLNP11WY44XN5wDUkudFbTupb6zAfHRy3rq7Yb
   A==;
X-CSE-ConnectionGUID: kjbv7HVKThKNk3raODJuTw==
X-CSE-MsgGUID: yWm5A7LjSzy3OGtrsyTtBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33684861"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33684861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 03:27:36 -0800
X-CSE-ConnectionGUID: h7SEJrMaSxCoFXmnOYBh9A==
X-CSE-MsgGUID: rZ9Es8VPT++hprW/iP3bOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93316508"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Dec 2024 03:27:36 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIR40-0000av-2q;
	Tue, 03 Dec 2024 11:27:32 +0000
Date: Tue, 3 Dec 2024 19:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, LeoLiu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1577/1577] drivers/ata/libahci.c:210:5: warning:
 no previous prototype for function 'get_ahci_em_messages'
Message-ID: <202412031924.l8eOZ6vd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d72146e885adc1fe1f656075dccd9344d0024041
commit: fb43492008c11fe89e510dd63383a2d37ea3cf8e [1577/1577] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-buildonly-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031924.l8eOZ6vd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031924.l8eOZ6vd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031924.l8eOZ6vd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ata/libahci.c:24:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2235:
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
>> drivers/ata/libahci.c:210:5: warning: no previous prototype for function 'get_ahci_em_messages' [-Wmissing-prototypes]
     210 | int get_ahci_em_messages(void)
         |     ^
   drivers/ata/libahci.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     210 | int get_ahci_em_messages(void)
         | ^
         | static 
   6 warnings generated.


vim +/get_ahci_em_messages +210 drivers/ata/libahci.c

   209	
 > 210	int get_ahci_em_messages(void)
   211	{
   212		return ahci_em_messages;
   213	}
   214	EXPORT_SYMBOL_GPL(get_ahci_em_messages);
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
