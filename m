Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7791C28D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692719015; x=1724255015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9BwLVuhGRtomV3KZ13dmZ0mnh2ToOz4BrQ/YNrYJkDo=;
  b=kAm01tEUUunDOd+0Vkf0I5WswL+iF81THHnURaSrLTLgplBH/AK16fYk
   2Fq4/M/QB0O7QzuSiivcv8RDdFi4rlUMZ1vLKC6Sl2yG0rgaCdprkGN4S
   jDpTIoT+QcBQvNz46BH7dGKZUWdUAOMmTcTEr9D3FuX6iFadBRQc0DQtS
   QIZiB3+IIrHO0M6miBI+oqcEiwBoqlcMsw05RbFEXKvFRjNdfmOMNnCCQ
   b7YtRfUyxl6Tq+PLzSFycmmaBCK7qesix1PsONyQ2UePXpK6l73TVjt7B
   pAU8TNfsX1TqJXmS/XmjLJSmzzvOlZIdYZXccswOauriqMooKL0yBRiDg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371335488"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="371335488"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 08:43:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="859960660"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="859960660"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 08:43:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYTXX-0000IW-2g;
	Tue, 22 Aug 2023 15:43:31 +0000
Date: Tue, 22 Aug 2023 23:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 2329/11761]
 arch/powerpc/include/asm/cmpxchg.h:626:47: sparse: sparse: cast truncates
 bits from constant value (5deadbeef000eb9f becomes f000eb9f)
Message-ID: <202308222338.DPTQeMxG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   28c736b0e92e11bfe2b9997688213dc43cb22182
commit: c3c510ce431cd99fa10dcd50d995c8e89330ee5b [2329/11761] bpf: Add 'owner' field to bpf_{list,rb}_node
config: powerpc64-randconfig-r131-20230822 (https://download.01.org/0day-ci/archive/20230822/202308222338.DPTQeMxG-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308222338.DPTQeMxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308222338.DPTQeMxG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c: note: in included file (through arch/powerpc/include/asm/atomic.h, arch/powerpc/include/asm/paca.h, arch/powerpc/include/asm/current.h, ...):
>> arch/powerpc/include/asm/cmpxchg.h:626:47: sparse: sparse: cast truncates bits from constant value (5deadbeef000eb9f becomes f000eb9f)
   arch/powerpc/include/asm/cmpxchg.h:628:48: sparse: sparse: cast truncates bits from constant value (5deadbeef000eb9f becomes f000eb9f)
>> arch/powerpc/include/asm/cmpxchg.h:626:47: sparse: sparse: cast truncates bits from constant value (5deadbeef000eb9f becomes f000eb9f)
   arch/powerpc/include/asm/cmpxchg.h:628:48: sparse: sparse: cast truncates bits from constant value (5deadbeef000eb9f becomes f000eb9f)
   kernel/bpf/helpers.c:2419:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c: note: in included file (through include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +626 arch/powerpc/include/asm/cmpxchg.h

ae3a197e3d0bfe David Howells    2012-03-28  619  
ae3a197e3d0bfe David Howells    2012-03-28  620  static __always_inline unsigned long
da58b23cb976ab Michael Ellerman 2016-11-24  621  __cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
ae3a197e3d0bfe David Howells    2012-03-28  622  	  unsigned int size)
ae3a197e3d0bfe David Howells    2012-03-28  623  {
ae3a197e3d0bfe David Howells    2012-03-28  624  	switch (size) {
d0563a1297e234 Pan Xinhui       2016-04-27  625  	case 1:
d0563a1297e234 Pan Xinhui       2016-04-27 @626  		return __cmpxchg_u8(ptr, old, new);
d0563a1297e234 Pan Xinhui       2016-04-27  627  	case 2:
d0563a1297e234 Pan Xinhui       2016-04-27  628  		return __cmpxchg_u16(ptr, old, new);
ae3a197e3d0bfe David Howells    2012-03-28  629  	case 4:
ae3a197e3d0bfe David Howells    2012-03-28  630  		return __cmpxchg_u32(ptr, old, new);
ae3a197e3d0bfe David Howells    2012-03-28  631  #ifdef CONFIG_PPC64
ae3a197e3d0bfe David Howells    2012-03-28  632  	case 8:
ae3a197e3d0bfe David Howells    2012-03-28  633  		return __cmpxchg_u64(ptr, old, new);
ae3a197e3d0bfe David Howells    2012-03-28  634  #endif
ae3a197e3d0bfe David Howells    2012-03-28  635  	}
10d8b1480e6966 pan xinhui       2016-02-23  636  	BUILD_BUG_ON_MSG(1, "Unsupported size for __cmpxchg");
ae3a197e3d0bfe David Howells    2012-03-28  637  	return old;
ae3a197e3d0bfe David Howells    2012-03-28  638  }
ae3a197e3d0bfe David Howells    2012-03-28  639  

:::::: The code at line 626 was first introduced by commit
:::::: d0563a1297e234ed37f6b51c2e9321accebd1839 powerpc: Implement {cmp}xchg for u8 and u16

:::::: TO: Pan Xinhui <xinhui.pan@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
