Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1347E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 01:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683423628; x=1714959628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G/Y+t84SEhAGCjP48FvM2IybWm3n0sQqFWTnU44rhXI=;
  b=YHg+d26etpAInBHrs5nCGG1y0tKUSF9mKw9V2f4ahbooupOrfCrFvZn3
   BPJoWyJAl9CVowf11pJofb57pF9z+4n5Oo8V06I7ZGBM8O6Dzmq5H7b4/
   +fDYt2E0ePuVXIRfCnHEFdLF4+naZu4LgWE6yYoine6MoobnXZdDXv3cQ
   MhyJPPEF9Moh6sQotyoj4lVZuRfHVEMJj3hsYYVyOo3IbXaadYNb/3Yx8
   8lKA9mwBQhR9//96uxbr29jANGCWZ29ZZSR8HghbyTMNQVGTmkuanHmWD
   +gMCmCvNWoEZRmQLuyTeQN7dsbYNlsvd6tmRG2GOWSMctQ9Pzi0ox51Nc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="338653297"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="338653297"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 18:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="1027996377"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="1027996377"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 May 2023 18:40:25 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvTNx-0000YX-0Q;
	Sun, 07 May 2023 01:40:25 +0000
Date: Sun, 7 May 2023 09:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>
Subject: [akpm-mm:mm-unstable 14/80] mm/kfence/core.c:329:34: sparse: sparse:
 cast to restricted __le64
Message-ID: <202305070938.YhOGAf6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   988a57a6576e4e7f4ad22aa1486fcd807b83f38b
commit: b58bcd8602ac75d2c1e2757d4027ae039fed6f4c [14/80] mm: kfence: fix false positives on big endian
config: parisc-randconfig-s043-20230507 (https://download.01.org/0day-ci/archive/20230507/202305070938.YhOGAf6p-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=b58bcd8602ac75d2c1e2757d4027ae039fed6f4c
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout b58bcd8602ac75d2c1e2757d4027ae039fed6f4c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash mm/kfence/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305070938.YhOGAf6p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:372:21: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:1181:9: sparse: sparse: context imbalance in 'kfence_handle_page_fault' - different lock contexts for basic block

vim +329 mm/kfence/core.c

0ce20dd840897b Alexander Potapenko 2021-02-25  318  
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  319  static inline void set_canary(const struct kfence_metadata *meta)
0ce20dd840897b Alexander Potapenko 2021-02-25  320  {
0ce20dd840897b Alexander Potapenko 2021-02-25  321  	const unsigned long pageaddr = ALIGN_DOWN(meta->addr, PAGE_SIZE);
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  322  	unsigned long addr = pageaddr;
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  323  
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  324  	/*
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  325  	 * The canary may be written to part of the object memory, but it does
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  326  	 * not affect it. The user should initialize the object before using it.
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  327  	 */
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  328  	for (; addr < meta->addr; addr += sizeof(u64))
1ba3cbf3ec3b21 Peng Zhang          2023-04-03 @329  		*((u64 *)addr) = KFENCE_CANARY_PATTERN_U64;
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  330  
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  331  	addr = ALIGN_DOWN(meta->addr + meta->size, sizeof(u64));
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  332  	for (; addr - pageaddr < PAGE_SIZE; addr += sizeof(u64))
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  333  		*((u64 *)addr) = KFENCE_CANARY_PATTERN_U64;
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  334  }
1ba3cbf3ec3b21 Peng Zhang          2023-04-03  335  

:::::: The code at line 329 was first introduced by commit
:::::: 1ba3cbf3ec3b21d866436fb46b4bb7bdc38608f9 mm: kfence: improve the performance of __kfence_alloc() and __kfence_free()

:::::: TO: Peng Zhang <zhangpeng.00@bytedance.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
