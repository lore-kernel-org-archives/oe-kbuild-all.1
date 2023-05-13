Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE844A2C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 01:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683942182; x=1715478182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NSddCji1xD4h/v3N+BG8GRedJXFLGYddrruFhWDtUFU=;
  b=MhVnJEEvuQdm84BYiTLDSOTF77hUbKwi3VZi/o9fQEqwS2wthUIYMwE0
   DvI8wLs666ElENiQzaRaet8OxK75wn2Md4kUo5BN8sg2lWm5lN2iResbm
   DsM6Ou380MjW8tsZC3C0HX5Sm1uO8lwmat+Xsu9iUS6164bD+zDV9fEfe
   HQlv4O7BFrlxEZJjFYWIjJw1Ra6r8ppgAvVGOYJyBIJtkPehHi4zE/v+1
   PGSHOBYIFrHtsivQ2yixh4rdR8AxEA66LY+pLrVHcl+SpyEKnPjppXvkH
   Z4npThjSbjh48Hjo2+n2QXmBVp7MaidzzvNapa75Lh1CWvAwr/6aGqP91
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335440631"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="335440631"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 18:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="812278049"
X-IronPort-AV: E=Sophos;i="5.99,271,1677571200"; 
   d="scan'208";a="812278049"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2023 18:43:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxeHk-0005EY-1G;
	Sat, 13 May 2023 01:43:00 +0000
Date: Sat, 13 May 2023 09:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-remove-mixed-mode 22/30] arch/ia64/kernel/efi.c:1353:7:
 warning: no previous prototype for 'efi_systab_show_arch'
Message-ID: <202305130900.kmXx4YNq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-remove-mixed-mode
head:   cd57f70012e67876ab331fb83fd05670727e44d1
commit: 7273d530e9395955b89a59ed682253dacbce7b7a [22/30] x86: efi: Drop UGA support
config: ia64-defconfig (https://download.01.org/0day-ci/archive/20230513/202305130900.kmXx4YNq-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=7273d530e9395955b89a59ed682253dacbce7b7a
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-remove-mixed-mode
        git checkout 7273d530e9395955b89a59ed682253dacbce7b7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash arch/ia64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130900.kmXx4YNq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/ia64/kernel/efi.c: In function 'efi_init':
   arch/ia64/kernel/efi.c:490:13: warning: variable 'efi_desc_size' set but not used [-Wunused-but-set-variable]
     490 |         u64 efi_desc_size;
         |             ^~~~~~~~~~~~~
   arch/ia64/kernel/efi.c:489:31: warning: variable 'efi_map_end' set but not used [-Wunused-but-set-variable]
     489 |         void *efi_map_start, *efi_map_end;
         |                               ^~~~~~~~~~~
   arch/ia64/kernel/efi.c: At top level:
   arch/ia64/kernel/efi.c:971:1: warning: no previous prototype for 'find_memmap_space' [-Wmissing-prototypes]
     971 | find_memmap_space (void)
         | ^~~~~~~~~~~~~~~~~
>> arch/ia64/kernel/efi.c:1353:7: warning: no previous prototype for 'efi_systab_show_arch' [-Wmissing-prototypes]
    1353 | char *efi_systab_show_arch(char *str)
         |       ^~~~~~~~~~~~~~~~~~~~


vim +/efi_systab_show_arch +1353 arch/ia64/kernel/efi.c

120540f230d5d2d Ard Biesheuvel 2020-01-19  1352  
120540f230d5d2d Ard Biesheuvel 2020-01-19 @1353  char *efi_systab_show_arch(char *str)

:::::: The code at line 1353 was first introduced by commit
:::::: 120540f230d5d2d32846adc0156b58961c8c59d1 efi/ia64: Move HCDP and MPS table handling into IA64 arch code

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
