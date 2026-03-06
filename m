Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1EB33F581
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812437; cv=none; b=gS4K2Viam1amWKmeDNQ/burW3UC34URHbJkm4JBlYoQ7imJeQrBU8Pu53n8+7RD3CHOu6BtnB/GPsrmkjC9YEyhhzExi0jd5bjVA07GietPqLFFD9QSmx84WrPuHPn5lLvsZKdWjv/5/rCSRWhUd+zKbUwx8iqUeIVk27zPkGrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812437; c=relaxed/simple;
	bh=VduVTnRv2wVv4lsKOYVKDUsqVwm1MCIpIougmauMuxQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ku6caT6bsrfyfTie94dVfiuAOuRJzb++4i+50OzyuE2YG9+3NFNklHuOaqNpKOG6xyFgmJYXff1f88ZIFrQG42eLqHL7riFsKaWe4YOI5yUqyrbMhc31dHE2M8HAK6+yUSsv2x7hD0HZd64cAt0l83x6dQzQdjEzY0KVw+3sSMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPTiKdih; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPTiKdih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772812434; x=1804348434;
  h=date:from:to:cc:subject:message-id;
  bh=VduVTnRv2wVv4lsKOYVKDUsqVwm1MCIpIougmauMuxQ=;
  b=YPTiKdih3gi0TIj1/ylX82zV3b9Zj3yRQG/3hP5QuSsH/vRyT7pLH19q
   2ehUPyxB/L1gwxRVUC2IHOmtAAbSI4GoCh45QXkQm2zm0N3J2HZztcvIG
   qYi79+rRpQZ4JGhgm+vidi23QWoH3KS7UB9ZoyxghrG5rtJeGu+Fgy4Mq
   wTZNeKwnVMAz1J5OJOHsXY5uYjcgQHMrNsFYFdjlmSL7smbzEp2/AVGwg
   v5Et9rVrVONGoma1tfzIp8PQ0Zh+S1JKNhSLcsNKQwRzBETqql8U4I24y
   Q2DxemOwk2x921Rmo/7A+T9lAxSly91QuWWH35tDO71ClPAhec8Q5xTmT
   g==;
X-CSE-ConnectionGUID: qZDUh2KBSziUbIRNK1Dl9Q==
X-CSE-MsgGUID: aLXq6XhRTRyVQ8aXYiDUaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84634659"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84634659"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:53:54 -0800
X-CSE-ConnectionGUID: Gps25Pz2QQ2YJfqq28v0kg==
X-CSE-MsgGUID: Xlo0v1jjTP+YXnKeq0t0EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="256969991"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2026 07:53:52 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyXUr-0000000010n-2uny;
	Fri, 06 Mar 2026 15:53:49 +0000
Date: Fri, 06 Mar 2026 23:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-for-next 2/13]
 include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument
 1 (different base types)
Message-ID: <202603062334.wgI5htP0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux block-for-next
head:   d4a80ed9d3c8754e002fede1d94828bbe2041f7b
commit: 6cea1699043f5f9a0be022a9bbc8ad29f561e5b3 [2/13] block: Make the lock context annotations compatible with Clang
config: riscv-randconfig-r132-20260306 (https://download.01.org/0day-ci/archive/20260306/202603062334.wgI5htP0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603062334.wgI5htP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603062334.wgI5htP0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
   block/blk-ioc.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:331:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:325:37: sparse:  the previous one is here
   block/blk-ioc.c: note: in included file (through include/linux/fs.h, include/linux/compat.h, arch/riscv/include/asm/elf.h, ...):
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *
--
   WARNING: invalid argument to '-march': '_zacas_zabha'
   block/blk-cgroup.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:331:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:325:37: sparse:  the previous one is here
   block/blk-cgroup.c: note: in included file (through include/linux/iocontext.h, include/linux/ioprio.h):
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *
>> include/linux/radix-tree.h:260:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   include/linux/radix-tree.h:260:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   include/linux/radix-tree.h:260:9: sparse:     got struct local_lock [noderef] __percpu *

vim +260 include/linux/radix-tree.h

^1da177e4c3f41 Linus Torvalds            2005-04-16  257  
^1da177e4c3f41 Linus Torvalds            2005-04-16  258  static inline void radix_tree_preload_end(void)
^1da177e4c3f41 Linus Torvalds            2005-04-16  259  {
cfa6705d89b656 Sebastian Andrzej Siewior 2020-05-27 @260  	local_unlock(&radix_tree_preloads.lock);
^1da177e4c3f41 Linus Torvalds            2005-04-16  261  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  262  

:::::: The code at line 260 was first introduced by commit
:::::: cfa6705d89b6562f79c40c249f8d94073c4276e4 radix-tree: Use local_lock for protection

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
