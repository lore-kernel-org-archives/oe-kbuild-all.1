Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2E885C7B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 22:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715295572; cv=none; b=dC8/eyYa9sE1KEjnLMSDeG3H2zXdNWYgNDaWnK0AlsL43ykR8OnhuzAXs/Ya0XU1pQ82rW5doaVhjuaYQjj4aGfcmWekZvHV8+yPDFne97CxJhFIGqAHACAxp3E0d29TTP/Rpb9FMzF5CMKQ1PISCE18NBTc8C0tW9kZnDJ1ypQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715295572; c=relaxed/simple;
	bh=OGgmylap9QZN40WiQFdwN8sPtjTsX6B7H8DWZZFOQ+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCiuVcXnJrlPH+zX10uJvIqkD3g2QmFBtnbUhBi2ZTNlEt3mIRNhCf+quuHoBjKbRPKtYiTbsmWruWarv+UM1a/lWAkvF+lTgHTfP5/MWWHJunDOez6J+pKIsz5p2XHUO2SU89QdvapgQyg7H/XDAGWwFlHcoxBxMF8hzRNSlNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfrYvX99; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfrYvX99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715295570; x=1746831570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OGgmylap9QZN40WiQFdwN8sPtjTsX6B7H8DWZZFOQ+E=;
  b=IfrYvX99zKXBIu2CFVkF9OOfRiwwVPaq/gXQePj0YJCTG13gfz23Zny2
   shiHIzq/RolsyCbG5CkhnSXaOV6Nz9/CM/xfD/Q7jlcvyaHNZCHvBB8Au
   oyhOxhQxHINhgyfPun2kcqBB2P61YK5sdYUhViAHVsaKEkZ8TYwfFg6rr
   ewa9dvFRFFXxMFEX20NNqYnCZkMNLggw4kacds98Sg05ejcSyUaxGWip5
   cpejo+HNdewiBJsF7sIfTl64OsyanlMyuYycj2FTZbhaj1LNpTK5m9Fjq
   K5fKw5zNZghiJf13fwe8kFDj0mNEmDxccYUtAIpg5QiYDMtNKeLIeF1rt
   Q==;
X-CSE-ConnectionGUID: DxpaTXKnQtKtK6TweptJfQ==
X-CSE-MsgGUID: q2e0Kt1VRimNqUEIMUebvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21827200"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="21827200"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 15:59:29 -0700
X-CSE-ConnectionGUID: ymr2dOoBQxGBRypMYczuNg==
X-CSE-MsgGUID: zS7RGbquSHedcp6BQIL4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="66848909"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2024 15:59:28 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5CjV-0005TJ-2x;
	Thu, 09 May 2024 22:59:25 +0000
Date: Fri, 10 May 2024 06:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.rfc 7/10] mm/memcontrol-v1.c:1475:6:
 sparse: sparse: symbol 'mem_cgroup_oom_notify' was not declared. Should it
 be static?
Message-ID: <202405100613.RXNccOGL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.rfc
head:   0011ac60f32b91542b15b122087bd97f41634b51
commit: aff3b6905c9323586157503a143c23c9fc5536b5 [7/10] mm: memcg: move cgroup v1 oom handling code into memcontrol-v1.c
config: i386-randconfig-061-20240510 (https://download.01.org/0day-ci/archive/20240510/202405100613.RXNccOGL-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405100613.RXNccOGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405100613.RXNccOGL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/memcontrol-v1.c:1174:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:1174:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol-v1.c:1174:23: sparse:    struct task_struct *
   mm/memcontrol-v1.c:1386:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:1386:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol-v1.c:1386:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol-v1.c:1388:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:1388:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol-v1.c:1388:21: sparse:    struct mem_cgroup_threshold_ary *
>> mm/memcontrol-v1.c:1475:6: sparse: sparse: symbol 'mem_cgroup_oom_notify' was not declared. Should it be static?
   mm/memcontrol-v1.c:1566:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:1566:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol-v1.c:1566:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol-v1.c:1660:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol-v1.c:1660:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol-v1.c:1660:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol-v1.c:482:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol-v1.c:529:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol-v1.c: note: in included file (through include/linux/rculist.h, include/linux/cgroup.h, include/linux/memcontrol.h):
   include/linux/rcupdate.h:812:9: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   include/linux/rcupdate.h:812:9: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/mem_cgroup_oom_notify +1475 mm/memcontrol-v1.c

7436a2e299bc25 Roman Gushchin 2024-05-06  1474  
7436a2e299bc25 Roman Gushchin 2024-05-06 @1475  void mem_cgroup_oom_notify(struct mem_cgroup *memcg)
7436a2e299bc25 Roman Gushchin 2024-05-06  1476  {
7436a2e299bc25 Roman Gushchin 2024-05-06  1477  	struct mem_cgroup *iter;
7436a2e299bc25 Roman Gushchin 2024-05-06  1478  
7436a2e299bc25 Roman Gushchin 2024-05-06  1479  	for_each_mem_cgroup_tree(iter, memcg)
7436a2e299bc25 Roman Gushchin 2024-05-06  1480  		mem_cgroup_oom_notify_cb(iter);
7436a2e299bc25 Roman Gushchin 2024-05-06  1481  }
7436a2e299bc25 Roman Gushchin 2024-05-06  1482  

:::::: The code at line 1475 was first introduced by commit
:::::: 7436a2e299bc254dfe54f5de8719e37b72ae2d9a mm: memcg: move legacy memcg event code into memcontrol-v1.c

:::::: TO: Roman Gushchin <roman.gushchin@linux.dev>
:::::: CC: Roman Gushchin <roman.gushchin@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
