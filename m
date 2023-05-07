Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064DE17D5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 04:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683434912; x=1714970912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/gyKuIkgSH5DC96PwbqyDGjIuKG92Fl7hHL6Ys/Ab4Y=;
  b=YKpfknH6RUVqL2Z8SuUQPCdSZXSGrOaQCw79BF+6iGAxq7Iohmk8d5aq
   9JS5Zsv+YbJsprx3PB/JQfPlDfXW4p/P4TWQR9XzpNe5Gp3xV0Q4GWlhm
   GxtGfMioMPGsrW1o9vY3IqdWveovX2TOwESGz7eTdNSq1DsKtmNv1HFdh
   oh5CG4pOKDnWI69fVZeS9IIJQsoyMfwC0Hr2fKYq/LFb3AY9b3mujJRJj
   bYqkgWdgAwy70m8YjnjUyWyKgcpw5pcnKd1/G32bi4SjBlDdS3bggpYXE
   4j0A0yw6ETsWwMGKGcXaEaHeL0KtI5NuRyHsuE0CtgkJe0kdwPb0mykmY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="435767177"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="435767177"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 21:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="692204455"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="692204455"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 May 2023 21:48:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvWJv-0000cD-1K;
	Sun, 07 May 2023 04:48:27 +0000
Date: Sun, 7 May 2023 12:47:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs
 inode iterator
Message-ID: <202305071207.mrlTxnpr-lkp@intel.com>
References: <20230507040107.3755166-3-houtao@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230507040107.3755166-3-houtao@huaweicloud.com>

