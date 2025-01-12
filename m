Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA0101E6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 04:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736654985; cv=none; b=LGRNvb6dM5Mw9t0FyHP5hRC84zy6A6s9ydDZ9guEsZP6KyxJ7jK5y+W0zXlcuQNq3N7jThSYBlf45ZGI8Hsd8KWH3f20ZGunylb8BWzFySoGQaifElXz7Tqm2wJP+DBUC4GhBhedYMJYMOO1YXiCKAQ8Hhg0UC4TEiVOqOfSxTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736654985; c=relaxed/simple;
	bh=Z6v3ZkO8TkdBDggSHl2PjWnCGatNaUdsKUB47xaHmdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zfl1Hg899SklEFgFQo6sXtoqImyNUMrWqNt6wryXbcNXgucemEtrTs1o69v4rLoCfPuRrivyglyFRx+Xqyn4iohcTrJGb/Dce9yx+DJEy2IgSvEUOw6Kxmk3NUmpV4umIcXIdBOxmDq7XhShyhnvy/ram0GbEskbc1iFXV2FV7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4/R9qOt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4/R9qOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736654983; x=1768190983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6v3ZkO8TkdBDggSHl2PjWnCGatNaUdsKUB47xaHmdo=;
  b=N4/R9qOtoI1WnTBz11Kq7APN1lD+VRaRKzOvB7zev4a8+nVmXtZIsxXd
   84LXExBrwAif97mSFQAni7muPdm5FbQQ0jX1PyG0eQ0KTxWwXFf9WBnnX
   g3aBQRQWZMmVWJ9ZlCf/NhylutHbbGG7/uSHLo0EJVQBZ/BoTw24Z/Ie4
   FUztXsT50RbcuUfmgGb8j/JrsgyIf1ooC+tdp16uK4yPTUM3oVzWHYfPA
   2SJff0MckIR2142lk5w5xPKRJsK287tGSVXhkvwWMWM4wx5ZLv5UYPaOg
   3uU/1UWIm5vGP2kBmwFhDfdJLgF0AijLmZqjBvxrs00gXxUX2Ycu7C6X6
   Q==;
X-CSE-ConnectionGUID: hqIefIfzSp+ViR4UJLW0dQ==
X-CSE-MsgGUID: mX/Z/PS7Q8+I5SLq0YdaSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="48277732"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="48277732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 20:09:43 -0800
X-CSE-ConnectionGUID: TOJ1jBTsRUemDyKDFRQLdg==
X-CSE-MsgGUID: gfvSEkWAQ8WbGAT1758Iyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108155323"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jan 2025 20:09:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWpIB-000LYz-1m;
	Sun, 12 Jan 2025 04:09:39 +0000
Date: Sun, 12 Jan 2025 12:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/mips/include/asm/cmpxchg.h:79:24: sparse: sparse: cast
 truncates bits from constant value (8000000000000000 becomes 0)
Message-ID: <202501121223.KuJ3vwbu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b62cef9a5c673f1b8083159f5dc03c1c5daced2f
commit: 453924de6212ac159f946b75c6b59918e2e30944 afs: Overhaul invalidation handling to better support RO volumes
date:   1 year ago
config: mips-randconfig-r121-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121223.KuJ3vwbu-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250112/202501121223.KuJ3vwbu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121223.KuJ3vwbu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/afs/rotate.c: note: in included file (through arch/mips/include/asm/atomic.h, include/linux/atomic.h, arch/mips/include/asm/processor.h, ...):
>> arch/mips/include/asm/cmpxchg.h:79:24: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
--
   fs/afs/callback.c: note: in included file (through arch/mips/include/asm/atomic.h, include/linux/atomic.h, include/linux/cpumask.h, ...):
>> arch/mips/include/asm/cmpxchg.h:79:24: sparse: sparse: cast truncates bits from constant value (8000000000000000 becomes 0)
   fs/afs/callback.c:146:22: sparse: sparse: context imbalance in 'afs_lookup_volume_rcu' - different lock contexts for basic block

vim +79 arch/mips/include/asm/cmpxchg.h

5154f3b4194910 Paul Burton         2017-06-09  66  
b70eb30056dc84 Paul Burton         2017-06-09  67  extern unsigned long __xchg_small(volatile void *ptr, unsigned long val,
b70eb30056dc84 Paul Burton         2017-06-09  68  				  unsigned int size);
b70eb30056dc84 Paul Burton         2017-06-09  69  
46f1619500d022 Thomas Bogendoerfer 2019-10-09  70  static __always_inline
068550631fbe0b Andrzej Hajda       2023-01-18  71  unsigned long __arch_xchg(volatile void *ptr, unsigned long x, int size)
b81947c646bfef David Howells       2012-03-28  72  {
b81947c646bfef David Howells       2012-03-28  73  	switch (size) {
b70eb30056dc84 Paul Burton         2017-06-09  74  	case 1:
b70eb30056dc84 Paul Burton         2017-06-09  75  	case 2:
b70eb30056dc84 Paul Burton         2017-06-09  76  		return __xchg_small(ptr, x, size);
b70eb30056dc84 Paul Burton         2017-06-09  77  
b81947c646bfef David Howells       2012-03-28  78  	case 4:
62c6081dca75d6 Paul Burton         2017-06-09 @79  		return __xchg_asm("ll", "sc", (volatile u32 *)ptr, x);
62c6081dca75d6 Paul Burton         2017-06-09  80  
b81947c646bfef David Howells       2012-03-28  81  	case 8:
62c6081dca75d6 Paul Burton         2017-06-09  82  		if (!IS_ENABLED(CONFIG_64BIT))
62c6081dca75d6 Paul Burton         2017-06-09  83  			return __xchg_called_with_bad_pointer();
62c6081dca75d6 Paul Burton         2017-06-09  84  
62c6081dca75d6 Paul Burton         2017-06-09  85  		return __xchg_asm("lld", "scd", (volatile u64 *)ptr, x);
62c6081dca75d6 Paul Burton         2017-06-09  86  
d15dc68c1143e2 Paul Burton         2017-06-09  87  	default:
d15dc68c1143e2 Paul Burton         2017-06-09  88  		return __xchg_called_with_bad_pointer();
b81947c646bfef David Howells       2012-03-28  89  	}
b81947c646bfef David Howells       2012-03-28  90  }
b81947c646bfef David Howells       2012-03-28  91  

:::::: The code at line 79 was first introduced by commit
:::::: 62c6081dca75d6bec1198ed5a1ae50968b323a8c MIPS: cmpxchg: Drop __xchg_u{32,64} functions

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
