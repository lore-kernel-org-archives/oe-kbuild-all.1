Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3D7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 00:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680049534; x=1711585534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRb2COvdneivUgfvivL5gkxKEPEnp3OK5RsaxojHDiU=;
  b=jOiVkwsGHX8MRaFEorO03/GRx5rVExzmsX218CrlUVQgZitooIX7uLIi
   LwEcDaiYB62HZtTTMSyBERizyMJGkr7EmBf4rO1+4T7YJ7+uppc6sxmdn
   UZJWJyA/+8MGfiFGYn4ebyHzDOdCfuPghY3yydfLTfFXhB17mjSf1FiNW
   057cEc5MVOr+/9G5e0jreW65HTD9cxpTRP/BxNC3/ddq1EuI9oQyXy+Z8
   b6DE3eEOpUb5/UwvLzG7T7YNFO7Qe7Fp2pWC6fs2yQ60T3mrymPeBqzWI
   EOSFFt85ruw6wqAmwad+HnWsDx6PytfrxDqs9ohWxmRd784JOc2Son23N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="321133394"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="321133394"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 17:25:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="714425494"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="714425494"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 28 Mar 2023 17:25:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phJd0-000J0T-2u;
	Wed, 29 Mar 2023 00:25:26 +0000
Date: Wed, 29 Mar 2023 08:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>
Subject: [stable:linux-6.1.y 1681/4294]
 arch/arm64/include/asm/pgtable.h:871:51: error: implicit declaration of
 function 'pud_user_exec'; did you mean 'pmd_user_exec'?
Message-ID: <202303290834.xA0I5ejP-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
head:   e3a87a10f2591f296d1a50c5af6820e2181d564a
commit: a006aaffd78ff70efcffa44e325633c0840b2bf2 [1681/4294] arm64/mm: add pud_user_exec() check in pud_user_accessible_page()
config: arm64-randconfig-r021-20230326 (https://download.01.org/0day-ci/archive/20230329/202303290834.xA0I5ejP-lkp@intel.com/config)
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
| Link: https://lore.kernel.org/oe-kbuild-all/202303290834.xA0I5ejP-lkp@intel.com/

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
