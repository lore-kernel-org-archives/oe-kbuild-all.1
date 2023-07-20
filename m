Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F210C14011
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 23:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689894986; x=1721430986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UgW9AbmUOWC95zHhFGBgdLTMd1mExDCwRIJiVDbKvKc=;
  b=AlivK1ZKq+rArQt51U81hbc1IVr83QZZ/gyZTRDQM+ccFRTMq8ruJzal
   ZY6Y7gEIZWMoRG32uYM7B6jm9PBBIh1pHgjv2pLb12dDNYzR6OIrg3cfN
   71/oscTFbxKvWUZF24uzLvlbB5oStCo0nhMfStNBucdhGSz18qzqWa3HS
   bdXc9xkja6m5rJ5VHJHTFx/NnLwj9/57GSEd+fD2q3SQZE4gBPEyhv3Nq
   xmlRiiBvaSd4phsMQzibdwWU3Df4gY473xYVHo8TL/GifcWlMloSnp6xW
   HHe/tq3qJhuP52dgv06PIvxojC/5hQJeeTKjbl6ez6NTpPxzXbChmawQv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="370486811"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; 
   d="scan'208";a="370486811"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 16:16:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="868017641"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2023 16:16:25 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMcsi-0006cb-1D;
	Thu, 20 Jul 2023 23:16:24 +0000
Date: Fri, 21 Jul 2023 07:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 16/19]
 include/linux/page-flags.h:715:9: error: call to undeclared function
 'change_and_unlock_is_negative_byte'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202307210706.h7ReNXGr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   98061915c6df5892ff3efa2f04a27857ea36ca51
commit: 93cbe503f078744fb5bfa0a119bb25a58efdf4f9 [16/19] mm: Add folio_mark_uptodate_unlock()
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210706.h7ReNXGr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210706.h7ReNXGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210706.h7ReNXGr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:23:
>> include/linux/page-flags.h:715:9: error: call to undeclared function 'change_and_unlock_is_negative_byte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     715 |         return change_and_unlock_is_negative_byte(flag, PG_locked,
         |                ^
   include/linux/page-flags.h:715:9: note: did you mean 'clear_bit_unlock_is_negative_byte'?
   arch/riscv/include/asm/bitops.h:194:20: note: 'clear_bit_unlock_is_negative_byte' declared here
     194 | static inline bool clear_bit_unlock_is_negative_byte(unsigned long nr,
         |                    ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:100:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     100 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/riscv/kernel/asm-offsets.c:10:
   In file included from include/linux/mm.h:990:
   In file included from include/linux/huge_mm.h:8:


vim +/change_and_unlock_is_negative_byte +715 include/linux/page-flags.h

   704	
   705	/**
   706	 * folio_set_unlock - Set a flag and unlock a folio
   707	 * @folio: The folio.
   708	 * @flag: The flag to clear
   709	 *
   710	 * Return: Whether there are tasks waiting on the folio.
   711	 */
   712	static inline
   713	bool folio_set_unlock(struct folio *folio, unsigned int flag)
   714	{
 > 715		return change_and_unlock_is_negative_byte(flag, PG_locked,
   716				folio_flags(folio, 0));
   717	}
   718	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
