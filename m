Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF03016FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766429514; cv=none; b=cn0/SzCTwd3fAK6r+Cozwb1LphcrLvOioyHZ/LXRnVhsHSn8gUwS/wjfmEG+EtKx4Jqre7F2QmR8lVPLA3Jvjw2xAylS5AbVhgO+FI9YCixXEAh5tN0rlH/Y8k+7dW3yxxXQzpbbpVnJHoPq0vm+xXyVcApBPv8bGy5XUpD9IDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766429514; c=relaxed/simple;
	bh=Phre9f9dFaJSb7PWYNuuOz65gkDRKWRzTQ6RvjICCq4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tr73wSjhUmfC2tTt/vY0P0kQV5KjILwIF4jlUz78Ita4h92jjoJILUqxLwGz7gTajPk6JptldpOCP6n/5MTKrLkEhpgiy0YYd5Bjp0BgIn74ITVg/WcNmYhJgiLuZ3eWqm3vZifAInMVn6nFcADcK5+Bd8ftJFvefdhlJ3E2Ct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcUAvkqo; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcUAvkqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766429512; x=1797965512;
  h=date:from:to:cc:subject:message-id;
  bh=Phre9f9dFaJSb7PWYNuuOz65gkDRKWRzTQ6RvjICCq4=;
  b=ZcUAvkqoMpfUoAtpDCQi+PS/CDGoeV0yv9LA0H3J+OQD5zdpQkn0wm4c
   dBASwDFtCzZGiG/xJTbh0QJZABxOgTx7p2xEVWA6oRViMauKvJ313IIC8
   yTnTnCLF0KfEblKtPzOYPvworMWg5zBPzhFUyyZ1/5/dFioN2YdAuRQlU
   H6Hfs4zNzveico5UQ0QxGg+Qo/QbpFfsPSJR47ynDnY4mMblxXdo2Dl5N
   mQlauvuwDjYMbdmI5Pthv5dhGu8oiGnLSFZVZijro0I5dYVwYkKp+l9Iy
   OoOCqzOzH7wUICpAvfCYeSlUeELpty1Ds1ZQe0kE/zJomSD0D5KUbbjE7
   A==;
X-CSE-ConnectionGUID: RgWBhLGOR7eVX9j9Ffu6xg==
X-CSE-MsgGUID: 6k1wIlcdTSG+xeY8xcRceg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85872305"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="85872305"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:51:50 -0800
X-CSE-ConnectionGUID: 8NpjvXpUSIO1wx6TjAPIhA==
X-CSE-MsgGUID: Jocmi9SCT1CUO7zWCM13zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199578197"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Dec 2025 10:51:48 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXl0B-0000000010Z-3ofN;
	Mon, 22 Dec 2025 18:51:32 +0000
Date: Tue, 23 Dec 2025 02:50:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 arch/arm64/kernel/cpu_errata.c:1323:13: warning: no previous prototype for
 'spectre_bhb_patch_loop_iter'
Message-ID: <202512230214.GrBXN1xm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi James,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: cb917077efa4fecd975ab17d6aececdd90abe82e [1942/1942] arm64: Mitigate spectre style branch history side channels
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251223/202512230214.GrBXN1xm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230214.GrBXN1xm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230214.GrBXN1xm-lkp@intel.com/

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
