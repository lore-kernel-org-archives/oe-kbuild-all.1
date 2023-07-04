Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A6E620
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 01:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688434171; x=1719970171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4bncmtr0fYmT7FFhQWde9w7N9G+thHjl62QxmkYGYuA=;
  b=NMT0ocNPzZyEqYYkAAuMuBdBNJlXbLVQ/YSKty286c8ipTghfETiu63E
   sxy6HbUdrGO9IbfEqWrNjwiZ1bcN8jg1LrIhjSp95ndw9IYPIynOisbyW
   Z+BjrCyfoF/03tGamIn5uKWHPawQDHEgI6/TbgrWwkN8WlR8uVvRtFWtK
   n5RjGNqNYkFkh7627/J5KomyfHdIUM7hedQuVm27ddLZRrCOKNrv/9ypY
   /d3IMzBwJnbXwyBmrtqWvUp83EGu2kaINTAvBz9RQSS2BzaeJGU8u9Qjl
   +KJ6pr+taUAcr6DNbUrQ887rp5Krv7UDw+thNI1x17k0QX92xxUmtdlKT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="352830022"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="352830022"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 18:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="784050928"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="784050928"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Jul 2023 18:29:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGUrA-000HmB-15;
	Tue, 04 Jul 2023 01:29:28 +0000
Date: Tue, 4 Jul 2023 09:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 59/96] include/linux/kexec.h:41:2: error:
 #error KEXEC_SOURCE_MEMORY_LIMIT not defined
Message-ID: <202307040903.rVi8UJrJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   1e72a0774792199f0a39d6f2c1dc1cfa32fcffcd
commit: 62c177f4ed72c8c34d818f92f0d067a6c1b7cb80 [59/96] arm/kexec: refactor for kernel/Kconfig.kexec
config: arm-randconfig-r016-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040903.rVi8UJrJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040903.rVi8UJrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040903.rVi8UJrJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/crash_dump.h:5,
                    from block/blk-mq.c:28:
>> include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined
      41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:45:2: error: #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
      45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:49:2: error: #error KEXEC_CONTROL_MEMORY_LIMIT not defined
      49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:57:2: error: #error KEXEC_CONTROL_PAGE_SIZE not defined
      57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
         |  ^~~~~
>> include/linux/kexec.h:61:2: error: #error KEXEC_ARCH not defined
      61 | #error KEXEC_ARCH not defined
         |  ^~~~~
--
   In file included from arch/arm/kernel/setup.c:20:
>> include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined
      41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:45:2: error: #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
      45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:49:2: error: #error KEXEC_CONTROL_MEMORY_LIMIT not defined
      49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:57:2: error: #error KEXEC_CONTROL_PAGE_SIZE not defined
      57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
         |  ^~~~~
>> include/linux/kexec.h:61:2: error: #error KEXEC_ARCH not defined
      61 | #error KEXEC_ARCH not defined
         |  ^~~~~
   In file included from arch/arm/include/asm/efi.h:12,
                    from arch/arm/kernel/setup.c:37:
   arch/arm/include/asm/fixmap.h:39:35: warning: '__end_of_fixed_addresses' defined but not used [-Wunused-const-variable=]
      39 | static const enum fixed_addresses __end_of_fixed_addresses =
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from kernel/kexec_core.c:15:
>> include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined
      41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:45:2: error: #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
      45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:49:2: error: #error KEXEC_CONTROL_MEMORY_LIMIT not defined
      49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:57:2: error: #error KEXEC_CONTROL_PAGE_SIZE not defined
      57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
         |  ^~~~~
>> include/linux/kexec.h:61:2: error: #error KEXEC_ARCH not defined
      61 | #error KEXEC_ARCH not defined
         |  ^~~~~
   kernel/kexec_core.c: In function 'sanity_check_segment_list':
>> kernel/kexec_core.c:179:29: error: 'KEXEC_DESTINATION_MEMORY_LIMIT' undeclared (first use in this function); did you mean 'KEXEC_CRASH_CONTROL_MEMORY_LIMIT'?
     179 |                 if (mend >= KEXEC_DESTINATION_MEMORY_LIMIT)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             KEXEC_CRASH_CONTROL_MEMORY_LIMIT
   kernel/kexec_core.c:179:29: note: each undeclared identifier is reported only once for each function it appears in
   kernel/kexec_core.c: In function 'kimage_alloc_normal_control_pages':
