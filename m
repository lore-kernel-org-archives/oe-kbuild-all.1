Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325D4643
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 05:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678943906; x=1710479906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yb+97cXP5E9gPk66njOB/9f/lmzpESYyib6gieZVtEI=;
  b=feJJZWwCUTdyU2elOgT12I1KaxcWMs+Y6F+iviueCRCbl1rMEcy53spe
   ljHsZaWxknpucElKOhUbrtbaAZ3BLx1uPWhi453rp1XyMcsDSe+9jKhtL
   IxQ7wqSDqfdQvXB9qLLsKC21rsTFuHxePfv076qGRmdooMWqeJ764GqnN
   W0khBjNLuczTC2ePvz4++vENjRxUfPH/Mfjn91xF5+aAwBQacERybMKq3
   sZH054bjASZW995k3SIUKjUlH5/QCkDoByVR6Vu3J7h9Mr0DLdEQOXBUJ
   qqHnUJ4DAwonRBGk5jXYDklcv5+CMrnRpZRBtGVGwEIXeSuDoGM3kHnID
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365581650"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="365581650"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 22:18:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="743972028"
X-IronPort-AV: E=Sophos;i="5.98,264,1673942400"; 
   d="scan'208";a="743972028"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Mar 2023 22:18:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcg0L-0008Jx-27;
	Thu, 16 Mar 2023 05:18:21 +0000
Date: Thu, 16 Mar 2023 13:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: Viktor Malik <vmalik@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [linux-next:master 3796/4036] kernel/module/internal.h:260:56:
 error: expected ';', ',' or ')' before 'const'
Message-ID: <202303161311.Qv4gDU9T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: 2a6427ca8f3a8f08498c7b60e486c95af88d0afd [3796/4036] bpf: Fix attaching fentry/fexit/fmod_ret/lsm to modules
config: m68k-randconfig-r001-20230313 (https://download.01.org/0day-ci/archive/20230316/202303161311.Qv4gDU9T-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2a6427ca8f3a8f08498c7b60e486c95af88d0afd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2a6427ca8f3a8f08498c7b60e486c95af88d0afd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303161311.Qv4gDU9T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/module/main.c:59:
>> kernel/module/internal.h:260:56: error: expected ';', ',' or ')' before 'const'
     260 |                                                        const char *name)
         |                                                        ^~~~~
--
   In file included from kernel/bpf/verifier.c:27:
>> kernel/bpf/../module/internal.h:260:56: error: expected ';', ',' or ')' before 'const'
     260 |                                                        const char *name)
         |                                                        ^~~~~
   kernel/bpf/verifier.c: In function 'bpf_check_attach_target':
>> kernel/bpf/verifier.c:18488:48: error: implicit declaration of function 'find_kallsyms_symbol_value'; did you mean 'kallsyms_symbol_value'? [-Werror=implicit-function-declaration]
   18488 |                                         addr = find_kallsyms_symbol_value(mod, tname);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                kallsyms_symbol_value
   cc1: some warnings being treated as errors


vim +260 kernel/module/internal.h

   250	
   251	static inline bool sect_empty(const Elf_Shdr *sect)
   252	{
   253		return !(sect->sh_flags & SHF_ALLOC) || sect->sh_size == 0;
   254	}
   255	#else /* !CONFIG_KALLSYMS */
   256	static inline void init_build_id(struct module *mod, const struct load_info *info) { }
   257	static inline void layout_symtab(struct module *mod, struct load_info *info) { }
   258	static inline void add_kallsyms(struct module *mod, const struct load_info *info) { }
   259	static inline unsigned long find_kallsyms_symbol_value(struct module *mod
 > 260							       const char *name)
   261	{
   262		return 0;
   263	}
   264	#endif /* CONFIG_KALLSYMS */
   265	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
