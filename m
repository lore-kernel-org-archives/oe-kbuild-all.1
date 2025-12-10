Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F02472BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765383150; cv=none; b=TMnutxbk8i8/Oc9roJQW31dmSxVUQndpUjIUbHfrLRw2wCpY8vGCH85nCahGd/ni08jabR8itScHFBom1trJjgd3J3Lppb+QJfu33QkACSx9mavZzNhgxG6JVyCKciOE3q9AnlKWIjfS1aWgSIn/mlyl/YNQr/k3tifsIAzL7qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765383150; c=relaxed/simple;
	bh=Qbm/ZjNIKXEaQsnfGmYk4U2B4wz/sc+dO8UvWRL51Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8z8DIway8IZShyNSqH5gqIns7v0lYTbG7KFbIsyM5gKHmO4CMnnLa+17ZxrOVwqyqhmdps422HBPjJ7yOfV197Hdbf/qLv9zV9mluIhhigYaScdp6DLH2mliJJI+qIFL904SH1jPIIA7ylEopDvQMDEg4+ZcdDcmzeF//xfa2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEvm959R; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEvm959R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765383147; x=1796919147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qbm/ZjNIKXEaQsnfGmYk4U2B4wz/sc+dO8UvWRL51Gs=;
  b=WEvm959RU2e4IWtWSXlf6DO9yTor1Q1zGrexJB2UgLqetlkj4ecAByBT
   QaAQ86+9hdsvGyWftemYrGkmmz4o+5VnSvyqDiIBbr9VSLOdVQY496b30
   pxjFNfu+xMPljp3tDEuljmO31+/NTa1HP8CqW1THn2jsVpncGoqrS8ESI
   q9GMRrS5zhFVHyG1+IdtjTkfSfHp95eEMa7qwRhOty+FT7M/f+UZHLiOj
   uCaqmNr+vi0Ho3bf/0P8luFp/3PQSGaN8BKCzJZtkBf23k5OPNajJ/lm/
   SfqrPyWd3YBeYKHWkKte+t/EPbO3sgRx5sliKRGDauFZ8Fk/KLlt7+Jpl
   A==;
X-CSE-ConnectionGUID: 8Ko62VazT/+d5zdiaktA4g==
X-CSE-MsgGUID: wOvR+b+bRMuEri2Y/1T+0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84766007"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="84766007"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 08:12:26 -0800
X-CSE-ConnectionGUID: ni6bTjACR1i13wvUX0jkEg==
X-CSE-MsgGUID: vSiY0YYPRXalyRi0uZNEmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="233957918"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 08:12:26 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTMnf-000000000dU-0YoL;
	Wed, 10 Dec 2025 16:12:23 +0000
Date: Wed, 10 Dec 2025 17:11:36 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] block/genhd.c:100:6: warning: no
 previous prototype for 'part_stat_read_all'
Message-ID: <202512101708.qm6iJ0uc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7bf6051b5c404918d02133a7e2aad8b059d6f6b0
commit: 89fa7dcff5e533bd14396601f40c388cfb6c1e59 [3508/3508] bpf-rvi: block: Add diskstats iterator target
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251210/202512101708.qm6iJ0uc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101708.qm6iJ0uc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101708.qm6iJ0uc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:100:6: warning: no previous prototype for 'part_stat_read_all' [-Wmissing-prototypes]
     100 | void part_stat_read_all(struct block_device *part, struct disk_stats *stat)
         |      ^~~~~~~~~~~~~~~~~~


vim +/part_stat_read_all +100 block/genhd.c

    99	
 > 100	void part_stat_read_all(struct block_device *part, struct disk_stats *stat)
   101	{
   102		int cpu;
   103	
   104		memset(stat, 0, sizeof(struct disk_stats));
   105		for_each_possible_cpu(cpu) {
   106			struct disk_stats *ptr = per_cpu_ptr(part->bd_stats, cpu);
   107			int group;
   108	
   109			for (group = 0; group < NR_STAT_GROUPS; group++) {
   110				stat->nsecs[group] += ptr->nsecs[group];
   111				stat->sectors[group] += ptr->sectors[group];
   112				stat->ios[group] += ptr->ios[group];
   113				stat->merges[group] += ptr->merges[group];
   114			}
   115	
   116			stat->io_ticks += ptr->io_ticks;
   117		}
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
