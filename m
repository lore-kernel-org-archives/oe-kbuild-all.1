Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2446D2110
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 01:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766883630; cv=none; b=h6GJzP5rInG7XO+KhPj/w16JI0ucEGf5QIxA7rrbo6NYxVLzvRwOSfTHt3pAglS80IS/3bqfNJrzY4aqwl/+spcA/7u5V6o14gSMsInghmwGJ39IcrUgF+vR4qdJDX+YKKNZyYFkLewfcUyTJDD5v1e2h1MqNsIHB5HtqrTNUOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766883630; c=relaxed/simple;
	bh=qfcknvVzqTPARFaY/VzqEiWXe5ctxr3jM6WI02MV/QY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MaEFIxukKdhLf/tRdWQ/UIeNp8RJD2dqYtLebDeVdytjGiPTps7K8fD4q5OfG18+MJlLjTVu9iaWjXSdL2e/LHmkzW/ZvvOhgm57GPD3q2VdGKhwve0+YNrY6vH6nj3+o+MBr2ARdzCqWM0TDHJfqcljqMgCenC+CHWfpf/toGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nck1ekMV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nck1ekMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766883628; x=1798419628;
  h=date:from:to:cc:subject:message-id;
  bh=qfcknvVzqTPARFaY/VzqEiWXe5ctxr3jM6WI02MV/QY=;
  b=Nck1ekMVvCxvV0Ua6CW6gM+hS1BUB8BAMr+vQiyup4ClmIEvu9zVPeUW
   qZhyTN69FO8WGd2Ecob256DNOSEkZkBZIU5Wsj2m80eY5wttYN4SVB/Il
   0jOd/fhMC8jBlVkyETN0ajyfJ1Wbv2vCqIHFLFUB5JewiTnIdE1l4aMv1
   frjn+oPSnevUjMTazCI5IaITLV3vhIx5lqKRUP5FF6Av9DQiR/K+wzbRp
   3WgqagFOchDoWM8MxFC9MOTgJ/8hgbVoICTQxvb2FhPukXVdjlyyfOCc/
   Heg2E428DId5Cb617x58ncQtO295o7cncjinMoQYrk17q2PaLqpUQJHik
   A==;
X-CSE-ConnectionGUID: sv7Ft8jKQ7OtIP9D9WoCTg==
X-CSE-MsgGUID: r/D8G9MVSGyLhMexwNdLUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="78866592"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="78866592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 17:00:27 -0800
X-CSE-ConnectionGUID: tlDeJITSSGOGzQ/aGtnCsA==
X-CSE-MsgGUID: tDuMv/hqSQivPjl1WMH8Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="238035301"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 27 Dec 2025 17:00:26 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZf8x-000000006A3-3REy;
	Sun, 28 Dec 2025 01:00:23 +0000
Date: Sun, 28 Dec 2025 08:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 29/29]
 drivers/firmware/efi/libstub/zboot-decompress-elf.c:90:32: warning: cast to
 pointer from integer of different size
Message-ID: <202512280821.bvUtTNIa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ard,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: b6f238d2e8720acf63467aa0d48d7fc4e31c07c2 [29/29] efi zboot for x86
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251228/202512280821.bvUtTNIa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512280821.bvUtTNIa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512280821.bvUtTNIa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/zboot-decompress-elf.c: In function 'handle_dynamic':
>> drivers/firmware/efi/libstub/zboot-decompress-elf.c:90:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      90 |                         rela = (void *)(d->d_un.d_ptr + p2v_offset);
         |                                ^
   drivers/firmware/efi/libstub/zboot-decompress-elf.c:96:32: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
      96 |                         relr = (void *)(d->d_un.d_ptr + p2v_offset);
         |                                ^
   drivers/firmware/efi/libstub/zboot-decompress-elf.c:105:53: error: 'R_X86_64_RELATIVE' undeclared (first use in this function); did you mean 'R_386_RELATIVE'?
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
>> drivers/firmware/efi/libstub/zboot-decompress-elf.c:150:45: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     150 |                         handle_dynamic(dst, (Elf64_Off)dst - ph->p_vaddr, va_shift);
         |                                             ^


