Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D80221FD8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 03:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747798512; cv=none; b=GNCDjIz3p5sfmtY9trt2LBEE25XDJlUz4dTzZ+Z54vEvCGm0/yFCR9jBZmRPTrGBx1hfvMPuaKWmleQiQzVjmquu3zi/mcmhfZ4vWumqfEOluimpgp8h7XlfIBw+ddZde5+sBzUuKfSqUz5zhkM3n/kUaVgeIGe2fdUh3cnYMIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747798512; c=relaxed/simple;
	bh=oYwpVihZpscxBJKKmCxRxmidjOXsONoQmapRgC/dgTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePdAGJ5Xq4e1MwJ9+P6S5OpqRb2mIsLjcw50IxjoyinXvOspFV8tye1OxqJsJuVny24L9wNTe8g/1Rb4bpq330uCuKp2/cAvCQK3M0B4dKUtsbQ8ppjmjzCj2UOPCI7eMUNLiadWWeWNWX3WVfEGfO864yoniN7ciV3jurCbL0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHltGnfy; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHltGnfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747798511; x=1779334511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYwpVihZpscxBJKKmCxRxmidjOXsONoQmapRgC/dgTg=;
  b=mHltGnfyIuF2m7DgS8Y6SW8b7H5fHcEgQoZwKbDH94LNGRUs2gxCvnP8
   U0rEXWmBfapq7t1JGZ6KOzrVr64YXpco3a/jGgXchDTJ4Ku/Qzxr19b24
   +KwOl8Qcvii3dQmsYypdPHQeA1Xpvkbkz43UnUCaHm0+DfpOmlq1tGMnW
   FyVSNeJmdCWlSMOpcN5tqOhdqVsBkHHVFl+BdxF58uDI/LDMoA1so5BNo
   uMgbn3ige+62aYIO6lF8EfyrTXxJin4TM2eEHGbqZUUzRBueF5X/kGGGB
   wB9K8rODgALZKHDSe6ghhsY/6iMXzpUsFmucsfrLxaQnEmL3Gt47v44FV
   g==;
X-CSE-ConnectionGUID: bYzqB3gnToaSIVb9U0E/cg==
X-CSE-MsgGUID: McHQbWnNRNOnHSdUONFUfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49819077"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49819077"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 20:35:10 -0700
X-CSE-ConnectionGUID: 2T/dECnyRiuUlmTgt5TUXw==
X-CSE-MsgGUID: tciQZLzFSx6y5VYoqs5CJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139731734"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 May 2025 20:35:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHaEV-000Npm-1q;
	Wed, 21 May 2025 03:35:07 +0000
Date: Wed, 21 May 2025 11:34:26 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] arch/x86/mm/fault.c:1229:11:
 warning: no previous prototype for function 'memmap_page_fault'
Message-ID: <202505211104.C0v6ZuVB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   ace7789354948892feb8f07d384af6d4af715703
commit: 64f9a784aebe4551c84681f3037d1dab82b8193e [11/11] anolis: mm: initialize ZONE_DEVICE page struct on demand in guest kernel
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250521/202505211104.C0v6ZuVB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211104.C0v6ZuVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211104.C0v6ZuVB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/fault.c:1229:11: warning: no previous prototype for function 'memmap_page_fault' [-Wmissing-prototypes]
    1229 | int __ref memmap_page_fault(unsigned long address)
         |           ^
   arch/x86/mm/fault.c:1229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1229 | int __ref memmap_page_fault(unsigned long address)
         | ^
         | static 
   1 warning generated.


vim +/memmap_page_fault +1229 arch/x86/mm/fault.c

  1228	
> 1229	int __ref memmap_page_fault(unsigned long address)
  1230	{
  1231		struct zdm_context *zdm;
  1232		unsigned long start_pfn = 0, end_pfn, page_pfn, flags;
  1233		unsigned int level;
  1234		pte_t *pte;
  1235		pmd_t *pmd;
  1236	
  1237		rcu_read_lock();
  1238		zdm = zdm_lookup(address);
  1239		if (!zdm) {
  1240			rcu_read_unlock();
  1241			return 0;
  1242		}
  1243	
  1244		spin_lock_irqsave(&zdm->lock, flags);
  1245		pte = lookup_address(address, &level);
  1246		BUG_ON(!pte);
  1247		if (pte_flags(*pte) & _PAGE_PRESENT)
  1248			goto out;
  1249	
  1250		if (level == PG_LEVEL_4K) {
  1251			address &= PAGE_MASK;
  1252			page_pfn = pte_pfn(__pte(pte_val(*pte) | _PAGE_PRESENT));
  1253			start_pfn = page_to_pfn((struct page *)address);
  1254			end_pfn = start_pfn + PAGE_SIZE/sizeof(struct page);
  1255		} else {
  1256			pmd = (pmd_t *)pte;
  1257			address &= PMD_MASK;
  1258			page_pfn = pmd_pfn(__pmd(pmd_val(*pmd) | _PAGE_PRESENT));
  1259			start_pfn = page_to_pfn((struct page *)address);
  1260			end_pfn = start_pfn + PMD_SIZE/sizeof(struct page);
  1261		}
  1262	
  1263		zdm_reinit_struct_pages(zdm, page_pfn, start_pfn, end_pfn);
  1264	
  1265		/* All job is done, recover the page table */
  1266		if (level == PG_LEVEL_4K) {
  1267			set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
  1268		} else {
  1269			pmd = (pmd_t *)pte;
  1270			set_pmd(pmd, __pmd(pmd_val(*pmd) | _PAGE_PRESENT));
  1271		}
  1272	out:
  1273		spin_unlock_irqrestore(&zdm->lock, flags);
  1274		rcu_read_unlock();
  1275	
  1276		return 1;
  1277	}
  1278	#endif
  1279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