>> kernel/kexec_core.c:388:31: error: 'KEXEC_CONTROL_MEMORY_LIMIT' undeclared (first use in this function); did you mean 'KEXEC_CONTROL_MEMORY_GFP'?
     388 |                 if ((epfn >= (KEXEC_CONTROL_MEMORY_LIMIT >> PAGE_SHIFT)) ||
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               KEXEC_CONTROL_MEMORY_GFP
   kernel/kexec_core.c: In function 'kimage_alloc_crash_control_pages':
>> include/linux/kexec.h:65:42: error: 'KEXEC_CONTROL_MEMORY_LIMIT' undeclared (first use in this function); did you mean 'KEXEC_CONTROL_MEMORY_GFP'?
      65 | #define KEXEC_CRASH_CONTROL_MEMORY_LIMIT KEXEC_CONTROL_MEMORY_LIMIT
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kexec_core.c:454:32: note: in expansion of macro 'KEXEC_CRASH_CONTROL_MEMORY_LIMIT'
     454 |                 if (hole_end > KEXEC_CRASH_CONTROL_MEMORY_LIMIT)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kexec_core.c: In function 'kimage_alloc_page':
>> kernel/kexec_core.c:721:34: error: 'KEXEC_SOURCE_MEMORY_LIMIT' undeclared (first use in this function); did you mean 'KEXEC_CRASH_CONTROL_MEMORY_LIMIT'?
     721 |                                 (KEXEC_SOURCE_MEMORY_LIMIT >> PAGE_SHIFT)) {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  KEXEC_CRASH_CONTROL_MEMORY_LIMIT
   kernel/kexec_core.c: In function '__crash_kexec':
   kernel/kexec_core.c:1061:25: error: implicit declaration of function 'crash_setup_regs' [-Werror=implicit-function-declaration]
    1061 |                         crash_setup_regs(&fixed_regs, regs);
         |                         ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from kernel/panic.c:25:
>> include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined
      41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:45:2: error: #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
      45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:49:2: error: #error KEXEC_CONTROL_MEMORY_LIMIT not defined
      49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
         |  ^~~~~
>> include/linux/kexec.h:57:2: error: #error KEXEC_CONTROL_PAGE_SIZE not defined
      57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
         |  ^~~~~
>> include/linux/kexec.h:61:2: error: #error KEXEC_ARCH not defined
      61 | #error KEXEC_ARCH not defined
         |  ^~~~~
   kernel/panic.c: In function '__warn':
   kernel/panic.c:666:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     666 |                 vprintk(args->fmt, args->args);
         |                 ^~~~~~~


vim +41 include/linux/kexec.h

dc009d92435f994 Eric W. Biederman  2005-06-25  39  
dc009d92435f994 Eric W. Biederman  2005-06-25  40  #ifndef KEXEC_SOURCE_MEMORY_LIMIT
dc009d92435f994 Eric W. Biederman  2005-06-25 @41  #error KEXEC_SOURCE_MEMORY_LIMIT not defined
dc009d92435f994 Eric W. Biederman  2005-06-25  42  #endif
dc009d92435f994 Eric W. Biederman  2005-06-25  43  
dc009d92435f994 Eric W. Biederman  2005-06-25  44  #ifndef KEXEC_DESTINATION_MEMORY_LIMIT
dc009d92435f994 Eric W. Biederman  2005-06-25 @45  #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
dc009d92435f994 Eric W. Biederman  2005-06-25  46  #endif
dc009d92435f994 Eric W. Biederman  2005-06-25  47  
dc009d92435f994 Eric W. Biederman  2005-06-25  48  #ifndef KEXEC_CONTROL_MEMORY_LIMIT
dc009d92435f994 Eric W. Biederman  2005-06-25 @49  #error KEXEC_CONTROL_MEMORY_LIMIT not defined
dc009d92435f994 Eric W. Biederman  2005-06-25  50  #endif
dc009d92435f994 Eric W. Biederman  2005-06-25  51  
7e01b5acd88b3f3 Martin Schwidefsky 2015-04-16  52  #ifndef KEXEC_CONTROL_MEMORY_GFP
dc5cccacf4272da Russell King       2016-08-02  53  #define KEXEC_CONTROL_MEMORY_GFP (GFP_KERNEL | __GFP_NORETRY)
7e01b5acd88b3f3 Martin Schwidefsky 2015-04-16  54  #endif
7e01b5acd88b3f3 Martin Schwidefsky 2015-04-16  55  
163f6876f5c3ff8 Huang Ying         2008-08-15  56  #ifndef KEXEC_CONTROL_PAGE_SIZE
163f6876f5c3ff8 Huang Ying         2008-08-15 @57  #error KEXEC_CONTROL_PAGE_SIZE not defined
dc009d92435f994 Eric W. Biederman  2005-06-25  58  #endif
dc009d92435f994 Eric W. Biederman  2005-06-25  59  
dc009d92435f994 Eric W. Biederman  2005-06-25  60  #ifndef KEXEC_ARCH
dc009d92435f994 Eric W. Biederman  2005-06-25 @61  #error KEXEC_ARCH not defined
dc009d92435f994 Eric W. Biederman  2005-06-25  62  #endif
dc009d92435f994 Eric W. Biederman  2005-06-25  63  
3d214faea6e4f9b Michael Holzheu    2011-10-30  64  #ifndef KEXEC_CRASH_CONTROL_MEMORY_LIMIT
3d214faea6e4f9b Michael Holzheu    2011-10-30 @65  #define KEXEC_CRASH_CONTROL_MEMORY_LIMIT KEXEC_CONTROL_MEMORY_LIMIT
3d214faea6e4f9b Michael Holzheu    2011-10-30  66  #endif
3d214faea6e4f9b Michael Holzheu    2011-10-30  67  

:::::: The code at line 41 was first introduced by commit
:::::: dc009d92435f99498cbc579ce76bf28e837e2c14 [PATCH] kexec: add kexec syscalls

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
