Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4B2F3C22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 12:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771504594; cv=none; b=nUZNim2dk6Xs4/Tn0aj9DepaSMZ52oSRQE3zhmxrGjgohyRUuTqgcWZ3hwHtTBD3K4w52aKUPi1ji64ZHvMbowkOkpk5u8Cl3gkX9KtG9pkKrRMBbvAoNM7wMTq/iCITlVZWxQ6nf4mRCFpCKiKtZenfSCAYfLoGr/q77mWMPPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771504594; c=relaxed/simple;
	bh=Q0bHFLHRVhvvvwwVNjF1eu1UOctJBHHKxKTNYjQSmbI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=piZ9W6VPAQOa8ZGmkG9rdnYn4XVHNYj63RUuhRsXraJ/x78EhUgs4JKhQPHpDkEQMEm6weFcglS8+W9X/dGuEGu4nPLGofNwWUZyqNX405IGVz8/8nKcHmqI3o5rnMiW98+gI6B72HLQG6CJdgwUp8t/GrucbPJQeKxFKs6dSGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8wgsyeE; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8wgsyeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771504593; x=1803040593;
  h=date:from:to:cc:subject:message-id;
  bh=Q0bHFLHRVhvvvwwVNjF1eu1UOctJBHHKxKTNYjQSmbI=;
  b=L8wgsyeEKlijtS8AYVDmVFxlwjB/ZXuEM5cF0XOUitBX1MP8heE8v6st
   ABJ+59Vgqe1OMgqb9svD2a64bYthM5PD/G3HFSPuVUhG/wslyR0PcCDXE
   6Y2UHp0rZw9LTMT37sf6A5UuiOJue0iQErCyIInMGygnp59JvhmLViDH7
   3lCKHqABVBwOOwMqaG0Jnj5+sqwCQ6qwq6aUXL1HBTODuBwgDTMYwTKlo
   c2WuAuSh56DTtwHo4V5RB7OXJz5RJZiFLqbo3aWys3Rzp98nU3RMP6Pqj
   kXclBvxdCz1IRQ1XIT06zG0eqm8Kxd2ab51OAWOhxfjXKe4N2QflyBpVg
   Q==;
X-CSE-ConnectionGUID: 85PEVBk1QoWD+MXiTW8zAg==
X-CSE-MsgGUID: lvIrn9IqS9ucbC4RTPvMgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72685535"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72685535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 04:36:32 -0800
X-CSE-ConnectionGUID: ASPfYxgtTayJJQ9CYipOEA==
X-CSE-MsgGUID: iKDiOxShTpyHy8JpIHLt3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="252204949"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Feb 2026 04:36:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt3Ge-000000013BA-2qHm;
	Thu, 19 Feb 2026 12:36:28 +0000
Date: Thu, 19 Feb 2026 20:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xor-improvements 10/26]
 lib/raid/xor/xor-core.c:64:undefined reference to `xor_block_8regs_p'
Message-ID: <202602192029.tNHwVsL3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git xor-improvements
head:   2f049c62469371a286e933b1a316b38d3fdac4da
commit: 35ac177a76b4cc8fb9169d53c93910c9a9315d28 [10/26] xor: only build the generic prefetching code if prefetching is supported
config: um-randconfig-002-20260219 (https://download.01.org/0day-ci/archive/20260219/202602192029.tNHwVsL3-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602192029.tNHwVsL3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602192029.tNHwVsL3-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: lib/raid/xor/xor-core.o: in function `xor_init':
>> lib/raid/xor/xor-core.c:64:(.init.text+0x1b8): undefined reference to `xor_block_8regs_p'
>> /usr/bin/ld: lib/raid/xor/xor-core.c:64:(.init.text+0x1c6): undefined reference to `xor_block_8regs_p'
>> /usr/bin/ld: lib/raid/xor/xor-core.c:64:(.init.text+0x1cc): undefined reference to `xor_block_32regs_p'
   /usr/bin/ld: lib/raid/xor/xor-core.c:64:(.init.text+0x1d5): undefined reference to `xor_block_32regs_p'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +64 lib/raid/xor/xor-core.c

^1da177e4c3f41 drivers/md/xor.c        Linus Torvalds    2005-04-16  53  
11dc593223d6aa lib/raid/xor/xor-core.c Christoph Hellwig 2026-02-16  54  /**
11dc593223d6aa lib/raid/xor/xor-core.c Christoph Hellwig 2026-02-16  55   * xor_register - register a XOR template
11dc593223d6aa lib/raid/xor/xor-core.c Christoph Hellwig 2026-02-16  56   * @tmpl:	template to register
11dc593223d6aa lib/raid/xor/xor-core.c Christoph Hellwig 2026-02-16  57   *
11dc593223d6aa lib/raid/xor/xor-core.c Christoph Hellwig 2026-02-16  58   * Register a XOR implementation with the core.  Registered implementations
11dc593223d6aa lib/raid/xor/xor-core.c Christoph Hellwig 2026-02-16  59   * will be measured by a trivial benchmark, and the fastest one is chosen
11dc593223d6aa lib/raid/xor/xor-core.c Christoph Hellwig 2026-02-16  60   * unless an implementation is forced using xor_force().
11dc593223d6aa lib/raid/xor/xor-core.c Christoph Hellwig 2026-02-16  61   */
11dc593223d6aa lib/raid/xor/xor-core.c Christoph Hellwig 2026-02-16  62  void __init xor_register(struct xor_block_template *tmpl)
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26  63  {
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26 @64  	tmpl->next = template_list;
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26  65  	template_list = tmpl;
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26  66  }
524ccdbdfb5260 crypto/xor.c            Ard Biesheuvel    2020-09-26  67  

:::::: The code at line 64 was first introduced by commit
:::::: 524ccdbdfb52608e9b98fcd64f4337add7009f41 crypto: xor - defer load time benchmark to a later time

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
