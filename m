Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900FD2260E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 14:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683989294; x=1715525294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fWbL8rf38wRMPzqtKLnME6IzgrKkVMH8/+sKLw5DU7s=;
  b=dEfWYhs2rdnwck7yIXFcgGoIfz8zahfjFSzsdkoLrzzl5zSG6bcl3j5q
   g2Q3FekXn6sxxCIdwBLam+XvS/p5agwj3cWuva/mWlOzaWRsXfs0l/ofs
   t9smrAciN1zoFOs5NtMAvCw0qCovxCovrbMtjnhSWlkBmgvEHMtacg89z
   tYRqLRwRs9kcZvOOk5b21BVCCecDzzled1dcl79TtE42pnfpdhsucbePq
   T/g7q4IuKHlUyjDNpZUV9xi4jF848ux4hmgNy0JhaiU+VqlIbk4+icIv+
   Y5oS22x6as6Tahwy9itCRrpPoWaX6U7/XJgnyVH3eU7JMZO5FojiiAlIm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="350989309"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="350989309"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 07:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="703470213"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="703470213"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 May 2023 07:48:12 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxqXb-0005Xg-1a;
	Sat, 13 May 2023 14:48:11 +0000
Date: Sat, 13 May 2023 22:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>
Subject: [linux-next:master 946/2056] mm/kfence/core.c:329:34: sparse:
 sparse: cast to restricted __le64
Message-ID: <202305132244.DwzBUcUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e922ba281a8d84f640d8c8e18a385d032c19e185
commit: 7106f5ae4745c65b29d34ec825f9a83e85dd8f8a [946/2056] mm: kfence: fix false positives on big endian
config: riscv-randconfig-s053-20230510 (https://download.01.org/0day-ci/archive/20230513/202305132244.DwzBUcUd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7106f5ae4745c65b29d34ec825f9a83e85dd8f8a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7106f5ae4745c65b29d34ec825f9a83e85dd8f8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash mm/kfence/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305132244.DwzBUcUd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> mm/kfence/core.c:329:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:333:34: sparse: sparse: cast to restricted __le64
   mm/kfence/core.c:352:21: sparse: sparse: cast to restricted __le64
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
