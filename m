Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC516AD5A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 19:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675453695; x=1706989695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KgF+C3tHg7eczQffHz5j0ddquop/SdrQUGY5WuI2jBM=;
  b=ZTNJBwtpNyNJmZpPUkEau9PDr+OeE1ItXcyTfTdieUBDL+aMdIlkKmaW
   xeuZpuDVYxE0Gl4oGXN+upqnFmR/QZ9sFFkWVZuJjj4KtTtYUJ+0eQDF4
   PB/V4FSXfLFjfY55EFeItsd3LapFPbTb/vkvDRy4BMqzMhPuFy20IMGwc
   wzKCLFuu5Gjz46ZYEMbPCmc9QPcwqrcPxiKFhq1VeL9KqbxEF3hsh8pQI
   SNV1WumUofTh1gxU5mXJPriBoLbvotLvMUkqfI+bHYk3C8L1QNXrl6q1d
   WpkBMQfbQ3c3o0/YddRbAhbkKPTIPoV/6SiWbBCS6EZGLTIxYWAui5a5A
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309173846"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="309173846"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 11:48:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="667742972"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="667742972"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Feb 2023 11:48:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO22f-0000jB-0t;
	Fri, 03 Feb 2023 19:48:13 +0000
Date: Sat, 4 Feb 2023 03:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Garnier <thgarnie@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>
Subject: [jsarha:topic/chromeos-4.19-s0ix 7414/9999]
 security/container/process.c:44:31: error: 'struct linux_binprm' has no
 member named 'vma'
Message-ID: <202302040351.AJ961qpR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: 92dff21f44ad18e109b6e086a29141fe474b3782 [7414/9999] CHROMIUM: security: Container Monitoring LSM
config: m68k-randconfig-c042-20230204 (https://download.01.org/0day-ci/archive/20230204/202302040351.AJ961qpR-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jsarha/linux/commit/92dff21f44ad18e109b6e086a29141fe474b3782
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout 92dff21f44ad18e109b6e086a29141fe474b3782
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash arch/m68k/68000/ security/container/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/m68k/68000/ints.c:77:6: warning: no previous prototype for 'process_int' [-Wmissing-prototypes]
      77 | void process_int(int vec, struct pt_regs *fp)
         |      ^~~~~~~~~~~
   arch/m68k/68000/ints.c: In function 'process_int':
>> arch/m68k/68000/ints.c:82:30: error: 'ISR' undeclared (first use in this function)
      82 |         unsigned long pend = ISR;
         |                              ^~~
   arch/m68k/68000/ints.c:82:30: note: each undeclared identifier is reported only once for each function it appears in
   arch/m68k/68000/ints.c: In function 'intc_irq_unmask':
>> arch/m68k/68000/ints.c:135:9: error: 'IMR' undeclared (first use in this function)
     135 |         IMR &= ~(1 << d->irq);
         |         ^~~
   arch/m68k/68000/ints.c: In function 'intc_irq_mask':
   arch/m68k/68000/ints.c:140:9: error: 'IMR' undeclared (first use in this function)
     140 |         IMR |= (1 << d->irq);
         |         ^~~
   arch/m68k/68000/ints.c: At top level:
   arch/m68k/68000/ints.c:153:13: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]
     153 | void __init trap_init(void)
         |             ^~~~~~~~~
   arch/m68k/68000/ints.c:172:13: warning: no previous prototype for 'init_IRQ' [-Wmissing-prototypes]
     172 | void __init init_IRQ(void)
         |             ^~~~~~~~
   arch/m68k/68000/ints.c: In function 'init_IRQ':
>> arch/m68k/68000/ints.c:176:9: error: 'IVR' undeclared (first use in this function)
     176 |         IVR = 0x40; /* Set DragonBall IVR (interrupt base) to 64 */
         |         ^~~
   arch/m68k/68000/ints.c:179:9: error: 'IMR' undeclared (first use in this function)
     179 |         IMR = ~0;
         |         ^~~
--
   security/container/process.c: In function 'kmap_argument_stack':
>> security/container/process.c:44:31: error: 'struct linux_binprm' has no member named 'vma'
      44 |         count = vma_pages(bprm->vma);
         |                               ^~
   In file included from include/linux/kernel.h:10,
                    from security/container/monitor.h:10,
                    from security/container/process.c:8:
   security/container/process.c: In function 'kunmap_argument_stack':
   security/container/process.c:93:34: error: 'struct linux_binprm' has no member named 'vma'
      93 |         if (likely(vma_pages(bprm->vma) == 1)) {
         |                                  ^~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   security/container/process.c: In function 'encode_current_argv':
   security/container/process.c:150:43: error: 'struct linux_binprm' has no member named 'vma'
     150 |         unsigned long end = vma_pages(bprm->vma) * PAGE_SIZE;
         |                                           ^~
   security/container/process.c: In function 'encode_current_envp':
   security/container/process.c:234:43: error: 'struct linux_binprm' has no member named 'vma'
     234 |         unsigned long end = vma_pages(bprm->vma) * PAGE_SIZE;
         |                                           ^~
   security/container/process.c: At top level:
   security/container/process.c:367:5: warning: no previous prototype for 'csm_set_contid' [-Wmissing-prototypes]
     367 | u64 csm_set_contid(struct task_struct *task)
         |     ^~~~~~~~~~~~~~


vim +44 security/container/process.c

    34	
    35	static void *kmap_argument_stack(struct linux_binprm *bprm, void **ctx)
    36	{
    37		char *argv;
    38		int err;
    39		unsigned long i, pos, count;
    40		void *map;
    41		struct page *page;
    42	
    43		/* vma_pages() returns the number of pages reserved for the stack */
  > 44		count = vma_pages(bprm->vma);
    45	
    46		if (likely(count == 1)) {
    47			err = get_user_pages_remote(current, bprm->mm, bprm->p, 1,
    48						    FOLL_FORCE, &page, NULL, NULL);
    49			if (err != 1)
    50				return NULL;
    51	
    52			argv = kmap(page);
    53			*ctx = page;
    54		} else {
    55			/*
    56			 * If more than one pages is needed, copy all of them to a set
    57			 * of pages. Parsing the argument across kmap pages in different
    58			 * addresses would make it impractical.
    59			 */
    60			argv = vmalloc(count * PAGE_SIZE);
    61			if (!argv)
    62				return NULL;
    63	
    64			for (i = 0; i < count; i++) {
    65				pos = ALIGN_DOWN(bprm->p, PAGE_SIZE) + i * PAGE_SIZE;
    66				err = get_user_pages_remote(current, bprm->mm, pos, 1,
    67							    FOLL_FORCE, &page, NULL,
    68							    NULL);
    69				if (err <= 0) {
    70					vfree(argv);
    71					return NULL;
    72				}
    73	
    74				map = kmap(page);
    75				memcpy(argv + i * PAGE_SIZE, map, PAGE_SIZE);
    76				kunmap(page);
    77				put_page(page);
    78			}
    79			*ctx = bprm;
    80		}
    81	
    82		return argv;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
