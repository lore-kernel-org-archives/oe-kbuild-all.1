Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E407A10957
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 12:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688992097; x=1720528097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwrMSvSwXm+TsSagY9RDyWAjx25J/lVVjF0s1Keviuo=;
  b=jp4K19eJVjZtc0M+2uRdOowybyOPaKpqs31/iwLIS5wJfrnDA36Wq3l4
   b4rRq56gXQF09YimxdQYN6p3bQfo2ZUhT5QErT6yOzlvxVzkssYqr6SWh
   PwUNAutKafXKGyDKbfXILmD6tv9l+odomQM5pdjioEMzpjsGBgRy3mb//
   /R57S02fejVshC2cZgWYk/cMQsPOIJ2juwXxeapN7MvQ/eG4Ke+FjGTA+
   IxahBWNoSj9yrE1IJsmCn77i/nLn0FTSXoJha6B5GAKX+zPT7jqqLrRFL
   Z9w1jwtFrlBxeSpKXkSEUUKvAlvTz1a58hnaUQ3riES6rtop7xnS8wROc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="428023602"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="428023602"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 05:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755980721"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="755980721"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 05:28:15 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIpzy-0003ho-2G;
	Mon, 10 Jul 2023 12:28:14 +0000
Date: Mon, 10 Jul 2023 20:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 5/11] include/uapi/linux/byteorder/big_endian.h:34:54:
 error: expected expression before ')' token
