Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC510225A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 01:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731547796; cv=none; b=a/RTs6HlpriypaHHq+0PEl2FFXYY57iMQER8+Ruu+KEVBa5+mS5uRm31E96ec4QZKSD+BIPLBHKZ9S3dbn9y+JS0hL2QiAwM0AUbJzmClse6TChHg2QG7X9+htZ9Dl6/cUI/UADnEJU7S7Usq3r6X3hqdFB1ogj6U7mSyL1FCb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731547796; c=relaxed/simple;
	bh=X/ugtRT55emOqiAkVhGwzjoQ3kNpKoxLJ6zCV02f/qE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHhhH72sNXmw4HGy+0BdefVTDGyio4npEvR2k6c5lIj2nCWG5Bqr1/gJjdNOdtX9voSlvjYr6f6MzC3H2BvdWVUHUXX8k3TViZqMSiO+AZFYX5kZlZlKzUBRxIr2F0xtnSl8FG8tyWxOJk2qABXE4mWuJuzKkRDHyHeLvpUrz6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCMrf58H; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCMrf58H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731547794; x=1763083794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X/ugtRT55emOqiAkVhGwzjoQ3kNpKoxLJ6zCV02f/qE=;
  b=bCMrf58HnU2NiL2lTlaFY+XRo1I+3sifiqXvWE0J6DboVIbrjxxpwsmU
   IpnxJWuDdYx+TBRy+4I5qMWztxofD/tUsEZ2BqaOVITA3g/e0X6mlW5Tt
   mjtDx26EKn1PZRMiXe4aDDCnD4+QTvXvXbX/1ap6Ek1i1mtMS6bNKI4mS
   sE0Kuk8SWPi4vttQkEAm8ndUydchJVjRsugVBQZewk4GZid3URJkMFQTf
   HKjSXveswKdOMzn5oSLj9ztSQc2vnepzdCtKr6S6kGMShBEgR2GtNWIxQ
   3BmIbSDAEiqgkLHGFblW+V3MA2abXQ23FNepkuT2ZqULKqkCrWqBsR4+o
   w==;
X-CSE-ConnectionGUID: hKsrcCqjR3S/3JrwEkNNew==
X-CSE-MsgGUID: 0bqP7vjaSL+Tdp05LOVQ6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31239754"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31239754"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 17:29:53 -0800
X-CSE-ConnectionGUID: 52qz0shXRv+cwZ1gYe7s5g==
X-CSE-MsgGUID: HkSXaLrfQb6rOExxcjYWZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88468710"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2024 17:29:52 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBOg9-00012R-2x;
	Thu, 14 Nov 2024 01:29:49 +0000
Date: Thu, 14 Nov 2024 09:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 block/blk-io-hierarchy/debugfs.c:63:2: error: implicit declaration of
 function 'hierarchy_show_slow_io'
Message-ID: <202411140945.MlPVuer1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: b2f723aef027af0f194ff0c9f53f8ae6a7cb7de3 [1294/1294] blk-io-hierarchy: support to recored the number of slow IO
config: x86_64-randconfig-123-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140945.MlPVuer1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140945.MlPVuer1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140945.MlPVuer1-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-io-hierarchy/debugfs.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/wait.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-io-hierarchy/debugfs.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-io-hierarchy/debugfs.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   block/blk-io-hierarchy/debugfs.c:63:9: sparse: sparse: undefined identifier 'hierarchy_show_slow_io'
   In file included from block/blk-io-hierarchy/debugfs.c:15:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/blk-io-hierarchy/debugfs.c:63:2: error: implicit declaration of function 'hierarchy_show_slow_io' [-Werror,-Wimplicit-function-declaration]
      63 |         hierarchy_show_slow_io(hstats_data, m);
         |         ^
   block/blk-io-hierarchy/debugfs.c:63:2: note: did you mean 'hierarchy_account_slow_io'?
   block/blk-io-hierarchy/iodump.h:85:1: note: 'hierarchy_account_slow_io' declared here
      85 | hierarchy_account_slow_io(struct hierarchy_stage *hstage,
         | ^
   1 warning and 1 error generated.
--
   In file included from block/blk-io-hierarchy/debugfs.c:15:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> block/blk-io-hierarchy/debugfs.c:63:2: error: implicit declaration of function 'hierarchy_show_slow_io' [-Werror,-Wimplicit-function-declaration]
      63 |         hierarchy_show_slow_io(hstats_data, m);
         |         ^
   block/blk-io-hierarchy/debugfs.c:63:2: note: did you mean 'hierarchy_account_slow_io'?
   block/blk-io-hierarchy/iodump.h:85:1: note: 'hierarchy_account_slow_io' declared here
      85 | hierarchy_account_slow_io(struct hierarchy_stage *hstage,
         | ^
   1 warning and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
   Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
   Selected by [y]:
   - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]


vim +/hierarchy_show_slow_io +63 block/blk-io-hierarchy/debugfs.c

    28	
    29	static int __hierarchy_stats_show(struct hierarchy_stats_data *hstats_data,
    30					  struct seq_file *m, enum stage_group stage)
    31	{
    32		u64 dispatched[NR_NEW_STAT_GROUPS] = {0};
    33		u64 completed[NR_NEW_STAT_GROUPS] = {0};
    34		u64 latency[NR_NEW_STAT_GROUPS] = {0};
    35		int cpu;
    36		int i;
    37	
    38		for_each_possible_cpu(cpu) {
    39			struct hierarchy_stats *stat =
    40				per_cpu_ptr(hstats_data->hstats, cpu);
    41	
    42			for (i = 0; i < NR_NEW_STAT_GROUPS; ++i) {
    43				dispatched[i] += stat->dispatched[i];
    44				completed[i] += stat->completed[i];
    45				latency[i] += stage_is_rq(stage) ?
    46					      stat->jiffies[i] : stat->nsecs[i];
    47			}
    48		}
    49	
    50		if (stage_is_rq(stage))
    51			for (i = 0; i < NR_NEW_STAT_GROUPS; ++i)
    52				latency[i] =
    53					jiffies_to_msecs(latency[i]) * NSEC_PER_MSEC;
    54	
    55		seq_printf(m, "%llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
    56			   dispatched[STAT_READ], completed[STAT_READ],
    57			   latency[STAT_READ], dispatched[STAT_WRITE],
    58			   completed[STAT_WRITE], latency[STAT_WRITE],
    59			   dispatched[STAT_DISCARD], completed[STAT_DISCARD],
    60			   latency[STAT_DISCARD], dispatched[STAT_FLUSH],
    61			   completed[STAT_FLUSH], latency[STAT_FLUSH]);
    62	
  > 63		hierarchy_show_slow_io(hstats_data, m);
    64		seq_putc(m, '\n');
    65		return 0;
    66	}
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
