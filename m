Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69F04204B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 08:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730016302; cv=none; b=PCdMF4wY221cI0mmNRI0AfjMtHCtjHhVlzapB6/Lza+XbmoUHHHdetcxyVGl8wfxbb0LRoc3oFcZUdaonz3OdvGgUaedfxsdnMER/e7fGHx7XeEFO5QxeDIp10qGVfVhg6hWKigsAm3F9FFWMn9khowangcYT4YXyqAwgtfz2mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730016302; c=relaxed/simple;
	bh=J+T+n7inKapu5aC689clTpWSBFWfHk0wsks7SJDDLHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YAMPTKGBv3l7riJLQbEBku2JaG7cIJ9tEfP5cl1pVF0QI0fulCE57O+r5silrKK3hiwBh2/LoKbgNhrRkSaq/Liw3vcB6KQ2GKJJppwOhN5+JdsYie7+eKfF7+AKOK0L9kzIIE4DNKJ3dx99HsV2l4D/On62+Cpye1rcsDskzlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LF8mwl+s; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LF8mwl+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730016299; x=1761552299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+T+n7inKapu5aC689clTpWSBFWfHk0wsks7SJDDLHE=;
  b=LF8mwl+sv6+BtICLtTbQfgZhpsWb+mGaxkKAKBd5pAK1QEJj5bt4RoyD
   UpZ/6UCdP+p+y0mLz1OTuD/UUDChUU6Vs+sYpb/33ljdo/Rb2V3PY3mdM
   ZB+xgjRL1grAZD6u14WnsAiba3KWnWYeLJfL8J8qE/607i5xMfHJEDPp7
   WNCJ7Nh194p0uztt6tgjFjdSNei8V4PBBCAMtImUKAGEgUF1n9aeCYCvi
   D0bSOX+Noj463fe/ZWMQ1vAA1//u+xAcYVYoIbev6GUJCPHU/0ZVjMTeC
   8Cch1Na0NsCHZclduL8vhooKC8meep2uTuiwE3+7JMisR7Tn1kWVfs4Hp
   g==;
X-CSE-ConnectionGUID: Dsck81F0THu9bZnm/EETMw==
X-CSE-MsgGUID: u7aHgk8GR8eVmQBvVU5Wqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="33435857"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="33435857"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 01:04:59 -0700
X-CSE-ConnectionGUID: mALzJcykTviHxwuifjv7kA==
X-CSE-MsgGUID: hKbj7UUBQHK5m5Fiw1haSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="118789291"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Oct 2024 01:04:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4yGd-000aVw-2i;
	Sun, 27 Oct 2024 08:04:55 +0000
Date: Sun, 27 Oct 2024 16:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/loongarch/include/asm/cmpxchg.h:70:42: sparse: sparse: cast
 truncates bits from constant value (8000000000000000 becomes 0)
Message-ID: <202410271522.2slPqExV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   850925a8133c73c4a2453c360b2c3beb3bab67c9
commit: 453924de6212ac159f946b75c6b59918e2e30944 afs: Overhaul invalidation handling to better support RO volumes
date:   10 months ago
config: loongarch-randconfig-r133-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271522.2slPqExV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241027/202410271522.2slPqExV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271522.2slPqExV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/afs/callback.c: note: in included file (through arch/loongarch/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/loongarch/include/asm/cmpxchg.h:70:42: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
   arch/loongarch/include/asm/cmpxchg.h:73:24: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
   fs/afs/callback.c:146:22: sparse: sparse: context imbalance in 'afs_lookup_volume_rcu' - different lock contexts for basic block
--
   fs/afs/rotate.c: note: in included file (through arch/loongarch/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/loongarch/include/asm/cmpxchg.h:70:42: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
   arch/loongarch/include/asm/cmpxchg.h:73:24: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)

vim +70 arch/loongarch/include/asm/cmpxchg.h

720dc7ab252bbdf Huacai Chen   2022-08-25  63  
ddf502717da029c Huacai Chen   2022-10-12  64  static __always_inline unsigned long
068550631fbe0b7 Andrzej Hajda 2023-01-18  65  __arch_xchg(volatile void *ptr, unsigned long x, int size)
5b0b14e550a006b Huacai Chen   2022-05-31  66  {
5b0b14e550a006b Huacai Chen   2022-05-31  67  	switch (size) {
720dc7ab252bbdf Huacai Chen   2022-08-25  68  	case 1:
720dc7ab252bbdf Huacai Chen   2022-08-25  69  	case 2:
720dc7ab252bbdf Huacai Chen   2022-08-25 @70  		return __xchg_small(ptr, x, size);
720dc7ab252bbdf Huacai Chen   2022-08-25  71  
5b0b14e550a006b Huacai Chen   2022-05-31  72  	case 4:
5b0b14e550a006b Huacai Chen   2022-05-31  73  		return __xchg_asm("amswap_db.w", (volatile u32 *)ptr, (u32)x);
5b0b14e550a006b Huacai Chen   2022-05-31  74  
5b0b14e550a006b Huacai Chen   2022-05-31  75  	case 8:
5b0b14e550a006b Huacai Chen   2022-05-31  76  		return __xchg_asm("amswap_db.d", (volatile u64 *)ptr, (u64)x);
5b0b14e550a006b Huacai Chen   2022-05-31  77  
5b0b14e550a006b Huacai Chen   2022-05-31  78  	default:
5b0b14e550a006b Huacai Chen   2022-05-31  79  		BUILD_BUG();
5b0b14e550a006b Huacai Chen   2022-05-31  80  	}
5b0b14e550a006b Huacai Chen   2022-05-31  81  
5b0b14e550a006b Huacai Chen   2022-05-31  82  	return 0;
5b0b14e550a006b Huacai Chen   2022-05-31  83  }
5b0b14e550a006b Huacai Chen   2022-05-31  84  

:::::: The code at line 70 was first introduced by commit
:::::: 720dc7ab252bbdf404cab7b909e26b31e602bf7e LoongArch: Add subword xchg/cmpxchg emulation

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