Hi Hou,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf/master]
[also build test WARNING on linus/master]
[cannot apply to bpf-next/master akpm-mm/mm-everything v6.3 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230507040107.3755166-3-houtao%40huaweicloud.com
patch subject: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs inode iterator
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230507/202305071207.mrlTxnpr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/93ea1c2e394182d3547673f69a808b8c1fa994e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
        git checkout 93ea1c2e394182d3547673f69a808b8c1fa994e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash mm/damon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071207.mrlTxnpr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/mman.h:5,
                    from include/linux/fs.h:49,
                    from include/linux/highmem.h:5,
                    from mm/damon/vaddr.c:11:
>> arch/alpha/include/uapi/asm/mman.h:15: warning: "MAP_FIXED" redefined
      15 | #define MAP_FIXED       0x100           /* Interpret addr exactly */
         | 
   In file included from mm/damon/vaddr.c:10:
   include/uapi/asm-generic/mman-common.h:22: note: this is the location of the previous definition
      22 | #define MAP_FIXED       0x10            /* Interpret addr exactly */
         | 
>> arch/alpha/include/uapi/asm/mman.h:16: warning: "MAP_ANONYMOUS" redefined
      16 | #define MAP_ANONYMOUS   0x10            /* don't use a file */
         | 
   include/uapi/asm-generic/mman-common.h:23: note: this is the location of the previous definition
      23 | #define MAP_ANONYMOUS   0x20            /* don't use a file */
         | 
>> arch/alpha/include/uapi/asm/mman.h:29: warning: "MAP_POPULATE" redefined
      29 | #define MAP_POPULATE    0x20000         /* populate (prefault) pagetables */
         | 
   include/uapi/asm-generic/mman-common.h:26: note: this is the location of the previous definition
      26 | #define MAP_POPULATE            0x008000        /* populate (prefault) pagetables */
         | 
>> arch/alpha/include/uapi/asm/mman.h:30: warning: "MAP_NONBLOCK" redefined
      30 | #define MAP_NONBLOCK    0x40000         /* do not block on IO */
         | 
   include/uapi/asm-generic/mman-common.h:27: note: this is the location of the previous definition
      27 | #define MAP_NONBLOCK            0x010000        /* do not block on IO */
         | 
>> arch/alpha/include/uapi/asm/mman.h:31: warning: "MAP_STACK" redefined
      31 | #define MAP_STACK       0x80000         /* give out an address that is best suited for process/thread stacks */
         | 
   include/uapi/asm-generic/mman-common.h:28: note: this is the location of the previous definition
      28 | #define MAP_STACK               0x020000        /* give out an address that is best suited for process/thread stacks */
         | 
>> arch/alpha/include/uapi/asm/mman.h:32: warning: "MAP_HUGETLB" redefined
      32 | #define MAP_HUGETLB     0x100000        /* create a huge page mapping */
         | 
   include/uapi/asm-generic/mman-common.h:29: note: this is the location of the previous definition
      29 | #define MAP_HUGETLB             0x040000        /* create a huge page mapping */
         | 
>> arch/alpha/include/uapi/asm/mman.h:33: warning: "MAP_FIXED_NOREPLACE" redefined
      33 | #define MAP_FIXED_NOREPLACE     0x200000/* MAP_FIXED which doesn't unmap underlying mapping */
         | 
   include/uapi/asm-generic/mman-common.h:31: note: this is the location of the previous definition
      31 | #define MAP_FIXED_NOREPLACE     0x100000        /* MAP_FIXED which doesn't unmap underlying mapping */
         | 
>> arch/alpha/include/uapi/asm/mman.h:36: warning: "MS_SYNC" redefined
      36 | #define MS_SYNC         2               /* synchronous memory sync */
         | 
   include/uapi/asm-generic/mman-common.h:43: note: this is the location of the previous definition
      43 | #define MS_SYNC         4               /* synchronous memory sync */
         | 
>> arch/alpha/include/uapi/asm/mman.h:37: warning: "MS_INVALIDATE" redefined
      37 | #define MS_INVALIDATE   4               /* invalidate the caches */
         | 
   include/uapi/asm-generic/mman-common.h:42: note: this is the location of the previous definition
      42 | #define MS_INVALIDATE   2               /* invalidate the caches */
         | 
>> arch/alpha/include/uapi/asm/mman.h:50: warning: "MADV_DONTNEED" redefined
      50 | #define MADV_DONTNEED   6               /* don't need these pages */
         | 
   include/uapi/asm-generic/mman-common.h:49: note: this is the location of the previous definition
      49 | #define MADV_DONTNEED   4               /* don't need these pages */
         | 


vim +/MAP_FIXED +15 arch/alpha/include/uapi/asm/mman.h

^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  12  
746c9398f5ac2b arch/alpha/include/uapi/asm/mman.h Michael S. Tsirkin 2019-02-08  13  /* 0x01 - 0x03 are defined in linux/mman.h */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  14  #define MAP_TYPE	0x0f		/* Mask for type of mapping (OSF/1 is _wrong_) */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16 @15  #define MAP_FIXED	0x100		/* Interpret addr exactly */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16 @16  #define MAP_ANONYMOUS	0x10		/* don't use a file */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  17  
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  18  /* not used by linux, but here to make sure we don't clash with OSF/1 defines */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  19  #define _MAP_HASSEMAPHORE 0x0200
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  20  #define _MAP_INHERIT	0x0400
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  21  #define _MAP_UNALIGNED	0x0800
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  22  
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  23  /* These are linux-specific */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  24  #define MAP_GROWSDOWN	0x01000		/* stack-like segment */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  25  #define MAP_DENYWRITE	0x02000		/* ETXTBSY */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  26  #define MAP_EXECUTABLE	0x04000		/* mark it as an executable */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  27  #define MAP_LOCKED	0x08000		/* lock the mapping */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  28  #define MAP_NORESERVE	0x10000		/* don't check for reservations */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16 @29  #define MAP_POPULATE	0x20000		/* populate (prefault) pagetables */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16 @30  #define MAP_NONBLOCK	0x40000		/* do not block on IO */
90f72aa58bbf07 arch/alpha/include/asm/mman.h      Arnd Bergmann      2009-09-21 @31  #define MAP_STACK	0x80000		/* give out an address that is best suited for process/thread stacks */
90f72aa58bbf07 arch/alpha/include/asm/mman.h      Arnd Bergmann      2009-09-21 @32  #define MAP_HUGETLB	0x100000	/* create a huge page mapping */
a4ff8e8620d3f4 arch/alpha/include/uapi/asm/mman.h Michal Hocko       2018-04-10 @33  #define MAP_FIXED_NOREPLACE	0x200000/* MAP_FIXED which doesn't unmap underlying mapping */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  34  
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  35  #define MS_ASYNC	1		/* sync memory asynchronously */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16 @36  #define MS_SYNC		2		/* synchronous memory sync */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16 @37  #define MS_INVALIDATE	4		/* invalidate the caches */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  38  
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  39  #define MCL_CURRENT	 8192		/* lock all currently mapped pages */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  40  #define MCL_FUTURE	16384		/* lock all additions to address space */
b0f205c2a3082d arch/alpha/include/uapi/asm/mman.h Eric B Munson      2015-11-05  41  #define MCL_ONFAULT	32768		/* lock all pages that are faulted in */
b0f205c2a3082d arch/alpha/include/uapi/asm/mman.h Eric B Munson      2015-11-05  42  
b0f205c2a3082d arch/alpha/include/uapi/asm/mman.h Eric B Munson      2015-11-05  43  #define MLOCK_ONFAULT	0x01		/* Lock pages in range after they are faulted in, do not prefault */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  44  
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  45  #define MADV_NORMAL	0		/* no further special treatment */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  46  #define MADV_RANDOM	1		/* expect random page references */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  47  #define MADV_SEQUENTIAL	2		/* expect sequential page references */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  48  #define MADV_WILLNEED	3		/* will need these pages */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16  49  #define	MADV_SPACEAVAIL	5		/* ensure resources are available */
^1da177e4c3f41 include/asm-alpha/mman.h           Linus Torvalds     2005-04-16 @50  #define MADV_DONTNEED	6		/* don't need these pages */
5f6164f3092832 include/asm-alpha/mman.h           Michael S. Tsirkin 2006-02-15  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
