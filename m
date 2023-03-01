Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCF82588
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Mar 2023 12:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677674839; x=1709210839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6qD355sk9Oju0ppGL+mkH3aVoztR5j8Lz5BWNpbycM=;
  b=JoO3613b+z5wPGnnfCC+XuqsKJCoZDGK6sxVjbmNEvdiPk5mPAeuxsYA
   g8GGbDZmRv0CtaoQ95wuTalFLtdBf0iNEmF6e7K8w0LgmdqTELObSYxZD
   TrEmh/cowqQlv6ohNpRxjbbZyx282T/OO+z+2OWWoDyMCD8gMIBkjefAE
   PdHzs7+71YnF/E7ipC7nk9hbTYkekz2/X5szI5xfTER7RU2s9HGx/YTGX
   CUnrEsShJcK86Ld6dwAkbb7TaVfzPcc9fQRvjn5W10zj+YFRORuBjKiwA
   2JRmM/i+5s7/yNfPiWdgyj6yJyPO5Vya2+V9XFcUVdfQquNooRVKkpOxG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="399180271"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="399180271"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 04:47:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="676746414"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; 
   d="scan'208";a="676746414"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Mar 2023 04:47:17 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXLrZ-00069N-0Y;
	Wed, 01 Mar 2023 12:47:17 +0000
Date: Wed, 1 Mar 2023 20:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 1/2] kernel/sched/core.c:5212: Error: unrecognized opcode `csrs sstatus,a5'
Message-ID: <202303012028.wti3UArY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   f47c1c07f90d2065c93bd942a2f3895cfd3ec0e5
commit: 22cfbf1a8e2848fde162c2b8ac9c4bb878e6be18 [1/2] BACKPORT: sched_setattr: switch to copy_struct_from_user()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230301/202303012028.wti3UArY-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/22cfbf1a8e2848fde162c2b8ac9c4bb878e6be18
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-stable
        git checkout 22cfbf1a8e2848fde162c2b8ac9c4bb878e6be18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303012028.wti3UArY-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:2283:20: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
    2283 |         struct rq *rq;
         |                    ^~
   kernel/sched/core.c: At top level:
   kernel/sched/core.c:4424:35: warning: no previous prototype for 'preempt_schedule_irq' [-Wmissing-prototypes]
    4424 | asmlinkage __visible void __sched preempt_schedule_irq(void)
         |                                   ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'sched_init':
   kernel/sched/core.c:6659:39: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    6659 |         unsigned long alloc_size = 0, ptr;
         |                                       ^~~
   kernel/sched/core.c: Assembler messages:
>> kernel/sched/core.c:5212: Error: unrecognized opcode `csrs sstatus,a5'
>> kernel/sched/core.c:5212: Error: unrecognized opcode `csrc sstatus,a5'
   kernel/sched/core.c:5242: Error: unrecognized opcode `csrs sstatus,a3'
   kernel/sched/core.c:5242: Error: unrecognized opcode `csrc sstatus,a3'
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr a5,sstatus'
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s8,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s8,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s8'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5'
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2'
   arch/riscv/include/asm/mmu_context.h:91: Error: unrecognized opcode `csrw sptbr,a5'
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2'
   kernel/sched/core.c:3471: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/sched/core.c:3471: Error: unrecognized opcode `csrc sstatus,a4'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5'
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr a5,sstatus'
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2'
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s3,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s3'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s3'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s3,sstatus,2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4'
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2'
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2'
   arch/riscv/include/asm/irqflags.h:36: Error: unrecognized opcode `csrc sstatus,2'
   arch/riscv/include/asm/irqflags.h:30: Error: unrecognized opcode `csrs sstatus,2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2'
   arch/riscv/include/asm/irqflags.h:24: Error: unrecognized opcode `csrr a4,sstatus'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s1'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s1,sstatus,2'
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc s2,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,s2'


vim +5212 kernel/sched/core.c

^1da177e4c3f41 kernel/sched.c      Linus Torvalds  2005-04-16  5200  
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5201  /*
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5202   * Mimics kernel/events/core.c perf_copy_attr().
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5203   */
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar     2017-02-01  5204  static int sched_copy_attr(struct sched_attr __user *uattr, struct sched_attr *attr)
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5205  {
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5206  	u32 size;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5207  	int ret;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5208  
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar     2017-02-01  5209  	/* Zero the full structure, so that a short copy will be nice: */
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5210  	memset(attr, 0, sizeof(*attr));
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5211  
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07 @5212  	ret = get_user(size, &uattr->size);
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5213  	if (ret)
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5214  		return ret;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5215  
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar     2017-02-01  5216  	/* ABI compatibility quirk: */
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar     2017-02-01  5217  	if (!size)
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5218  		size = SCHED_ATTR_SIZE_VER0;
22cfbf1a8e2848 kernel/sched/core.c Aleksa Sarai    2019-10-01  5219  	if (size < SCHED_ATTR_SIZE_VER0 || size > PAGE_SIZE)
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5220  		goto err_size;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5221  
22cfbf1a8e2848 kernel/sched/core.c Aleksa Sarai    2019-10-01  5222  	ret = copy_struct_from_user(attr, sizeof(*attr), uattr, size);
22cfbf1a8e2848 kernel/sched/core.c Aleksa Sarai    2019-10-01  5223  	if (ret) {
22cfbf1a8e2848 kernel/sched/core.c Aleksa Sarai    2019-10-01  5224  		if (ret == -E2BIG)
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5225  			goto err_size;
22cfbf1a8e2848 kernel/sched/core.c Aleksa Sarai    2019-10-01  5226  		return ret;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5227  	}
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5228  
e6056b2a5b47a7 kernel/sched/core.c Patrick Bellasi 2019-06-21  5229  	if ((attr->sched_flags & SCHED_FLAG_UTIL_CLAMP) &&
e6056b2a5b47a7 kernel/sched/core.c Patrick Bellasi 2019-06-21  5230  	    size < SCHED_ATTR_SIZE_VER1)
e6056b2a5b47a7 kernel/sched/core.c Patrick Bellasi 2019-06-21  5231  		return -EINVAL;
e6056b2a5b47a7 kernel/sched/core.c Patrick Bellasi 2019-06-21  5232  
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5233  	/*
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar     2017-02-01  5234  	 * XXX: Do we want to be lenient like existing syscalls; or do we want
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5235  	 * to be strict and return an error on out-of-bounds values?
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5236  	 */
75e45d512f257b kernel/sched/core.c Dongsheng Yang  2014-02-11  5237  	attr->sched_nice = clamp(attr->sched_nice, MIN_NICE, MAX_NICE);
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5238  
e78c7bca56dab5 kernel/sched/core.c Michael Kerrisk 2014-05-09  5239  	return 0;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5240  
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5241  err_size:
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5242  	put_user(sizeof(*attr), &uattr->size);
e78c7bca56dab5 kernel/sched/core.c Michael Kerrisk 2014-05-09  5243  	return -E2BIG;
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5244  }
d50dde5a10f305 kernel/sched/core.c Dario Faggioli  2013-11-07  5245  

:::::: The code at line 5212 was first introduced by commit
:::::: d50dde5a10f305253cbc3855307f608f8a3c5f73 sched: Add new scheduler syscalls to support an extended scheduling parameters ABI

:::::: TO: Dario Faggioli <raistlin@linux.it>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
