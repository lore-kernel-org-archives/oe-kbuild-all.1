Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B84734E277
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987139; cv=none; b=rU1vj3HWWLl539Tp9ebV6fME47QcZWW4p3cHMevHFzoRLvVYht8QxPsr7FqTVbI4J/t2ZsaG6N7OhcWN4/EkMj9L3QE/xX9D779VUYZDL3x4KbYjEV+EyBvTAWnznDq4TPHy9mFihkYm5urUWvQu7BXQFV1daA1x/CdwjKVhuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987139; c=relaxed/simple;
	bh=w0XFTRqXK+vIGeUzwGiQk8QoXrHISXB3zkfir8s6DlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TASGPtELOVIkiNy/Jl3KapybdWXu3TgJ3riRrIGnlUb7mcmP5CixtXlLzRi3daEkUkKhn8/MKV6lYM2dGq39D9IWH7vrxWm8yEYSitgkpm/oBh+93vPwF1fZOlgCsCLyU0FgpXF23LUAPyRK8breOJwQAHJ3ayi4yVNEOPeN9kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mzK+kVtx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mzK+kVtx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765987137; x=1797523137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w0XFTRqXK+vIGeUzwGiQk8QoXrHISXB3zkfir8s6DlE=;
  b=mzK+kVtxcU9c7WHKLi1fAT8pHfV+Pg31vcE6tt7y9tbxn7iYtrFuyaFK
   no0VJNA0QJ8LAIVGVHIyKN64iD+C2IUD/lfmZNUmOc+c27Yry240Gohc+
   iTj3MiNstG/eMMQpgHu7vhZwZisstx0aiVUTUHfVUg3Dc+XLIJoZ2KtGS
   cWZjDBn+dYH7GgWaLRXGWPIuLI9taxBDlloLMwAzKJc2jEhtBEXDAllft
   H4MgajeygwznELOfgr810vHXMFjOzPqUgDkvEC7kHw1B1QZg5wo9b0joY
   Hgr4CBJY67zNa8RKhnrJlBR/cwMTSJnzLqE6GZVPmObrGKxz1bj4lidOh
   w==;
X-CSE-ConnectionGUID: eWjfkJRSSgqDAiu1Qpz3jQ==
X-CSE-MsgGUID: ZJe/k36ETh6OIH1RvS5jmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78566103"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78566103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 07:58:56 -0800
X-CSE-ConnectionGUID: CW8Dbv5jSo+d4ruCvCxWmw==
X-CSE-MsgGUID: /l4/tGvZQguTOgNS5+4rrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="202529326"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Dec 2025 07:58:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVtvP-000000000rf-3uSP;
	Wed, 17 Dec 2025 15:58:51 +0000
Date: Wed, 17 Dec 2025 23:58:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1944/1944]
 block/blk-io-hierarchy/debugfs.c:63:2: error: implicit declaration of
 function 'hierarchy_show_slow_io'
Message-ID: <202512172302.VsJqe4Ef-lkp@intel.com>
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
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: b2f723aef027af0f194ff0c9f53f8ae6a7cb7de3 [1944/1944] blk-io-hierarchy: support to recored the number of slow IO
config: x86_64-randconfig-r062-20251217 (https://download.01.org/0day-ci/archive/20251217/202512172302.VsJqe4Ef-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172302.VsJqe4Ef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172302.VsJqe4Ef-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
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
