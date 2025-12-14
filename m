Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E427A93C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765697879; cv=none; b=rz1zTc6y8jnED3P6RnvWhGKHWVYRXetsXk81E6jWfrUEmdu5kAnl5K9vNkW6DYRaGePoiQ23f3JXE840fBPlTjkodCsPDHKVMHP1ZuQPk4MiC0/egHwxTVFNvhrGQf+5HV+WBKD18cfl51ccOyCaJwVxggogH8W3fO86em1HKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765697879; c=relaxed/simple;
	bh=+W1kpiHTXcE0tYgwaL+I4Az+btaR9IirxHiNeJs68gM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PT98EJ91uwqnfS7tGlypD6As4U22YeWuUYttvWlXmXyHxTgqeHj4ncGAcEiAPQcVP+7xMyUdHju93t3UddJlJpsxSs6yy7dVyBs4nYb/TsPiyC+ANb4PDwNxGkaXJsNh/REapCiBY1YgATctaA902h7UUg6gRJV6wJK5C2whMmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6U1IYht; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6U1IYht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765697877; x=1797233877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+W1kpiHTXcE0tYgwaL+I4Az+btaR9IirxHiNeJs68gM=;
  b=F6U1IYhtRQoBb6hS+enbOR9bjyT3vByWr60G3tLIDr3JHMCfjlAh2YS2
   8XFDZacTjFjOxAGBsVkJUJv87b4xezRD+z+mJV1IjVPWxbfKQmC9VkQBE
   THAMGnb93yfZ4qoepXQMplte1xa0EntWwH8KZrml/g1iBzLNM6QuBYzSg
   QeHiN9omCOPt/31WbCLQPQ6IGhs79jFSHDyfKLcitd8bVFwNjwYuH8v+3
   5JZq4qSuzrvRS24KA77JsyCgwROTVulJAmLkBd/x7fIOSWLhjqZUgjbtH
   ZWrfruNV4PVcmv9IHccm5lz2QkInKbRE4f6BxAnKjmLkeuu8RiGl6HYZG
   Q==;
X-CSE-ConnectionGUID: yspffUnVTb6cwLHuzN57pg==
X-CSE-MsgGUID: xii6vCYcQGGIua6SM3kQXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70216352"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="70216352"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:37:56 -0800
X-CSE-ConnectionGUID: WD2DJw0RRJGaQwLwFdb5NA==
X-CSE-MsgGUID: DcMfBCq7TZ+ZQ/6IJ7bs3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197733544"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Dec 2025 23:37:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUgfx-000000008pN-369h;
	Sun, 14 Dec 2025 07:37:53 +0000
Date: Sun, 14 Dec 2025 15:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 arch/arm64/kernel/cpu_errata.c:1323:13: warning: no previous prototype for
 'spectre_bhb_patch_loop_iter'
Message-ID: <202512141546.w5VlxAA3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: cb917077efa4fecd975ab17d6aececdd90abe82e [1942/1942] arm64: Mitigate spectre style branch history side channels
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251214/202512141546.w5VlxAA3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141546.w5VlxAA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141546.w5VlxAA3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/cpu_errata.c:335:13: warning: no previous prototype for 'arm64_update_smccc_conduit' [-Wmissing-prototypes]
     335 | void __init arm64_update_smccc_conduit(struct alt_instr *alt,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c:357:13: warning: no previous prototype for 'arm64_enable_wa2_handling' [-Wmissing-prototypes]
     357 | void __init arm64_enable_wa2_handling(struct alt_instr *alt,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpu_errata.c:1323:13: warning: no previous prototype for 'spectre_bhb_patch_loop_iter' [-Wmissing-prototypes]
    1323 | void __init spectre_bhb_patch_loop_iter(struct alt_instr *alt,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:36,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/arm64/kernel/cpu_errata.c:22:
   In function '__cmpxchg_case_4',
       inlined from '__cmpxchg' at arch/arm64/include/asm/cmpxchg.h:140:1,
       inlined from 'update_mitigation_state' at arch/arm64/kernel/cpu_errata.c:1044:11,
       inlined from 'spectre_bhb_enable_mitigation' at arch/arm64/kernel/cpu_errata.c:1319:2,
       inlined from 'spectre_bhb_enable_mitigation' at arch/arm64/kernel/cpu_errata.c:1271:6:
>> arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'enum mitigation_state[1]' [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:279:1: note: in expansion of macro '__CMPXCHG_CASE'
     279 | __CMPXCHG_CASE(w,  ,     4,        ,  ,  ,         )
         | ^~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c: In function 'spectre_bhb_enable_mitigation':
   arch/arm64/kernel/cpu_errata.c:1058:30: note: object 'spectre_bhb_state' of size 4
    1058 | static enum mitigation_state spectre_bhb_state;
         |                              ^~~~~~~~~~~~~~~~~
   In function '__cmpxchg_case_4',
       inlined from '__cmpxchg' at arch/arm64/include/asm/cmpxchg.h:140:1,
       inlined from 'update_mitigation_state' at arch/arm64/kernel/cpu_errata.c:1044:11,
       inlined from 'spectre_bhb_enable_mitigation' at arch/arm64/kernel/cpu_errata.c:1319:2,
       inlined from 'spectre_bhb_enable_mitigation' at arch/arm64/kernel/cpu_errata.c:1271:6:
>> arch/arm64/include/asm/atomic_ll_sc.h:259:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'enum mitigation_state[1]' [-Warray-bounds=]
     259 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_ll_sc.h:279:1: note: in expansion of macro '__CMPXCHG_CASE'
     279 | __CMPXCHG_CASE(w,  ,     4,        ,  ,  ,         )
         | ^~~~~~~~~~~~~~
   arch/arm64/kernel/cpu_errata.c: In function 'spectre_bhb_enable_mitigation':
   arch/arm64/kernel/cpu_errata.c:1058:30: note: object 'spectre_bhb_state' of size 4
    1058 | static enum mitigation_state spectre_bhb_state;
         |                              ^~~~~~~~~~~~~~~~~


vim +/spectre_bhb_patch_loop_iter +1323 arch/arm64/kernel/cpu_errata.c

  1321	
  1322	/* Patched to correct the immediate */
> 1323	void __init spectre_bhb_patch_loop_iter(struct alt_instr *alt,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
