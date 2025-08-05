Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329D7632
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 03:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754362862; cv=none; b=FmCdjBd43nE62V6tv2/lQGSVBTWyF6z+JKFnRUW7+qm8Gv6Yu0guiNckbnuwsQd4CiI38sRRbaDrfGtJww1kb7KVSdZGXK4NWrjSLuY6egPS1yDz58rVSZvxCjPCL/QJaXOl2d8JrE8mq9TzoCLaeabAuJ+yePTLaSFAEjOO9m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754362862; c=relaxed/simple;
	bh=ZXHVKboxZCUL9h+KgMtC7Irea7q6xHcBT3Z1wq8He2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f873PoniZtqvcP0ZMA8mzdn1hOZDU/JqgQDio6IZgwJb3XKX/3NCUWcmrlL1vFL4nlxemYljRMTbLeS17KmUhyrPJ+nKlwm2qbiB/0KqN3AMVaUITA85gQ6njNR1SzFXek5HvUBqNmJ0XOBPMd6R7BtY79XT1eTSwzclqe8Hn9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIeRSR5r; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIeRSR5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754362860; x=1785898860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZXHVKboxZCUL9h+KgMtC7Irea7q6xHcBT3Z1wq8He2U=;
  b=PIeRSR5rDKGP7Y67fZ5DHQOfCh0b8fT2PYZ65kbHQzpM24yoXSDHPskE
   RAdNe1/O2L4VGllMeFbFzFpXj6VfbvEKzRU+ESTsJfKxoVGZ+oj3kiIi0
   wh7IcMQBtv494UzOFi3krnTQhkT+wHn62GBqFZ2iso5HiLQBusHsUQYhK
   O+Btyj+cB4Db3ivRebkLqZeU7fUIZHRmndlEODJgvZY8SPJU41wGjGgM7
   WcaN/r4aZMb/wgweatUsazDg3EySjyXEH4Vz7+WMnrBo5Qr1YZvpJVxkE
   W+oxZsAAcl3Xaz35AH5GEIkf0j202xLVnxODTP+iSckmiLMF8yOkOCCEe
   w==;
X-CSE-ConnectionGUID: 4hxP5r+UQd28t6Jia9AlfQ==
X-CSE-MsgGUID: ux3XFVBESM+NWdsWHjUj3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="74221571"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="74221571"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 20:00:59 -0700
X-CSE-ConnectionGUID: p82xninsQnmUju91KzndHw==
X-CSE-MsgGUID: hXoldjfMQ66cEZV5t1SFHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="165132059"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 04 Aug 2025 20:00:59 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj7v6-0001uR-1V;
	Tue, 05 Aug 2025 03:00:56 +0000
Date: Tue, 5 Aug 2025 05:00:38 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1743/1743]
 arch/x86/kernel/cpu/cacheinfo.c:685:6: warning: no previous prototype for
 'cacheinfo_hygon_init_llc_id'
Message-ID: <202508050522.5Dp2I0DP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5c1061eccd6b1d6c12741278240a2b93ff91a0a8
commit: 1a0525a3d6d3c9c8effb3ae49581ef8ef99d8b26 [1743/1743] x86/cpu: Get cache info and setup cache cpumap for Hygon Dhyana
config: x86_64-buildonly-randconfig-2004-20250802 (https://download.01.org/0day-ci/archive/20250805/202508050522.5Dp2I0DP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050522.5Dp2I0DP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050522.5Dp2I0DP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/cacheinfo.c:647:6: warning: no previous prototype for 'cacheinfo_amd_init_llc_id' [-Wmissing-prototypes]
     647 | void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, int cpu, u8 node_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/cacheinfo.c:685:6: warning: no previous prototype for 'cacheinfo_hygon_init_llc_id' [-Wmissing-prototypes]
     685 | void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c, int cpu, u8 node_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/cacheinfo.c: In function 'amd_cpuid4':
   arch/x86/kernel/cpu/cacheinfo.c:249:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     249 |                 l1 = &l1i;
         |                 ~~~^~~~~~
   arch/x86/kernel/cpu/cacheinfo.c:250:9: note: here
     250 |         case 0:
         |         ^~~~


vim +/cacheinfo_hygon_init_llc_id +685 arch/x86/kernel/cpu/cacheinfo.c

   684	
 > 685	void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c, int cpu, u8 node_id)
   686	{
   687		/*
   688		 * We may have multiple LLCs if L3 caches exist, so check if we
   689		 * have an L3 cache by looking at the L3 cache CPUID leaf.
   690		 */
   691		if (!cpuid_edx(0x80000006))
   692			return;
   693	
   694		/*
   695		 * LLC is at the core complex level.
   696		 * Core complex ID is ApicId[3] for these processors.
   697		 */
   698		per_cpu(cpu_llc_id, cpu) = c->apicid >> 3;
   699	}
   700	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
