Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9AB1BD9C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 21:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730411336; cv=none; b=MddGuMYhANNBGukn1Xi88HT/+MwYCWzeEABwvI/SmBm/xRbqx03ltQd0UxCmZhsNgAVCu4MSzxUhYAOSmVAvszBbQSIXb7839kunNzwXvBTPL2EkkMp+jP4fBJdDv1kYVXQl25fI2k2EQJIut3a03oxO7uTHP21bjHSKxgAYEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730411336; c=relaxed/simple;
	bh=JIN3EDyNiJ/VqcedktEKtpBtfmoKJQYDSxblrioZCjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kf2Ym1wlj3fYC05iI/ran+IA8o/r8qDYcYiCvq/782F4FQoOwrtevqpuWeJ9iV9Smgooy60VElG+YiOTI1WiwEBeg4y5w4ZB5Hj6ZVhg6d8dbkAE+T3CbHzEVL9IrjOtubfjYkjUuYST6pFK6rXpqjvlZq3unLeR+bCH799a2NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jaVrsHQI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jaVrsHQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730411330; x=1761947330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIN3EDyNiJ/VqcedktEKtpBtfmoKJQYDSxblrioZCjE=;
  b=jaVrsHQIw/KpzWR6rA5GsMo6vHLvpFd6q2RT10BO4MTEROZjrf/eXUBd
   x5h/DquoAOQdfVJdStPdjtZbMvpuWQUityuBoCaepQdmvSBFZNUSQ5bd4
   a2bIM8BHPJD8tPfuR1om2fViSW6ij43dM1PDywqnWEdJV2BxMPis9y8gw
   U3415riQYNlqgqZAOKJfR2sFay5yOaDF8ipWhkzxOznLO3364kDehcqYM
   w304OmzMxC5kbAlvXZGuvMK/E0XNSnRhv8+tX4Qt3TRP/BY+MIGl9PPVu
   vFM6NV3KUOgNzlsFnl/Mg9VHy9D9PbYJooBGh/scI4kONBDkShSgFm+YR
   w==;
X-CSE-ConnectionGUID: mTaKNPhbSsKJhSwy7d81Pw==
X-CSE-MsgGUID: fMkixfP1TQO2lR1ZPQbOkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="40753937"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="40753937"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 14:48:49 -0700
X-CSE-ConnectionGUID: sHfFcwtpSoOPmt/f7Z4Uig==
X-CSE-MsgGUID: k1SQv8dxSRu9Pd1zLDtr9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82681602"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Oct 2024 14:48:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6d25-000gkY-2B;
	Thu, 31 Oct 2024 21:48:45 +0000
Date: Fri, 1 Nov 2024 05:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/extended-linear 4/5] drivers/cxl/core/mbox.c:8:10: fatal
 error: 'asm/mce.h' file not found
Message-ID: <202411010513.9o5am7F5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/extended-linear
head:   c4724382d8850a1fd8ea8b7777e1ef783c31f480
commit: 6c38847990ac33ff84ee4c96452cecff09caac37 [4/5] cxl: Add extended linear cache address alias emission for cxl events
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411010513.9o5am7F5-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010513.9o5am7F5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010513.9o5am7F5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/cxl/core/mbox.c:3:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/mbox.c:8:10: fatal error: 'asm/mce.h' file not found
       8 | #include <asm/mce.h>
         |          ^~~~~~~~~~~
   4 warnings and 1 error generated.


vim +8 drivers/cxl/core/mbox.c

   > 8	#include <asm/mce.h>
     9	#include <cxlpci.h>
    10	#include <cxlmem.h>
    11	#include <cxl.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
