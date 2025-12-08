Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EAA3A1DB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765219080; cv=none; b=lgNZaMeP2QtnPBEfXH9u2reNx77+hBS0Se31Ooy6uQQOoiXranHPfSPtAbxLPTIAncJvsPyDuhR3LBlhamJCWg/cSxnPFO3xgNhvnomuWyQ3bno3DSnruxmGnh5U/tMllZrehJZEgUZTk52U2xCWlUDXmwI8I5lNihmbfmi7VMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765219080; c=relaxed/simple;
	bh=tRn3RHtDjlfbge1/gxXhH90BKtidYQUxBgg2SYTcxNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQ1GroNYVV3iv7bkmTsKw+K9d19ODC70BxkWRivmwY+C67yRh1cDFfJftrIl3MfpE2UrPTa9mchYa1Z4asRNpTDKhmaS/tWOcSeNMNuS6Vt7i/z0nyJYWeIKLMN9x3qmxydEmzwytWlghhzEGYmpiSoxuxExhSHc9WT6phwjJ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LRbmhqN9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LRbmhqN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765219078; x=1796755078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRn3RHtDjlfbge1/gxXhH90BKtidYQUxBgg2SYTcxNU=;
  b=LRbmhqN9hSWxhDzcbdoPILbEuktFTT7dFm1sgsZRiAI+hrtUPC2kky+Y
   cqpatUovEV9Q6/KmqCW4vPh/+973ZxBMO99MWKGeNs/6jz5Yc4CO3oPa2
   PPAqM6lFRFWMD/XSZQV/RZQZsOwxAfHCslJh16SkkcwbjOBl0vwiOavX3
   CedacvwnJ8ZURutQw0DqNO+a8/+sgfLL0wjrYe4t/RNan+8Rfx0IoGUzJ
   s9PwkN2r1l1s6hs0Ns6U8LY8ebfsYxs+dlEFlo1h9ia/NuGrRagpFkPFm
   S25Gw8pVlJCLYUqjYnc4etvfi+vKxzKB/ueCiofOyx1rN95WkOvlYZm8m
   g==;
X-CSE-ConnectionGUID: i3kou4WHR7S84FYFVWFOOA==
X-CSE-MsgGUID: NCPi/sYxS0uLPGAiaAgyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78527061"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="78527061"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 10:37:56 -0800
X-CSE-ConnectionGUID: uFBZFhvOQaa+jFU4LR7hpw==
X-CSE-MsgGUID: TF5nC/SXR4ezp3hAXGUn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="233380173"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Dec 2025 10:37:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSg7M-000000000j8-1zMS;
	Mon, 08 Dec 2025 18:37:52 +0000
Date: Tue, 9 Dec 2025 02:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3485/3485]
 drivers/net/ethernet/huawei/bma/kbox_drv/kbox_printk.c:281:57: warning:
 diagnostic behavior may be improved by adding the 'format(printf, 1, 2)'
 attribute to the declaration of 'kbox_dump_printk_info'
Message-ID: <202512090240.NdebMvOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36141432a37f7dedddde8825e724b07ce3a440fb
commit: cd2978286f40089fcd83f74ffdff733bfbe1e52a [3485/3485] Huawei BMA: Adding Huawei BMA driver: host_kbox_drv
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251209/202512090240.NdebMvOZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 000e46219ba1ee53fc42d35e00c314c2807e8b14)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090240.NdebMvOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090240.NdebMvOZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/bma/kbox_drv/kbox_printk.c:20:
   In file included from drivers/net/ethernet/huawei/bma/kbox_drv/kbox_include.h:21:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/loongarch/include/asm/cacheflush.h:8:
   In file included from include/linux/mm.h:2204:
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
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_printk.c:281:57: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 2)' attribute to the declaration of 'kbox_dump_printk_info' [-Wmissing-format-attribute]
     281 |         num = vsnprintf(tmp_buf, sizeof(tmp_buf) - 1, fmt, args);
         |                                                                ^
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_printk.h:30:6: note: 'kbox_dump_printk_info' declared here
      30 | int  kbox_dump_printk_info(const char *fmt, ...);
         |      ^
   6 warnings generated.
--
   In file included from drivers/net/ethernet/huawei/bma/kbox_drv/kbox_panic.c:20:
   In file included from drivers/net/ethernet/huawei/bma/kbox_drv/kbox_include.h:21:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/loongarch/include/asm/cacheflush.h:8:
   In file included from include/linux/mm.h:2204:
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
>> drivers/net/ethernet/huawei/bma/kbox_drv/kbox_panic.c:85:57: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 2)' attribute to the declaration of 'kbox_dump_painc_info' [-Wmissing-format-attribute]
      85 |         num = vsnprintf(tmp_buf, sizeof(tmp_buf) - 1, fmt, args);
         |                                                                ^
   drivers/net/ethernet/huawei/bma/kbox_drv/kbox_panic.h:21:5: note: 'kbox_dump_painc_info' declared here
      21 | int kbox_dump_painc_info(const char *fmt, ...);
         |     ^
   6 warnings generated.


vim +281 drivers/net/ethernet/huawei/bma/kbox_drv/kbox_printk.c

   270	
   271	int kbox_dump_printk_info(const char *fmt, ...)
   272	{
   273		va_list args;
   274		int num = 0;
   275		char tmp_buf[TMP_BUF_SIZE] = { };
   276	
   277		if (g_printk_init_ok != KBOX_TRUE)
   278			return 0;
   279	
   280		va_start(args, fmt);
 > 281		num = vsnprintf(tmp_buf, sizeof(tmp_buf) - 1, fmt, args);
   282		if (num >= 0)
   283			(void)kbox_duplicate_printk_info(tmp_buf, num);
   284	
   285		va_end(args);
   286	
   287		return num;
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
