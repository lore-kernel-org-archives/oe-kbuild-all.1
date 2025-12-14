Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68D24369A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 19:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765739082; cv=none; b=Tpyim+UzIyLxR0a75nhmhREH0ZFKqXlS0SaBZzAVV1ESZHA+iM4RMEyaFSnt8enBvAINCS3RvLhZOqfVuqcDcHWK2sgUH3M6RvVCaQ6pKjVjMjyD46lxURYKdKz4CcvcE8iN3bHO7TkNt9xqUiB/kyf6OcKh6baT7d7uLv4+0W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765739082; c=relaxed/simple;
	bh=UIT4GTvJpExXhH4Q0e+QHCS3diM7pv+pKf6xSzpSqVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FFZNDa0jypY3eiqnT9O+ijcY2+/ECqeY/xVoFTSmf4hs5yL8BZLGhRyMq6yFj71hP8sp6HzFaxet4kFRzkfy2INJYYh/5PdoWpE/AewTgoRn3f/xyMmH6D8DOXZ3vH5LTvmwui2UUEcaDBcnqRPIQ1xsLsxccFNT4tLZ/AOQI9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdYM1ssI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdYM1ssI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765739081; x=1797275081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UIT4GTvJpExXhH4Q0e+QHCS3diM7pv+pKf6xSzpSqVA=;
  b=kdYM1ssIUK2nx9M1HmPBBIPe4Nf31TZHmLonN7fvjnfm4atKZDM3ZCFS
   q9EJ/aaZtSVYf5703QeVjUDYVUjB3DkWEViTeXGVmEN5kT0/8Xsk2pH8r
   Vn2SZQwgltg+i5GS6bfQov0uryqbyUCsYg95Eb9QV0LuVHJ3BAhsPAAIB
   n7YX3Bdudh0yx+414EBvn6RiRL6fHCehq+i9wsER6ynMqYJtFw4S2QNU2
   moT/d6y7TzcYigFpsQvw7mP7dGQ37c9Fed05nYqpy5cr7mQgYiBy//KNH
   G4ALDS01UOlBzAkvbKqQXj5xQcREg3ptRDrNKHEjbOXGmr/c9LatcDSAR
   g==;
X-CSE-ConnectionGUID: ledASnksRoy9lSDWEbeZEg==
X-CSE-MsgGUID: Ejh91FmjRrWoZ30yqY5ZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67531370"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67531370"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 11:04:41 -0800
X-CSE-ConnectionGUID: aJJgKPbRREqeIBAeP75BOA==
X-CSE-MsgGUID: yJpEiyQeTR2NAbZGk4/31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202467739"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Dec 2025 11:04:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUrOW-000000009I5-39k8;
	Sun, 14 Dec 2025 19:04:36 +0000
Date: Mon, 15 Dec 2025 03:04:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] kernel/module/strict_rwx.c:36:6:
 warning: no previous prototype for function 'module_disable_ro'
Message-ID: <202512150222.mwnNlqrD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: c8783f92771c891518257c9deb22cd91d4e1a212 [3541/3541] livepatch/core: Revert module_enable_ro and module_disable_ro
config: arm64-randconfig-001-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150222.mwnNlqrD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150222.mwnNlqrD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150222.mwnNlqrD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/strict_rwx.c:36:6: warning: no previous prototype for function 'module_disable_ro' [-Wmissing-prototypes]
      36 | void module_disable_ro(const struct module *mod)
         |      ^
   kernel/module/strict_rwx.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | void module_disable_ro(const struct module *mod)
         | ^
         | static 
   1 warning generated.


vim +/module_disable_ro +36 kernel/module/strict_rwx.c

    34	
    35	#ifdef CONFIG_LIVEPATCH_WO_FTRACE
  > 36	void module_disable_ro(const struct module *mod)
    37	{
    38		if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
    39			return;
    40	#ifdef CONFIG_STRICT_MODULE_RWX
    41		if (!rodata_enabled)
    42			return;
    43	#endif
    44	
    45		module_set_memory(mod, MOD_TEXT, set_memory_rw);
    46		module_set_memory(mod, MOD_INIT_TEXT, set_memory_rw);
    47		module_set_memory(mod, MOD_RODATA, set_memory_rw);
    48		module_set_memory(mod, MOD_INIT_RODATA, set_memory_rw);
    49	}
    50	#endif /* CONFIG_LIVEPATCH_WO_FTRACE */
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
