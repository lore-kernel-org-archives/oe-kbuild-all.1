Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1DC5380
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680108853; x=1711644853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W1YGt+CxBuyGcfTld0KaeTCjU9IbhsL/iEx1LJy6d5s=;
  b=CmglodKHhwaNknKmVd75145560MjUd60p2hRBlrU8ymEYJ/bjK3C5JJI
   K+WhprON/kFVcC5uNB7VlabmAr9fbVPx1Kn2OWEJdTNDzVbcnkh+rhIRa
   LlPt20trowXuZMuqyZtyATieMeMF19tYKy2v6Sj34uDMxSclzpYY+Wasy
   JQyf2OtCksyr42kbHBGZPwPacMjg06DHttmmEnwzSsQWtCEGlo7WCmM69
   Lhc8JvTw71e3jc/aw86rkD2yjc2rHizgfiXZqBXamTUvvvG23lQGfi7LZ
   V7LcjJHq13ZMoxhxwpBwKiB324+rPSH1WcTyYQQ86wIdPVBJpikD/9o++
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338441427"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="338441427"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 09:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="930403120"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="930403120"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Mar 2023 09:54:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phZ3h-000Jjs-2b;
	Wed, 29 Mar 2023 16:54:01 +0000
Date: Thu, 30 Mar 2023 00:53:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 9/11] arch/arm/kernel/head.S:262: Error: invalid
 constant (1ff000) after fixup
Message-ID: <202303300036.1B5WO1J0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   65a20e72febca3edf64d56b2ac1973086b16a342
commit: 8ac5a3710750dde4a136fe35c90cc56caac62552 [9/11] ARM: head: Omit TEXT_OFFSET from initial kernel mapping when possible
config: arm-randconfig-r046-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300036.1B5WO1J0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=8ac5a3710750dde4a136fe35c90cc56caac62552
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout 8ac5a3710750dde4a136fe35c90cc56caac62552
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300036.1B5WO1J0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/head.S: Assembler messages:
>> arch/arm/kernel/head.S:262: Error: invalid constant (1ff000) after fixup


vim +262 arch/arm/kernel/head.S

   230	
   231		ldr	r7, [r10, #PROCINFO_MM_MMUFLAGS] @ mm_mmuflags
   232	
   233		/*
   234		 * Create identity mapping to cater for __enable_mmu.
   235		 * This identity mapping will be removed by paging_init().
   236		 */
   237		adr_l	r5, __turn_mmu_on		@ _pa(__turn_mmu_on)
   238		adr_l	r6, __turn_mmu_on_end		@ _pa(__turn_mmu_on_end)
   239		mov	r5, r5, lsr #SECTION_SHIFT
   240		mov	r6, r6, lsr #SECTION_SHIFT
   241	
   242	1:	orr	r3, r7, r5, lsl #SECTION_SHIFT	@ flags + kernel base
   243		str	r3, [r4, r5, lsl #PMD_ENTRY_ORDER]	@ identity mapping
   244		cmp	r5, r6
   245		addlo	r5, r5, #1			@ next section
   246		blo	1b
   247	
   248		/*
   249		 * The main matter: map in the kernel using section mappings, and
   250		 * set two variables to indicate the physical start and end of the
   251		 * kernel.
   252		 */
   253		add	r0, r4, #KERNEL_OFFSET >> (SECTION_SHIFT - PMD_ENTRY_ORDER)
   254	#if (TEXT_OFFSET >> SECTION_SHIFT) != 0
   255		/*
   256		 * If the TEXT_OFFSET reservation covers multiple sections, omit the
   257		 * lower ones that are not shared with the swapper page tables and the
   258		 * start of kernel text.
   259		 */
   260		add	r0, r0, #(TEXT_OFFSET >> SECTION_SHIFT) << PMD_ENTRY_ORDER
   261	#endif
 > 262		bic	r3, r4, #((1 << (SECTION_SHIFT - PAGE_SHIFT)) - 1) << PAGE_SHIFT
   263		ldr	r6, =(_end - 1)
   264		adr_l	r5, kernel_sec_start		@ _pa(kernel_sec_start)
   265	#if defined CONFIG_CPU_ENDIAN_BE8 || defined CONFIG_CPU_ENDIAN_BE32
   266		str	r3, [r5, #4]			@ Save physical start of kernel (BE)
   267	#else
   268		str	r3, [r5]			@ Save physical start of kernel (LE)
   269	#endif
   270		orr	r3, r3, r7			@ Add the MMU flags
   271		add	r6, r4, r6, lsr #(SECTION_SHIFT - PMD_ENTRY_ORDER)
   272	1:	str	r3, [r0], #1 << PMD_ENTRY_ORDER
   273		add	r3, r3, #1 << SECTION_SHIFT
   274		cmp	r0, r6
   275		bls	1b
   276		eor	r3, r3, r7			@ Remove the MMU flags
   277		adr_l	r5, kernel_sec_end		@ _pa(kernel_sec_end)
   278	#if defined CONFIG_CPU_ENDIAN_BE8 || defined CONFIG_CPU_ENDIAN_BE32
   279		str	r3, [r5, #4]			@ Save physical end of kernel (BE)
   280	#else
   281		str	r3, [r5]			@ Save physical end of kernel (LE)
   282	#endif
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
