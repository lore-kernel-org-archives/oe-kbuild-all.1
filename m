Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AE8440C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706437347; cv=none; b=TuWmfxVb68o0Ciy3DNVWStkqadRXMlsVW32gwPmcPjAwPQz/KmvHe/IpvPDStuk8c8m7UyGfYJGJJkl61bgcNOSYOhQ5bgZFEgejrsvGjHuZCQJuzt5irITgd6Fs+xFod7VwXQvZnDdE5t3pXTjzYEkDL4lxi8WgqyvXUAAsFYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706437347; c=relaxed/simple;
	bh=gDXDjQYD1nOn5ZoaWrzC7H5ChbDNb4cni+ouUXHaeYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fwemEauN7r9zcG4IofvHV395sBys5rmJ7fLONk+VvJCjmWUj34IVo+7SRfWquBk/b94bATmvEFuQgAZn3JoxMB4/I0xr0jaf/6iudfTfF1WXzFI3zqI4hCWDpyed8l4yn4vi7yCzD2CXRhjXAxPSsjszzgyOdp+NuQNivVuG/pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imBPfg8L; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imBPfg8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706437345; x=1737973345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gDXDjQYD1nOn5ZoaWrzC7H5ChbDNb4cni+ouUXHaeYg=;
  b=imBPfg8LNXCCCVrX4ioujJ2RrScPraidkCPjqdGTouDcWi4X3M8pBhRQ
   fZVPdr9Wl2Qo8ACa3c+odIJcgxnOs0a3q8c5q455B7OR8j56Vc52cFlzf
   q9FEb4fB+vQh4Ym8AjJcz/cTeqhO/NRezN2NdHBXXbrWMprznSUtkSRuy
   S7s9/ZxfG6VjX0UzYxmLkU0pkZ+XASwafjTRm7VF3KLtsTosdY6+fJ3XQ
   JeRW1gEN4h1KEIMbexsVzyPq5DSGrnyRG+sCm5aKtKsYzYD/IWNkUPhWv
   0NhnbGizyYqdPDa89v14u1Yrz4TVua1OkH6Yr5cL3mLNgJS7cwn9QQFZS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2589614"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2589614"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 02:22:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3139372"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2024 02:22:24 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU2Iv-0003Jm-1z;
	Sun, 28 Jan 2024 10:22:21 +0000
Date: Sun, 28 Jan 2024 18:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_batching 135/136]
 arch/powerpc/include/asm/tlb.h:22:33: error: implicit declaration of
 function '__tlb_remove_tlb_entry'; did you mean 'tlb_remove_tlb_entry'?
