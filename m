Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BBE7261C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765485171; cv=none; b=JbhUTKZAALVyM84M/bsf3GRvZ7gAqoOUOiFhDpyYyF1Yr/JRYsHWVhvj9xOghBgGmFk0bdaQq5o2P0t8t5SXHQ2oGkC282+WG7rc4/SegBVxwGxhacMmmrdPEEXiqk5Gg8mpBjIuMbuw6y6bp0wFXCb6vawCxEsLB4cYBYzeBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765485171; c=relaxed/simple;
	bh=vGlARMro7s19FZWUqjrqQlVdXClSrhezCD6Gc0LHiwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KQ8zJKCblGSgwQqsCUhkAuoawB/SyWymuBLMM+nkDKMIMRihNZOsdLr165/0SrZfMUJFv1KoaqjYFj9T5nIE5HvlPwcZYrw5w6/lW4vNTSmXKDy2jpDKpD3o/+LNSQb3FVyr3A5eQRKtUcGVQ3HkCZtjl/GPtdS383Hegb9R5CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0rvRRCB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0rvRRCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765485169; x=1797021169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vGlARMro7s19FZWUqjrqQlVdXClSrhezCD6Gc0LHiwE=;
  b=O0rvRRCB/aJy5Uk6qIol3ApwQn8ZxuYStYyMQ67hAk/cHbMQfgscZwfS
   FuJVodGfRmSOhGJmwBh8hYp0Uu8TXfqpsCJSgcKQ63EmbIQj6xwjNULzX
   Cp7cDPymwBX6ReAvawJvZmqOY2sQPUJ42oM6jQhs4xt6JwStY9+7ll8cv
   q5RpW4C10t3Ra/oALWEe8ceD6T5BqzDt3tF1ClSicZhrZGr1mxKkCA7aS
   GBhGwqfwZ71yr7s2gzTPHn0yADbqTOVewl2fjD5MeAo2FvuXu04yRcCAO
   s/HPszoDNy02FcWTxqIenFxG60tvOL76PE5GlmO3m8hHBeUnNArO1DbHl
   Q==;
X-CSE-ConnectionGUID: +tdOxa1yRXmvtvJn9obwzw==
X-CSE-MsgGUID: XHySPj9uTVq1wSBzhNx5Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78587849"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78587849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 12:32:49 -0800
X-CSE-ConnectionGUID: 18QT3mU7Sq2eZ+9nACn5lA==
X-CSE-MsgGUID: mq0sHrOXQPm+SDC72XL65Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="195978750"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Dec 2025 12:32:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTnLB-0000000055x-1I00;
	Thu, 11 Dec 2025 20:32:45 +0000
Date: Fri, 12 Dec 2025 04:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] net/ipv4/fib_trie.c:320:13:
 warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned
 int') changes value from 2305843009213693946 to 4294967290
Message-ID: <202512120408.X1ke7PFz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c3d01075f9db5f720da320b1090656bc91a22722
commit: 3e1da3739d68558bacc60ea5f469fbddaf529c32 [1/1] ANDROID: GKI: Add GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
config: x86_64-randconfig-016-20251212 (https://download.01.org/0day-ci/archive/20251212/202512120408.X1ke7PFz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120408.X1ke7PFz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120408.X1ke7PFz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/fib_trie.c:69:
   In file included from include/net/tcp.h:45:
   include/net/xfrm.h:2088:30: error: no member named 'xfrm' in 'struct dst_entry'
    2088 |         struct xfrm_state *x = dst->xfrm;
         |                                ~~~  ^
   include/net/xfrm.h:2095:46: error: no member named 'xfrm' in 'struct dst_entry'
    2095 |         if (!x->xso.offload_handle && !xdst->child->xfrm)
         |                                        ~~~~~~~~~~~  ^
   include/net/xfrm.h:2098:20: error: no member named 'xfrm' in 'struct dst_entry'
    2098 |             !xdst->child->xfrm)
         |              ~~~~~~~~~~~  ^
>> net/ipv4/fib_trie.c:320:13: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 2305843009213693946 to 4294967290 [-Wconstant-conversion]
     320 |         if (bits > TNODE_VMALLOC_MAX)
         |                    ^~~~~~~~~~~~~~~~~
   net/ipv4/fib_trie.c:301:35: note: expanded from macro 'TNODE_VMALLOC_MAX'
     301 |         ilog2((SIZE_MAX - TNODE_SIZE(0)) / sizeof(struct key_vector *))
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:162:14: note: expanded from macro 'ilog2'
     162 |         __ilog2_u32(n) :                \
         |         ~~~~~~~~~~~ ^
   1 warning and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]


vim +320 net/ipv4/fib_trie.c

37fd30f2da573c Alexander Duyck   2014-12-31  314  
dc35dbeda3e00a Alexander Duyck   2015-03-06  315  static struct tnode *tnode_alloc(int bits)
f0e36f8cee8101 Patrick McHardy   2005-07-05  316  {
1de3d87bcd2c2e Alexander Duyck   2015-03-04  317  	size_t size;
1de3d87bcd2c2e Alexander Duyck   2015-03-04  318  
1de3d87bcd2c2e Alexander Duyck   2015-03-04  319  	/* verify bits is within bounds */
1de3d87bcd2c2e Alexander Duyck   2015-03-04 @320  	if (bits > TNODE_VMALLOC_MAX)
1de3d87bcd2c2e Alexander Duyck   2015-03-04  321  		return NULL;
1de3d87bcd2c2e Alexander Duyck   2015-03-04  322  
1de3d87bcd2c2e Alexander Duyck   2015-03-04  323  	/* determine size and verify it is non-zero and didn't overflow */
1de3d87bcd2c2e Alexander Duyck   2015-03-04  324  	size = TNODE_SIZE(1ul << bits);
1de3d87bcd2c2e Alexander Duyck   2015-03-04  325  
2373ce1ca04dd4 Robert Olsson     2005-08-25  326  	if (size <= PAGE_SIZE)
8d96544475b236 Eric Dumazet      2008-01-13  327  		return kzalloc(size, GFP_KERNEL);
15be75cdb5db44 Stephen Hemminger 2008-04-10  328  	else
7a1c8e5ab120a5 Eric Dumazet      2010-11-20  329  		return vzalloc(size);
15be75cdb5db44 Stephen Hemminger 2008-04-10  330  }
2373ce1ca04dd4 Robert Olsson     2005-08-25  331  

:::::: The code at line 320 was first introduced by commit
:::::: 1de3d87bcd2c2e631500b9e4f0c40b38ce0d0d57 fib_trie: Prevent allocating tnode if bits is too big for size_t

:::::: TO: Alexander Duyck <alexander.h.duyck@redhat.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
