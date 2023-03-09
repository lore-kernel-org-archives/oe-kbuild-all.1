Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216027E6
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 06:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678341808; x=1709877808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FhQ37SSEcdk0edwdrxtCJA636DjwwzQQ0+pqbNjhwB0=;
  b=hL7xRfygO80uhoVSbgdqBx8Jk4YAA96q4TrsK9BxDf3jOkcJnvtKkjxb
   b1ezG6ASQiS6CkW/iD/qVyxYHtnMKk6SkWPOzmkoSN4U05RHDasQF/M0M
   i7RnP8SoaO83E2YvE0MoNg3A/6eE9u7IAx1FCaPeRhEBT8T7K7R6zqZ3s
   btW+MsiWmDGhfE5x66tIjo+qcWmf2QKNjOwQlrGiz5o3JxBYTy2kwuOR9
   1zCN7x5p73SLV6wbshRO80icgyf0+sDoyh9W2EHDxJFARjogVLc8QF2iz
   nKS74bCtF5LCO7CVlXseNW11ZMSo+qaIGM87eeuZ4qIaEPbeH3/qf1W7J
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316756757"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316756757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 22:03:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="707471318"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="707471318"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Mar 2023 22:03:12 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa9Mt-0002hN-2h;
	Thu, 09 Mar 2023 06:03:11 +0000
Date: Thu, 9 Mar 2023 14:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 875/895]
 arch/arm64/include/asm/mte.h:40:25: error: 'PG_arch_3' undeclared; did you
 mean 'PG_arch_2'?
Message-ID: <202303091415.klp9bIyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   c6e1ce96835337ed0ee4d20905134db259606f7f
commit: ac5228fa6a67a6ddd73164ca03c62e596826e864 [875/895] arm64: mte: Lock a page for MTE tag initialisation
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303091415.klp9bIyo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=ac5228fa6a67a6ddd73164ca03c62e596826e864
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.1
        git checkout ac5228fa6a67a6ddd73164ca03c62e596826e864
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303091415.klp9bIyo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/pgtable.h:12,
                    from include/linux/pgtable.h:6,
                    from include/linux/kasan.h:33,
                    from include/linux/slab.h:148,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from include/acpi/apei.h:9,
                    from include/acpi/ghes.h:5,
                    from include/linux/arm_sdei.h:8,
                    from arch/arm64/kernel/asm-offsets.c:10:
   arch/arm64/include/asm/mte.h: In function 'try_page_mte_tagging':
>> arch/arm64/include/asm/mte.h:40:25: error: 'PG_arch_3' undeclared (first use in this function); did you mean 'PG_arch_2'?
      40 | #define PG_mte_lock     PG_arch_3
         |                         ^~~~~~~~~
   arch/arm64/include/asm/mte.h:79:31: note: in expansion of macro 'PG_mte_lock'
      79 |         if (!test_and_set_bit(PG_mte_lock, &page->flags))
         |                               ^~~~~~~~~~~
   arch/arm64/include/asm/mte.h:40:25: note: each undeclared identifier is reported only once for each function it appears in
      40 | #define PG_mte_lock     PG_arch_3
         |                         ^~~~~~~~~
   arch/arm64/include/asm/mte.h:79:31: note: in expansion of macro 'PG_mte_lock'
      79 |         if (!test_and_set_bit(PG_mte_lock, &page->flags))
         |                               ^~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:118: arch/arm64/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1282: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:231: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +40 arch/arm64/include/asm/mte.h

    36	
    37	/* track which pages have valid allocation tags */
    38	#define PG_mte_tagged	PG_arch_2
    39	/* simple lock to avoid multiple threads tagging the same page */
  > 40	#define PG_mte_lock	PG_arch_3
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
