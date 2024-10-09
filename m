Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7020338DD3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 04:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728449372; cv=none; b=c1jJ0lxZ9/zMUfXPX4vNcS4hFxNVk7HfuwJkIN3RpbHbsF1vL/3PgQloaX/YNmsCrhtxFiy63hdrtsnB8Quz7oGjnapULX1JpYB9OpwQSMBsoKWqSqvstDzhsw+OEHjz8zuI9VKgPpBcSgBb2k9cVA8Qa6uboKl0dNHBb5QdMNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728449372; c=relaxed/simple;
	bh=CvIrdU8q4WBfEa0igGaYC6ERPOGhSWsv9fqZxTT5ZkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ln62KZaqHeqo6b2sEBTBV8Gpb9a8Vxty6O4Ektx3FvrgJefb17q89BaL5bb9y0826EpUKYqMMsNtYHzhcEorBV1gWVjJd6P+bpssN4SNxAJ8jr5a8qBX/lge8wEgTloEzHmm7Ev2zQQJWzXWSqqfoiLOmcil/mMhHEtR2aK1W+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPoAoIx4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPoAoIx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728449369; x=1759985369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CvIrdU8q4WBfEa0igGaYC6ERPOGhSWsv9fqZxTT5ZkQ=;
  b=SPoAoIx4pDP8tNR6/yJ0sNThpLYHZVW5xisWnuINs2AUA8yWmZWi9gLC
   4TyIfseVDHpqoQXptUJOU+FrAIvX9EnFYa6XM+PuDTU+eFRBQVgSw6TQn
   XHcrTyzMj4e+TXSrixMNGC109rLM+qseNkI/DONCetD0s1u4aelPU+49p
   Z5TXWoybkCMypQvJs4z8t4J25hhz14AXXt6G4dxOGZnwqXndtlYfI3H1D
   wkhO30NjxOhOXVwM8nEj7dC5o7vQqIFOw540cOCyW8/6vFy6LcLYbpvm+
   6GZCwh3nbI1HdfKZ/HFAaQOPgophXLV/pRYgsqvSIdLdQRFYTosKjJqEf
   Q==;
X-CSE-ConnectionGUID: ZD13QXOnTyWbV0ziMF/SDQ==
X-CSE-MsgGUID: ksC8/jJjRNSEilBPX7dBzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="15347721"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="15347721"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 21:49:29 -0700
X-CSE-ConnectionGUID: pJBiFkHZTk+KYzdaH0zfGA==
X-CSE-MsgGUID: 9vLrFa+qSVm7qHCL2crYGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="113605409"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Oct 2024 21:49:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syOdZ-0008kG-1z;
	Wed, 09 Oct 2024 04:49:25 +0000
Date: Wed, 9 Oct 2024 12:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng1 <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28633/30000] arch/x86/kernel/paravirt.c:65:2:
 error: implicit declaration of function '__text_gen_insn'
Message-ID: <202410091222.YZTQ9zgW-lkp@intel.com>
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
head:   17befaf8efea2ff937fa7e0d754885a67f67ce71
commit: 822da186955cbcd69b4715b8a307053e6c756f30 [28633/30000] x86/ibt,paravirt: Use text_gen_insn() for paravirt_patch()
config: x86_64-buildonly-randconfig-002-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091222.YZTQ9zgW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091222.YZTQ9zgW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091222.YZTQ9zgW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/paravirt.c:65:2: error: implicit declaration of function '__text_gen_insn' [-Werror,-Wimplicit-function-declaration]
      65 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |         ^
>> arch/x86/kernel/paravirt.c:65:29: error: use of undeclared identifier 'CALL_INSN_OPCODE'
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
   1 warning and 4 errors generated.


vim +/__text_gen_insn +65 arch/x86/kernel/paravirt.c

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
