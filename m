Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D231D1F199
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jul 2023 17:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689962219; x=1721498219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WdcaXiwT8cyjUJyc9Mz8k5tgbDvi106D4BbqF1D157s=;
  b=EKqgW1vwMfYu/bZwNbtmKe1M8uHN77B/k0uAZxqRz/mgQJqee5GbshnC
   9D19lQbSm4jmZqPDyJXTrlhdqczbfwnhfmZcko4xt0NggzsG/7GwNwJuD
   gpwiUAbAHI7FVThHhKzbpV4aH40Ljo6dnmRkwVwnzzDh4jONgtMOAZSuF
   M7ZCgKdqndGqGp7j5dG7blDPZLHkIfKfh/Q0h2KE6SsmufCbjVLnV0G0Z
   S/GsobJ7pmj/uG9P8Y2e9DkW43/AnzXT7clE3uSeKvbfJcmr0Qmub5cd1
   CdaO9H6wJFCxWAKj3+dNc7iw+ylotBoNDHHFTRunJDkkJZf2yGIhBMVvV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346685711"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="346685711"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 10:56:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="790273373"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="790273373"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2023 10:56:57 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMuN4-0007VZ-20;
	Fri, 21 Jul 2023 17:56:55 +0000
Date: Sat, 22 Jul 2023 01:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:folio-flags 8/19] include/linux/page-flags.h:702:9:
 error: call to undeclared function 'clear_bit_unlock_is_negative_byte'; ISO
 C99 and later do not support implicit function declarations
Message-ID: <202307220119.Ua1v1YuV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache folio-flags
head:   9ad8623abd535600efa80248e7f89f7627e4ce29
commit: e7505fb32cfea001bace22f189b6a4c391383cc2 [8/19] mm: Add folio_clear_has_waiters()
config: mips-cavium_octeon_defconfig (https://download.01.org/0day-ci/archive/20230722/202307220119.Ua1v1YuV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220119.Ua1v1YuV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220119.Ua1v1YuV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:13:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:15:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:23:
>> include/linux/page-flags.h:702:9: error: call to undeclared function 'clear_bit_unlock_is_negative_byte'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     702 |         return clear_bit_unlock_is_negative_byte(flag, folio_flags(folio, 0));
         |                ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      97 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     113 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/mips/include/uapi/asm/signal.h:20:2: note: array 'sig' declared here
      20 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/mips/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     156 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:24: note: expanded from macro '_SIG_SET_BINOP'
     137 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \


vim +/clear_bit_unlock_is_negative_byte +702 include/linux/page-flags.h

   692	
   693	/**
   694	 * folio_clear_has_waiters - Clear a flag that can be waited upon
   695	 * @folio: The folio.
   696	 * @flag: The flag to clear
   697	 *
   698	 */
   699	static inline
   700	bool folio_clear_has_waiters(struct folio *folio, unsigned int flag)
   701	{
 > 702		return clear_bit_unlock_is_negative_byte(flag, folio_flags(folio, 0));
   703	}
   704	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
