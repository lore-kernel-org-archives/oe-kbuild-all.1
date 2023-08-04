Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F42279D0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 07:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691133553; x=1722669553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/vxscF9XbaGrfJAFr8idYQDN8jl+VU2PN3cSW4wuSc=;
  b=aRtcVK6m/9QjrU7BHGzDI6NxDvdfIANpHF2CBHeTBDPpAidUyXgdnytl
   +VyHWa3uCQpFMB6+WAXhZnrNq43ZqZ8VYpTER0P7Hg+Szu4vDr0OFWBR6
   mOfaAnjj5p0zp+ko7ivu0VUUXDlyWid+0hrgOmHJEW8fc/ApUm+YGKaOM
   shyCHtL2cDyRjb3W8g18dK4p3p99O4yMERwC4EotBzuVMwzmrFsVzwtaX
   MZJ6hB7Sj0EuezC7UxL97vSytfQQO/j4yxIa0mlJSnBBpsUF2OF2nPQ8e
   KmxPLYBQor7byKlxBYg+t5bLJhmUdsLhV5gQYM+iPLAPN1sIMuhkeYQyT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373737456"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="373737456"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 00:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="759451249"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="759451249"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2023 00:19:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRp5X-0002id-2S;
	Fri, 04 Aug 2023 07:19:07 +0000
Date: Fri, 4 Aug 2023 15:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Li Zetao <lizetao1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [axboe-block:for-6.6/block 30/30] arch/x86/include/asm/atomic.h:23:
 undefined reference to `__tracepoint_block_touch_buffer'
Message-ID: <202308041420.2nsxiGV4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.6/block
head:   0f842210d97a7a02d14ee44c3766bcc1ceabf99c
commit: 0f842210d97a7a02d14ee44c3766bcc1ceabf99c [30/30] fs/Kconfig: Fix compile error for romfs
config: i386-randconfig-r004-20230801 (https://download.01.org/0day-ci/archive/20230804/202308041420.2nsxiGV4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041420.2nsxiGV4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041420.2nsxiGV4-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/buffer.o: in function `arch_atomic_read':
>> arch/x86/include/asm/atomic.h:23: undefined reference to `__tracepoint_block_touch_buffer'
   ld: fs/buffer.o: in function `trace_block_touch_buffer':
>> include/trace/events/block.h:46: undefined reference to `__tracepoint_block_touch_buffer'
>> ld: include/trace/events/block.h:46: undefined reference to `__SCT__tp_func_block_touch_buffer'
   ld: fs/buffer.o: in function `arch_atomic_read':
>> arch/x86/include/asm/atomic.h:23: undefined reference to `__tracepoint_block_dirty_buffer'
>> ld: arch/x86/include/asm/atomic.h:23: undefined reference to `__tracepoint_block_dirty_buffer'
   ld: fs/buffer.o: in function `trace_block_dirty_buffer':
>> include/trace/events/block.h:59: undefined reference to `__tracepoint_block_dirty_buffer'
>> ld: include/trace/events/block.h:59: undefined reference to `__SCT__tp_func_block_dirty_buffer'
   ld: fs/buffer.o: in function `end_bio_bh_io_sync':
   fs/buffer.c:2789: undefined reference to `bio_put'
   ld: fs/buffer.o: in function `bio_alloc':
   include/linux/bio.h:427: undefined reference to `fs_bio_set'
   ld: include/linux/bio.h:427: undefined reference to `bio_alloc_bioset'
   ld: fs/buffer.o: in function `submit_bh_wbc':
   fs/buffer.c:2821: undefined reference to `__bio_add_page'
   ld: fs/buffer.c:2827: undefined reference to `guard_bio_eod'
   ld: fs/buffer.c:2834: undefined reference to `submit_bio'
   ld: fs/buffer.o: in function `arch_atomic_read':
>> arch/x86/include/asm/atomic.h:23: undefined reference to `__tracepoint_block_touch_buffer'
   ld: fs/buffer.o: in function `trace_block_touch_buffer':
