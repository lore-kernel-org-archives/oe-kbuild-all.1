Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F3B33E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 00:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732581435; cv=none; b=eYAQbUkRuHIi4Cq3/Xms7Hati/5IRFMjszdW0Igojr/iGHC8ioGiGo8eXhqbn03NiUwC338KvkLHzTN/i3RTLHDMWV120Qx3RdhCTshUVGNqRtH73AAeK0K7AC0Fsz3yGdqSPkhTpWidMg8NuV6ZLu2fJs1bIsSEP3Iloz3M0cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732581435; c=relaxed/simple;
	bh=dIWK1GlGf+pCwly56VFduUcmvJCutce8SxZ2FnhKhdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S/lhTVtBx9KxLZdW7mJuv9uzYSEht35YeayueoWRKNJDsiIDjhkX1VmUFDiPUML0gm6KDCQFlgUxlpx1r5DhNxdqh+4ap7FCJ7oCnPYDdXryZPed4V/AiQCmvJD0kZMRR6G9iFvbleEdpln7cO/AQQvXLPl6VjCrY7SLiCRyebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OW/hRljW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OW/hRljW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732581433; x=1764117433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dIWK1GlGf+pCwly56VFduUcmvJCutce8SxZ2FnhKhdk=;
  b=OW/hRljWYRqK7G0tIcH8cLseyrvzV1ZGjvRbhW30Hcj8iQOXSuh+cqvI
   CTfmUeZMkAyC2Z49gJCpZ4QWq9Jsovc4z7xmPYKp+kAGd8AIJZHQZm4Xb
   KEvX/1241FoPLnh00UpfkFtsQjNyS3zlHerxlD7iNIWfpfm72/g6havLR
   GzHVbrJdB37ELF8YSGeYmHidw+ILCgLWbvJCw3bMPuCa2dhuNmybc6tOw
   MmD3w3DQSwPGCMixjMDaMgnPKNyPbi8Ex+G/BM0NFhCYtgQN02PDSNGGo
   S9l1+dZ0c/ZklU1CKiNN3KDAIFVrzKeOahtigeW3Gdb4gRVpVzUVI1w20
   Q==;
X-CSE-ConnectionGUID: 4d4MY0CXSmq9ckywTu1FUA==
X-CSE-MsgGUID: W72xrEgUSGaARJIUL7LmMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="58125546"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="58125546"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 16:37:13 -0800
X-CSE-ConnectionGUID: aR6i//G4QVifkg8bc7sx1w==
X-CSE-MsgGUID: h9jMTXq2Swu6kMOco2txkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="91561800"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Nov 2024 16:37:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFjZl-0006w0-1I;
	Tue, 26 Nov 2024 00:37:09 +0000
Date: Tue, 26 Nov 2024 08:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, s00851154 <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1525/1525]
 drivers/net/ethernet/huawei/hinic3/hinic3_tx.c:395:5: warning: no previous
 prototype for function 'hinic3_tx_offload'
Message-ID: <202411260828.tqAJ61AV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   37bf81d42b30a06140faa3c377e3f3c16f954e89
commit: 74e3846262704452212a3245dccb10c2cd185ac3 [1525/1525] net/hinic3: Support new TX feature
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241126/202411260828.tqAJ61AV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260828.tqAJ61AV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260828.tqAJ61AV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic3/hinic3_tx.c:6:
   In file included from include/net/xfrm.h:9:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
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
>> drivers/net/ethernet/huawei/hinic3/hinic3_tx.c:395:5: warning: no previous prototype for function 'hinic3_tx_offload' [-Wmissing-prototypes]
     395 | u32 hinic3_tx_offload(struct sk_buff *skb, struct hinic3_offload_info *offload_info,
         |     ^
   drivers/net/ethernet/huawei/hinic3/hinic3_tx.c:395:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     395 | u32 hinic3_tx_offload(struct sk_buff *skb, struct hinic3_offload_info *offload_info,
         | ^
         | static 
   6 warnings generated.


vim +/hinic3_tx_offload +395 drivers/net/ethernet/huawei/hinic3/hinic3_tx.c

   394	
 > 395	u32 hinic3_tx_offload(struct sk_buff *skb, struct hinic3_offload_info *offload_info,
   396			      struct hinic3_queue_info *queue_info, struct hinic3_txq *txq)
   397	{
   398		u32 offload = 0;
   399		int tso_cs_en;
   400	
   401		tso_cs_en = hinic3_tso(offload_info, queue_info, skb);
   402		if (tso_cs_en < 0) {
   403			offload = TX_OFFLOAD_INVALID;
   404			return offload;
   405		} else if (tso_cs_en) {
   406			offload |= TX_OFFLOAD_TSO;
   407		} else {
   408			tso_cs_en = hinic3_tx_csum(txq, skb, offload_info, queue_info);
   409			if (tso_cs_en)
   410				offload |= TX_OFFLOAD_CSUM;
   411		}
   412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
