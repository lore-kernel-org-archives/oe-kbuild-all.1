Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106D198A37
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735598459; cv=none; b=ttxKvjQuuPx6Ud2yf56M3TcdgfBmryY6rdRfV5AzkYGLQNWSl6K5ICGVjKfcTIWHqzSAHhaIl1yr4B/0DbhazAavQ51WHg2cQjTFuGyxNG9G/SBoNP7oiQauDDnkb1cWAjaDy1uvD6IQLyXK4/72FGNdG6I9ODaQdwaOdqITzT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735598459; c=relaxed/simple;
	bh=Bm4aunSxEm2PWT+jAnQRQ9B8I3foUJDjlJqNmxtlFRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E8Iyo7pQhFHLZ2ZMLKL0+XmXBiuG1b7LqzMmcAtXjLdb8Owe6mZpehCQmyLPcWa9bdFMDdvwyJFMxZSecji++AqXXqjxQUbKBsumUr7Lnk7fh6dmciV1IST5Gz1PHHINpS07OaAGTNsX55Nf1Vj/YTo3oKwlpqIxj7xMTU5FoLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAecldBw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAecldBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735598456; x=1767134456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bm4aunSxEm2PWT+jAnQRQ9B8I3foUJDjlJqNmxtlFRs=;
  b=ZAecldBw5Q9ClW3RWuYohI2tLTMLsmG5SZuFBaMGVqjZ7N7L2HsQGnAA
   DmLs6top7gPs4uAyL6wikl9eIUp/KOmE+Uj1fEAwpGkcWyOC2aT4rEhbe
   h4m1jqGHX4hOew8tHqpXk1K+j9npvLQ3yI2OpkDHuOtH1d/l/gwpSu0bf
   +QE+lvne0A/2q4CPQp32q/esj5UoTntCsgG/ntEF6XNJMiclW9bKr9hsY
   2YtgHNy99yu9sEPlH3lv+ZLhJWyafmLFzbNDgbPw6oWCp+MJF/Xfs6r4/
   kYxYXXnYVcYExM/CMc3g6dbiRVChwdw4iy8hcE/j9RAmhsGFa4aXrz19e
   Q==;
X-CSE-ConnectionGUID: yvrFJWEvRhaaGch2i/z9+g==
X-CSE-MsgGUID: qsFlwZckTLesA0q44zsteQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35139197"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="35139197"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 14:40:55 -0800
X-CSE-ConnectionGUID: +clPCGz7QuKOFc07uZ3ebQ==
X-CSE-MsgGUID: 1hIrufozT1uCR6KfN+PWmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="105879117"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Dec 2024 14:40:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSORQ-0006Ru-0z;
	Mon, 30 Dec 2024 22:40:52 +0000
Date: Tue, 31 Dec 2024 06:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1359/1359]
 block/blk-io-hierarchy/debugfs.c:63:2: error: implicit declaration of
 function 'hierarchy_show_slow_io'
Message-ID: <202412310605.VXvJcPMm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4dc4cec05b40921a3db85d24f97f1142272e4abf
commit: b2f723aef027af0f194ff0c9f53f8ae6a7cb7de3 [1359/1359] blk-io-hierarchy: support to recored the number of slow IO
config: x86_64-buildonly-randconfig-001-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310605.VXvJcPMm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310605.VXvJcPMm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310605.VXvJcPMm-lkp@intel.com/

All errors (new ones prefixed by >>):

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
