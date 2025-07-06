Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6088529A5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751767982; cv=none; b=KTa92J1WYLWR0D+x8zoT9pgttWyWWUje0Fp9d7AYsUiEA2mue0EECWDmXoch6TwdnJNV5vW+Ai7Nas/4WcVws663Ma0tEOLdJLEwiz8CCqzvQF976gnIpNQZLGbmJ45MLBvMOfg9bu4KOhyY4MJ2A59683AuLpUTOloiIabn25I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751767982; c=relaxed/simple;
	bh=VjO8mb3xrXY8BDA3KnU2P5psKFqFLlHwrB2OZHge6Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iFuMO/QzM42wh/RXfBVrC7Fljwmc7dguTOlM4t1/9JvpuZNSFbhixgR1k/NX9IKoPvJF3D2zjzb5HAHc3+oxi8n6XdrTHj5fdhlfld3KHi2RIGw+U7Fo9yw8vmdXTs6FQsZOI4HrbJEvlw3N8EzOJVZDn/482xoUJRBg/T0685I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jw9SclFS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jw9SclFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751767980; x=1783303980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VjO8mb3xrXY8BDA3KnU2P5psKFqFLlHwrB2OZHge6Vs=;
  b=Jw9SclFStEKl1lFSha4Bk54LGyDDJGv8ijjTkJ5BTGITQDywgINU4Rqi
   060lWllaoQW5kUqUdfIvkd/+ftjyYLgBoJ4xjDbv/9TtqzFHSYni65vpT
   OtcAxVjeE6q9cKr3/q2/+tu/WLiBs+97gzFmLqq21CQKNC0s8VqLcALvl
   0wbZ2WGv+vWlqufFn3ZsrkabjjsMuVF+R9QPyV5pya9HeGdJudHToAAuS
   Qo1557xDy6FtfTnCrparipnDLrdIlABXAIM11w8WckkFtHDQV8ruWzjCJ
   M0uqoXmAYP32nUhDJ31kMsniljCwDf77hIicm03+3Ei/KNTeR+iWZMeze
   A==;
X-CSE-ConnectionGUID: bKZIyvKnS1eQuy2utvlyLA==
X-CSE-MsgGUID: avy9IAueQ4+dNsb5o+XAfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="41653393"
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="41653393"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 19:13:00 -0700
X-CSE-ConnectionGUID: U9wkzm+KS22la+RsO890Xg==
X-CSE-MsgGUID: eqjbYB9wQLu637hHh/2f+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,291,1744095600"; 
   d="scan'208";a="160450260"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jul 2025 19:12:58 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYEsC-0004p3-1o;
	Sun, 06 Jul 2025 02:12:56 +0000
Date: Sun, 6 Jul 2025 10:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1719/1719]
 block/blk-io-hierarchy/debugfs.c:63:2: error: implicit declaration of
 function 'hierarchy_show_slow_io'
Message-ID: <202507061031.GhTBMLAx-lkp@intel.com>
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
head:   e6b6811414fe4cfc995369e8bda32fc1b4ee1d51
commit: b2f723aef027af0f194ff0c9f53f8ae6a7cb7de3 [1719/1719] blk-io-hierarchy: support to recored the number of slow IO
config: x86_64-randconfig-101-20250706 (https://download.01.org/0day-ci/archive/20250706/202507061031.GhTBMLAx-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507061031.GhTBMLAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507061031.GhTBMLAx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-io-hierarchy/debugfs.c:63:2: error: implicit declaration of function 'hierarchy_show_slow_io' [-Werror,-Wimplicit-function-declaration]
      63 |         hierarchy_show_slow_io(hstats_data, m);
         |         ^
   block/blk-io-hierarchy/debugfs.c:63:2: note: did you mean 'hierarchy_account_slow_io'?
   block/blk-io-hierarchy/iodump.h:85:1: note: 'hierarchy_account_slow_io' declared here
      85 | hierarchy_account_slow_io(struct hierarchy_stage *hstage,
         | ^
   1 error generated.


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
