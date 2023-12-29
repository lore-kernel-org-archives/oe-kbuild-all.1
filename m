Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29AE12B90
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 18:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mS4sEjDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703873982; x=1735409982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tTL3L0znAqshbqCLLiDKbgKybMicp5TOgknQusBbzD0=;
  b=mS4sEjDsZn7Qk36QPEezkDl4McQibu6T02PrBhC6WOgMUj21U14Y9lcO
   ZrMmnam0jaYDWca9tzR60h5nEiI2Gk/6rgInRed1++lqC1DFFmmvPCepM
   zWWKfwlHfvkCplMwk9bXFbjGzC2BIOaIm55GfKohbFPqpBYAGd+AUjzQm
   It6faqjOS7l5K/brtbV7aBbYICbk/5Me8D5m0ZGynCACuXrdYurNk5/AB
   CHbTWEZa4uO+wzPx5917F4B/xnBFweyvl0EbjvniZJh7ZCUdfdkTn5u3L
   kvf3Y/8ajCDGJW1xtZwY+0X9yE0ymgHqP8fCbxoFXBMr0KuEelDbKl3+s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="399443912"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="399443912"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 10:19:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="1110227237"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="1110227237"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Dec 2023 10:19:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJHSK-000Hgv-2A;
	Fri, 29 Dec 2023 18:19:36 +0000
Date: Sat, 30 Dec 2023 02:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6546/9925]
 arch/loongarch/include/asm/cmpxchg.h:70:42: sparse: sparse: cast truncates
 bits from constant value (8000000000000000 becomes 0)
Message-ID: <202312300218.jKdzoA8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 4a0d72ea10ce156eb2269358fa38528f62a96081 [6546/9925] afs: Overhaul invalidation handling to better support RO volumes
config: loongarch-randconfig-r122-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300218.jKdzoA8z-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231230/202312300218.jKdzoA8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300218.jKdzoA8z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/afs/callback.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/afs/callback.c: note: in included file (through arch/loongarch/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/loongarch/include/asm/cmpxchg.h:70:42: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
   arch/loongarch/include/asm/cmpxchg.h:73:24: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
   fs/afs/callback.c:146:22: sparse: sparse: context imbalance in 'afs_lookup_volume_rcu' - different lock contexts for basic block
--
   fs/afs/rotate.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   fs/afs/rotate.c: note: in included file (through arch/loongarch/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/loongarch/include/asm/cmpxchg.h:70:42: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
   arch/loongarch/include/asm/cmpxchg.h:73:24: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
   fs/afs/rotate.c:639:42: sparse: sparse: self-comparison always evaluates to true

vim +70 arch/loongarch/include/asm/cmpxchg.h

720dc7ab252bbd Huacai Chen   2022-08-25  63  
ddf502717da029 Huacai Chen   2022-10-12  64  static __always_inline unsigned long
068550631fbe0b Andrzej Hajda 2023-01-18  65  __arch_xchg(volatile void *ptr, unsigned long x, int size)
5b0b14e550a006 Huacai Chen   2022-05-31  66  {
5b0b14e550a006 Huacai Chen   2022-05-31  67  	switch (size) {
720dc7ab252bbd Huacai Chen   2022-08-25  68  	case 1:
720dc7ab252bbd Huacai Chen   2022-08-25  69  	case 2:
720dc7ab252bbd Huacai Chen   2022-08-25 @70  		return __xchg_small(ptr, x, size);
720dc7ab252bbd Huacai Chen   2022-08-25  71  
5b0b14e550a006 Huacai Chen   2022-05-31  72  	case 4:
5b0b14e550a006 Huacai Chen   2022-05-31  73  		return __xchg_asm("amswap_db.w", (volatile u32 *)ptr, (u32)x);
5b0b14e550a006 Huacai Chen   2022-05-31  74  
5b0b14e550a006 Huacai Chen   2022-05-31  75  	case 8:
5b0b14e550a006 Huacai Chen   2022-05-31  76  		return __xchg_asm("amswap_db.d", (volatile u64 *)ptr, (u64)x);
5b0b14e550a006 Huacai Chen   2022-05-31  77  
5b0b14e550a006 Huacai Chen   2022-05-31  78  	default:
5b0b14e550a006 Huacai Chen   2022-05-31  79  		BUILD_BUG();
5b0b14e550a006 Huacai Chen   2022-05-31  80  	}
5b0b14e550a006 Huacai Chen   2022-05-31  81  
5b0b14e550a006 Huacai Chen   2022-05-31  82  	return 0;
5b0b14e550a006 Huacai Chen   2022-05-31  83  }
5b0b14e550a006 Huacai Chen   2022-05-31  84  

:::::: The code at line 70 was first introduced by commit
:::::: 720dc7ab252bbdf404cab7b909e26b31e602bf7e LoongArch: Add subword xchg/cmpxchg emulation

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
