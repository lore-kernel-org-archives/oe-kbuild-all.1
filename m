Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150013A1E94
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 06:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766902796; cv=none; b=imwIAyPnPsZp6c/XyvXzvjWhvywFxf3nsYTdcKgsoTLwXZbl3cwp1dDdDn0uEiEfsifolGammyVeh/7HMpPPl8NwJufLPHjf/2Jgrv+tL8pVHP8knao5pwxRYgqCNpjE0NrYzu6nhWnX1WtHfMvTzdM0nMmI8YxMAnIiC8z8+MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766902796; c=relaxed/simple;
	bh=Scd1gjFMkW5rwza5NknHxSHu5Um4Q3odMXbUnMNbkSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n2C7UaqIX3DrYPWMOukv/W5ZjUcbM9PlONLoLLn7jtMGE2E7sD5VHVIwAw7kbOiTmQdfTzKmuA3j4avFlVZY4a8+6xMosrVUyoO9TSGWdSKe622Y58jNtFDTwWoh/nuLbiJINCT6OyHdFQg4H18DSZ7R0nQ3VkIxjScFOoOINE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGqRv014; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGqRv014"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766902794; x=1798438794;
  h=date:from:to:cc:subject:message-id;
  bh=Scd1gjFMkW5rwza5NknHxSHu5Um4Q3odMXbUnMNbkSM=;
  b=IGqRv014mMYwkT9fdGHiYXqzCurqfIE3HBZPEbzxwcDTLBlf007IhBmv
   PE1yRly3TjuBKAeDLxYW5HOVRCL+5ttYXHt8CRS2vucWayGx/39McsKZP
   3WKJLjD8Sc0dX6cl97e9Ei5lihHNwYbS81fj8X3Q9dwQMVi0lzsptajls
   4CD+ZY+7os953qOwbnbK8/sgubD5gKdKZAB9tbgem4GwimEi8qvusUhZK
   igdUrzb2R4JRlH+d8z+vxUGUlleaclYZBP1Gc6OB8ZsjFxUzUPzhfHW/w
   nWJ0RjANkdP9OWA2tC820E7a3wJKxtUzdCXEpO7xd9rnacajknHTnN/D6
   w==;
X-CSE-ConnectionGUID: y4nfVBw9RgumfmaSqhQsDA==
X-CSE-MsgGUID: E6JkyRDWQDKbKTl2BNfRTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68450970"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="68450970"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 22:19:53 -0800
X-CSE-ConnectionGUID: 33gMNuPlRFePcanUKrhMuw==
X-CSE-MsgGUID: SqPJPuWTSKql961ORzNv0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200964388"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Dec 2025 22:19:52 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZk7U-000000006ID-37Xf;
	Sun, 28 Dec 2025 06:19:48 +0000
Date: Sun, 28 Dec 2025 14:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 29/29]
 drivers/firmware/efi/libstub/zboot-decompress-elf.c:105:53: error:
 'R_X86_64_RELATIVE' undeclared; did you mean 'R_386_RELATIVE'?
Message-ID: <202512281414.hZR7yWaS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: b6f238d2e8720acf63467aa0d48d7fc4e31c07c2 [29/29] efi zboot for x86
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251228/202512281414.hZR7yWaS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281414.hZR7yWaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281414.hZR7yWaS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/zboot-decompress-elf.c: In function 'handle_dynamic':
   drivers/firmware/efi/libstub/zboot-decompress-elf.c:90:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      90 |                         rela = (void *)(d->d_un.d_ptr + p2v_offset);
         |                                ^
   drivers/firmware/efi/libstub/zboot-decompress-elf.c:96:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      96 |                         relr = (void *)(d->d_un.d_ptr + p2v_offset);
         |                                ^
>> drivers/firmware/efi/libstub/zboot-decompress-elf.c:105:53: error: 'R_X86_64_RELATIVE' undeclared (first use in this function); did you mean 'R_386_RELATIVE'?
     105 |                 if (ELF64_R_TYPE(rela[i].r_info) != R_X86_64_RELATIVE)
         |                                                     ^~~~~~~~~~~~~~~~~
         |                                                     R_386_RELATIVE
   drivers/firmware/efi/libstub/zboot-decompress-elf.c:105:53: note: each undeclared identifier is reported only once for each function it appears in
   drivers/firmware/efi/libstub/zboot-decompress-elf.c:108:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     108 |                 place = (u64 *)(rela[i].r_offset + p2v_offset);
         |                         ^
   drivers/firmware/efi/libstub/zboot-decompress-elf.c:114:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     114 |                         place = (u64 *)(relr[i] + p2v_offset);
         |                                 ^
   drivers/firmware/efi/libstub/zboot-decompress-elf.c: In function 'efi_zboot_decompress_segments':
   drivers/firmware/efi/libstub/zboot-decompress-elf.c:150:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     150 |                         handle_dynamic(dst, (Elf64_Off)dst - ph->p_vaddr, va_shift);
         |                                             ^


