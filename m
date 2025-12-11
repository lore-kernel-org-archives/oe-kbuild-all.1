Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F259E2F290E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765457690; cv=none; b=lyzXIgzudvlNYuopQBX008f+XohOotHVeeqVCYq0NhPMrppZEv3jrIIALHljkRpvYmZl2XzKkFMUcc/WULU15zXGKyuGj6I5VnT+DZvSNfmJ+eSAGXhvSCCggAiHWcxe/ieHrp6OTD9Tkb2uWlJGsGJkyChtKXJQ0eCFydvX59M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765457690; c=relaxed/simple;
	bh=THtOe3dcvPny7ZtoueA9DFhK+ewKhI58xIjuZANujNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XOxtll8pFa3FVhlRbRKg5iVfVAs39o/TvJkW9NfWjTbXpmg/5Xc1YL+4sKP6EJqBINzgbD2kmAR/gx+RA38xO2/zaBr+/rAPUCW/YojW2t4K7qE3+26GuQ5kS2h23B+UfKilUlFWMwSU+R/Zw32sR8h5gcVZS2iItuuE5Ok+pxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cOCHUlm8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cOCHUlm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765457687; x=1796993687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=THtOe3dcvPny7ZtoueA9DFhK+ewKhI58xIjuZANujNk=;
  b=cOCHUlm8nJu5ERr1TNu+Tj0e2TNQR0wH3x5c2aVp6M7ydumBCv5xhNCK
   +cI+dpmy7xBTaoyuCvKxguOg3LznUq2EgvOcL8O+PZTazxrdKb1QyiADB
   S0t9PENbLwWh0ccZiIdIDfybC6g7xNINPYW6WKj3FOsMEaMb1CAcLdxMJ
   aGHeE3YehKpV8XDD729Olx0eyYlHc6h6FE1vG9zf7uO6g8s0BJ7xdR9RG
   aevaygETJXDYnpJpSaZcruvRAvI8c7+81tLg2zJFA7KsMrZQsSNXdbUAX
   mHTSorrPVSyPQIgYQNJnFByIcuyChUhUCiUa2bo1SA3n84IzBpdxXh0Mj
   A==;
X-CSE-ConnectionGUID: CENTJrebTDiLXkS0wRau2g==
X-CSE-MsgGUID: WYop52tYQ5GQJ9D5M990Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84846430"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="84846430"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 04:54:47 -0800
X-CSE-ConnectionGUID: S8vqUzu7TC+0wwHWg39Xtw==
X-CSE-MsgGUID: xLmhqUNTRRGw6u8U/C5kLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="196796624"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 11 Dec 2025 04:54:47 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTgBw-0000000015o-2pVP;
	Thu, 11 Dec 2025 12:54:44 +0000
Date: Thu, 11 Dec 2025 13:53:47 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] kernel/dma/contiguous.c:209:13:
 warning: no previous prototype for function 'is_zhaoxin_kh40000'
Message-ID: <202512111317.lY52m2Gz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 8eaba08b2d72718a40cafe3402ab4f26b0dc62eb [3534/3534] x86/cpu/zhaoxin: Encapsulate access to global variables within functions
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111317.lY52m2Gz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111317.lY52m2Gz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111317.lY52m2Gz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from kernel/dma/contiguous.c:48:
   In file included from ./include/linux/memblock.h:12:
   In file included from ./include/linux/mm.h:2235:
   ./include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   ./include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   ./include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> kernel/dma/contiguous.c:209:13: warning: no previous prototype for function 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     209 | bool __weak is_zhaoxin_kh40000(void)
         |             ^
   kernel/dma/contiguous.c:209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     209 | bool __weak is_zhaoxin_kh40000(void)
         | ^
         | static 
   7 warnings generated.


vim +/is_zhaoxin_kh40000 +209 kernel/dma/contiguous.c

   208	
 > 209	bool __weak is_zhaoxin_kh40000(void)
   210	{
   211		return false;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