Message-ID: <202307102048.HWSFEWPR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   e18cb7292230c20204fcf62e44cdb3bfa5155ac6
commit: 98f7f6bf14dbf5eb3be09d69724a8433dfd2278d [5/11] PCI/CMA: Authenticate devices on enumeration
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230710/202307102048.HWSFEWPR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307102048.HWSFEWPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307102048.HWSFEWPR-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                     ^
   include/uapi/linux/const.h:20:26: note: in definition of macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^
   include/uapi/linux/const.h:25:26: note: in expansion of macro '_AC'
      25 | #define _UL(x)          (_AC(x, UL))
         |                          ^~~
   include/vdso/const.h:7:26: note: in expansion of macro '_UL'
       7 | #define UL(x)           (_UL(x))
         |                          ^~~
   include/vdso/bits.h:7:34: note: in expansion of macro 'UL'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                  ^~
   lib/spdm_requester.c:93:41: note: in expansion of macro 'BIT'
      93 | #define SPDM_ASYM_ECDSA_ECC_NIST_P256   BIT(4)
         |                                         ^~~
   lib/spdm_requester.c:117:41: note: in expansion of macro 'SPDM_ASYM_ECDSA_ECC_NIST_P256'
     117 | #define SPDM_ASYM_ECDSA                 SPDM_ASYM_ECDSA_ECC_NIST_P256 | \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm_requester.c:132:41: note: in expansion of macro 'SPDM_ASYM_ECDSA'
     132 |                                         SPDM_ASYM_ECDSA 0)
         |                                         ^~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6:
   include/vdso/bits.h:7:40: error: expected ')' before '<<' token
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   lib/spdm_requester.c:93:41: note: in expansion of macro 'BIT'
      93 | #define SPDM_ASYM_ECDSA_ECC_NIST_P256   BIT(4)
         |                                         ^~~
   lib/spdm_requester.c:117:41: note: in expansion of macro 'SPDM_ASYM_ECDSA_ECC_NIST_P256'
     117 | #define SPDM_ASYM_ECDSA                 SPDM_ASYM_ECDSA_ECC_NIST_P256 | \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm_requester.c:132:41: note: in expansion of macro 'SPDM_ASYM_ECDSA'
     132 |                                         SPDM_ASYM_ECDSA 0)
         |                                         ^~~~~~~~~~~~~~~
   lib/spdm_requester.c:146:1: warning: empty declaration
     146 | } __packed;
         | ^
   lib/spdm_requester.c: In function '__spdm_exchange':
   lib/spdm_requester.c:511:29: error: invalid application of 'sizeof' to incomplete type 'struct spdm_header'
     511 |         if (length < sizeof(struct spdm_header))
         |                             ^~~~~~
   lib/spdm_requester.c:514:21: error: invalid use of undefined type 'struct spdm_header'
     514 |         if (response->code == SPDM_ERROR)
         |                     ^~
   lib/spdm_requester.c:517:21: error: invalid use of undefined type 'struct spdm_header'
     517 |         if (response->code != (request->code & ~SPDM_REQ)) {
         |                     ^~
   lib/spdm_requester.c:517:39: error: invalid use of undefined type 'const struct spdm_header'
     517 |         if (response->code != (request->code & ~SPDM_REQ)) {
         |                                       ^~
   In file included from lib/spdm_requester.c:15:
   lib/spdm_requester.c:520:33: error: invalid use of undefined type 'struct spdm_header'
     520 |                         response->code, request->code);
         |                                 ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   lib/spdm_requester.c:518:17: note: in expansion of macro 'dev_err'
     518 |                 dev_err(spdm_state->dev,
         |                 ^~~~~~~
   lib/spdm_requester.c:520:48: error: invalid use of undefined type 'const struct spdm_header'
     520 |                         response->code, request->code);
         |                                                ^~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   lib/spdm_requester.c:518:17: note: in expansion of macro 'dev_err'
     518 |                 dev_err(spdm_state->dev,
         |                 ^~~~~~~
   lib/spdm_requester.c: In function 'spdm_exchange':
   lib/spdm_requester.c:532:29: error: invalid application of 'sizeof' to incomplete type 'struct spdm_header'
     532 |         if (req_sz < sizeof(struct spdm_header) ||
         |                             ^~~~~~
   lib/spdm_requester.c:533:29: error: invalid application of 'sizeof' to incomplete type 'struct spdm_header'
     533 |             rsp_sz < sizeof(struct spdm_header))
         |                             ^~~~~~
   lib/spdm_requester.c:536:19: error: invalid use of undefined type 'struct spdm_header'
     536 |         req_header->version = spdm_state->version;
         |                   ^~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/powerpc/include/uapi/asm/byteorder.h:14,
                    from arch/powerpc/include/asm/qspinlock_types.h:6,
                    from arch/powerpc/include/asm/spinlock_types.h:10,
                    from include/linux/spinlock_types_raw.h:7,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/powerpc/include/asm/bug.h:159,
                    from include/linux/bug.h:5,
                    from arch/powerpc/include/asm/cmpxchg.h:8,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rbtree.h:24,
                    from include/linux/key.h:15,
                    from include/linux/cred.h:13:
   lib/spdm_requester.c: In function 'spdm_negotiate_algs':
>> include/uapi/linux/byteorder/big_endian.h:34:54: error: expected expression before ')' token
      34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                                      ^
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   lib/spdm_requester.c:775:31: note: in expansion of macro 'cpu_to_le32'
     775 |         req->base_asym_algo = cpu_to_le32(SPDM_ASYM_ALGOS);
         |                               ^~~~~~~~~~~
   lib/spdm_requester.c:1379:1: error: expected declaration or statement at end of input
    1379 | MODULE_LICENSE("GPL");
         | ^~~~~~~~~~~~~~
   lib/spdm_requester.c:764:17: warning: unused variable 'length' [-Wunused-variable]
     764 |         int rc, length;
         |                 ^~~~~~
   lib/spdm_requester.c:764:13: warning: unused variable 'rc' [-Wunused-variable]
     764 |         int rc, length;
         |             ^~
   lib/spdm_requester.c:763:16: warning: unused variable 'rsp_sz' [-Wunused-variable]
     763 |         size_t rsp_sz = sizeof(*rsp);
         |                ^~~~~~
   lib/spdm_requester.c:759:37: warning: unused variable 'req_alg_struct' [-Wunused-variable]
     759 |         struct spdm_req_alg_struct *req_alg_struct;
         |                                     ^~~~~~~~~~~~~~
   lib/spdm_requester.c: At top level:
   lib/spdm_requester.c:756:12: warning: 'spdm_negotiate_algs' defined but not used [-Wunused-function]
     756 | static int spdm_negotiate_algs(struct spdm_state *spdm_state,
         |            ^~~~~~~~~~~~~~~~~~~
   lib/spdm_requester.c:712:12: warning: 'spdm_parse_algs' defined but not used [-Wunused-function]
     712 | static int spdm_parse_algs(struct spdm_state *spdm_state)
         |            ^~~~~~~~~~~~~~~
   lib/spdm_requester.c:665:12: warning: 'spdm_start_hash' defined but not used [-Wunused-function]
     665 | static int spdm_start_hash(struct spdm_state *spdm_state,
         |            ^~~~~~~~~~~~~~~
   lib/spdm_requester.c:591:12: warning: 'spdm_get_capabilities' defined but not used [-Wunused-function]
     591 | static int spdm_get_capabilities(struct spdm_state *spdm_state,
         |            ^~~~~~~~~~~~~~~~~~~~~
   lib/spdm_requester.c:546:12: warning: 'spdm_get_version' defined but not used [-Wunused-function]
     546 | static int spdm_get_version(struct spdm_state *spdm_state,
         |            ^~~~~~~~~~~~~~~~


vim +34 include/uapi/linux/byteorder/big_endian.h

5921e6f8809b16 David Howells 2012-10-13  15  
5921e6f8809b16 David Howells 2012-10-13  16  #define __constant_htonl(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  17  #define __constant_ntohl(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  18  #define __constant_htons(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  19  #define __constant_ntohs(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  20  #define __constant_cpu_to_le64(x) ((__force __le64)___constant_swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  21  #define __constant_le64_to_cpu(x) ___constant_swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13  22  #define __constant_cpu_to_le32(x) ((__force __le32)___constant_swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  23  #define __constant_le32_to_cpu(x) ___constant_swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  24  #define __constant_cpu_to_le16(x) ((__force __le16)___constant_swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  25  #define __constant_le16_to_cpu(x) ___constant_swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  26  #define __constant_cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  27  #define __constant_be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  28  #define __constant_cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  29  #define __constant_be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  30  #define __constant_cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  31  #define __constant_be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  32  #define __cpu_to_le64(x) ((__force __le64)__swab64((x)))
5921e6f8809b16 David Howells 2012-10-13  33  #define __le64_to_cpu(x) __swab64((__force __u64)(__le64)(x))
5921e6f8809b16 David Howells 2012-10-13 @34  #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
5921e6f8809b16 David Howells 2012-10-13  35  #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
5921e6f8809b16 David Howells 2012-10-13  36  #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
5921e6f8809b16 David Howells 2012-10-13  37  #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
5921e6f8809b16 David Howells 2012-10-13  38  #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
5921e6f8809b16 David Howells 2012-10-13  39  #define __be64_to_cpu(x) ((__force __u64)(__be64)(x))
5921e6f8809b16 David Howells 2012-10-13  40  #define __cpu_to_be32(x) ((__force __be32)(__u32)(x))
5921e6f8809b16 David Howells 2012-10-13  41  #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
5921e6f8809b16 David Howells 2012-10-13  42  #define __cpu_to_be16(x) ((__force __be16)(__u16)(x))
5921e6f8809b16 David Howells 2012-10-13  43  #define __be16_to_cpu(x) ((__force __u16)(__be16)(x))
5921e6f8809b16 David Howells 2012-10-13  44  

:::::: The code at line 34 was first introduced by commit
:::::: 5921e6f8809b1616932ca4afd40fe449faa8fd88 UAPI: (Scripted) Disintegrate include/linux/byteorder

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
