Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C9D200A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 19:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720987109; cv=none; b=gwyKCqFub+6l5jM3xfCTAxv9UrSf97oSLJGwhFiOEQSAVFeUydt0b8lmM7fH+tzhenRRTUwsabH+e7igZVPv7r9mQaK+g22Ed6HCoCz45hYuK2AhFi1REjdYk2Bq4CEy4xMfEhxsY7/3UtwcaYOtobYYEjMqgbC6S25Dan4cv5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720987109; c=relaxed/simple;
	bh=xBl3RYslNtFEl6J9q5FlpJyFt19EoWwOz5fn9Kxxw8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8ko39aB4QM/vaVi4+m4SZGMH+uM4wNcWwpgV+109djyvYu6BApIa74bm5NXsGGYkyDTTWWd23Ufak2Gin/kYntbWIP4jO87GLGAd2wCKxPBsAv09qBolT27BbVQ+IjIZyu0ms8oO/JgrypKZFbTd9os6H3BLgzRzpL283jI/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZo0sutK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZo0sutK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720987108; x=1752523108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xBl3RYslNtFEl6J9q5FlpJyFt19EoWwOz5fn9Kxxw8E=;
  b=iZo0sutK+feuKFhzEzJs+5qq0a0ZxER8KwVDHGT+XIP3JijWsus4YArz
   38URdRuyyh70hVIu0XV4zCmGS+DljYi01ExOd04wavxIg9x936vk1cFSN
   Vm/KDpPUTr/Sca/sdpatA5COXz5OwSJcCcxx/27f6JT9t41hLLhgEPXvs
   BSiqQZYMbYxICIM7w5V08W8iosR2o2KfZg3BLhOVnnkwlSoNxP7BwzNih
   /W3dVLJfLwa0qv1WuJXBNf7TJD1r/b4ixu51J6Okfhab2aa/d6NJgR1Qp
   fgn0oOZUEM5ocSdz/M/MYDObv/aLyJT074fiPzFPjK3uYvVxuqRkwY32c
   A==;
X-CSE-ConnectionGUID: R6MYn3htQ9CXgCvzknVpwQ==
X-CSE-MsgGUID: 5/Jz+LthRoat1QlmoXh/Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="35791490"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="35791490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 12:58:27 -0700
X-CSE-ConnectionGUID: K5nD5h25R7e2EH6oo5lMpA==
X-CSE-MsgGUID: Fzi0y781SyOyfNglRc90ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="49512631"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jul 2024 12:58:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT5MW-000dhc-0A;
	Sun, 14 Jul 2024 19:58:24 +0000
Date: Mon, 15 Jul 2024 03:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/memblks/v0.1 17/17] include/linux/numa_memblks.h:49:42:
 warning: 'struct numa_meminfo' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202407150302.veTF2f3n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/memblks/v0.1
head:   1386d3ef0ea65efd26c4ad6b034910535f0a7f91
commit: 1386d3ef0ea65efd26c4ad6b034910535f0a7f91 [17/17] mm: make range-to-target_node lookup facility a part of numa_memblks
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240715/202407150302.veTF2f3n-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407150302.veTF2f3n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407150302.veTF2f3n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/numa.c:6:
>> include/linux/numa_memblks.h:49:42: warning: 'struct numa_meminfo' declared inside parameter list will not be visible outside of this definition or declaration
      49 | static inline void numa_emulation(struct numa_meminfo *numa_meminfo,
         |                                          ^~~~~~~~~~~~


vim +49 include/linux/numa_memblks.h

97c53b4731a18b Mike Rapoport (Microsoft  2024-06-13  40) 
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  41) #ifdef CONFIG_NUMA_EMU
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  42) int numa_emu_cmdline(char *str);
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  43) void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  44) 					unsigned int nr_emu_nids);
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  45) u64 __init numa_emu_dma_end(void);
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  46) void __init numa_emulation(struct numa_meminfo *numa_meminfo,
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  47) 			   int numa_dist_cnt);
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  48) #else
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11 @49) static inline void numa_emulation(struct numa_meminfo *numa_meminfo,
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  50) 				  int numa_dist_cnt)
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  51) { }
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  52) static inline int numa_emu_cmdline(char *str)
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  53) {
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  54) 	return -EINVAL;
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  55) }
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  56) #endif /* CONFIG_NUMA_EMU */
00ccaed699b5f8 Mike Rapoport (Microsoft  2024-07-11  57) 

:::::: The code at line 49 was first introduced by commit
:::::: 00ccaed699b5f8eaa463a7911e7cce631465f4da mm: introduce numa_emulationa

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
