Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCEE10792
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 20:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676491684; x=1708027684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CxkOpm9iRKIZBSHzh2RVRtmB+Gckvud9r5a+HcNvcjs=;
  b=a74FgaK7m0SDeOygMo0zdBW5WSK/oLcJNb9sxrE5E+7B3YPODpvw0LeT
   SfrUi+bq/SvY9fsifFCEBj54JugtTT4Uh9HCZ7v+lwR7WVleXxiIKPxF3
   3IMk90VEKxJPqiouOvGYubeXACThGdyfJiFAe9GQcq2qFzyLxL+j7uhRa
   +0TRr6Kb6zClJVjEDzQmwrEDj19phSx2ZA53lUnoThCchTceGM86mAEF9
   eugTc8Uau+euR1Kwaw0YD1jMYS7X2uJqz5iqmZ8rGSSx333OcrSm3yuMN
   oe31wzoSlGIRCnSlaKQQGJWIYk+WJpCyi7pf1yNs6C6bnDO/NKy1F7rs8
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="332848903"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="332848903"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 12:08:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="998723724"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="998723724"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Feb 2023 12:08:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSO4Q-0009kD-0c;
	Wed, 15 Feb 2023 20:08:02 +0000
Date: Thu, 16 Feb 2023 04:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 07/16] drm/ttm: Reduce the number of used allocation
 orders for TTM pages
Message-ID: <202302160315.1ArgxuzS-lkp@intel.com>
References: <20230215161405.187368-8-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215161405.187368-8-thomas.hellstrom@linux.intel.com>

Hi Thomas,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230215161405.187368-8-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH 07/16] drm/ttm: Reduce the number of used allocation orders for TTM pages
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230216/202302160315.1ArgxuzS-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4925cefe2ad6e10e768cebed1a78bfde13199195
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
        git checkout 4925cefe2ad6e10e768cebed1a78bfde13199195
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/ttm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160315.1ArgxuzS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:10,
                    from drivers/gpu/drm/ttm/ttm_pool.c:37:
>> arch/mips/include/asm/pgtable.h:238:26: warning: "__builtin_ffs" is not defined, evaluates to 0 [-Wundef]
     238 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                          ^~~~~~~~~~~~~
   arch/mips/include/asm/pgtable-32.h:67:43: note: in expansion of macro 'PTE_T_LOG2'
      67 | # define PGDIR_SHIFT    (2 * PAGE_SHIFT - PTE_T_LOG2)
         |                                           ^~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:52:24: note: in expansion of macro 'PMD_SHIFT'
      52 | #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
         |                        ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:54:6: note: in expansion of macro 'TTM_MAX_ORDER'
      54 | #if (TTM_MAX_ORDER < TTM_64K_ORDER)
         |      ^~~~~~~~~~~~~
>> arch/mips/include/asm/pgtable.h:238:39: error: missing binary operator before token "("
     238 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                                       ^
   arch/mips/include/asm/pgtable-32.h:67:43: note: in expansion of macro 'PTE_T_LOG2'
      67 | # define PGDIR_SHIFT    (2 * PAGE_SHIFT - PTE_T_LOG2)
         |                                           ^~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:52:24: note: in expansion of macro 'PMD_SHIFT'
      52 | #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
         |                        ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:54:6: note: in expansion of macro 'TTM_MAX_ORDER'
      54 | #if (TTM_MAX_ORDER < TTM_64K_ORDER)
         |      ^~~~~~~~~~~~~
>> arch/mips/include/asm/pgtable.h:238:26: warning: "__builtin_ffs" is not defined, evaluates to 0 [-Wundef]
     238 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                          ^~~~~~~~~~~~~
   arch/mips/include/asm/pgtable-32.h:67:43: note: in expansion of macro 'PTE_T_LOG2'
      67 | # define PGDIR_SHIFT    (2 * PAGE_SHIFT - PTE_T_LOG2)
         |                                           ^~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:52:24: note: in expansion of macro 'PMD_SHIFT'
      52 | #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
         |                        ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:58:24: note: in expansion of macro 'TTM_MAX_ORDER'
      58 | #if ((MAX_ORDER - 1) < TTM_MAX_ORDER)
         |                        ^~~~~~~~~~~~~
>> arch/mips/include/asm/pgtable.h:238:39: error: missing binary operator before token "("
     238 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                                       ^
   arch/mips/include/asm/pgtable-32.h:67:43: note: in expansion of macro 'PTE_T_LOG2'
      67 | # define PGDIR_SHIFT    (2 * PAGE_SHIFT - PTE_T_LOG2)
         |                                           ^~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:52:24: note: in expansion of macro 'PMD_SHIFT'
      52 | #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
         |                        ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:58:24: note: in expansion of macro 'TTM_MAX_ORDER'
      58 | #if ((MAX_ORDER - 1) < TTM_MAX_ORDER)
         |                        ^~~~~~~~~~~~~


vim +238 arch/mips/include/asm/pgtable.h

^1da177e4c3f41 include/asm-mips/pgtable.h Linus Torvalds 2005-04-16  235  
5ff974720abec2 include/asm-mips/pgtable.h Ralf Baechle   2007-08-01  236  #define PGD_T_LOG2	(__builtin_ffs(sizeof(pgd_t)) - 1)
5ff974720abec2 include/asm-mips/pgtable.h Ralf Baechle   2007-08-01  237  #define PMD_T_LOG2	(__builtin_ffs(sizeof(pmd_t)) - 1)
5ff974720abec2 include/asm-mips/pgtable.h Ralf Baechle   2007-08-01 @238  #define PTE_T_LOG2	(__builtin_ffs(sizeof(pte_t)) - 1)
^1da177e4c3f41 include/asm-mips/pgtable.h Linus Torvalds 2005-04-16  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
