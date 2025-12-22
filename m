Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031D62D9792
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766409539; cv=none; b=W/boQROKRKkaBKVetg0alAcceyuT3nwc9FPPIr3l2IaPoSBFRh43CeAK09fI1zvaNZFOlZANgcqH4mGf03rYQbQPBiSQUuVo1vNjRgnkqj5g62dXuoP4RhVBP4JhCIzUHjs066BYFwW/CxyJowqGA5KdhEhdmMc+UeS5p1xUCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766409539; c=relaxed/simple;
	bh=rzMHl+vAzj1mUbNo33uaG2zrwAaoA/tIkqp5XboTw5Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CyRzQ4J7ojxm2p/SBoNTym5inAc629QRqdndYwso3aXu0Kscmoei2wtDg1HDO7s2tN/GhWEKHUZUf/fKjFi34o7bVj9pDQ3vIBFVbTrCSQuUGZXAk71WsTc0EzWVVze4svR4R9K0AtCs7wAl5C5JM+b3ayNeUBajjzLHSMLaI+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJG0Asqi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJG0Asqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766409537; x=1797945537;
  h=date:from:to:cc:subject:message-id;
  bh=rzMHl+vAzj1mUbNo33uaG2zrwAaoA/tIkqp5XboTw5Q=;
  b=lJG0AsqiIUkcbDnNRW0KAbbrnoclgNp0yykv+0GnLa1Br0KZBF3DDbYv
   yVcRsieS2ZL/1YF8YVviMV8h/05n5dFWEIR+kcf873LhiaNIZoaF6dWpT
   b4Hzn1JJ86mkinpikUqysWjnlo8hIGpOfua/vm8BJV35zB0no1eWpgjyt
   qenxjRQ1J8UbcXJnM5Wp0q/9McdllNqxVCV+ELexUM3ff5WaucNV3jwxj
   oT/X5+/ZEnxETb5Bj2Pn9eqUGppLhTSdjwelJZlHSOG/I29YlTvl1qqHx
   FGqZSSgUqlBuwt2fMoVux3bHQySIcPSHgUoWWYH7S0Mx6Mqdvh3dV3l2/
   A==;
X-CSE-ConnectionGUID: Y/CsHGxpTLay74qeeEMobw==
X-CSE-MsgGUID: QJj5fZRURDypNbbahztCUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68145295"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68145295"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 05:18:57 -0800
X-CSE-ConnectionGUID: Y8FaatCqTVqiqqKpO7/maA==
X-CSE-MsgGUID: MkIUecnrRc++uCxlg7tB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="200415216"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Dec 2025 05:18:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXfoL-000000000cP-0k02;
	Mon, 22 Dec 2025 13:18:53 +0000
Date: Mon, 22 Dec 2025 21:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3418/3418]
 arch/x86/kernel/cpu/common.c:92:16: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202512222106.0whCMuCB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: f4128ae8e6ff03b4c805707fe75d0345797f7f53 [3418/3418] sched: Add cluster scheduler level for x86
config: x86_64-randconfig-121-20251217 (https://download.01.org/0day-ci/archive/20251222/202512222106.0whCMuCB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222106.0whCMuCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222106.0whCMuCB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/common.c:92:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got unsigned short * @@
   arch/x86/kernel/cpu/common.c:92:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/kernel/cpu/common.c:92:16: sparse:     got unsigned short *
   arch/x86/kernel/cpu/common.c:1901:1: sparse: sparse: symbol 'fixed_percpu_data' redeclared with different type (different address spaces):
   arch/x86/kernel/cpu/common.c:1901:1: sparse:    struct fixed_percpu_data [addressable] [noderef] [toplevel] __percpu fixed_percpu_data
   arch/x86/kernel/cpu/common.c: note: in included file (through arch/x86/include/asm/cpufeature.h, arch/x86/include/asm/thread_info.h, include/linux/thread_bits.h, ...):
   arch/x86/include/asm/processor.h:470:1: sparse: note: previously declared as:
   arch/x86/include/asm/processor.h:470:1: sparse:    struct fixed_percpu_data extern [addressable] [toplevel] fixed_percpu_data
   arch/x86/kernel/cpu/common.c:144:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:145:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:146:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:147:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:148:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/kernel/cpu/common.c:149:43: sparse: sparse: cast truncates bits from constant value (fffff becomes ffff)
   arch/x86/include/asm/processor.h:474:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got char ( * )[40] @@
   arch/x86/include/asm/processor.h:474:31: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/include/asm/processor.h:474:31: sparse:     got char ( * )[40]

vim +92 arch/x86/kernel/cpu/common.c

f8b64d08dde271 Borislav Petkov 2018-04-27  89  
6f01df96c462b7 Kim Phillips    2021-08-17  90  u16 get_llc_id(unsigned int cpu)
6f01df96c462b7 Kim Phillips    2021-08-17  91  {
6f01df96c462b7 Kim Phillips    2021-08-17 @92  	return per_cpu(cpu_llc_id, cpu);
6f01df96c462b7 Kim Phillips    2021-08-17  93  }
6f01df96c462b7 Kim Phillips    2021-08-17  94  EXPORT_SYMBOL_GPL(get_llc_id);
6f01df96c462b7 Kim Phillips    2021-08-17  95  

:::::: The code at line 92 was first introduced by commit
:::::: 6f01df96c462b77915b27d404152c47e75e879cf x86/cpu: Add get_llc_id() helper function

:::::: TO: Kim Phillips <kim.phillips@amd.com>
:::::: CC: Xie Haocheng <haocheng.xie@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
