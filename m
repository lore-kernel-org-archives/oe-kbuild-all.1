Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8841C40BE5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732073143; cv=none; b=N2oQXlXliPvowIeRujcs15EiFMt2ea3nYLdmKowa2/I8Pa7pV/zb2Xn2ykWLl7MLLrW7rXRG6UIrKAfeHJ0bKp9tfB6jaExWX3CG446Wsk/MukGGDEBifD+nfI+wkkzZ0Xb+der/+4WhrR3Wj1/u+sWLlKOJ9PvWtHRntfoXbJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732073143; c=relaxed/simple;
	bh=tC4pAaF9iz+j+P8+DHzdFpeBjensyu8F0DWQ7LwEzHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fN14kAMG9MD8L5q/H19acD/9FH6aimBLc25RZpzaNPZz+nbAaL7d2W4netdNqnlmT2z7UulbGhJdCuQc93OjBik6Ztc75hnpXFMq90YBm8thkFAjm2hymgb3SrcS4bVOiVVst1H1ALgUNVTr223XBauT05Z/c/E48IimwSjoJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcIFca7N; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcIFca7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732073141; x=1763609141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tC4pAaF9iz+j+P8+DHzdFpeBjensyu8F0DWQ7LwEzHs=;
  b=jcIFca7NmNhZ8g4i/1hiALQB8U+hTrirVJ86F3k4j7fhvLkQO1u4naLF
   ZbAHqXOrsDdVphabNL3cpwvKBrddomyZAk0fwEHJqUbAft2Ti3a3aA5Iu
   N+3Xs7kZJn88fVhq7aSH+SuJV1iSak6A0vHDmAWrLVmbakYFIo+Jbqmjh
   h69I41jvTsFDxBo4uiwQt0NCA4cSe2eLIr5VGPorepDx9R476JZslpT/9
   fwUR6+C+b32gVlvulsF1u2y8u2reBzzVgSNXC51RrpwnabvPKPFQ2KyUr
   S6XlzpHha+E/TbyA06F+eKBPHW6CLaU1LSrqCaDnFvaEuI11SfdHpCQja
   A==;
X-CSE-ConnectionGUID: TCpHgICiSDiCLKb/layAdA==
X-CSE-MsgGUID: b+cTle4UQ/CbZFUB/GD7OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35894226"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="35894226"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 19:25:41 -0800
X-CSE-ConnectionGUID: SUxGHDsdTxSaiJMA/Hf21w==
X-CSE-MsgGUID: XfDLRjw9RoCExoQx/ehn0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90172589"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2024 19:25:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDbLV-0000T7-2S;
	Wed, 20 Nov 2024 03:25:37 +0000
Date: Wed, 20 Nov 2024 11:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng1 <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2451/2451] arch/x86/kernel/paravirt.c:66:26:
 error: use of undeclared identifier 'CALL_INSN_SIZE'
Message-ID: <202411201117.TvJc5RO0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e74aedc9df70f84e50a280478b93d98b3a622bc3
commit: 822da186955cbcd69b4715b8a307053e6c756f30 [2451/2451] x86/ibt,paravirt: Use text_gen_insn() for paravirt_patch()
config: x86_64-buildonly-randconfig-001-20241119 (https://download.01.org/0day-ci/archive/20241120/202411201117.TvJc5RO0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201117.TvJc5RO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201117.TvJc5RO0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/paravirt.c:14:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/mm.h:1581:
   include/linux/vmstat.h:417:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     417 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     418 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:424:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     424 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     425 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:445:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     445 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     446 |                            NR_VM_NUMA_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/paravirt.c:65:2: error: implicit declaration of function '__text_gen_insn' [-Werror,-Wimplicit-function-declaration]
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |         ^
   arch/x86/kernel/paravirt.c:65:29: error: use of undeclared identifier 'CALL_INSN_OPCODE'
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |                                    ^
>> arch/x86/kernel/paravirt.c:66:26: error: use of undeclared identifier 'CALL_INSN_SIZE'
      66 |                         (void *)addr, target, CALL_INSN_SIZE);
         |                                               ^
   arch/x86/kernel/paravirt.c:67:9: error: use of undeclared identifier 'CALL_INSN_SIZE'
      67 |         return CALL_INSN_SIZE;
         |                ^
   arch/x86/kernel/paravirt.c:327:4: warning: cast from 'void (*)(struct mmu_gather *, struct page *)' to 'void (*)(struct mmu_gather *, void *)' converts to incompatible function type [-Wcast-function-type-strict]
     327 |                         (void (*)(struct mmu_gather *, void *))tlb_remove_page,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 4 errors generated.


vim +/CALL_INSN_SIZE +66 arch/x86/kernel/paravirt.c

    61	
    62	static unsigned paravirt_patch_call(void *insn_buff, const void *target,
    63					    unsigned long addr, unsigned len)
    64	{
  > 65		__text_gen_insn(insn_buff, CALL_INSN_OPCODE,
  > 66				(void *)addr, target, CALL_INSN_SIZE);
    67		return CALL_INSN_SIZE;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
