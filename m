Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8020A6110
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 20:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712781166; cv=none; b=BskUNtrZLcwbdGShpbONhAZfV+i1tpaxTxoHbcnJWrqxMa60h6Wr75H4kRRFCkHiym6tv0j2NrGbqNUnlbErv3RBJ8LkulcIKbi3Hkt25QavqFeAwwt5rgXHHHrvZ8i6A+dLaH1CfcyPeReubX2Rx+nWOrAa3PBmz6reT5iUH/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712781166; c=relaxed/simple;
	bh=WSZWzwQWR5ThI0os3F1sZb+xlO/nnOjmnNTDIOUA3fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H02A5calTc/MhyJ2TPrsKigq+S6/TUXcSn46oqLKv87pvSYvvtvYYnIYUvYBvO8ABsRus4ypsljDQ/4Zowt0dx1fl7m3m28Y0hrrwVbidQlJxpx0ltBgRbKgraHur4SD+B4AyPBuDn795dsCn9xyORfBxwdyQ6sSxxKgXE9o0ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhIhSmry; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhIhSmry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712781165; x=1744317165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WSZWzwQWR5ThI0os3F1sZb+xlO/nnOjmnNTDIOUA3fw=;
  b=VhIhSmryx/lc+xybezlQm9wmghPPBSrDepq+v35vMSAs2gXUyKSENFDX
   JMq0M/gS0F1SyHhJgQPWRci6riCKFgVn6ZQTvfQnKBuQaRCu5mKpGksjf
   CqodfJpq0ycVlwGJW3YL9mIGZ/AJbRtbPjSKmfIIpUP2CinIRxO8WrFWE
   3tPdPzKZkHPY5ghKwOVg94W3M/y5AjZwhb/BoScMXQBOqN4YeTKreY9uD
   FVdUVcRhnkWyc0MOtrJBNupgTB3Efopsy1ifI5dzh1yT0vRuVPRxnh81G
   o55aSi+O57a7I4pK+T5hqB78s08Nm+MpTltBuYT3cjnFDDkZiRstsEnty
   w==;
X-CSE-ConnectionGUID: dauAJV48QtOWTtdVHYuyJg==
X-CSE-MsgGUID: ttSkjBIDS+awyVbg5DljoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12022793"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="12022793"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 13:32:44 -0700
X-CSE-ConnectionGUID: //7xdL3WQWCdW7HQ55NWnA==
X-CSE-MsgGUID: yrOH2xUMRd+r8wFGECWh5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="43964116"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2024 13:32:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rueca-0007mQ-2z;
	Wed, 10 Apr 2024 20:32:40 +0000
Date: Thu, 11 Apr 2024 04:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.1 4/5] include/linux/page_counter.h:9:10:
 fatal error: 'asm/page_types.h' file not found
Message-ID: <202404110434.TTMMzIKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.1
head:   dbe528dceca7fe608061c8686e00aa4d53042767
commit: 7fb104a83d94f08496291125374fdf7c49ea7baa [4/5] mm: memcg: merge multiple page_counters into a single structure
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240411/202404110434.TTMMzIKe-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110434.TTMMzIKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110434.TTMMzIKe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:5:
   In file included from include/linux/mm.h:2237:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from init/main.c:21:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:62:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:18:
>> include/linux/page_counter.h:9:10: fatal error: 'asm/page_types.h' file not found
       9 | #include <asm/page_types.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +9 include/linux/page_counter.h

     4	
     5	#include <linux/atomic.h>
     6	#include <linux/cache.h>
     7	#include <linux/limits.h>
     8	#include <asm/page.h>
   > 9	#include <asm/page_types.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
