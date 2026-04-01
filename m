Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B913EF678
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 23:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775086704; cv=none; b=mThu9L+9mRHnjiLCyL5ZVo5P2RCHYL7yayVVk65qkfEGcI7ZMVEvZW+h7EqRHCqLbp2XdiU2V2mWenTwfMiAmD7paUTRUAxNBkp01azsUG6jaam8AvBSuvWQ6TmrNL+Ql/A1hM2SMbKZHqPMpMHDUMBEej6+LUAeJWHRqqvskjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775086704; c=relaxed/simple;
	bh=1CF30HoFVOtL7h+jt+K7mdR/1hZ18w50gWGXEN6JhhY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I2DOdqUqKOkwKBFd9V7OzZ5wUoAeOmUEVsTJaOEaQBfy7hpYXLdXDJhLA/7fTyyuVX+PWOnwP2kKRE8+TiVYyav2MZnaTW/zUOQ0L8mqTdYPYczjZFLHYm7fsIM1bySHGBsjoeE2nMnQmzx1NFidTqBR8Wol3l5KOjULpS7TSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=no6rICGu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="no6rICGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775086695; x=1806622695;
  h=date:from:to:cc:subject:message-id;
  bh=1CF30HoFVOtL7h+jt+K7mdR/1hZ18w50gWGXEN6JhhY=;
  b=no6rICGuQff7Vr3jn+Ucs/9DslcqkPL3URwR2RxRnaH4DPOSR2K/Ml13
   zZ1Zy+rSJ1nlqf5BcPQp8ra9h3fj32YQyzYM488qSr4WERjrCtvnO6gZs
   A+nKqA2FJuBNxwa3mJnZsmnTuhn1+4fdDoRLtosalBPAkRltgsqHKDZuw
   WVCqufc4hinocdub/4jpGUWopPjTRM92WqwqgtkXUwhSut3T0sTW1duzd
   X1lfnrgD1DZInWgAEboBos8UJ43mN/IDTSkgFKvms2UyMoYeeVSz03Nro
   3OUwskRY21UG6Mn3QJMjZvGZe77bOyfq5RVUzc7I5G90IyofqtY3h+txT
   A==;
X-CSE-ConnectionGUID: vwvpqiFwSwCFiBUrM4EbCw==
X-CSE-MsgGUID: sfSApzfuS1GZh8AcfAUb0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76327551"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76327551"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 16:38:13 -0700
X-CSE-ConnectionGUID: BW7wwEG0QWG8YHRBihBQSQ==
X-CSE-MsgGUID: Xsyxn/ZSQsCQruKcR0Ij7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="223527309"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Apr 2026 16:38:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w858S-000000008rl-3UzM;
	Wed, 01 Apr 2026 23:38:08 +0000
Date: Thu, 02 Apr 2026 01:37:23 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Breno Leitao <leitao@debian.org>
Subject: [ardb:x86-efi-memattr-kexec-v3 4/5]
 drivers/firmware/efi/memattr.c:104:15: error: implicit declaration of
 function 'PAGE_ALIGNED'; did you mean 'IS_ALIGNED'?
