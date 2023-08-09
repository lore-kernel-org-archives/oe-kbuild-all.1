Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F618C0B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691600862; x=1723136862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Phbk9sSYrwWa38iSwmydfo828k4mNwGumGkChyM/0e8=;
  b=Se+zfDbkQ49cDGmIOpih3HTpfQqNbi7m4/zZgYoEAu9B/BP7XYLSMTK3
   9gs6MldFsvdwyPiGU/jPt1ak5p8bety5jXEITvANLZMnBjnNhY0U5GYee
   xV7AkD4vOLP55H+pAZWi2KyCbUC4Uv7y1fxilGo5iNCiYiVaNk9lNTVS5
   C4AMqjp6cv22s69Dxq0f3Eac1Okn6SNUwVq8FnGmtwET5R1GNk6iw8l4A
   cjGPSq8bqz8Ye16z7mQ1E3PDNnRDsDxDXjOXhwChc8Mzv2Xk/JdRpJFXj
   huI8gq+LXQGZNWHv7tb7cU3sFgsAT0piF0O0xEA0xDzw2I0WQwvxxK7Ge
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370080775"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="370080775"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 10:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="731893813"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="731893813"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 10:07:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTmep-0006HO-2N;
	Wed, 09 Aug 2023 17:07:39 +0000
Date: Thu, 10 Aug 2023 01:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Marchevsky <davemarchevsky@fb.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 2424/8441] arch/alpha/include/asm/xchg.h:234:32:
 sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
Message-ID: <202308100149.2rvEPRIG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: c3c510ce431cd99fa10dcd50d995c8e89330ee5b [2424/8441] bpf: Add 'owner' field to bpf_{list,rb}_node
config: alpha-randconfig-r093-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100149.2rvEPRIG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100149.2rvEPRIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100149.2rvEPRIG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c: note: in included file (through arch/alpha/include/asm/cmpxchg.h, arch/alpha/include/asm/atomic.h, include/linux/atomic.h, ...):
>> arch/alpha/include/asm/xchg.h:234:32: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
>> arch/alpha/include/asm/xchg.h:234:32: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
   kernel/bpf/helpers.c:2419:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2424:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +234 arch/alpha/include/asm/xchg.h

a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  227  
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  228  static __always_inline unsigned long
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  229  ____cmpxchg(, volatile void *ptr, unsigned long old, unsigned long new,
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  230  	      int size)
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  231  {
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  232  	switch (size) {
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  233  		case 1:
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31 @234  			return ____cmpxchg(_u8, ptr, old, new);
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  235  		case 2:
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  236  			return ____cmpxchg(_u16, ptr, old, new);
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  237  		case 4:
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  238  			return ____cmpxchg(_u32, ptr, old, new);
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  239  		case 8:
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  240  			return ____cmpxchg(_u64, ptr, old, new);
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  241  	}
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  242  	__cmpxchg_called_with_bad_pointer();
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  243  	return old;
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  244  }
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  245  

:::::: The code at line 234 was first introduced by commit
:::::: a6209d6d71f2ab8c63cc1587ef65490d83022baf alpha: xchg/cmpxchg cleanup and fixes

:::::: TO: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
