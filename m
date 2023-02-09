Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351CA64A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 17:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675962971; x=1707498971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JYNn6mVY8VbEBQsdc33AfcZoEUBeQM1RHyiqVLICUYg=;
  b=khNfacdNRfJQWvokepn672DUDTxtf0rmexIxCPcFP91TkgF3570ms43v
   vcAcBZUxrwFJhS+LdKK6pF1RZKBEsV/c7poHvqez1VkaehMfPyKUb5mOM
   dU7dYcte+pzgxN1RfXwXo4DEZqTXIUx14GWE5leStFlg7YOqeAQ43z8bm
   ZTt8rkgqo4sOgJxbyv/ot1bhQqep+0Op6hXZWHuOMLni6vqXjwhGclia9
   Q4PqluSpxrWyimuRP681gxGjYFI70u1ky5WvobKE3H1bahYL8T8Sh9DnR
   ZF1XpQ3ls1mXFw2PdDhPGFZH9mLrp44RR5mV808wr3PxlQiRa9owWiMxX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="394777250"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="394777250"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 09:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="667730667"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="667730667"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Feb 2023 09:13:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQAUZ-0005C4-2t;
	Thu, 09 Feb 2023 17:13:51 +0000
Date: Fri, 10 Feb 2023 01:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>
Subject: [stable:linux-rolling-stable 61/915]
 arch/arm64/include/asm/pgtable.h:871:51: error: implicit declaration of
 function 'pud_user_exec'; did you mean 'pmd_user_exec'?
Message-ID: <202302100106.Ln9eytJj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-stable
head:   657b3ebc26ae7bc5bb30e2d32e7c81ee17d087d9
commit: a006aaffd78ff70efcffa44e325633c0840b2bf2 [61/915] arm64/mm: add pud_user_exec() check in pud_user_accessible_page()
config: arm64-buildonly-randconfig-r002-20230209 (https://download.01.org/0day-ci/archive/20230210/202302100106.Ln9eytJj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=a006aaffd78ff70efcffa44e325633c0840b2bf2
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-rolling-stable
        git checkout a006aaffd78ff70efcffa44e325633c0840b2bf2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100106.Ln9eytJj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:33,
                    from include/linux/slab.h:148,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
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
