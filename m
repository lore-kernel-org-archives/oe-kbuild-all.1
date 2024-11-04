Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3102A1B81C1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 19:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730748997; cv=none; b=njr4v1O9jy3ox9Z9puY6tFzEVWLXJsD096N9urOetLbl/y9p41OXFcR233tIMkMUjkca4DqwxqHlRKVgctek91eHq1WHmUeNOwx8Khl/BxhUIMP7PiLDuTm81BnkaDTvVN9kNaKb8T23AVobNWc7M7cq3WGSzODoyPU6h1LA7As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730748997; c=relaxed/simple;
	bh=UyvXukuUKsz7/I3SvtJuUA/jjSRQyyewUGK5CIpxyW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H5xCseorQs3eKDCZSt8cYqsK3srsFjceDpJnQXVkjMIBuXeG36sMYWpWYkpUh4SsSE+g6HReSelT/kc6Fa3uc51dPdkmSWT1jtFxSF9nzzpZpIV5BOmhB/yDmvw09b0hK0KRo3F+qCT8PxbdlijPud4eEiZXtnIXnC065u8R73I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S15QN9fm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S15QN9fm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730748995; x=1762284995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UyvXukuUKsz7/I3SvtJuUA/jjSRQyyewUGK5CIpxyW0=;
  b=S15QN9fmCBgsVG+MyEIprWjWeqlobanCEtzYdExOCutr1wi1d7NIgX1U
   aMG4GD+KNYf69kfyqrgIzYhpIsDDoTmVisV8fOOPMuH8DUkaHBg6E/dT0
   vxyw/1OSlt8gCevq9kZjeZfcOe8W+kYeEervZpmYIr3EhQGTw2P3W+igc
   rloF85aJKbahkMSuJMXtt0DUP2N1miQIvAw0euFR0u0vrj226AF1CuTiX
   MHM+586GkdEfhF2ByobFGUo12d9Hn0lhaFgYzUOhY2FC1dMQxCM7yPOyz
   RPRz5vE9m//qov/ACMbGbqARFKqObkPKqG0XD7zTKo5dGRCV/Gqq9oxwO
   w==;
X-CSE-ConnectionGUID: wVX4pRLWQXC1qpvQK03+UQ==
X-CSE-MsgGUID: zoELIHA/QE+Blt6nNxZd7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30348765"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="30348765"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 11:36:34 -0800
X-CSE-ConnectionGUID: bOqUhslHTKGxzr+5AdyVfw==
X-CSE-MsgGUID: aERVGnYfStWUTQo91ex+nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="88578797"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2024 11:36:33 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t82sI-000lD9-2y;
	Mon, 04 Nov 2024 19:36:30 +0000
Date: Tue, 5 Nov 2024 03:35:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9863/16090] arch/x86/kernel/early-quirks.c:722:6:
 warning: no previous prototype for function 'is_zhaoxin_kh40000'
Message-ID: <202411050336.auofJ1jN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab4fcabb7d813ddd7a455c85557f8d0891df4c41
commit: 8eaba08b2d72718a40cafe3402ab4f26b0dc62eb [9863/16090] x86/cpu/zhaoxin: Encapsulate access to global variables within functions
config: x86_64-buildonly-randconfig-002-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050336.auofJ1jN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050336.auofJ1jN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050336.auofJ1jN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/early-quirks.c:13:
   In file included from include/linux/pci.h:1666:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kernel/early-quirks.c:722:6: warning: no previous prototype for function 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     722 | bool is_zhaoxin_kh40000(void)
         |      ^
   arch/x86/kernel/early-quirks.c:722:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     722 | bool is_zhaoxin_kh40000(void)
         | ^
         | static 
   arch/x86/kernel/early-quirks.c:737:14: error: use of undeclared identifier 'kh40000_dma_direct_ops'
     737 |                 dma_ops = &kh40000_dma_direct_ops;
         |                            ^
   2 warnings and 1 error generated.
--
   In file included from kernel/dma/contiguous.c:48:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/dma/contiguous.c:209:13: warning: no previous prototype for function 'is_zhaoxin_kh40000' [-Wmissing-prototypes]
     209 | bool __weak is_zhaoxin_kh40000(void)
         |             ^
   kernel/dma/contiguous.c:209:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     209 | bool __weak is_zhaoxin_kh40000(void)
         | ^
         | static 
   kernel/dma/contiguous.c:73:26: warning: unused variable 'size_bytes' [-Wunused-const-variable]
      73 | static const phys_addr_t size_bytes __initconst =
         |                          ^~~~~~~~~~
   3 warnings generated.


vim +/is_zhaoxin_kh40000 +722 arch/x86/kernel/early-quirks.c

   721	
 > 722	bool is_zhaoxin_kh40000(void)
   723	{
   724		return zhaoxin_kh40000;
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