Message-ID: <202604020110.9r66cE3E-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-memattr-kexec-v3
head:   9dee7ecd271959a84a9d7bd622e017f6eb7ff5b9
commit: 3f66665e01597a2b05c8d87edf66f3227a97c994 [4/5] efi: Use efi_mem_reserve() to reserve the memory attribute table
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260402/202604020110.9r66cE3E-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604020110.9r66cE3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604020110.9r66cE3E-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/memattr.c: In function 'entry_is_valid':
>> drivers/firmware/efi/memattr.c:104:15: error: implicit declaration of function 'PAGE_ALIGNED'; did you mean 'IS_ALIGNED'? [-Wimplicit-function-declaration]
     104 |             (!PAGE_ALIGNED(in->phys_addr) ||
         |               ^~~~~~~~~~~~
         |               IS_ALIGNED


vim +104 drivers/firmware/efi/memattr.c

10f0d2f57705350 Ard Biesheuvel 2016-04-25   83  
10f0d2f57705350 Ard Biesheuvel 2016-04-25   84  /*
10f0d2f57705350 Ard Biesheuvel 2016-04-25   85   * Returns a copy @out of the UEFI memory descriptor @in if it is covered
10f0d2f57705350 Ard Biesheuvel 2016-04-25   86   * entirely by a UEFI memory map entry with matching attributes. The virtual
10f0d2f57705350 Ard Biesheuvel 2016-04-25   87   * address of @out is set according to the matching entry that was found.
10f0d2f57705350 Ard Biesheuvel 2016-04-25   88   */
10f0d2f57705350 Ard Biesheuvel 2016-04-25   89  static bool entry_is_valid(const efi_memory_desc_t *in, efi_memory_desc_t *out)
10f0d2f57705350 Ard Biesheuvel 2016-04-25   90  {
10f0d2f57705350 Ard Biesheuvel 2016-04-25   91  	u64 in_paddr = in->phys_addr;
10f0d2f57705350 Ard Biesheuvel 2016-04-25   92  	u64 in_size = in->num_pages << EFI_PAGE_SHIFT;
10f0d2f57705350 Ard Biesheuvel 2016-04-25   93  	efi_memory_desc_t *md;
10f0d2f57705350 Ard Biesheuvel 2016-04-25   94  
10f0d2f57705350 Ard Biesheuvel 2016-04-25   95  	*out = *in;
10f0d2f57705350 Ard Biesheuvel 2016-04-25   96  
10f0d2f57705350 Ard Biesheuvel 2016-04-25   97  	if (in->type != EFI_RUNTIME_SERVICES_CODE &&
10f0d2f57705350 Ard Biesheuvel 2016-04-25   98  	    in->type != EFI_RUNTIME_SERVICES_DATA) {
10f0d2f57705350 Ard Biesheuvel 2016-04-25   99  		pr_warn("Entry type should be RuntimeServiceCode/Data\n");
10f0d2f57705350 Ard Biesheuvel 2016-04-25  100  		return false;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  101  	}
10f0d2f57705350 Ard Biesheuvel 2016-04-25  102  
10f0d2f57705350 Ard Biesheuvel 2016-04-25  103  	if (PAGE_SIZE > EFI_PAGE_SIZE &&
10f0d2f57705350 Ard Biesheuvel 2016-04-25 @104  	    (!PAGE_ALIGNED(in->phys_addr) ||
10f0d2f57705350 Ard Biesheuvel 2016-04-25  105  	     !PAGE_ALIGNED(in->num_pages << EFI_PAGE_SHIFT))) {
10f0d2f57705350 Ard Biesheuvel 2016-04-25  106  		/*
10f0d2f57705350 Ard Biesheuvel 2016-04-25  107  		 * Since arm64 may execute with page sizes of up to 64 KB, the
10f0d2f57705350 Ard Biesheuvel 2016-04-25  108  		 * UEFI spec mandates that RuntimeServices memory regions must
10f0d2f57705350 Ard Biesheuvel 2016-04-25  109  		 * be 64 KB aligned. We need to validate this here since we will
10f0d2f57705350 Ard Biesheuvel 2016-04-25  110  		 * not be able to tighten permissions on such regions without
10f0d2f57705350 Ard Biesheuvel 2016-04-25  111  		 * affecting adjacent regions.
10f0d2f57705350 Ard Biesheuvel 2016-04-25  112  		 */
10f0d2f57705350 Ard Biesheuvel 2016-04-25  113  		pr_warn("Entry address region misaligned\n");
10f0d2f57705350 Ard Biesheuvel 2016-04-25  114  		return false;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  115  	}
10f0d2f57705350 Ard Biesheuvel 2016-04-25  116  
10f0d2f57705350 Ard Biesheuvel 2016-04-25  117  	for_each_efi_memory_desc(md) {
10f0d2f57705350 Ard Biesheuvel 2016-04-25  118  		u64 md_paddr = md->phys_addr;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  119  		u64 md_size = md->num_pages << EFI_PAGE_SHIFT;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  120  
10f0d2f57705350 Ard Biesheuvel 2016-04-25  121  		if (!(md->attribute & EFI_MEMORY_RUNTIME))
10f0d2f57705350 Ard Biesheuvel 2016-04-25  122  			continue;
5de0fef0230f3c8 Ard Biesheuvel 2019-02-02  123  		if (md->virt_addr == 0 && md->phys_addr != 0) {
10f0d2f57705350 Ard Biesheuvel 2016-04-25  124  			/* no virtual mapping has been installed by the stub */
10f0d2f57705350 Ard Biesheuvel 2016-04-25  125  			break;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  126  		}
10f0d2f57705350 Ard Biesheuvel 2016-04-25  127  
10f0d2f57705350 Ard Biesheuvel 2016-04-25  128  		if (md_paddr > in_paddr || (in_paddr - md_paddr) >= md_size)
10f0d2f57705350 Ard Biesheuvel 2016-04-25  129  			continue;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  130  
10f0d2f57705350 Ard Biesheuvel 2016-04-25  131  		/*
10f0d2f57705350 Ard Biesheuvel 2016-04-25  132  		 * This entry covers the start of @in, check whether
10f0d2f57705350 Ard Biesheuvel 2016-04-25  133  		 * it covers the end as well.
10f0d2f57705350 Ard Biesheuvel 2016-04-25  134  		 */
10f0d2f57705350 Ard Biesheuvel 2016-04-25  135  		if (md_paddr + md_size < in_paddr + in_size) {
10f0d2f57705350 Ard Biesheuvel 2016-04-25  136  			pr_warn("Entry covers multiple EFI memory map regions\n");
10f0d2f57705350 Ard Biesheuvel 2016-04-25  137  			return false;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  138  		}
10f0d2f57705350 Ard Biesheuvel 2016-04-25  139  
10f0d2f57705350 Ard Biesheuvel 2016-04-25  140  		if (md->type != in->type) {
10f0d2f57705350 Ard Biesheuvel 2016-04-25  141  			pr_warn("Entry type deviates from EFI memory map region type\n");
10f0d2f57705350 Ard Biesheuvel 2016-04-25  142  			return false;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  143  		}
10f0d2f57705350 Ard Biesheuvel 2016-04-25  144  
10f0d2f57705350 Ard Biesheuvel 2016-04-25  145  		out->virt_addr = in_paddr + (md->virt_addr - md_paddr);
10f0d2f57705350 Ard Biesheuvel 2016-04-25  146  
10f0d2f57705350 Ard Biesheuvel 2016-04-25  147  		return true;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  148  	}
10f0d2f57705350 Ard Biesheuvel 2016-04-25  149  
10f0d2f57705350 Ard Biesheuvel 2016-04-25  150  	pr_warn("No matching entry found in the EFI memory map\n");
10f0d2f57705350 Ard Biesheuvel 2016-04-25  151  	return false;
10f0d2f57705350 Ard Biesheuvel 2016-04-25  152  }
10f0d2f57705350 Ard Biesheuvel 2016-04-25  153  

:::::: The code at line 104 was first introduced by commit
:::::: 10f0d2f57705350bbbe5f28e9292ae3905823c3c efi: Implement generic support for the Memory Attributes table

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
