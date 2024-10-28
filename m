Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5E215E8B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 10:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112476; cv=none; b=njW7ilV0qXOsxzlV3NrdzQ/dvrfKN0Ki7q8fyUZS/Tw1cngEBl5sm9sFiYvLXsjxfZgxKDZQeMQoQ6aZ9AIPp7boS9kH2KgG2jEQHorbK8/l/vXaemnWQBOmK4BJ80N9HIwDqm22OrTgaa20KL6JWLnYiuWFqNK70IE8WrWh/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112476; c=relaxed/simple;
	bh=7WmzYj1DbTkG8ZWN1+SlUQOElREQDPzb7T0rppvt53M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MEQrhw5YYPGmnOAKvTPyqHhSnl0kJ9TtyM90Kd6NY/HyauIGd/pu61lm6dSdE8VCi+SLYodoWLdg+g7vyW+QvCTzVc527JGw7Z6b0eCKNhsONNw7yxS1kRRVCaXbnKeW+MoantgqP5i6vN3lLfqIqHFOWmPaM5Q/HwgyetB0hYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eF5FnKJQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eF5FnKJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730112474; x=1761648474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WmzYj1DbTkG8ZWN1+SlUQOElREQDPzb7T0rppvt53M=;
  b=eF5FnKJQ6aNh/3D04GVsAuQr7FnszIRI0ySXSus3tFA+idoJ3zXoi7v2
   aaf2lk67A87h15eW5dxNhLZEe4IAQc8xYRvXMdwnNbv3pgO5UbfIQqQZb
   HzFGuZPDHDCfoLMwCmtlClEL63PM0Z6NqMVlKfydFeshH3JxNk3QeSwnF
   24NDKkFU8P8jxN1unqLvXnxikjSA9mgLMYpVp1kC+/SRt5KII5q7YFvS7
   gW7RCnfuXMLUF86J6q5y1bz6g8h/NbgngTGGLhG1qnevc5s/AG1wRIuEw
   UQBJ1lAVxg77eiZ214KvIQOYLsWnqyAVfpi6AnyNhArHHFsF4AW5rlFys
   g==;
X-CSE-ConnectionGUID: Mi0p+yS8TjCwIalaIgai0w==
X-CSE-MsgGUID: YLzcr8cfROugh7riegRXGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47161602"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47161602"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 03:47:53 -0700
X-CSE-ConnectionGUID: Ng9mSJ3PTQ+MNpkRS+GHfA==
X-CSE-MsgGUID: 5Bz5hm6MTPmGfQLHAF7eLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81642116"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2024 03:47:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5NHq-000cKF-10;
	Mon, 28 Oct 2024 10:47:50 +0000
Date: Mon, 28 Oct 2024 18:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_5 21/26] sound/pci/azt3328.c:226:12:
 warning: 'index' defined but not used
Message-ID: <202410281829.TIzh3j82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_5
head:   748f02be1adc50c8aea1e580791e8085f8713c07
commit: 0ec2293dc6f5526b57f0f431643dbfbbddc5cd51 [21/26] uprobes: Add mapping for optimized uprobe trampolines
config: arm64-randconfig-001-20241028 (https://download.01.org/0day-ci/archive/20241028/202410281829.TIzh3j82-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410281829.TIzh3j82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410281829.TIzh3j82-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:16,
                    from include/linux/page-flags.h:13,
                    from arch/arm64/include/asm/mte.h:15,
                    from arch/arm64/include/asm/pgtable.h:12,
                    from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:14,
                    from sound/pci/azt3328.c:168:
   include/linux/uprobes.h:127:33: error: field 'tramp_mutex' has incomplete type
     127 |         struct mutex            tramp_mutex;
         |                                 ^~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/io.h:11:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/azt3328.c:227:1: note: in expansion of macro 'module_param_array'
     227 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/azt3328.c:226:12: warning: 'index' defined but not used [-Wunused-variable]
     226 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from include/linux/mm_types.h:16,
                    from include/linux/page-flags.h:13,
                    from arch/arm64/include/asm/mte.h:15,
                    from arch/arm64/include/asm/pgtable.h:12,
                    from include/linux/pgtable.h:6,
                    from arch/arm64/include/asm/io.h:12,
                    from include/linux/io.h:14,
                    from sound/pci/es1968.c:83:
   include/linux/uprobes.h:127:33: error: field 'tramp_mutex' has incomplete type
     127 |         struct mutex            tramp_mutex;
         |                                 ^~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/io.h:11:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:243:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     243 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/es1968.c:129:1: note: in expansion of macro 'module_param_array'
     129 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/es1968.c:115:12: warning: 'index' defined but not used [-Wunused-variable]
     115 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 1-MAX */
         |            ^~~~~


vim +/index +226 sound/pci/azt3328.c

dfbf9511155d35 Andreas Mohr   2009-07-05  225  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @226  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 0-MAX */
^1da177e4c3f41 Linus Torvalds 2005-04-16 @227  module_param_array(index, int, NULL, 0444);
^1da177e4c3f41 Linus Torvalds 2005-04-16  228  MODULE_PARM_DESC(index, "Index value for AZF3328 soundcard.");
^1da177e4c3f41 Linus Torvalds 2005-04-16  229  

:::::: The code at line 226 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
