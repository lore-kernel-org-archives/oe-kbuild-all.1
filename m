Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6062C1EB32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bB8ORiMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700856292; x=1732392292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6YrsduC7BxSi8XqGqziZewRNjlyKnLey0YuZmFxTuxQ=;
  b=bB8ORiMwdvxa8OjccLUNmZ4iqQxZPFvRvoUHUyUgITgNiz1wOlPkY9Dq
   xM9V4+lKXrjmDOnQeAxVSdb1HudDGpaPJStKHZ0QIbKBWwIWS+cS/mrwo
   8IIPI4uTVHK7dYIKsNnQ33ZeBoxihwksBJJYUqQo167W/QkNWee8GKrAs
   u3qEI1z/aoShZt/BkzPDRtdpLOxjFG3tpFJuBmIf5hoJjzSVIXupamGmX
   xPVW6NExVZu+8e6g6X0JEUQZaeU/LYW7KbpasTlugX+bW2XDPRz3ZueSe
   tJKUFlUyBe7y5efn84nTKH4748IU+1oRXlwOamiCiuhNKVurSOIfRYynq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5691028"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5691028"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 12:04:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="9219872"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2023 12:04:49 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6cPu-0003F6-2o;
	Fri, 24 Nov 2023 20:04:46 +0000
Date: Sat, 25 Nov 2023 04:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: [viro-vfs:work.csum-x86 4/18] net/core/datagram.c:754:23: sparse:
 sparse: incorrect type in argument 1 (different base types)
Message-ID: <202311250254.UC1kAFDI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.csum-x86
head:   f6c1313680f1d2319d2061c63abeb76f820319b8
commit: 90c2bfd06916ac7c05129b36683bfd3424d8e0e4 [4/18] Fix the csum_and_copy_..._user() idiocy
config: powerpc64-randconfig-r121-20231124 (https://download.01.org/0day-ci/archive/20231125/202311250254.UC1kAFDI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250254.UC1kAFDI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250254.UC1kAFDI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/datagram.c:745:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] v @@     got restricted __wsum_fault [usertype] next @@
   net/core/datagram.c:745:55: sparse:     expected restricted __wsum [usertype] v
   net/core/datagram.c:745:55: sparse:     got restricted __wsum_fault [usertype] next
   net/core/datagram.c:745:54: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] csum2 @@     got restricted __wsum_fault @@
   net/core/datagram.c:745:54: sparse:     expected restricted __wsum [usertype] csum2
   net/core/datagram.c:745:54: sparse:     got restricted __wsum_fault
>> net/core/datagram.c:754:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] v @@     got restricted __wsum_fault @@
   net/core/datagram.c:754:23: sparse:     expected restricted __wsum [usertype] v
   net/core/datagram.c:754:23: sparse:     got restricted __wsum_fault
>> net/core/datagram.c:754:23: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __wsum [usertype] next @@     got restricted __wsum_fault @@
   net/core/datagram.c:754:23: sparse:     expected restricted __wsum [usertype] next
   net/core/datagram.c:754:23: sparse:     got restricted __wsum_fault
   net/core/datagram.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
   include/net/checksum.h:36:17: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __wsum_fault @@     got restricted __wsum [usertype] @@
   include/net/checksum.h:36:17: sparse:     expected restricted __wsum_fault
   include/net/checksum.h:36:17: sparse:     got restricted __wsum [usertype]
   include/net/checksum.h:36:17: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __wsum_fault @@     got restricted __wsum [usertype] @@
   include/net/checksum.h:36:17: sparse:     expected restricted __wsum_fault
   include/net/checksum.h:36:17: sparse:     got restricted __wsum [usertype]
--
>> net/core/skbuff.c:3385:24: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] v @@     got restricted __wsum_fault @@
   net/core/skbuff.c:3385:24: sparse:     expected restricted __wsum [usertype] v
   net/core/skbuff.c:3385:24: sparse:     got restricted __wsum_fault
>> net/core/skbuff.c:3385:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __wsum [usertype] csum @@     got restricted __wsum_fault @@
   net/core/skbuff.c:3385:22: sparse:     expected restricted __wsum [usertype] csum
   net/core/skbuff.c:3385:22: sparse:     got restricted __wsum_fault
   net/core/skbuff.c:3414:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] v @@     got restricted __wsum_fault @@
   net/core/skbuff.c:3414:41: sparse:     expected restricted __wsum [usertype] v
   net/core/skbuff.c:3414:41: sparse:     got restricted __wsum_fault
