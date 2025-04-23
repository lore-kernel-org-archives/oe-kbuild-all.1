Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CFD28C5C6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745429135; cv=none; b=GvMnGoAl/zCa5uzPW7bMgHGvv8jrsKn+tztB/xsOIlzeP8K1nV5j2yOTGOe+EL3HHfaCFQhckPuG32qvc/Pwnk6RD7nWic43zN/M8SrqFeiZngbO6/I5/s3kvoF8CryJdlN+2g0nUp5lr83SpopJHA0qPRY/hbFWITmo7s36O+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745429135; c=relaxed/simple;
	bh=pdPKTEwWK0Kv2l9nq3+vKBUcOgjsrvP3DZwM9YF/7ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2xcURyYYlxX/k8ATQYsxBhVynORKCXkPUHCYIvez2a6Tz8MdeQHXxeYJYMdoWD9rxyoyM6BzoQ5V82wUsG/0G5tMytrIv6wS+Q5SbzS9FAxnFLJ2RWaGrYfPVjYuLVgIuaa+Ezo1BAv+mjeS4SOwgXl/8uSeT59DM2gU3wXZU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKYH/WPl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKYH/WPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745429134; x=1776965134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pdPKTEwWK0Kv2l9nq3+vKBUcOgjsrvP3DZwM9YF/7ys=;
  b=jKYH/WPlaxsZ6qu9B2dD3Pvfmy8dzm0mD4GZu6u0wKkkpqDRgdo6eq5B
   JWCeeim8SP7dbcHb/mEfnTAF5tz+3Ifs4a6u6Sjw9oTJ82hwZGMk+3uYj
   r93r7XHq9j48rXvHx7foL7Sza3BYtpGe/PDrydCk8jnYjAIP7dnUXJNT5
   TQwvDKarjmfVx6nBtKuBJtSm8nJoDgrQIzIm317WcCdtRbTFe9Bt6brTh
   lRkyAIYdOOxNqTfZBSStzmoVEcDT1fjEQkz1i9yQkmQMpgnr7J0Xj0fcY
   SYQ9/8JiV0HR+IFTx2zaFtojp3OGy8gWfvYqSKADqN7mYyBEQZhmi4fmS
   Q==;
X-CSE-ConnectionGUID: KepBWy0jQwOvyEuizNaFpA==
X-CSE-MsgGUID: 9/wCpsuQRkGalQgv1mpjqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50863719"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50863719"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:25:31 -0700
X-CSE-ConnectionGUID: Hd3nO56VTSeTOAZw+3WfyA==
X-CSE-MsgGUID: 3i1tR4wAReKPRwTJ1Xta1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132908760"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Apr 2025 10:25:30 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7dqh-0003Ut-2t;
	Wed, 23 Apr 2025 17:25:27 +0000
Date: Thu, 24 Apr 2025 01:25:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2163/2163]
 block/blk-io-hierarchy/iodump.c:188:17: error: no member named 'bi_blkg' in
 'struct bio'
Message-ID: <202504240132.o0JWh6zx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb46ff9245f25c71ce2d456156bb2fc39c400aad
commit: 1bf8f90fb90c600d9f372e6be4ef251cc8905f04 [2163/2163] block-io-hierarchy: core hierarchy stats and iodump implementation
config: arm64-randconfig-003-20250424 (https://download.01.org/0day-ci/archive/20250424/202504240132.o0JWh6zx-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240132.o0JWh6zx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240132.o0JWh6zx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/blk-io-hierarchy/iodump.c:15:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
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
>> block/blk-io-hierarchy/iodump.c:188:17: error: no member named 'bi_blkg' in 'struct bio'
     188 |         blkg_path(bio->bi_blkg, path, PATH_LEN);
         |                   ~~~  ^
   4 warnings and 1 error generated.


vim +188 block/blk-io-hierarchy/iodump.c

   179	
   180	static void __hierarchy_show_bio(struct seq_file *m, struct bio *bio,
   181					 enum stage_group stage, u64 duration)
   182	{
   183		char rwbs[RWB_LEN];
   184		char path[PATH_LEN] = {0};
   185		struct task_struct *task = get_pid_task(bio->pid, PIDTYPE_PID);
   186	
   187		blk_fill_rwbs(rwbs, bio->bi_opf);
 > 188		blkg_path(bio->bi_blkg, path, PATH_LEN);
   189	
   190		seq_printf(m, "%s-%d %s stage %s bio %s %llu + %u cgroup %s started %llu ns ago\n",
   191			   task ? task->comm : "null", task ? task->pid : 0,
   192			   bio->bi_bdev->bd_disk->disk_name,
   193			   hierarchy_stage_name(stage), rwbs, bio->bi_iter.bi_sector,
   194			   bio_sectors(bio), path, duration);
   195	
   196		if (task)
   197			put_task_struct(task);
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