>> include/trace/events/block.h:46: undefined reference to `__tracepoint_block_touch_buffer'
>> ld: include/trace/events/block.h:46: undefined reference to `__SCT__tp_func_block_touch_buffer'
   ld: fs/mpage.o: in function `mpage_bio_submit_read':
   fs/mpage.c:81: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:82: undefined reference to `submit_bio'
>> ld: fs/mpage.c:81: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:82: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `bio_alloc':
   include/linux/bio.h:427: undefined reference to `fs_bio_set'
   ld: include/linux/bio.h:427: undefined reference to `bio_alloc_bioset'
   ld: fs/mpage.o: in function `do_mpage_readpage':
   fs/mpage.c:306: undefined reference to `bio_add_folio'
   ld: fs/mpage.o: in function `mpage_bio_submit_read':
   fs/mpage.c:81: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:82: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `mpage_bio_submit_write':
   fs/mpage.c:89: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:90: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `mpage_bio_submit_read':
   fs/mpage.c:81: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:82: undefined reference to `submit_bio'
>> ld: fs/mpage.c:81: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:82: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `mpage_write_end_io':
   fs/mpage.c:65: undefined reference to `blk_status_to_errno'
   ld: fs/mpage.c:75: undefined reference to `bio_put'
   ld: fs/mpage.o: in function `mpage_read_end_io':
   fs/mpage.c:49: undefined reference to `blk_status_to_errno'
   ld: fs/mpage.c:59: undefined reference to `bio_put'
   ld: fs/mpage.c:59: undefined reference to `bio_put'
   ld: fs/mpage.o: in function `mpage_bio_submit_write':
   fs/mpage.c:89: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:90: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `__mpage_writepage':
   fs/mpage.c:624: undefined reference to `bio_add_folio'
   ld: fs/mpage.o: in function `mpage_bio_submit_write':
   fs/mpage.c:89: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:90: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `bio_alloc':
   include/linux/bio.h:427: undefined reference to `fs_bio_set'
   ld: include/linux/bio.h:427: undefined reference to `bio_alloc_bioset'
   ld: fs/mpage.o: in function `mpage_bio_submit_write':
   fs/mpage.c:89: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:90: undefined reference to `submit_bio'
   ld: fs/mpage.c:89: undefined reference to `guard_bio_eod'
   ld: fs/mpage.c:90: undefined reference to `submit_bio'
   ld: fs/mpage.o: in function `do_mpage_readpage':
   fs/mpage.c:306: undefined reference to `bio_add_folio'


vim +23 arch/x86/include/asm/atomic.h

5abbbbf0b0cd4a Brian Gerst    2010-01-07  11  
5abbbbf0b0cd4a Brian Gerst    2010-01-07  12  /*
5abbbbf0b0cd4a Brian Gerst    2010-01-07  13   * Atomic operations that C can't guarantee us.  Useful for
5abbbbf0b0cd4a Brian Gerst    2010-01-07  14   * resource counting etc..
5abbbbf0b0cd4a Brian Gerst    2010-01-07  15   */
5abbbbf0b0cd4a Brian Gerst    2010-01-07  16  
8bf705d130396e Dmitry Vyukov  2018-01-29  17  static __always_inline int arch_atomic_read(const atomic_t *v)
5abbbbf0b0cd4a Brian Gerst    2010-01-07  18  {
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  19  	/*
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  20  	 * Note for KASAN: we deliberately don't use READ_ONCE_NOCHECK() here,
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  21  	 * it's non-inlined function that increases binary size and stack usage.
ac605bee0bfab4 Dmitry Vyukov  2018-01-29  22  	 */
37f8173dd84936 Peter Zijlstra 2020-01-24 @23  	return __READ_ONCE((v)->counter);
5abbbbf0b0cd4a Brian Gerst    2010-01-07  24  }
5abbbbf0b0cd4a Brian Gerst    2010-01-07  25  

:::::: The code at line 23 was first introduced by commit
:::::: 37f8173dd84936ea78000ed1cad24f8b18d48ebb locking/atomics: Flip fallbacks and instrumentation

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
