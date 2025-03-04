Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA134545
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Mar 2025 02:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741054034; cv=none; b=Quwtb9wXRFXVpLxeJvWZYjA8mjUQ9w8qUrabd/PXGspJDjequDQ2VKZfnn9yjKLgYHB2PQGVBlTxhIZ9h4hrLNiCurP1JrMsQBNrY6N3f2VIMpfcyKhlV1K9AeUBSHsQvnFSJUdnTUIqQNjlhRwzacBfDYfX0Gaf8dJMlSLeTxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741054034; c=relaxed/simple;
	bh=diIZ4gu3Z5eYgUKkKK50smet2ls2nlkJqmc2RAJf3m8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zgze+9mkOM/dx2fw87EANCik+3ubGyTFAZcJqdM8uAHcV0Ust9W8iRkySdtHtp24AshAkl5dVobI1lcEl4FwBAi3niSe4OI14cB09VKPH+UxUS/JV9EvSP1R5f3PL5UwuZu+TsFZED7EqoP+LS6o+fs6cy6FZsGeE/EYbTqFPw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hUr7/4ye; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hUr7/4ye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741054032; x=1772590032;
  h=date:from:cc:subject:message-id:mime-version;
  bh=diIZ4gu3Z5eYgUKkKK50smet2ls2nlkJqmc2RAJf3m8=;
  b=hUr7/4yeBGAAillbQWzMOnrLCoGRLFcJjHezWMdk3RTkPdObONrolQ1N
   O6D4kMG2wGn0VDJsCql6fVqI2rtXJo2nqNbIul8E2BBZV5JZrHM49eUHj
   JJ6W7/JpLBfIA573AGkr8TAg7f2Xp9OrjtwiBUw+yTQs2kkvg8s6GqIes
   RTDlFGwu/VdF5DU99ebYI0xgHaxODZYIaXbMovn6jjPEN4HLGUHd6nAms
   fmHNL3KGAMb2K2TXuLVUjQOqoyMQCenfJM5B66QGJomPt76KfyKPmZ5oK
   gJlIVGcE2ks4S0tWYvI3TWK1pPfSv49wUXNAe3YfnHZEZ9x4c+6X/tvvG
   A==;
X-CSE-ConnectionGUID: KRRDRYSRROGH877kJ3nz6A==
X-CSE-MsgGUID: 8jJ7dUItQLO5OUBSYZtPkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="59501457"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="59501457"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 18:07:12 -0800
X-CSE-ConnectionGUID: G6LQK/6ySIu8Td3sdvJGbw==
X-CSE-MsgGUID: Bjz6GRpJSAeYbOve1CKV3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="118916056"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Mar 2025 18:07:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpHgb-000J9u-0T
	for oe-kbuild-all@lists.linux.dev;
	Tue, 04 Mar 2025 02:07:09 +0000
Date: Tue, 4 Mar 2025 10:06:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] include/uapi/linux/swab.h:119:9: warning:
 array subscript i is outside array bounds of 'kgid_t[0]'
Message-ID: <202503041014.NEMCM6qN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: e8680a24a269bd6dcb533f4e4a5faba9ae58925c [1/1] SUNRPC: Use struct xdr_stream when constructing RPC Call header
config: riscv-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250304/202503041014.NEMCM6qN-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041014.NEMCM6qN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041014.NEMCM6qN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:13,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:21,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/riscv/include/asm/bitops.h:215,
                    from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:18,
                    from arch/riscv/include/asm/bug.h:75,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from net/sunrpc/auth_unix.c:10:
   net/sunrpc/auth_unix.c: In function 'unx_marshal':
>> include/uapi/linux/swab.h:119:9: warning: array subscript i is outside array bounds of 'kgid_t[0]' [-Warray-bounds=]
     119 |         __fswab32(x))
         |         ^~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:39:43: note: in expansion of macro '__swab32'
      39 | #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:94:21: note: in expansion of macro '__cpu_to_be32'
      94 | #define cpu_to_be32 __cpu_to_be32
         |                     ^~~~~~~~~~~~~
   net/sunrpc/auth_unix.c:131:32: note: in expansion of macro 'cpu_to_be32'
     131 |                         *p++ = cpu_to_be32(from_kgid(&init_user_ns,
         |                                ^~~~~~~~~~~
   In file included from include/linux/seq_file.h:12,
                    from include/linux/seq_file_net.h:5,
                    from include/net/net_namespace.h:168,
                    from include/linux/inet.h:46,
                    from include/linux/sunrpc/msg_prot.h:204,
                    from include/linux/sunrpc/clnt.h:18,
                    from net/sunrpc/auth_unix.c:15:
   include/linux/cred.h:33:25: note: while referencing 'gid'
      33 |         kgid_t          gid[0];
         |                         ^~~


vim +119 include/uapi/linux/swab.h

607ca46e97a1b6 David Howells 2012-10-13  108  
607ca46e97a1b6 David Howells 2012-10-13  109  /**
607ca46e97a1b6 David Howells 2012-10-13  110   * __swab32 - return a byteswapped 32-bit value
607ca46e97a1b6 David Howells 2012-10-13  111   * @x: value to byteswap
607ca46e97a1b6 David Howells 2012-10-13  112   */
7322dd755e7dd3 Arnd Bergmann 2016-05-05  113  #ifdef __HAVE_BUILTIN_BSWAP32__
7322dd755e7dd3 Arnd Bergmann 2016-05-05  114  #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
7322dd755e7dd3 Arnd Bergmann 2016-05-05  115  #else
607ca46e97a1b6 David Howells 2012-10-13  116  #define __swab32(x)				\
607ca46e97a1b6 David Howells 2012-10-13  117  	(__builtin_constant_p((__u32)(x)) ?	\
607ca46e97a1b6 David Howells 2012-10-13  118  	___constant_swab32(x) :			\
607ca46e97a1b6 David Howells 2012-10-13 @119  	__fswab32(x))
7322dd755e7dd3 Arnd Bergmann 2016-05-05  120  #endif
607ca46e97a1b6 David Howells 2012-10-13  121  

:::::: The code at line 119 was first introduced by commit
:::::: 607ca46e97a1b6594b29647d98a32d545c24bdff UAPI: (Scripted) Disintegrate include/linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