>> net/core/skbuff.c:3414:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __wsum [usertype] csum2 @@     got restricted __wsum_fault @@
   net/core/skbuff.c:3414:39: sparse:     expected restricted __wsum [usertype] csum2
   net/core/skbuff.c:3414:39: sparse:     got restricted __wsum_fault
   net/core/skbuff.c:6971:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] v @@     got restricted __wsum_fault [usertype] next @@
   net/core/skbuff.c:6971:55: sparse:     expected restricted __wsum [usertype] v
   net/core/skbuff.c:6971:55: sparse:     got restricted __wsum_fault [usertype] next
   net/core/skbuff.c:6971:54: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] csum2 @@     got restricted __wsum_fault @@
   net/core/skbuff.c:6971:54: sparse:     expected restricted __wsum [usertype] csum2
   net/core/skbuff.c:6971:54: sparse:     got restricted __wsum_fault
   net/core/skbuff.c:6958:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] v @@     got restricted __wsum_fault @@
   net/core/skbuff.c:6958:23: sparse:     expected restricted __wsum [usertype] v
   net/core/skbuff.c:6958:23: sparse:     got restricted __wsum_fault
>> net/core/skbuff.c:6958:23: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __wsum [usertype] next @@     got restricted __wsum_fault @@
   net/core/skbuff.c:6958:23: sparse:     expected restricted __wsum [usertype] next
   net/core/skbuff.c:6958:23: sparse:     got restricted __wsum_fault
   net/core/skbuff.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h):
   include/linux/skbuff.h:2703:28: sparse: sparse: self-comparison always evaluates to false
   net/core/skbuff.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/inet.h):
   include/net/checksum.h:36:17: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __wsum_fault @@     got restricted __wsum [usertype] @@
   include/net/checksum.h:36:17: sparse:     expected restricted __wsum_fault
   include/net/checksum.h:36:17: sparse:     got restricted __wsum [usertype]
   include/net/checksum.h:36:17: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __wsum_fault @@     got restricted __wsum [usertype] @@
   include/net/checksum.h:36:17: sparse:     expected restricted __wsum_fault
   include/net/checksum.h:36:17: sparse:     got restricted __wsum [usertype]
--
   drivers/net/ethernet/3com/typhoon.c:769:21: sparse: sparse: restricted __be16 degrades to integer
>> drivers/net/ethernet/3com/typhoon.c:1418:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] v @@     got restricted __wsum_fault @@
   drivers/net/ethernet/3com/typhoon.c:1418:42: sparse:     expected restricted __wsum [usertype] v
   drivers/net/ethernet/3com/typhoon.c:1418:42: sparse:     got restricted __wsum_fault
>> drivers/net/ethernet/3com/typhoon.c:1418:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __wsum [usertype] sum @@     got restricted __wsum_fault @@
   drivers/net/ethernet/3com/typhoon.c:1418:42: sparse:     expected restricted __wsum [usertype] sum
   drivers/net/ethernet/3com/typhoon.c:1418:42: sparse:     got restricted __wsum_fault
   drivers/net/ethernet/3com/typhoon.c:525:39: sparse: sparse: context imbalance in 'typhoon_process_response' - different lock contexts for basic block
   drivers/net/ethernet/3com/typhoon.c: note: in included file (through include/linux/skbuff.h, include/net/net_namespace.h, include/linux/netdevice.h):
   include/net/checksum.h:36:17: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __wsum_fault @@     got restricted __wsum [usertype] @@
   include/net/checksum.h:36:17: sparse:     expected restricted __wsum_fault
   include/net/checksum.h:36:17: sparse:     got restricted __wsum [usertype]

vim +754 net/core/datagram.c

6d0d419914286a David Howells 2023-09-25  748  
6d0d419914286a David Howells 2023-09-25  749  static __always_inline
6d0d419914286a David Howells 2023-09-25  750  size_t memcpy_to_iter_csum(void *iter_to, size_t progress,
6d0d419914286a David Howells 2023-09-25  751  			   size_t len, void *from, void *priv2)
6d0d419914286a David Howells 2023-09-25  752  {
6d0d419914286a David Howells 2023-09-25  753  	__wsum *csum = priv2;
dc32bff195b45e David Howells 2023-09-25 @754  	__wsum next = csum_partial_copy_nocheck(from, iter_to, len);
6d0d419914286a David Howells 2023-09-25  755  
dc32bff195b45e David Howells 2023-09-25  756  	*csum = csum_block_add(*csum, next, progress);
6d0d419914286a David Howells 2023-09-25  757  	return 0;
6d0d419914286a David Howells 2023-09-25  758  }
6d0d419914286a David Howells 2023-09-25  759  

:::::: The code at line 754 was first introduced by commit
:::::: dc32bff195b45e8571c442954beee259e9500dac iov_iter, net: Fold in csum_and_memcpy()

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
