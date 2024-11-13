Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F970205E0E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 20:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731530159; cv=none; b=emrc+73AL+MwUvxWMzGbXMnoiP1WX4tLJ7T7AZh+B7HRpVEo3TYBioGRbjC5abIaeFhmPzU85V9zC359q3M1BiqTvmoTOiJhXgU5jQbLytYNA9Fxya4j+leizb9A0svl13AZri7gcTbNtfIBTFOLn05hzwEZF11NMPk9x8MbalU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731530159; c=relaxed/simple;
	bh=mK9X8LdOmsvOoWl/uogErCWkHeqmNKZIZ2FZ1Bm4a+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFqW7C6MOtc7jEVy+PssMfu+mxuM1mbCO9f2GXjxCVTxL89600KM0JSCMIEUqaHMy0EROSCrLm+x/hJpFCYi97CJlpGsQQBEzGJ9Hjz1EKA4J+HpwTSWj02SR8GNRoYti4jTwxoNk4/EM8HbsCfrnNbCNOd6CWh/eEfyASk/jvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnXws/lB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnXws/lB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731530157; x=1763066157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mK9X8LdOmsvOoWl/uogErCWkHeqmNKZIZ2FZ1Bm4a+g=;
  b=TnXws/lB/XGVSTyJXikEhKixJ/RRBWJuyEHIyaNT1svS25s/hP50K4UC
   IZ7DYLCOrjKtFVrvlHxOfRQXszR8XDeMZZQ99oH2292KYj3CT40HBYgPO
   3L59dCoD2fwNLLjEGo+E6vMUautjzEzKT99nsc2yNTzofzGE06/s8mUan
   bFijkBeWiACP50Cp1Wt7OUgq6CupLR+G2CJsfpJc6nwacHH/Jpp2ySyEZ
   Cb+wAs9EUuO7D5KE5KKHdBN6GSD1x5s/qJWGloXF3voLM/YEzTU1GEcBn
   OOI9A1gchpNgr15KkznbWFhl8ejuaAlAAZB15SRv8tWwZwIQucWqFUAcr
   A==;
X-CSE-ConnectionGUID: 5G5wbIQxTvmvIme10hcubQ==
X-CSE-MsgGUID: ffxcrt3lSQ6fTGGgzG66pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48949457"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="48949457"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 12:35:56 -0800
X-CSE-ConnectionGUID: Oz9ppbDoQYuco9gygNaR1w==
X-CSE-MsgGUID: 2sNwN7kFSk+BN8FRnAfZ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="125491940"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2024 12:35:33 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBK5L-0000hX-03;
	Wed, 13 Nov 2024 20:35:31 +0000
Date: Thu, 14 Nov 2024 04:34:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 block/blk-io-hierarchy/debugfs.c:63:9: error: implicit declaration of
 function 'hierarchy_show_slow_io'; did you mean 'hierarchy_account_slow_io'?
Message-ID: <202411140424.PtWwsqSC-lkp@intel.com>
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
config: arm64-randconfig-003-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140424.PtWwsqSC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140424.PtWwsqSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140424.PtWwsqSC-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-io-hierarchy/debugfs.c: In function '__hierarchy_stats_show':
>> block/blk-io-hierarchy/debugfs.c:63:9: error: implicit declaration of function 'hierarchy_show_slow_io'; did you mean 'hierarchy_account_slow_io'? [-Werror=implicit-function-declaration]
      63 |         hierarchy_show_slow_io(hstats_data, m);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         hierarchy_account_slow_io
   cc1: some warnings being treated as errors


vim +63 block/blk-io-hierarchy/debugfs.c

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
