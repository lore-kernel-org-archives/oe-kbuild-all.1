Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A1942077
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715547555; cv=none; b=pV2G3XNHHQg1oV0VEZh9EFkvNNNKp/6Yv64Aj4qkFGCurSL1BJIDOto1rNRXsXQkGctfWp0ZJVRiEZ3cusRd8pmjx4tmQRverMI7cWm9aO9rA+vswhr5J/4m7aLzm1Pg/YIzlDIrykAYnQyV7k31U0lFxHIXs/wcMMdYt1RFWUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715547555; c=relaxed/simple;
	bh=16uRna6pcSiSpcRnJJ/oHY/ccrzHhuKEB0UslvjbmCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onsZ5gXD1V890QbvIKaeoRH1RcqyE0lga3BQ+NVvp1DMLujsztMU3BCRsQnBZTT59V3EKQRNZiGjUJXy0PIuTN0dBkj0CtvYTyt3apyfuTJP5hgFZIzwOPebdjF+obW8vRjrRq4zdoQ3HyR94zWYB23/mYNWAUhsc0c/Q1T4og4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuWDa2In; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuWDa2In"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715547553; x=1747083553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=16uRna6pcSiSpcRnJJ/oHY/ccrzHhuKEB0UslvjbmCI=;
  b=fuWDa2InQOLLyxTxUxkiuaUvvSQjuXe3BwNkqcBpG0VjZ37xAnZ/lmUa
   zFo3q3AJpesJBnnEb4zyLjHNK197aVEdrwKf8VeFBRF97UpmmclPh0bng
   GReKiCv3J+cJUb5H9+5vv1CeG6R5Fr+U9HNghu7vRJHeHf3qQbQoxWXPz
   UikPJP2gJivDtgUj4joxkqAmRhCmfub0LGjDmG5p3b44s9dutQibE/zre
   NifQCduDdFaHWyhPhy0OsJFj9NrAqoRYKc8PBgkiLTJBdFAOVBxxuwijt
   ZV824DhHZBWsJ4BkaJjdFJgzFteHPhPqMum4R/zTxzQQGx4UznBTCosdU
   A==;
X-CSE-ConnectionGUID: ORcNCkioTyiBP4mdoyimpg==
X-CSE-MsgGUID: HsCRRlA7QB2MByLchEVZOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22145097"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="22145097"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 13:59:12 -0700
X-CSE-ConnectionGUID: VCq9YyQSQjyMIwY/Qoj3SA==
X-CSE-MsgGUID: v8nsohgFS5W02hNCSuXAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; 
   d="scan'208";a="60967864"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 May 2024 13:59:12 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6GHl-0008uZ-0X;
	Sun, 12 May 2024 20:59:09 +0000
Date: Mon, 13 May 2024 04:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-netnext 17/17]
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c:640:5: error: conflicting
 types for 'mtk_eth_offload_init'
Message-ID: <202405130404.7VP9fmrq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-netnext
head:   9469b2a45f7e136361cc2a3ff84b2689e7517611
commit: 9469b2a45f7e136361cc2a3ff84b2689e7517611 [17/17] net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240513/202405130404.7VP9fmrq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130404.7VP9fmrq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130404.7VP9fmrq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mediatek/mtk_ppe_offload.c:6:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/arm64/include/asm/cacheflush.h:11:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2210:
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
>> drivers/net/ethernet/mediatek/mtk_ppe_offload.c:640:5: error: conflicting types for 'mtk_eth_offload_init'
     640 | int mtk_eth_offload_init(struct mtk_eth *eth)
         |     ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1540:5: note: previous declaration is here
    1540 | int mtk_eth_offload_init(struct mtk_eth *eth, u8 id);
         |     ^
   5 warnings and 1 error generated.


vim +/mtk_eth_offload_init +640 drivers/net/ethernet/mediatek/mtk_ppe_offload.c

502e84e2382d92 Felix Fietkau 2021-03-24  639  
502e84e2382d92 Felix Fietkau 2021-03-24 @640  int mtk_eth_offload_init(struct mtk_eth *eth)

:::::: The code at line 640 was first introduced by commit
:::::: 502e84e2382d92654a2ecbc52cdbdb5a11cdcec7 net: ethernet: mtk_eth_soc: add flow offloading support

:::::: TO: Felix Fietkau <nbd@nbd.name>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