vim +90 drivers/firmware/efi/libstub/zboot-decompress-elf.c

48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   77  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   78  static void handle_dynamic(const Elf64_Dyn *dyn, Elf64_Off p2v_offset,
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   79  			   u64 va_shift)
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   80  {
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   81  	const Elf64_Rela *rela = NULL;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   82  	u64 *relr = NULL;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   83  	int relasize = 0;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   84  	int relrsize = 0;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   85  	u64 *place;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   86  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   87  	for (auto d = dyn; d->d_tag != DT_NULL; d++) {
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   88  		switch (d->d_tag) {
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   89  		case DT_RELA:
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  @90  			rela = (void *)(d->d_un.d_ptr + p2v_offset);
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   91  			break;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   92  		case DT_RELASZ:
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   93  			relasize = d->d_un.d_val;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   94  			break;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   95  		case DT_RELR:
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   96  			relr = (void *)(d->d_un.d_ptr + p2v_offset);
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   97  			break;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   98  		case DT_RELRSZ:
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16   99  			relrsize = d->d_un.d_val;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  100  			break;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  101  		}
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  102  	}
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  103  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  104  	for (int i = 0; i < relasize / sizeof(*rela); i++) {
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  105  		if (ELF64_R_TYPE(rela[i].r_info) != R_X86_64_RELATIVE)
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  106  			continue;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  107  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  108  		place = (u64 *)(rela[i].r_offset + p2v_offset);
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  109  		*place += va_shift;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  110  	}
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  111  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  112  	for (int i = 0; i < relrsize / sizeof(u64); i++) {
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  113  		if ((relr[i] & 1) == 0) {
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  114  			place = (u64 *)(relr[i] + p2v_offset);
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  115  			*place++ += va_shift;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  116  			continue;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  117  		}
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  118  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  119  		for (u64 *p = place, r = relr[i] >> 1; r; p++, r >>= 1)
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  120  			if (r & 1)
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  121  				*p += va_shift;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  122  		place += 63;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  123  	}
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  124  }
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  125  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  126  bool efi_zboot_decompress_segments(u8 *out, unsigned long outlen,
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  127  				   unsigned long va_shift,
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  128  				   bool (*decompress_slice)(u8 *, unsigned long))
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  129  {
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  130  	efi_memory_attribute_protocol_t *memattr = NULL;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  131  	unsigned long pos = sizeof(elf_header);
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  132  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  133  	/* grab a reference to the memory attributes protocol, if available */
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  134  	efi_bs_call(locate_protocol, &EFI_MEMORY_ATTRIBUTE_PROTOCOL_GUID, NULL,
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  135  		    (void **)&memattr);
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  136  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  137  	/*
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  138  	 * Iterate over the program headers, and decompress the payload of each
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  139  	 * PT_LOAD entry. This involves skipping the padding by decompressing
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  140  	 * it into the output buffer before overwriting it with the actual
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  141  	 * data.
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  142  	 */
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  143  	for (int i = 0; i < elf_header.ehdr.e_phnum; i++) {
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  144  		__auto_type ph = &elf_header.phdr[i];
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  145  		void *dst = out + ph->p_paddr - elf_header.phdr[0].p_paddr;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  146  		unsigned long pa = (unsigned long)dst;
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  147  
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  148  		if (IS_ENABLED(CONFIG_64BIT) && ph->p_type == PT_DYNAMIC &&
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16  149  		    va_shift != 0)
48d32d494f9f9a7 Ard Biesheuvel 2024-12-16 @150  			handle_dynamic(dst, (Elf64_Off)dst - ph->p_vaddr, va_shift);

:::::: The code at line 90 was first introduced by commit
:::::: 48d32d494f9f9a7f30d08647fd94bf20c50705e9 efi/zboot: Add support for ELF payloads

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
