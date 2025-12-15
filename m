Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B421E7C23
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780884; cv=none; b=WTgSHTp9jIE5pJA/E8UCZsAKCVrsowIvp7WGZXqrQh40T+kLnc3pDGBweu9oUIffBCOb8tcqnFyfJIV0AGeb0+wONkLk1R56OXw+pDiJQ4wDDAAU3B+pEDDEGDnxgAvQoc8HGCX3koUj3bSsvrBqa1L1qXouSs2ISX54YjdfNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780884; c=relaxed/simple;
	bh=kd2Ub9onQ/O7I9krXWfPp/cSBH4amBOicTo5NQTzlWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NmSVPh9iKFC07dqOVVVLp7sjeOnHIiIdDXYPJW65e3WHZNBGZwExIseGjtaKgkZeitPJ1W5UHIl2HIXCdCFeYJUm05nTTRl+xfdRIpRRDkV8QAFJ38t8jS9OQSkdqR5p600eAGaas2iWeOZRV+SWqs5eh+dovUGigMqKppfAkCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIqwWo6Y; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIqwWo6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765780882; x=1797316882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kd2Ub9onQ/O7I9krXWfPp/cSBH4amBOicTo5NQTzlWI=;
  b=OIqwWo6YZon9kPjp09gVMN/pT8IGcADfihOIBa6CGqBEU3RHVVpzGo2D
   ynRBcA/C2n9DFZHLuheqi1B/icbh/TspeI69v59axjQhOkHsyUqHCgNSe
   hayb8Ge5Z2/VR2AR/mhoUdaMvqzRCw4XO6RxNeanzzhJ3hQkwoWhr15me
   kXKlwGFTgvVqeRiyXquk/8wbtcvh20SW5MzR6NTaVeF8L//Z/Aa3Xlki6
   8mlPwQ4phiayWZ8BPitAojKtPTOnoB5lUIqmOqZYhpLJrmQI0uXBl57zm
   2L8g0ZpeVfpPPDzQxAUyvT1Rqa00SVs9+3Vw8Ds2ktN7XVW6FLU3s9TYC
   w==;
X-CSE-ConnectionGUID: YgRdUrbJTa+TWPzna0RshQ==
X-CSE-MsgGUID: XXZB+ljnQ9WTHCi5qbsJvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="66664710"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="66664710"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 22:41:22 -0800
X-CSE-ConnectionGUID: MB3estuGRYS60dYB+bZXsQ==
X-CSE-MsgGUID: c/SWzPtVTVWD99LDH4IsLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228296136"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Dec 2025 22:41:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV2Gk-000000009t4-14AI;
	Mon, 15 Dec 2025 06:41:18 +0000
Date: Mon, 15 Dec 2025 14:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542] drivers/ata/libahci.c:210:5: warning:
 no previous prototype for function 'get_ahci_em_messages'
Message-ID: <202512151453.z27gHP7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   81b22958142c03b02c766c79cd1554ebfa142be4
commit: fb43492008c11fe89e510dd63383a2d37ea3cf8e [3542/3542] ata: ahci: Add support for AHCI SGPIO Enclosure Management
config: x86_64-buildonly-randconfig-002-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151453.z27gHP7d-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151453.z27gHP7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151453.z27gHP7d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ata/libahci.c:24:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/ata/libahci.c:210:5: warning: no previous prototype for function 'get_ahci_em_messages' [-Wmissing-prototypes]
     210 | int get_ahci_em_messages(void)
         |     ^
   drivers/ata/libahci.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     210 | int get_ahci_em_messages(void)
         | ^
         | static 
   2 warnings generated.
--
   In file included from drivers/ata/ahci_zhaoxin_sgpio.c:10:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/ata/ahci_zhaoxin_sgpio.c:31:5: warning: no previous prototype for function 'ahci_wait_em_reset' [-Wmissing-prototypes]
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         |     ^
   drivers/ata/ahci_zhaoxin_sgpio.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | int ahci_wait_em_reset(struct sgpio_zhaoxin *sgpio_zhaoxin, u32 retry)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:55:6: warning: no previous prototype for function 'ahci_zhaoxin_set_em_sgpio' [-Wmissing-prototypes]
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      55 | void ahci_zhaoxin_set_em_sgpio(struct sgpio_zhaoxin *sgpio_zhaoxin)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:99:6: warning: no previous prototype for function 'ahci_zhaoxin_set_em_sgpio_gpmode' [-Wmissing-prototypes]
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:99:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      99 | void ahci_zhaoxin_set_em_sgpio_gpmode(struct sgpio_zhaoxin *sgpio_zhaoxin)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:601:6: warning: no previous prototype for function 'set_em_messages' [-Wmissing-prototypes]
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:601:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     601 | void set_em_messages(struct sgpio_zhaoxin *sgpio_zhaoxin)
         | ^
         | static 
>> drivers/ata/ahci_zhaoxin_sgpio.c:621:5: warning: no previous prototype for function 'add_sgpio_zhaoxin' [-Wmissing-prototypes]
     621 | int add_sgpio_zhaoxin(void)
         |     ^
   drivers/ata/ahci_zhaoxin_sgpio.c:621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     621 | int add_sgpio_zhaoxin(void)
         | ^
         | static 
   drivers/ata/ahci_zhaoxin_sgpio.c:673:6: warning: no previous prototype for function 'remove_sgpio_zhaoxin' [-Wmissing-prototypes]
     673 | void remove_sgpio_zhaoxin(void)
         |      ^
   drivers/ata/ahci_zhaoxin_sgpio.c:673:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     673 | void remove_sgpio_zhaoxin(void)
         | ^
         | static 
   7 warnings generated.


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
