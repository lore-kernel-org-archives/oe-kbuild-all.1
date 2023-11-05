Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CF0171C0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 22:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJ7LO2tD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699225130; x=1730761130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaa4lnMw119eJCTcDj38F6YLvTMBddbhpRtDDdxdn9w=;
  b=WJ7LO2tDmUe0wK28J/ZldsG7JajM7c+VZKILJXasJKmYzU3DCz9vnyIk
   rPEXMMWSiz0324yeqT3NHlL9PmeQ7+kva/LQFP7KO2767EuvR2p82KI/q
   BdlHyjai9aGlKf9OjebgaX7+MsS72u+DJo/36G/fsb9196tg9EPO0l+Yn
   9cbZVcky99JLdwN+ah4UMMXyKSan0Ivb8woTkZA/cgDEzAfPbXZZ3pBPp
   WBJgvpTEGAMGmp6Aq5cDJ/ywM7hkS8bF0gxi37rsGYlS4UKAXoy7zBNmQ
   7hQ/z0tWXf4aNxOjqMjuNTDneF0S2vjEEOgQ1unSKJjMIhkl5cUq3Ztnz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="388064922"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="388064922"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 14:58:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="1093600482"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="1093600482"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2023 14:58:48 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzm4s-0005rd-2C;
	Sun, 05 Nov 2023 22:58:46 +0000
Date: Mon, 6 Nov 2023 06:57:31 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast
 truncates bits from constant value (dead00000000eb9f becomes 9f)
Message-ID: <202311060641.9xoaUdHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77fa2fbe87fc605c4bfa87dff87be9bfded0e9a3
commit: c3c510ce431cd99fa10dcd50d995c8e89330ee5b bpf: Add 'owner' field to bpf_{list,rb}_node
date:   4 months ago
config: arm64-randconfig-r122-20231102 (https://download.01.org/0day-ci/archive/20231106/202311060641.9xoaUdHJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311060641.9xoaUdHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060641.9xoaUdHJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/asm-generic/bitops/atomic.h, ...):
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (dead00000000eb9f becomes 9f)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (dead00000000eb9f becomes eb9f)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (dead00000000eb9f becomes eb9f)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (dead00000000eb9f becomes 9f)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (dead00000000eb9f becomes eb9f)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (dead00000000eb9f becomes eb9f)
   kernel/bpf/helpers.c:2419:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2424:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +171 arch/arm64/include/asm/cmpxchg.h

10b663aef1c247 Catalin Marinas 2012-03-05  167  
305d454aaa292b Will Deacon     2015-10-08  168  __CMPXCHG_GEN()
305d454aaa292b Will Deacon     2015-10-08  169  __CMPXCHG_GEN(_acq)
305d454aaa292b Will Deacon     2015-10-08  170  __CMPXCHG_GEN(_rel)
305d454aaa292b Will Deacon     2015-10-08 @171  __CMPXCHG_GEN(_mb)
10b663aef1c247 Catalin Marinas 2012-03-05  172  

:::::: The code at line 171 was first introduced by commit
:::::: 305d454aaa292be3a09a9d674e6c35f5b4249a13 arm64: atomics: implement native {relaxed, acquire, release} atomics

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
