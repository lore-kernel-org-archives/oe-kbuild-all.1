Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC4A25750
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 22:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707951521; cv=none; b=t6C+L6Gvw3Ih59Gfn4iRGT2NUzr/Or3UoFZDG7UjDqAwiIQtCepONKZl2ptRXhniVTcgbA8Sf3bDSaGtFiZ7Pr4fQP34MjBhOFyEFTAfQfz6edWDtgAHUC2yke+w/q7phHCuQym/Ja9PoMrqtezKme0ND6ssxCSsbXNECB7NdEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707951521; c=relaxed/simple;
	bh=PpTCDOO+mbKCg5bD3W2tdwJmp1+AJtz8p3yZ3Bl8r8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRJ8l9UXCC63jrZ7KO3ubTwJncP/rIu4ssKpAzVyb+ySdey80dfWLR+WbT5NaELTRe93AZWW98VMvUjito5E6n+mEuOjOUYOns+WKwFYnjjQH0pyyGVdRSXgZiCP0gsdWNgv6gAJ/zcx/4J72BtLdzoXwTeUEg22ky9liIVmbIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKz0kHun; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKz0kHun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707951520; x=1739487520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PpTCDOO+mbKCg5bD3W2tdwJmp1+AJtz8p3yZ3Bl8r8k=;
  b=oKz0kHunUbi9Fs49RW8ESxHHLdFoDpJWmsbVvIPw3nbP/SyTd7CG6LPv
   /bXjiC6oCjvgPIhMKDYgV7fyxvBuUzuN5rMAjU91d7NaxF2wsLY3U0tBd
   RVQ8ytbpbsFlC4dOEByWaRe7ZE3W0Ivwf/KvnAQb0e6rkp9niaHXSJ1Xd
   XvSBpICyVRhgB03jDyylihxoWd9PHA9sfeoIxLxL2FgkgRPn0lGUNUFrP
   nbBsSGXuIawfyO8f2gZlFy1ZOU5dV7uLz1GbvuCl8IdfKq0LekuoAJrsy
   +SSUHA6svYXkJK8GNss/QnV3bXV9KkPoG3kbud9tUKqxYyYuBY0BmUIHG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2165692"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="2165692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 14:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3631710"
Received: from lkp-server01.sh.intel.com (HELO 323e10984596) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2024 14:58:38 -0800
Received: from kbuild by 323e10984596 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raOD5-0000H0-2S;
	Wed, 14 Feb 2024 22:58:35 +0000
Date: Thu, 15 Feb 2024 06:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-pidfd_fs.v1 18/18] fs/pidfdfs.c:177:32: sparse:
 sparse: symbol 'pidfdfs_dentry_operations' was not declared. Should it be
 static?
Message-ID: <202402150655.lMaPWUXK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-pidfd_fs.v1
head:   48f1b954dad483121e9e096cc8e9c99eec26bb89
commit: 48f1b954dad483121e9e096cc8e9c99eec26bb89 [18/18] pidfd: add pidfdfs
config: x86_64-randconfig-r132-20240214 (https://download.01.org/0day-ci/archive/20240215/202402150655.lMaPWUXK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240215/202402150655.lMaPWUXK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402150655.lMaPWUXK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/pidfdfs.c:177:32: sparse: sparse: symbol 'pidfdfs_dentry_operations' was not declared. Should it be static?
   fs/pidfdfs.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:779:9: sparse: sparse: context imbalance in 'pidfdfs_alloc_file' - different lock contexts for basic block

vim +/pidfdfs_dentry_operations +177 fs/pidfdfs.c

   176	
 > 177	const struct dentry_operations pidfdfs_dentry_operations = {
   178		.d_prune	= pidfdfs_prune_dentry,
   179		.d_delete	= always_delete_dentry,
   180		.d_dname	= pidfdfs_dname,
   181	};
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
