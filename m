Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE1630F550
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 10:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768647235; cv=none; b=IJq/D/0odbjFL1sXn4r75CaWSTmU27oKPPnbNty3N/mc+V1+PALDdt/+SNeRMCr+dsC6RDVtUc5rCL76mNmY2qidljQqmvYsixbW+q6VFxK0qzHBwoJ4SYjbBVZWoqpXqP/x94fwWt8xfOVR4Z77oeo6HNAwuyYzBAwaWVplsRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768647235; c=relaxed/simple;
	bh=Cb+alO76YWG/SFld9NceL3HOggGee0a2+lP+yGwBke4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pa+5PeQnwNnKOkxE9SmXoZvIkWoq3j/gAAObFgz7LceDG5aKw8LTAMSyE7TV9uLyvAc5lLdxFJEM6fvpYyNR5zsmIY9bMx11vwC1WBJpaebpmtnYOvc8x6ijMdi9s4m61a6qzf6Wcee2fN2+z7JVs/odl3vZ1fN2ALEtxrPSO4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khzxfi17; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khzxfi17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768647234; x=1800183234;
  h=date:from:to:cc:subject:message-id;
  bh=Cb+alO76YWG/SFld9NceL3HOggGee0a2+lP+yGwBke4=;
  b=khzxfi17rz2JG1O++vd+FUrenx0gvpaxJlKQd1QkWBMpfdNu+0L51aHX
   9rJwN2mGgnq/9Hp+k457kIh6Qs0xCix1wlb0o77F0gPBQ21mZEZM0sfML
   5Wtdo63KTnrZ1L9Blo9jVGPIbDEYyTDsBeg8EIr3oSC9K0laT/CgGmyF8
   h0hJVJVHOcuTHfr/ZTa36RkyMnwHWKOwX/e8x+OgpVeSMDNT7XPo7zz35
   Ukxy9z9vVnl7scgWL0P1GIVxmFrdXSLWh6q7O65gK4bAACZNAfT/MMBqN
   luC4lISO5ihaLHcKvWr8KCbbLQiEowlBtWDYkQtbYK3DYY6T+4LWNArYO
   Q==;
X-CSE-ConnectionGUID: 84YJ0LWnSLyyHgPrUH1JGw==
X-CSE-MsgGUID: GY8MM1dYTmOGIInOs9qTmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="92609450"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="92609450"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 02:53:53 -0800
X-CSE-ConnectionGUID: o+Lw5vTpS96FgdrK6GK7dQ==
X-CSE-MsgGUID: jl9IOTXPRLWkE4idb2/AMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205353037"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2026 02:53:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh3wD-00000000Lm8-2TnI;
	Sat, 17 Jan 2026 10:53:49 +0000
Date: Sat, 17 Jan 2026 18:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1]
 drivers/android/binder.c:7389:2: error: call to undeclared function
 'unload_binderfs'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202601171842.FXaePKaa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ba857eb99ec955367580dc1c301b326e13ef6524
commit: 42393aa5693a216b395461b4edcf1ba46526b64e [0/1] ANDROID: binder: support loading both drivers at the same time
config: x86_64-buildonly-randconfig-004-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171842.FXaePKaa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171842.FXaePKaa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171842.FXaePKaa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/android/binder.c:7389:2: error: call to undeclared function 'unload_binderfs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    7389 |         unload_binderfs();
         |         ^
   drivers/android/binder.c:7389:2: note: did you mean 'init_binderfs'?
   drivers/android/binder_internal.h:103:26: note: 'init_binderfs' declared here
     103 | static inline int __init init_binderfs(void)
         |                          ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/unload_binderfs +7389 drivers/android/binder.c

  7385	
  7386	void binder_unload_builtin(void)
  7387	{
  7388		genl_unregister_family(&binder_nl_family);
> 7389		unload_binderfs();
  7390		debugfs_remove_recursive(binder_debugfs_dir_entry_root);
  7391		binder_alloc_shrinker_exit();
  7392		binder_remove_trace_events(THIS_MODULE);
  7393	}
  7394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