Message-ID: <202401281819.ZMcDWDxa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_batching
head:   865e6d6a176a1f50bcbb7dd1d6a57b803e398039
commit: 4779a2a486fbf2d3850b6256cd4c51f2d617c714 [135/136] mm/mmu_gather: add tlb_remove_tlb_entries()
config: powerpc64-randconfig-001-20240127 (https://download.01.org/0day-ci/archive/20240128/202401281819.ZMcDWDxa-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281819.ZMcDWDxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281819.ZMcDWDxa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/exec.c:73:
   include/asm-generic/tlb.h: In function 'tlb_remove_tlb_entries':
>> arch/powerpc/include/asm/tlb.h:22:33: error: implicit declaration of function '__tlb_remove_tlb_entry'; did you mean 'tlb_remove_tlb_entry'? [-Werror=implicit-function-declaration]
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:631:17: note: in expansion of macro '__tlb_remove_tlb_entry'
     631 |                 __tlb_remove_tlb_entry(tlb, ptep, address);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h: At top level:
   arch/powerpc/include/asm/tlb.h:22:33: warning: conflicting types for '__tlb_remove_tlb_entry'; have 'void(struct mmu_gather *, pte_t *, long unsigned int)'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h:41:20: note: in expansion of macro '__tlb_remove_tlb_entry'
      41 | static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/tlb.h:22:33: error: static declaration of '__tlb_remove_tlb_entry' follows non-static declaration
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h:41:20: note: in expansion of macro '__tlb_remove_tlb_entry'
      41 | static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h:22:33: note: previous implicit declaration of '__tlb_remove_tlb_entry' with type 'void(struct mmu_gather *, pte_t *, long unsigned int)'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:631:17: note: in expansion of macro '__tlb_remove_tlb_entry'
     631 |                 __tlb_remove_tlb_entry(tlb, ptep, address);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/powerpc/mm/book3s64/hash_tlb.c:25:
   include/asm-generic/tlb.h: In function 'tlb_remove_tlb_entries':
>> arch/powerpc/include/asm/tlb.h:22:33: error: implicit declaration of function '__tlb_remove_tlb_entry'; did you mean 'tlb_remove_tlb_entry'? [-Werror=implicit-function-declaration]
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:631:17: note: in expansion of macro '__tlb_remove_tlb_entry'
     631 |                 __tlb_remove_tlb_entry(tlb, ptep, address);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h: At top level:
   arch/powerpc/include/asm/tlb.h:22:33: warning: conflicting types for '__tlb_remove_tlb_entry'; have 'void(struct mmu_gather *, pte_t *, long unsigned int)'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h:41:20: note: in expansion of macro '__tlb_remove_tlb_entry'
      41 | static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/tlb.h:22:33: error: static declaration of '__tlb_remove_tlb_entry' follows non-static declaration
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h:41:20: note: in expansion of macro '__tlb_remove_tlb_entry'
      41 | static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h:22:33: note: previous implicit declaration of '__tlb_remove_tlb_entry' with type 'void(struct mmu_gather *, pte_t *, long unsigned int)'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:631:17: note: in expansion of macro '__tlb_remove_tlb_entry'
     631 |                 __tlb_remove_tlb_entry(tlb, ptep, address);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/hash_tlb.c: In function 'hpte_need_flush':
   arch/powerpc/mm/book3s64/hash_tlb.c:49:16: warning: variable 'offset' set but not used [-Wunused-but-set-variable]
      49 |         int i, offset;
         |                ^~~~~~
   cc1: some warnings being treated as errors
--
   In file included from arch/powerpc/mm/book3s64/hash_native.c:23:
   include/asm-generic/tlb.h: In function 'tlb_remove_tlb_entries':
>> arch/powerpc/include/asm/tlb.h:22:33: error: implicit declaration of function '__tlb_remove_tlb_entry'; did you mean 'tlb_remove_tlb_entry'? [-Werror=implicit-function-declaration]
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:631:17: note: in expansion of macro '__tlb_remove_tlb_entry'
     631 |                 __tlb_remove_tlb_entry(tlb, ptep, address);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h: At top level:
   arch/powerpc/include/asm/tlb.h:22:33: warning: conflicting types for '__tlb_remove_tlb_entry'; have 'void(struct mmu_gather *, pte_t *, long unsigned int)'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h:41:20: note: in expansion of macro '__tlb_remove_tlb_entry'
      41 | static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/tlb.h:22:33: error: static declaration of '__tlb_remove_tlb_entry' follows non-static declaration
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h:41:20: note: in expansion of macro '__tlb_remove_tlb_entry'
      41 | static inline void __tlb_remove_tlb_entry(struct mmu_gather *tlb, pte_t *ptep,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/tlb.h:22:33: note: previous implicit declaration of '__tlb_remove_tlb_entry' with type 'void(struct mmu_gather *, pte_t *, long unsigned int)'
      22 | #define __tlb_remove_tlb_entry  __tlb_remove_tlb_entry
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:631:17: note: in expansion of macro '__tlb_remove_tlb_entry'
     631 |                 __tlb_remove_tlb_entry(tlb, ptep, address);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s64/hash_native.c: In function 'native_flush_hash_range':
   arch/powerpc/mm/book3s64/hash_native.c:782:29: warning: variable 'index' set but not used [-Wunused-but-set-variable]
     782 |         unsigned long hash, index, hidx, shift, slot;
         |                             ^~~~~
   cc1: some warnings being treated as errors


vim +22 arch/powerpc/include/asm/tlb.h

d4243c175f127b include/asm-powerpc/tlb.h      Mathieu Desnoyers 2007-10-02  21  
fb7332a9fedfd6 arch/powerpc/include/asm/tlb.h Will Deacon       2014-10-29 @22  #define __tlb_remove_tlb_entry	__tlb_remove_tlb_entry
9a0f78f63bc05d include/asm-powerpc/tlb.h      Stephen Rothwell  2005-11-04  23  

:::::: The code at line 22 was first introduced by commit
:::::: fb7332a9fedfd62b1ba6530c86f39f0fa38afd49 mmu_gather: move minimal range calculations into generic code

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
