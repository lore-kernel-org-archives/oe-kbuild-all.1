Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D29817D8
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 05:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683437430; x=1714973430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=579cDMaPYjBtSAP/0hejrPjdjsvzDheddzkd6znhPSE=;
  b=kHKEozHN+1hHMNUPEAG2y1JtIu10V8GjYkxpaVgCiQdXTAcDbAAaPWwG
   n7zra/YcekGwjYQ1beaavDSK28GSyu6RSKxpab3346X1PHwH7fNJi6Tfn
   9m9tVvIPUZhZqQNP0OU9t9UpfP2olhKTn1fDTHLycw2GXVbjrAMzrnlJ7
   2FVVNPY5t/b4z5oihM5aYDibLGW0SRXiPMBgkg0m/GD3ejdqldIRJmG62
   8onmZA3znUttuwGUayK2eVl6kc+6JgDYz3sNmDoYGe/OSKRbyNkwNIzRs
   3KVjyaS+8nCx5Rak1WAD5oeIIq3VgR9nzSxhssHWl044q4p2kPlR5MLkA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="352506179"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="352506179"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 22:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="767669689"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="767669689"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 May 2023 22:30:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvWya-0000dN-0Z;
	Sun, 07 May 2023 05:30:28 +0000
Date: Sun, 7 May 2023 13:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs
 inode iterator
Message-ID: <202305071347.6YCIthgI-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]
[also build test ERROR on linus/master]
[cannot apply to bpf-next/master akpm-mm/mm-everything v6.3 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230507040107.3755166-3-houtao%40huaweicloud.com
patch subject: [RFC PATCH bpf-next 2/4] bpf: Add three kfunc helpers for bpf fs inode iterator
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230507/202305071347.6YCIthgI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/93ea1c2e394182d3547673f69a808b8c1fa994e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/bpf-Introduce-bpf-iterator-for-file-system-inode/20230507-113114
        git checkout 93ea1c2e394182d3547673f69a808b8c1fa994e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071347.6YCIthgI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/uapi/asm-generic/mman.h:5,
                    from ./arch/s390/include/generated/uapi/asm/mman.h:1,
                    from include/uapi/linux/mman.h:5,
                    from include/linux/fs.h:49,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:855,
                    from include/linux/kvm_host.h:16,
                    from arch/s390/kvm/kvm-s390.h:17,
                    from arch/s390/kvm/gaccess.c:16:
>> include/uapi/asm-generic/mman-common.h:16:25: error: expected identifier before numeric constant
      16 | #define PROT_NONE       0x0             /* page can not be accessed */
         |                         ^~~
   arch/s390/kvm/gaccess.c:493:9: note: in expansion of macro 'PROT_NONE'
     493 |         PROT_NONE,
         |         ^~~~~~~~~
   arch/s390/kvm/gaccess.c: In function 'trans_exc_ending':
>> arch/s390/kvm/gaccess.c:516:17: error: duplicate case value
     516 |                 case PROT_TYPE_LA:
         |                 ^~~~
   arch/s390/kvm/gaccess.c:509:17: note: previously used here
     509 |                 case PROT_NONE:
         |                 ^~~~
   In file included from include/linux/compiler_types.h:80,
                    from <command-line>:
>> include/linux/compiler_attributes.h:208:41: warning: attribute 'fallthrough' not preceding a case label or default label
     208 | # define fallthrough                    __attribute__((__fallthrough__))
         |                                         ^~~~~~~~~~~~~
   arch/s390/kvm/gaccess.c:515:25: note: in expansion of macro 'fallthrough'
     515 |                         fallthrough;
         |                         ^~~~~~~~~~~


vim +16 include/uapi/asm-generic/mman-common.h

5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15   9  
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  10  #define PROT_READ	0x1		/* page can be read */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  11  #define PROT_WRITE	0x2		/* page can be written */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  12  #define PROT_EXEC	0x4		/* page can be executed */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  13  #define PROT_SEM	0x8		/* page may be used for atomic ops */
d41938d2cbee926 include/uapi/asm-generic/mman-common.h Dave Martin        2019-12-11  14  /*			0x10		   reserved for arch-specific use */
d41938d2cbee926 include/uapi/asm-generic/mman-common.h Dave Martin        2019-12-11  15  /*			0x20		   reserved for arch-specific use */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15 @16  #define PROT_NONE	0x0		/* page can not be accessed */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  17  #define PROT_GROWSDOWN	0x01000000	/* mprotect flag: extend change to start of growsdown vma */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  18  #define PROT_GROWSUP	0x02000000	/* mprotect flag: extend change to end of growsup vma */
5f6164f3092832e include/asm-generic/mman.h             Michael S. Tsirkin 2006-02-15  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
