Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA518D640
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728471352; cv=none; b=jXpuv0o2LS+DQv6CBG0JIlAkO//S+NvKunV25wPgL2U8L1mquR+dpsFClEDCE/Vp9kyqHLZnLD4W9b3sVqhaTcmmxQJxuDB260xA0hrpOA3Tem3ciD4ysUuwBVuSeR9MdhPsGXCVxoYBdfAdp39lwMnReRee3cPTveLOxf9LvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728471352; c=relaxed/simple;
	bh=C2TeUgx+d8F/50U0E6Y8GAzLQQVkwbLWZqF8Gx1Z+hM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ONXjnxEFOYc5AAPZd/tlzDkYxtj6MxrNQD3L20H4XbCUpEDPCMV6ZMJrqpcZHNLXeNzwxBslCknAFHIkzakUeDeMZqboX/ivMtHuifIrl/peej7Zk94x9G6sIe+Yjxq1qw8D6OfZ+vgpzh7CKMFBdzEsTj+HTxEFjRPPDUIqPe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpctIB7E; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpctIB7E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728471350; x=1760007350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C2TeUgx+d8F/50U0E6Y8GAzLQQVkwbLWZqF8Gx1Z+hM=;
  b=TpctIB7E640uxfzJy7nLJVM2Dys5mxnq7kmSwCXAypdb/alU3By3obuO
   I4EgjWsu00aCL5g2l9FSDxOcFQGNn1+VGj64fCa24ClzSMCifJLsRXcv3
   pK7p0D2aCWIicy8drl0ogiWL3pXMi5jGMEqi1M+4QJ9D9uORsnmNijJj6
   uw++Wl36N9IKV+gYhletPZacbPnW6sstvLKM+lA/ZxN5PKrHtE9jBKLuN
   Arpr79tiUWVsnwVrQsoxHzDr+lg+7CIJJtKSNoZNl1ylq4shvsu/meCAt
   kiB96zVm799OZffYYpR9EL9v8r9VWg7xbq1tc17Uk27IdkKq6z7Nc9CbT
   w==;
X-CSE-ConnectionGUID: YfBZLC4dRfy0jQ//Uvs2Ng==
X-CSE-MsgGUID: D5lAQDfbTeCnXHKSAXlgfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38349941"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="38349941"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 03:55:49 -0700
X-CSE-ConnectionGUID: Ul+U2hUWRkaZ1CumrFFlTw==
X-CSE-MsgGUID: f8BcBraPTdSx+D4BOvNk8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80722225"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2024 03:55:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syUM6-00097w-0Y;
	Wed, 09 Oct 2024 10:55:46 +0000
Date: Wed, 9 Oct 2024 18:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:brauner.file.file_ref 2/4]
 arch/loongarch/include/asm/cmpxchg.h:168:50: sparse: sparse: cast truncates
 bits from constant value (e000000000000000 becomes 0)
Message-ID: <202410091842.jRYfPO3h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git brauner.file.file_ref
head:   072dfe12c3697eb822f81205ae1454896215d3cf
commit: 947c3d13e57f7abbc240d0d354049e4882ea2c3f [2/4] fs: add file_ref
config: loongarch-randconfig-r111-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091842.jRYfPO3h-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410091842.jRYfPO3h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410091842.jRYfPO3h-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/file.c:486:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:486:17: sparse:     expected struct file **old_fds
   fs/file.c:486:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:487:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:487:17: sparse:     expected struct file **new_fds
   fs/file.c:487:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:502:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:502:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:502:17: sparse:    struct file *
   fs/file.c:537:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] __res @@
   fs/file.c:577:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:760:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:950:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:971:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:975:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic64_t [usertype] *v @@     got struct atomic64_t [noderef] __rcu * @@
   fs/file.c:978:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file_reloaded @@     got struct file * @@
   fs/file.c:1001:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file_reloaded @@
   fs/file.c:1003:14: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1024:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1026:32: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *file @@
   fs/file.c:1048:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct file [noderef] __rcu **f @@     got struct file **f @@
   fs/file.c:1048:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file [noderef] __rcu *file @@     got struct file * @@
   fs/file.c:1052:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct file * @@     got struct file [noderef] __rcu *[assigned] file @@
   fs/file.c:1354:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@
   fs/file.c: note: in included file (through arch/loongarch/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/loongarch/include/asm/cmpxchg.h:168:50: sparse: sparse: cast truncates bits from constant value (e000000000000000 becomes 0)

vim +168 arch/loongarch/include/asm/cmpxchg.h

720dc7ab252bbd Huacai Chen 2022-08-25  161  
ddf502717da029 Huacai Chen 2022-10-12  162  static __always_inline unsigned long
ddf502717da029 Huacai Chen 2022-10-12  163  __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, unsigned int size)
5b0b14e550a006 Huacai Chen 2022-05-31  164  {
5b0b14e550a006 Huacai Chen 2022-05-31  165  	switch (size) {
720dc7ab252bbd Huacai Chen 2022-08-25  166  	case 1:
720dc7ab252bbd Huacai Chen 2022-08-25  167  	case 2:
720dc7ab252bbd Huacai Chen 2022-08-25 @168  		return __cmpxchg_small(ptr, old, new, size);
720dc7ab252bbd Huacai Chen 2022-08-25  169  
5b0b14e550a006 Huacai Chen 2022-05-31  170  	case 4:
5b0b14e550a006 Huacai Chen 2022-05-31  171  		return __cmpxchg_asm("ll.w", "sc.w", (volatile u32 *)ptr,
5b0b14e550a006 Huacai Chen 2022-05-31  172  				     (u32)old, new);
5b0b14e550a006 Huacai Chen 2022-05-31  173  
5b0b14e550a006 Huacai Chen 2022-05-31  174  	case 8:
5b0b14e550a006 Huacai Chen 2022-05-31  175  		return __cmpxchg_asm("ll.d", "sc.d", (volatile u64 *)ptr,
5b0b14e550a006 Huacai Chen 2022-05-31  176  				     (u64)old, new);
5b0b14e550a006 Huacai Chen 2022-05-31  177  
5b0b14e550a006 Huacai Chen 2022-05-31  178  	default:
5b0b14e550a006 Huacai Chen 2022-05-31  179  		BUILD_BUG();
5b0b14e550a006 Huacai Chen 2022-05-31  180  	}
5b0b14e550a006 Huacai Chen 2022-05-31  181  
5b0b14e550a006 Huacai Chen 2022-05-31  182  	return 0;
5b0b14e550a006 Huacai Chen 2022-05-31  183  }
5b0b14e550a006 Huacai Chen 2022-05-31  184  

:::::: The code at line 168 was first introduced by commit
:::::: 720dc7ab252bbdf404cab7b909e26b31e602bf7e LoongArch: Add subword xchg/cmpxchg emulation

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
