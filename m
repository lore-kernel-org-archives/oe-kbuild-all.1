Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35371DFE4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 17:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721582934; cv=none; b=N57ZPd8VPOca/O2Z8zhGt5pBU8lwW5JSgpXYM2HvTHzFtruVZ+IDx2xfzrFmOsfW1Xg06IagD7exfoagbP/wFxoTE7DNCzCZcLsYsTs/SLP9Y8ChtWl/0hqu+stvDIXC2cS50+vvxh2e109j0Zj0lp2sBENIJRlsqyRdrUlKCsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721582934; c=relaxed/simple;
	bh=dYgBtPDhI6H3DTasqZZta3DQR1nSDnK0XUheaMR642E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nnzqaxabR760truWwJgYnwJpmKYZSNo2yMb25FzL4r/YOnfVEVkM7mNNSjZZbQFMoP+4tpzfmeJ+yM96EC/XzSxAw4W/qwBf1C5orn0u8S8wBnOdGilwpjRLOVtTe/62622I6lY3mCpOwKEYNvhcHPpHOfXls7k1Vo4dskf2Qz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7J7xvVm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7J7xvVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721582931; x=1753118931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dYgBtPDhI6H3DTasqZZta3DQR1nSDnK0XUheaMR642E=;
  b=M7J7xvVm7h7CHxVyCAomy78rrhLDc3k9X+vS6ap/7pvBoBbDyxKNw6hC
   8k6Zy5WnGFhO0DixxBNI+OsNQXtt1slXi6nRSC0BiXScgpiTT6UQw1SoC
   6GFt9owGT7lWSWEn92CN5B8Q8dRJhD+gL9D9rbRPArWJ/wgeUeyZTN6ej
   NFNtxq6jQpJl6F9r1ZaFGlGBOxPM1dQRG0DjdOw7Af/f1dnEVCtLpDBgX
   7Zqtf3KjFV6hGhd/TomGrAadMSf3uEH3ingPxUksdG5VXJcHZW5293+j0
   S0TdcNs1ZFmf38nkAyG5+10QFNXudhBgDbMYxll5ATuCk1kcXm5ur59eI
   g==;
X-CSE-ConnectionGUID: cjm8wk4fQn+MvPSIxwxZuA==
X-CSE-MsgGUID: 0HaoFMegR++G9KFnutXSOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="29806728"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="29806728"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 10:28:50 -0700
X-CSE-ConnectionGUID: WqdlswcUQ1Gr+8JwyEdTUA==
X-CSE-MsgGUID: PVy4r4aIQda0CELjbBPSYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="56195615"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jul 2024 10:28:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVaMZ-000kQI-08;
	Sun, 21 Jul 2024 17:28:47 +0000
Date: Mon, 22 Jul 2024 01:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 32/43]
 arch/microblaze/include/asm/pgalloc.h:33:61: error: passing argument 2 of
 'pte_free' from incompatible pointer type
Message-ID: <202407220159.hn8Nhgx0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   24c8778745b223097d5e3d590967626176306b1d
commit: 2bf6dbc419014b25dfb0825a585c7444ebaa74fe [32/43] mm/pgtable: return ptdesc in pte_free
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20240722/202407220159.hn8Nhgx0-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407220159.hn8Nhgx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407220159.hn8Nhgx0-lkp@intel.com/

Note: the alexshi/mmunstable HEAD 24c8778745b223097d5e3d590967626176306b1d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:86:
   mm/memory.c: In function 'free_pte_range':
>> arch/microblaze/include/asm/pgalloc.h:33:61: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
      33 | #define __pte_free_tlb(tlb, pte, addr)  pte_free((tlb)->mm, (pte))
         |                                                             ^~~~~
         |                                                             |
         |                                                             pgtable_t {aka struct page *}
   include/asm-generic/tlb.h:706:17: note: in expansion of macro '__pte_free_tlb'
     706 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~
   mm/memory.c:194:9: note: in expansion of macro 'pte_free_tlb'
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~
   In file included from arch/microblaze/include/asm/pgalloc.h:20:
   include/asm-generic/pgalloc.h:108:66: note: expected 'struct ptdesc *' but argument is of type 'pgtable_t' {aka 'struct page *'}
     108 | static inline void pte_free(struct mm_struct *mm, struct ptdesc *ptdesc)
         |                                                   ~~~~~~~~~~~~~~~^~~~~~


vim +/pte_free +33 arch/microblaze/include/asm/pgalloc.h

1f84e1ea0e87ad Michal Simek           2009-05-26  32  
9e1b32caa525cb Benjamin Herrenschmidt 2009-07-22 @33  #define __pte_free_tlb(tlb, pte, addr)	pte_free((tlb)->mm, (pte))
1f84e1ea0e87ad Michal Simek           2009-05-26  34  

:::::: The code at line 33 was first introduced by commit
:::::: 9e1b32caa525cb236e80e9c671e179bcecccc657 mm: Pass virtual address to [__]p{te,ud,md}_free_tlb()

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
