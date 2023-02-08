Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A9C7F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 02:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675824716; x=1707360716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mwr3qNzGCEl1ilH3eggGBCQcHoceTEn3i6eC1KZclvU=;
  b=VQRmG4xL5Y/iyZkrMY8NDxH7nAzELHwXw9CFjCD90SEH2LljvIMAWd9T
   7nlicVdN+tGW5F/Q1xqAtRrpKi4hzOe9JpEYnAaM/qEhkPReX6caK2Lni
   Ko5hVIJSqqRvA6dGLJLMDRnf9NY3f5q2dhcc/OvwyZjPYuOarbvNaoohn
   //shSOptCgNHTA6cAFgz2XjwfYsI7OH7nuqXvWISdPsuSllUKB1IvxejC
   jFpkyzKucEmqZM5L7w3QdgP80xRR8pSKJLsZ7sXVt2BZuXTgrEYtJpPg9
   TPnKJjmZHUBdPKa8x8lpHaVU1vFHEo2eIMLV0ctcL39aMpB/F0JJP2Y0e
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="330984868"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="330984868"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 18:51:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="809777118"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="809777118"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2023 18:51:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPaYj-00046e-2I;
	Wed, 08 Feb 2023 02:51:45 +0000
Date: Wed, 8 Feb 2023 10:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning:
 "THREAD_SHIFT" is not defined, evaluates to 0
Message-ID: <202302081034.IDWxXcwG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: 80b6093b55e31c2c40ff082fb32523d4e852954f kbuild: add -Wundef to KBUILD_CPPFLAGS for W=1 builds
date:   8 weeks ago
config: powerpc-randconfig-r015-20230208 (https://download.01.org/0day-ci/archive/20230208/202302081034.IDWxXcwG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=80b6093b55e31c2c40ff082fb32523d4e852954f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 80b6093b55e31c2c40ff082fb32523d4e852954f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ arch/powerpc/kvm/ arch/powerpc/platforms/85xx/ arch/powerpc/sysdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kvm/bookehv_interrupts.S:26:
>> arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning: "THREAD_SHIFT" is not defined, evaluates to 0 [-Wundef]
      20 | #if (THREAD_SHIFT < 15)
         |      ^~~~~~~~~~~~


vim +/THREAD_SHIFT +20 arch/powerpc/kvm/../kernel/head_booke.h

1a4b739bbb4f885 Christophe Leroy 2019-04-30  10  
63dafe5728e7354 Becky Bruce      2006-01-14  11  /*
63dafe5728e7354 Becky Bruce      2006-01-14  12   * Macros used for common Book-e exception handling
63dafe5728e7354 Becky Bruce      2006-01-14  13   */
63dafe5728e7354 Becky Bruce      2006-01-14  14  
63dafe5728e7354 Becky Bruce      2006-01-14  15  #define SET_IVOR(vector_number, vector_label)		\
63dafe5728e7354 Becky Bruce      2006-01-14  16  		li	r26,vector_label@l; 		\
63dafe5728e7354 Becky Bruce      2006-01-14  17  		mtspr	SPRN_IVOR##vector_number,r26;	\
63dafe5728e7354 Becky Bruce      2006-01-14  18  		sync
63dafe5728e7354 Becky Bruce      2006-01-14  19  
e12401222f749c3 Yuri Tikhonov    2009-01-29 @20  #if (THREAD_SHIFT < 15)
e12401222f749c3 Yuri Tikhonov    2009-01-29  21  #define ALLOC_STACK_FRAME(reg, val)			\
e12401222f749c3 Yuri Tikhonov    2009-01-29  22  	addi reg,reg,val
e12401222f749c3 Yuri Tikhonov    2009-01-29  23  #else
e12401222f749c3 Yuri Tikhonov    2009-01-29  24  #define ALLOC_STACK_FRAME(reg, val)			\
e12401222f749c3 Yuri Tikhonov    2009-01-29  25  	addis	reg,reg,val@ha;				\
e12401222f749c3 Yuri Tikhonov    2009-01-29  26  	addi	reg,reg,val@l
e12401222f749c3 Yuri Tikhonov    2009-01-29  27  #endif
e12401222f749c3 Yuri Tikhonov    2009-01-29  28  

:::::: The code at line 20 was first introduced by commit
:::::: e12401222f749c37277a313d631dc024bbfd3b00 powerpc/44x: Support for 256KB PAGE_SIZE

:::::: TO: Yuri Tikhonov <yur@emcraft.com>
:::::: CC: Josh Boyer <jwboyer@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
