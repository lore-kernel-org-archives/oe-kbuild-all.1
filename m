Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5E63C00
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678981240; x=1710517240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Krr76bQycldUApGVoztl23LMjz5jmywRUC2sJscaQW0=;
  b=S89m7lF237/C7GnhCKI/WKqd2veyMDx5qHXXeHS9+RWhIkzkT5VN6tiC
   f/Eyv0r+yngkHnCXwzcG1591k/ifK+WIKXRmpGECRdmDUduHG8ZynHBEj
   elJiNRJ3cMIyQaeMeiuClkdvCWMV/Ih1k3VcjSfyIg41pfKnqE8DKXYZL
   BDJYoqI1nHwhiebg2hxz8frLzWw+QsXpqEDHPJEy7fiiqiOTqnmHVjkmj
   S9DCSzfzlj6G4d7gGbqmvMZ7gZW/kxoNY8UIy/yQCTOqMlxFxExH5oTJL
   xZIPqZvDH+QcGB5yrnb++6QvQvcbmacfGyLvNyGsx7QFor+zVOjVlhFUl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339571439"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="339571439"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 08:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="679943941"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="679943941"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Mar 2023 08:40:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcpiU-0008bc-0k;
	Thu, 16 Mar 2023 15:40:34 +0000
Date: Thu, 16 Mar 2023 23:39:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 5/5] arch/arm/kernel/entry-armv.S:672: undefined
 reference to `vfp_entry'
Message-ID: <202303162305.paoxMOMo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   2545efb55a148c88be4c92aa0a1a2936031c77dd
commit: 2545efb55a148c88be4c92aa0a1a2936031c77dd [5/5] ARM: vfp: Reimplement VFP exception entry in C code
config: arm-randconfig-r016-20230313 (https://download.01.org/0day-ci/archive/20230316/202303162305.paoxMOMo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=2545efb55a148c88be4c92aa0a1a2936031c77dd
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout 2545efb55a148c88be4c92aa0a1a2936031c77dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303162305.paoxMOMo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: arch/arm/kernel/entry-armv.o: in function `do_vfp':
>> arch/arm/kernel/entry-armv.S:672: undefined reference to `vfp_entry'


vim +672 arch/arm/kernel/entry-armv.S

   664	
   665	@ VFP entry point.
   666	@
   667	@  r0  = instruction opcode (32-bit ARM or two 16-bit Thumb)
   668	@  r9  = normal "successful" return address
   669	@  lr  = unrecognised instruction return address
   670	do_vfp:
   671		mov	r1, sp				@ pass struct pt_regs via R1
 > 672		bl	vfp_entry			@ dispatch the VFP exception
   673		cmp	r0, #0				@ handled successfully?
   674		reteq	r9				@ then use R9 as return address
   675		ret	lr
   676	
   677	do_fpe:
   678		add	r10, r10, #TI_FPSTATE		@ r10 = workspace
   679		ldr_va	pc, fp_enter, tmp=r4		@ Call FP module USR entry point
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
