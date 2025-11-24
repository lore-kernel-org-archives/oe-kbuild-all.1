Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04011400C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976781; cv=none; b=FERYGjjGwSDZZIC8hekzADF03HCHWTZ1sdRHby32UeKiiSADRfjAqBppPHf3bw6A5Hi5p7d4/+n8Nnfzbj9Es/lY2HgvRp0ZzkhXmZxw0dXlJVzITWss/A8r5DB4nie4vEdF52yQXzd/IhAKXw18wmEnbGcOS+Y7jIPhf/6Bf40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976781; c=relaxed/simple;
	bh=fNP/d1mkSTOco1NjX01rRM3VUgddltdPLOVJFMyV5SM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0sOUe9tlSRdOpElmIzbJSqHGOG8Il8qP7pvpWDPbOwsclA/F7CWQFfcQi2OZkP2W9vQRlLKrrRzZ2uZ98Bh7J4iJtTQ9g/1HqFT5ehC7/qEg8zIjhooKcBGpRbUZgs3+cW+u6LZVJMJGqiA5yFgX8C1i8TF6Bg+kejvVa64rp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVgLwrS2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVgLwrS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763976779; x=1795512779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fNP/d1mkSTOco1NjX01rRM3VUgddltdPLOVJFMyV5SM=;
  b=aVgLwrS28JJ5N/oedp6uEqW03Vd5AMtkVHfZcdAc7cEHW6UfYPViJNVS
   InzeDBoVHt+5vmoaMLcezm1LVWR0qsPcWWmeFVi4qPk1Q3ookuai5MRIh
   WTok6Bkb8gG/6T42ya+8KnU2pd0c4HB7WK2YvgczivphzNiS3iaRifxG6
   xaOUrcNcY/RgIvXvYBNqwhEelERZxFJMCgiapP3udh42Dj653HTTkGv3o
   ebluEUxGdIHtZN2Oqs9PmCQa7b3ZTSj8dWZqdkn8ofOPOVNyzoC1FG8bq
   XAzKsluWKFodc67TL5BoAfroqTHjHmVKjDU4qBB1x1TfOVESssjJPMb6t
   A==;
X-CSE-ConnectionGUID: WD3v0ieITqaO94Cd4t2UNw==
X-CSE-MsgGUID: 3MYxH8jwSMGKwwLeZ6C/CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65864787"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="65864787"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 01:32:58 -0800
X-CSE-ConnectionGUID: kEfAqJmtRC+R9/wVpfHpew==
X-CSE-MsgGUID: og+V2dJKS8m/+O2t9C0bZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="223252011"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2025 01:32:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNSwJ-000000000Zd-22bN;
	Mon, 24 Nov 2025 09:32:55 +0000
Date: Mon, 24 Nov 2025 17:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3313/3313] block/genhd.c:100:6: warning: no
 previous prototype for function 'part_stat_read_all'
Message-ID: <202511241700.GqFsj3QM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi GONG,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f75af043f61c1e2311edf9edd2c5e0987e5ab3c9
commit: 89fa7dcff5e533bd14396601f40c388cfb6c1e59 [3313/3313] bpf-rvi: block: Add diskstats iterator target
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251124/202511241700.GqFsj3QM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241700.GqFsj3QM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241700.GqFsj3QM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/genhd.c:100:6: warning: no previous prototype for function 'part_stat_read_all' [-Wmissing-prototypes]
     100 | void part_stat_read_all(struct block_device *part, struct disk_stats *stat)
         |      ^
   block/genhd.c:100:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     100 | void part_stat_read_all(struct block_device *part, struct disk_stats *stat)
         | ^
         | static 
   1 warning generated.


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
