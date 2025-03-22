Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895492E3384
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742678080; cv=none; b=eulZ5exQL7lNDtXwCPOVLfGB4t1RM6skR6klOmON0ZqINf/zjhcBfH39Ud8uG4Yq6T529CgmNk7ruHiM/Dc1+1SMFgrkl5wLY16E6gUB+Ld0xcwvQDVVyQOJ4sm3Og9sM7qA0hj/VT46NZRwfP9m34reJ/ESTrE8fUCUNJPVEGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742678080; c=relaxed/simple;
	bh=A/K8goV686h15/Sk/ujZZHSxtHsM72QIPuY1hHzN9cM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ir8APeXDq9o8tJZ0xpt13GpzviX7Bc8wvCkM7Tmx3rmY2leai/q1vRHsmoTwxsyuF7X+G0ai3seB2BAuPHTD2wMGDOLKZgBMs5SNLH7QH0Bh0ofRsbxeMxND2eB2qNbIaJBbB8dPWJVjL+HmBqg7VtuM/qEY0bRjObKifMAEUIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E01Llx9e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E01Llx9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742678078; x=1774214078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/K8goV686h15/Sk/ujZZHSxtHsM72QIPuY1hHzN9cM=;
  b=E01Llx9eQfaFpEyCe+7KeAbfaUno45yJ2MkLU2C3GV4ExuFz+VelNSqs
   v4zkX5Xjz37sXodROArnnfqftvRfy+InXkVdIcgcryOtRXbIsMw20skLu
   FsRDCYT3ow4e4u/KNAo6yyIUrMvfQdf+UWe97SEaYAiKHQKJtkl5lJNLQ
   D/qxW9ItqWizi49hDAACvxSfN9f6RQw3frOU7WvH8JWV5NPL9pPIYdLjZ
   Pr7rBjQMMq8AjIkoIDHHFqamrnEFG/Qq3o5NCfcXhbWHtS1wFa5Td+GtG
   KDmINlWruOX5UttCqhuUBcMLSUuRe7wFqnLXAkLMo338PNUaM5MEfDUOk
   A==;
X-CSE-ConnectionGUID: Xg+9HDR+RdeqNWeKD3BUxg==
X-CSE-MsgGUID: PJDnWJVGQ8GMwC0cIMBOyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="47575760"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="47575760"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 14:14:37 -0700
X-CSE-ConnectionGUID: Jm09a0vBR8iSohq7n48jOg==
X-CSE-MsgGUID: FytaZyIYS/OnCXrm4dYa2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="124647152"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Mar 2025 14:14:37 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw6As-0002Or-1W;
	Sat, 22 Mar 2025 21:14:34 +0000
Date: Sun, 23 Mar 2025 05:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2050/2050] kernel/module/strict_rwx.c:36:6:
 warning: no previous prototype for function 'module_disable_ro'
Message-ID: <202503230511.2940KCeN-lkp@intel.com>
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
head:   6f6f173b2b8fa65e1ef7ebc6e43b0b02c2a52759
commit: c8783f92771c891518257c9deb22cd91d4e1a212 [2050/2050] livepatch/core: Revert module_enable_ro and module_disable_ro
config: x86_64-randconfig-161-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230511.2940KCeN-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503230511.2940KCeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503230511.2940KCeN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/module/strict_rwx.c:9:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/module/strict_rwx.c:36:6: warning: no previous prototype for function 'module_disable_ro' [-Wmissing-prototypes]
      36 | void module_disable_ro(const struct module *mod)
         |      ^
   kernel/module/strict_rwx.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      36 | void module_disable_ro(const struct module *mod)
         | ^
         | static 
   2 warnings generated.


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
