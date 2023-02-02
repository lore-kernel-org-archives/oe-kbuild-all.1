Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E525A48
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 08:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675327282; x=1706863282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MUAVR+yha85mnDuDGl1Ge/U2oyAMvpEoenHMo8jRmZE=;
  b=iUUrD7cFZx7Wo3cAPDz2jxOL+Vhm72pllXXxX82395YkfZFxcCIZ2xPE
   jBkL5+eJbSc45RIAZI2fCOAIBFHMUDrU6hRLO7d56LjClHcRieb8V18gF
   fadXaEIEXrQvXNo8GAS7LfYJTu1Vq29iow85IB0JVNDXpWXgL45ByR6Cg
   d/bDPTcJWdVG5DNxuCrTARoBi/84G+GqVINRTNmC5EoUejm//xVX2x1Wj
   WpgLWhDQCCIi5s0Mljbgx2bCvLwBbNnodfTskbkT3gUBat4+uQD4A3+t4
   +m4kYJo616JhE1L0dvkVMSVcHiDtS74ga8QTCmFDj4mxf82gax8AwDIOU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="312039250"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="312039250"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 00:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="642822923"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="642822923"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Feb 2023 00:41:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNV9j-0006Kl-23;
	Thu, 02 Feb 2023 08:41:19 +0000
Date: Thu, 2 Feb 2023 16:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>
Subject: [stable:linux-6.1.y 1681/2293]
 arch/arm64/include/asm/pgtable.h:871:51: error: implicit declaration of
 function 'pud_user_exec'; did you mean 'pmd_user_exec'?
Message-ID: <202302021638.tYWqFXQb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   68a95455c153f8adc513e5b688f4b348daa7c1b1
commit: a006aaffd78ff70efcffa44e325633c0840b2bf2 [1681/2293] arm64/mm: add pud_user_exec() check in pud_user_accessible_page()
config: arm64-buildonly-randconfig-r006-20230129 (https://download.01.org/0day-ci/archive/20230202/202302021638.tYWqFXQb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a006aaffd78ff70efcffa44e325633c0840b2bf2
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-6.1.y
        git checkout a006aaffd78ff70efcffa44e325633c0840b2bf2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from include/linux/elfcore.h:11,
                    from include/linux/crash_core.h:6,
                    from include/linux/kexec.h:18,
                    from arch/arm64/kernel/asm-offsets.c:12:
   arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
>> arch/arm64/include/asm/pgtable.h:871:51: error: implicit declaration of function 'pud_user_exec'; did you mean 'pmd_user_exec'? [-Werror=implicit-function-declaration]
     871 |         return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
         |                                                   ^~~~~~~~~~~~~
         |                                                   pmd_user_exec
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:118: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1270: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:231: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +871 arch/arm64/include/asm/pgtable.h

   868	
   869	static inline bool pud_user_accessible_page(pud_t pud)
   870	{
 > 871		return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
   872	}
   873	#endif
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
