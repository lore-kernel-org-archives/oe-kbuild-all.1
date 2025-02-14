Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA307267389
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739547820; cv=none; b=OrbwjH4I+2YnATijqBK529lrcofQtpvFLNQ/OiEO0DNK+eJMOtG05LiOnjcUpeADMkNvbIizRDjpAFdAWwHjPcwuJE0PY/vPS5oOxOwzDkGQpdzTGDDyNCTJ2j89ZH46kjH2k4mog7HBitkVfqO/kJ1JXz0tq/YB++sySIpCrjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739547820; c=relaxed/simple;
	bh=mJEUXJp9GTgYNYCOlO0YtcICfsALWdGWjVP81BY2Ymg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=THkKT8kbuJrx2dUijulVAX0mu72RL5iJhvGdXGjPGH6RVsviBn/RhThWk4ss2YBPMu+IIbUmTNDOO0oSK1GhA7qDm3SRP4LgveviluiL96/SKlBJ/WZZ3Q10qPntnbn6h40Uwo1nKK2QdRMkx2XXJCZkd582E+tht3mX3LA5uRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2y17KN6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2y17KN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739547819; x=1771083819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJEUXJp9GTgYNYCOlO0YtcICfsALWdGWjVP81BY2Ymg=;
  b=N2y17KN6+bEZF99ehiBXd8JAPBFiGj5TfOaHnLPkWZXRdtM46/G3vt63
   sUlNkaEGapj8v/tuDFyETEWNHmT9D03Rybk+AiM3MVM6Gk4CyPyv2gnFr
   MCBl/RCsat3IQZqripaVUYbwHAzfSZARqZqChslxuhbxEThQJLBcIEM9n
   fjZlHED5TAHx+n4+7VtRnQlJt+vpTc/1K2JEY0NsHv7TPsv4jtOp4vhPN
   6fHI/0D+AkMcF3K25m8QeZZg2VcuDscGjf1KrL+f2ts7OadwJ6wuzQVKa
   BBUKsCy/tpqNljj7i7C5hztzTYtbMYFc8GMG3GUx5lbiRJlpmsjqoWuSq
   A==;
X-CSE-ConnectionGUID: CwL+bNWoTLGWmZ9OW9whng==
X-CSE-MsgGUID: qMCKgxK1SzSJkRGkKzS7/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40225768"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40225768"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 07:43:36 -0800
X-CSE-ConnectionGUID: W19D3CxNRTC0JSq8xeiSew==
X-CSE-MsgGUID: RYW+emXcRs6JFk7tt9XdPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113685189"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 07:43:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tixqm-0019nZ-3C;
	Fri, 14 Feb 2025 15:43:32 +0000
Date: Fri, 14 Feb 2025 23:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/91] mm/swapfile.c:102:26:
 warning: no previous prototype for function 'swap_type_to_swap_info'
Message-ID: <202502142315.uV8KuDWW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bing,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   d54a4869d416b5e3beebfa0e94bc0e2cd7568737
commit: 4506bcbba5ec78d8d694fbb43e964cfefe900887 [0/91] ANDROID: mm: export swap_type_to_swap_info
config: x86_64-buildonly-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142315.uV8KuDWW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142315.uV8KuDWW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142315.uV8KuDWW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/swapfile.c:9:
   In file included from include/linux/mm.h:1593:
   include/linux/vmstat.h:431:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     431 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/swapfile.c:102:26: warning: no previous prototype for function 'swap_type_to_swap_info' [-Wmissing-prototypes]
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         |                          ^
   mm/swapfile.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | struct swap_info_struct *swap_type_to_swap_info(int type)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +/swap_type_to_swap_info +102 mm/swapfile.c

   101	
 > 102	struct swap_info_struct *swap_type_to_swap_info(int type)
   103	{
   104		if (type >= READ_ONCE(nr_swapfiles))
   105			return NULL;
   106	
   107		smp_rmb();	/* Pairs with smp_wmb in alloc_swap_info. */
   108		return READ_ONCE(swap_info[type]);
   109	}
   110	EXPORT_SYMBOL_GPL(swap_type_to_swap_info);
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
