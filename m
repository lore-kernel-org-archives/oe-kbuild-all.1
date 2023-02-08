Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEF46AAD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675879873; x=1707415873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ffhm9P7ldicxKjOTzocP5q4HMs4eQxoqUg/xQs91C2Y=;
  b=deHGEoa/w83jl3teo/G/ag837RsKTHrsk1V9v55v8TLBoph9q6Tg9wr4
   kRGWx8PPHTLPMr89PSvE8FDa64Kvek2pjT5eBp65/Hj2CjhhAECPPxFF3
   2Ud4AZGRl5g7tBHw+/s6ccZZ/NbYkbNoBa7vNnje9RgiYS2CtGCHrVUv2
   Q/Ts9w5VDXsbTjzvByGgsmfmqllKiMUitfpiW23DiK4Lu3AC/JP+7VkpO
   MimCydJpQe2aDo9544oowUkCXcCTjAFWfI3NaZ5LKzSQw8xs2ggbdxcnB
   H7P4a5+Htv/9DRkE1XgHWS40HIMQVoEJIz5xJcrWgimpJajOUXSYNBx8o
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="331165349"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="331165349"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 10:11:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="660727667"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="660727667"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Feb 2023 10:11:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPouU-0004a6-0X;
	Wed, 08 Feb 2023 18:11:10 +0000
Date: Thu, 9 Feb 2023 02:10:57 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.2-rc3 17/20]
 ld:arch/powerpc/kernel/vdso/vdso32.lds:241: syntax error
Message-ID: <202302090226.2IbRd6pZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.2-rc3
head:   e7b124e682b6f0adf09d2bb405e70bee2024175f
commit: eed10e13220117531be06db71efbf2fcef9bbdba [17/20] powerpc: Make virt_to_pfn() a static inline
config: powerpc-buildonly-randconfig-r001-20230208 (https://download.01.org/0day-ci/archive/20230209/202302090226.2IbRd6pZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=eed10e13220117531be06db71efbf2fcef9bbdba
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.2-rc3
        git checkout eed10e13220117531be06db71efbf2fcef9bbdba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> ld:arch/powerpc/kernel/vdso/vdso32.lds:241: syntax error
>> collect2: error: ld returned 1 exit status
   make[2]: *** [arch/powerpc/kernel/vdso/Makefile:66: arch/powerpc/kernel/vdso/vdso32.so.dbg] Error 1
   make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:386: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
