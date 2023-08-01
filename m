Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA0E4DC94
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 22:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690928448; x=1722464448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gaLsET+/Qrz9JCJr5yov5MBIB2b7YhH/3a0CICM2NiA=;
  b=aQYtOBACgvA4hnUb1d0cWQWoJ+YHZtTXBRqnifWuGeJek99ZFHzxjNHr
   LvZalvOEh5ukjT/MEu+1i1WWxRsq1efckmH0qwCA63Bftd2RpSGZv00b6
   4Xz74ENC8Dxt3QW2Ll+IOipPzaBPwS3m3rr2+dTZTsAEFxkFe7whGa1XJ
   WvLU1MZ53jrEmQ87A/zBJfC6xzluC0cySHi224Bf84Xl14uKoM68mk2Mo
   66/u0qQNCLF30RtnqFz0eZw9d6GwkQxtvmKUuD3Q2GABKR+RMy5QsIOMZ
   D6AZNBQW3O2wiLJa+mUQYLH0o9obOx/MT49iMQT0CDHx2oDFJQtvP1I9/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359465022"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="359465022"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 15:20:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="732151424"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="732151424"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2023 15:20:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQxjP-0000d3-2K;
	Tue, 01 Aug 2023 22:20:43 +0000
Date: Wed, 2 Aug 2023 06:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 26/38]
 arch/sparc/include/asm/tlbflush_64.h:11: Error: Unknown opcode: `struct'
Message-ID: <202308020629.Pvc7oTDy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   9729c95a6d57a4f9d63c098dcfc27f1f1a5e8e03
commit: 1d7664343f866fe7c4184416ccc4be1871d5ba0c [26/38] sparc64: Implement the new page table range API
config: sparc64-randconfig-r021-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020629.Pvc7oTDy-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020629.Pvc7oTDy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020629.Pvc7oTDy-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/include/asm/tlbflush_64.h: Assembler messages:
>> arch/sparc/include/asm/tlbflush_64.h:11: Error: Unknown opcode: `struct'
>> arch/sparc/include/asm/tlbflush_64.h:12: Error: Unknown opcode: `unsigned'
   arch/sparc/include/asm/tlbflush_64.h:13: Error: Unknown opcode: `struct'
   arch/sparc/include/asm/tlbflush_64.h:14: Error: Unknown opcode: `unsigned'
   arch/sparc/include/asm/tlbflush_64.h:15: Error: Unknown opcode: `unsigned'
   arch/sparc/include/asm/tlbflush_64.h:16: Error: Unknown opcode: `unsigned'
>> arch/sparc/include/asm/tlbflush_64.h:17: Error: junk at end of line, first unrecognized character is `}'
>> arch/sparc/include/asm/tlbflush_64.h:19: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:20: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:21: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:22: Error: Unknown opcode: `unsigned'
>> arch/sparc/include/asm/tlbflush_64.h:26: Error: Unknown opcode: `static'
   arch/sparc/include/asm/tlbflush_64.h:27: Error: junk at end of line, first unrecognized character is `{'
   arch/sparc/include/asm/tlbflush_64.h:28: Error: junk at end of line, first unrecognized character is `}'
   arch/sparc/include/asm/tlbflush_64.h:30: Error: Unknown opcode: `static'
   arch/sparc/include/asm/tlbflush_64.h:31: Error: Unknown opcode: `unsigned'
   arch/sparc/include/asm/tlbflush_64.h:32: Error: junk at end of line, first unrecognized character is `{'
   arch/sparc/include/asm/tlbflush_64.h:33: Error: junk at end of line, first unrecognized character is `}'
   arch/sparc/include/asm/tlbflush_64.h:35: Error: Unknown opcode: `static'
   arch/sparc/include/asm/tlbflush_64.h:36: Error: Unknown opcode: `unsigned'
   arch/sparc/include/asm/tlbflush_64.h:37: Error: junk at end of line, first unrecognized character is `{'
   arch/sparc/include/asm/tlbflush_64.h:38: Error: junk at end of line, first unrecognized character is `}'
   arch/sparc/include/asm/tlbflush_64.h:40: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:44: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:45: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:46: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:50: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:51: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:52: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:63: Error: Unknown opcode: `void'
   arch/sparc/include/asm/tlbflush_64.h:64: Error: Unknown opcode: `void'


vim +11 arch/sparc/include/asm/tlbflush_64.h

90f08e399d054d arch/sparc/include/asm/tlbflush_64.h Peter Zijlstra  2011-05-24  10  
90f08e399d054d arch/sparc/include/asm/tlbflush_64.h Peter Zijlstra  2011-05-24 @11  struct tlb_batch {
c7d9f77d33a779 arch/sparc/include/asm/tlbflush_64.h Nitin Gupta     2017-02-01 @12  	unsigned int hugepage_shift;
90f08e399d054d arch/sparc/include/asm/tlbflush_64.h Peter Zijlstra  2011-05-24  13  	struct mm_struct *mm;
90f08e399d054d arch/sparc/include/asm/tlbflush_64.h Peter Zijlstra  2011-05-24  14  	unsigned long tlb_nr;
f36391d2790d04 arch/sparc/include/asm/tlbflush_64.h David S. Miller 2013-04-19  15  	unsigned long active;
90f08e399d054d arch/sparc/include/asm/tlbflush_64.h Peter Zijlstra  2011-05-24  16  	unsigned long vaddrs[TLB_BATCH_NR];
90f08e399d054d arch/sparc/include/asm/tlbflush_64.h Peter Zijlstra  2011-05-24 @17  };
90f08e399d054d arch/sparc/include/asm/tlbflush_64.h Peter Zijlstra  2011-05-24  18  
f05a68653e56ca arch/sparc/include/asm/tlbflush_64.h Sam Ravnborg    2014-05-16 @19  void flush_tsb_kernel_range(unsigned long start, unsigned long end);
f05a68653e56ca arch/sparc/include/asm/tlbflush_64.h Sam Ravnborg    2014-05-16  20  void flush_tsb_user(struct tlb_batch *tb);
c7d9f77d33a779 arch/sparc/include/asm/tlbflush_64.h Nitin Gupta     2017-02-01  21  void flush_tsb_user_page(struct mm_struct *mm, unsigned long vaddr,
c7d9f77d33a779 arch/sparc/include/asm/tlbflush_64.h Nitin Gupta     2017-02-01  22  			 unsigned int hugepage_shift);
f5e706ad886b6a include/asm-sparc/tlbflush_64.h      Sam Ravnborg    2008-07-17  23  
f5e706ad886b6a include/asm-sparc/tlbflush_64.h      Sam Ravnborg    2008-07-17  24  /* TLB flush operations. */
f5e706ad886b6a include/asm-sparc/tlbflush_64.h      Sam Ravnborg    2008-07-17  25  
f36391d2790d04 arch/sparc/include/asm/tlbflush_64.h David S. Miller 2013-04-19 @26  static inline void flush_tlb_mm(struct mm_struct *mm)
f36391d2790d04 arch/sparc/include/asm/tlbflush_64.h David S. Miller 2013-04-19  27  {
f36391d2790d04 arch/sparc/include/asm/tlbflush_64.h David S. Miller 2013-04-19  28  }
f36391d2790d04 arch/sparc/include/asm/tlbflush_64.h David S. Miller 2013-04-19  29  

:::::: The code at line 11 was first introduced by commit
:::::: 90f08e399d054d017c0e2c5089a0f44a76418271 sparc: mmu_gather rework

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