vim +105 drivers/firmware/efi/libstub/zboot-decompress-elf.c

48d32d494f9f9a Ard Biesheuvel 2024-12-16   77  
48d32d494f9f9a Ard Biesheuvel 2024-12-16   78  static void handle_dynamic(const Elf64_Dyn *dyn, Elf64_Off p2v_offset,
48d32d494f9f9a Ard Biesheuvel 2024-12-16   79  			   u64 va_shift)
48d32d494f9f9a Ard Biesheuvel 2024-12-16   80  {
48d32d494f9f9a Ard Biesheuvel 2024-12-16   81  	const Elf64_Rela *rela = NULL;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   82  	u64 *relr = NULL;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   83  	int relasize = 0;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   84  	int relrsize = 0;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   85  	u64 *place;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   86  
48d32d494f9f9a Ard Biesheuvel 2024-12-16   87  	for (auto d = dyn; d->d_tag != DT_NULL; d++) {
48d32d494f9f9a Ard Biesheuvel 2024-12-16   88  		switch (d->d_tag) {
48d32d494f9f9a Ard Biesheuvel 2024-12-16   89  		case DT_RELA:
48d32d494f9f9a Ard Biesheuvel 2024-12-16   90  			rela = (void *)(d->d_un.d_ptr + p2v_offset);
48d32d494f9f9a Ard Biesheuvel 2024-12-16   91  			break;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   92  		case DT_RELASZ:
48d32d494f9f9a Ard Biesheuvel 2024-12-16   93  			relasize = d->d_un.d_val;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   94  			break;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   95  		case DT_RELR:
48d32d494f9f9a Ard Biesheuvel 2024-12-16   96  			relr = (void *)(d->d_un.d_ptr + p2v_offset);
48d32d494f9f9a Ard Biesheuvel 2024-12-16   97  			break;
48d32d494f9f9a Ard Biesheuvel 2024-12-16   98  		case DT_RELRSZ:
48d32d494f9f9a Ard Biesheuvel 2024-12-16   99  			relrsize = d->d_un.d_val;
48d32d494f9f9a Ard Biesheuvel 2024-12-16  100  			break;
48d32d494f9f9a Ard Biesheuvel 2024-12-16  101  		}
48d32d494f9f9a Ard Biesheuvel 2024-12-16  102  	}
48d32d494f9f9a Ard Biesheuvel 2024-12-16  103  
48d32d494f9f9a Ard Biesheuvel 2024-12-16  104  	for (int i = 0; i < relasize / sizeof(*rela); i++) {
48d32d494f9f9a Ard Biesheuvel 2024-12-16 @105  		if (ELF64_R_TYPE(rela[i].r_info) != R_X86_64_RELATIVE)
48d32d494f9f9a Ard Biesheuvel 2024-12-16  106  			continue;
48d32d494f9f9a Ard Biesheuvel 2024-12-16  107  
48d32d494f9f9a Ard Biesheuvel 2024-12-16  108  		place = (u64 *)(rela[i].r_offset + p2v_offset);
48d32d494f9f9a Ard Biesheuvel 2024-12-16  109  		*place += va_shift;
48d32d494f9f9a Ard Biesheuvel 2024-12-16  110  	}
48d32d494f9f9a Ard Biesheuvel 2024-12-16  111  
48d32d494f9f9a Ard Biesheuvel 2024-12-16  112  	for (int i = 0; i < relrsize / sizeof(u64); i++) {
48d32d494f9f9a Ard Biesheuvel 2024-12-16  113  		if ((relr[i] & 1) == 0) {
48d32d494f9f9a Ard Biesheuvel 2024-12-16  114  			place = (u64 *)(relr[i] + p2v_offset);
48d32d494f9f9a Ard Biesheuvel 2024-12-16  115  			*place++ += va_shift;
48d32d494f9f9a Ard Biesheuvel 2024-12-16  116  			continue;
48d32d494f9f9a Ard Biesheuvel 2024-12-16  117  		}
48d32d494f9f9a Ard Biesheuvel 2024-12-16  118  
48d32d494f9f9a Ard Biesheuvel 2024-12-16  119  		for (u64 *p = place, r = relr[i] >> 1; r; p++, r >>= 1)
48d32d494f9f9a Ard Biesheuvel 2024-12-16  120  			if (r & 1)
48d32d494f9f9a Ard Biesheuvel 2024-12-16  121  				*p += va_shift;
48d32d494f9f9a Ard Biesheuvel 2024-12-16  122  		place += 63;
48d32d494f9f9a Ard Biesheuvel 2024-12-16  123  	}
48d32d494f9f9a Ard Biesheuvel 2024-12-16  124  }
48d32d494f9f9a Ard Biesheuvel 2024-12-16  125  

:::::: The code at line 105 was first introduced by commit
:::::: 48d32d494f9f9a7f30d08647fd94bf20c50705e9 efi/zboot: Add support for ELF payloads

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
