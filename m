Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8693D1712
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176271; cv=none; b=jHiiT06NjPpPkp55JnwgwN17MIXKhxBFappX+Hg8ZyVyDIRzAoDk7M7GUlYpbReikyyr3LeBPrTRVmkwcjow35Ett4ucrA+5wggDNQxyVgz84BEGHC6RC69doUe/augnEp9X0vqK25r5K22aLjfuLGMTGyOoJcA0buCBf4dd0dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176271; c=relaxed/simple;
	bh=afauFxXXIJQRzb1fUYQ2vdVZF/2OWooHy963qDa8Ia4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NEAGGrfwGC+DA0yCCFtl4G4scXBjT7rl64yUvlSKnl4cXrlbT6vfsyD5aYhHlXp44Rl+Kxl17OuFvxqP200aoCBdPeiEu+mbNXEjuxTeUK08qkwzagONMkON8SvXy67ZANThsWmnrnWK6rtwNavOKfWTffu5YrbYxkQyECpE9jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTIcUQOL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTIcUQOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779176269; x=1810712269;
  h=date:from:to:cc:subject:message-id;
  bh=afauFxXXIJQRzb1fUYQ2vdVZF/2OWooHy963qDa8Ia4=;
  b=lTIcUQOLiAGw26euTR5BvFVgLZ5PMWFQ0GYYNRRzispZy+ylgBuuE+2f
   IuOzHkD0NID64T/yzfBUeL7SASGrdSbu6a8GUsCDfi49hvfPrim74w1k+
   1XeJr+hndF8tCYtreeX9AxubjU++6QeEmu7jML9uxI8ta6RHF/5cKCOeg
   XKzhFOhmxne0AaKgTTf+5eIb9ne7kmy3+eGKzJzxqp0mqnD8T40Ei5m3m
   o6wLw/Xo4o9e/Yqx4CvYjO435I+4GBk7dV9SyuZD7hggkAsMlrL3VAU3t
   ohBCK0QgMFw54/ux9jS8N/vZdI4yXFtvG57aslOOpSoNhAva5ye4jw7MH
   w==;
X-CSE-ConnectionGUID: AabvLddDT7qib7tmxNqfAQ==
X-CSE-MsgGUID: g93PmV7ITw6lfPZedwlphw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80165695"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80165695"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 00:37:49 -0700
X-CSE-ConnectionGUID: c0scUyuMTdm0ixs6YP5h+A==
X-CSE-MsgGUID: 0/ZjiZE5RuuIr62awDeMeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="277800582"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 May 2026 00:37:48 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPF0x-000000000ev-3kHx;
	Tue, 19 May 2026 07:37:27 +0000
Date: Tue, 19 May 2026 15:37:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.1 117/238]
 arch/powerpc/platforms/cell/spufs/inode.c:40:12: warning: variable
 'isolated_loader_size' set but not used
Message-ID: <202605191540.nxSw7ZYK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.1
head:   cf8f69ff9142effba4d8d9a70a1a4f275044376c
commit: 6b3f461e4a660c831a2e3d9cefcae736f57a710f [117/238] powerpc/spufs: replace __get_free_pages() with kmalloc()
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20260519/202605191540.nxSw7ZYK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191540.nxSw7ZYK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191540.nxSw7ZYK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/cell/spufs/inode.c:40:12: warning: variable 'isolated_loader_size' set but not used [-Wunused-but-set-global]
      40 | static int isolated_loader_size;
         |            ^
   1 warning generated.


vim +/isolated_loader_size +40 arch/powerpc/platforms/cell/spufs/inode.c

2c3e47871d18f93b Jeremy Kerr       2008-07-03  37  
e18b890bb0881bba Christoph Lameter 2006-12-06  38  static struct kmem_cache *spufs_inode_cache;
c6730ed4c280ff9e Jeremy Kerr       2006-11-20  39  char *isolated_loader;
8b0d3121a0b2cf91 Sebastian Siewior 2007-09-19 @40  static int isolated_loader_size;
67207b9664a8d603 Arnd Bergmann     2005-11-15  41  

:::::: The code at line 40 was first introduced by commit
:::::: 8b0d3121a0b2cf91768ecef635e241b6abc3f1da [POWERPC] spufs: Make isolated loader properly aligned

:::::: TO: Sebastian Siewior <cbe-oss-dev@ml.breakpoint.cc>
:::::: CC: Paul Mackerras <paulus@samba.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
