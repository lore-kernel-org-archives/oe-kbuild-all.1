Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793285073;
	b=gKiAcCeLA38BWh7HcbKA86pTIMETeOBXBp/TGqzP7E5n9uk0AICE68Upd7xpaMQo9Inw
	 eUfBw/++LxqXYnpfRsS5l40zyV5+x87mQFT8TkL/YzvnZj3n/a/gZubIzEcnQ2rcC42rk
	 ags3RThsrGJhFBUnhkB7LIFBAIHGln65lbHnkJEFMiBg30jfgD+/+i+9+gmjQXDB5TBb7
	 q+aUnV9n3+gKozHlKP77OlEZjwzWCqaDKqJy5t/4QlF/g4aMvEl06XoxtIhZhwdyV4Ej/
	 9OfBHw1mO95MEJ/BfDAvKLxCXV5HDVo+J3WdzqYSES1L3EU4P7v7sbGYro6wOf5nmWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793285073;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8cW/sx37a6dIPJXTAg3GSLUwpZwNABlo6rBpicA9g+k=;
	b=mqtXHLMuWylAKT2iSlSb9/0X+6cr69kimeYw4wATNr4SA50XKktJKMxLoto6X+pjw0eI
	 gbNEFO1ocDrPH8+XqzhbTEXnMGy1r0bAXqjp5CZCYCnttcSoOaWoLc588/TbAnAr6LFQq
	 YDtm2hI9ZtV9eL4kFiRSNSIVbKHE2wdAcwdDnz3XKPEbRFVBWDpq2Kb4kQESGbbCL/Vto
	 AxNgiTj/5wwUJf3Oj1UKLgsKUXdu3L9asI+mKLml5IsI/MUkGK7IhljJexJ56cNpEMqcV
	 H3q9kxmSxajUrtUsJTn6eyCKGIwYhkKAWxRPcNZ8MZzWXbTZ9DuJCGBXCrsQMhFAaqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kAPXHEXq;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81389606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 14:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81389606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kAPXHEXq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793285072; x=1824821072;
  h=date:from:to:cc:subject:message-id;
  bh=/TlNNJyTiJbyMpWzH9rZRH7jfnIZMEgb5YN+7H6/NmQ=;
  b=kAPXHEXqijekQx544xVlu3fnt7pNsJKRkx5N1MBFuBq48DtLh+wdOYn9
   pbr5inewvuWU5nhu35NsX0QE1Xcx+YELGbhvaLvuu6GZZBFneic79YIM0
   yKlSlCXp7N6CfW49rUgco6+lTEUaHwK8d7BpWIcjdKtaXYiGBt8uS+bWP
   Wan6Z8zZFiC5xJEX+oJPqkYj+g+Ioopkl/TPEX5vSJGwWXEgSCUcBgY/C
   4sdmdrq1uvrSvD1TgX+mAjHUu8LSU3Qdkb7zIRH4zHZ1rFvbmbdMbVneR
   L8ddYJBqBNt5N3sJM5MON59a9FeSiSXoC+VVIo7u9f+tEgk1RLpTlwMlR
   w==;
X-CSE-ConnectionGUID: NBjzTD3BTJ60qmOjwtx9QA==
X-CSE-MsgGUID: D+zg/d4CTLi6Kb8QC6G0OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1912578"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1912578"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:44:31 -0700
X-CSE-ConnectionGUID: sYfG7wBRQCe5HZ067/0nTw==
X-CSE-MsgGUID: AqNioLsgQsutJfZQ8t8aUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5092855"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2026 07:44:29 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMRMg-000000005Gl-3om7;
	Thu, 29 Oct 2026 14:44:26 +0000
Date: Thu, 29 Oct 2026 15:44:05 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 1/1]
 net/ipv4/fib_trie.c:320:13: warning: implicit conversion from 'unsigned long'
 to 'u32' (aka 'unsigned int') changes value from 2305843009213693946 to
 4294967290
Message-ID: <202610291501.qubtmNJx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   a69319c19fd01d6ddb506d4e39b1e50451bdb352
commit: 3e1da3739d68558bacc60ea5f469fbddaf529c32 [1/1] ANDROID: GKI: Add GKI_HIDDEN_XFRM_OFFLOAD_CONFIGS
config: x86_64-randconfig-2001-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291501.qubtmNJx-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291501.qubtmNJx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291501.qubtmNJx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
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
   2 warnings and 3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


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
