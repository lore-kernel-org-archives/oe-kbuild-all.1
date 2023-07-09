Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EA62574
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jul 2023 13:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688910589; x=1720446589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5C45mwMMddQsSjVr1JLrb5SpDjs2CQpCv1t6QtPZNw=;
  b=PUixbFeiiEVDyrUsQqJfENRJEQP2TKPyq7FVQnzem/J7EzkR5fuqyNVD
   iPsVAV2AtJSvW1+UU1dymQzL0yWflChx+PAJlznSimJYRv0zOVz33EzWP
   JxKIJoW98qgkvCwJ+2PtM5IctWqa0hEA3eQpJ0/M6gzglNi0C0whN01G2
   LV5otThWRAlcBgMTNZrd42nz/v6ePKjg8DNPvAT8BDKKnZfXRHhUkht5C
   9guquIeHZ7N13pGrvfyac7pMPmTgrlgQtoenCAyE7Co4MxE6vcufvDt7x
   gqmh34No3gqEEnWwpwbaT0oyGswbUsYYE80Wci89cG2WKaa101V/9TMzg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="427857605"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="427857605"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 06:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="967157466"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="967157466"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Jul 2023 06:49:47 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIUnL-0003EK-0B;
	Sun, 09 Jul 2023 13:49:47 +0000
Date: Sun, 9 Jul 2023 21:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 5/11] lib/spdm.c:111:73: error: invalid operands to binary
 | (have 'char *' and 'char *')
Message-ID: <202307092105.RoVpHJtR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   bb8dcae54e81779980c746964e43e4db92c03b81
commit: a1f2eb283674915d3448e7934071c2c0cd60d5c9 [5/11] PCI/CMA: Authenticate devices on enumeration
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230709/202307092105.RoVpHJtR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307092105.RoVpHJtR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307092105.RoVpHJtR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from arch/x86/include/asm/orc_types.h:49,
                    from arch/x86/include/asm/unwind_hints.h:6,
                    from arch/x86/include/asm/nospec-branch.h:13,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:16,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rbtree.h:24,
                    from include/linux/key.h:15,
                    from include/linux/cred.h:13,
                    from lib/spdm.c:14:
   lib/spdm.c: In function 'spdm_negotiate_algs':
>> lib/spdm.c:111:73: error: invalid operands to binary | (have 'char *' and 'char *')
     111 | #define SPDM_SUPPORTED_ASYM_ALGOS      (CONFIG_SPDM_ASYM_RSA            | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition of macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   lib/spdm.c:755:43: note: in expansion of macro 'SPDM_SUPPORTED_ASYM_ALGOS'
     755 |         req->base_asym_algo = cpu_to_le32(SPDM_SUPPORTED_ASYM_ALGOS);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c:114:73: error: invalid operands to binary | (have 'char *' and 'char *')
     114 | #define SPDM_SUPPORTED_HASH_ALGOS      (CONFIG_SPDM_HASH_SHA_256        | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   include/uapi/linux/byteorder/little_endian.h:34:51: note: in definition of macro '__cpu_to_le32'
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                   ^
   lib/spdm.c:756:43: note: in expansion of macro 'SPDM_SUPPORTED_HASH_ALGOS'
     756 |         req->base_hash_algo = cpu_to_le32(SPDM_SUPPORTED_HASH_ALGOS);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/spdm.c:111:73: error: invalid operands to binary | (have 'char *' and 'char *')
     111 | #define SPDM_SUPPORTED_ASYM_ALGOS      (CONFIG_SPDM_ASYM_RSA            | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   lib/spdm.c:777:51: note: in expansion of macro 'SPDM_SUPPORTED_ASYM_ALGOS'
     777 |                 le32_to_cpu(rsp->base_asym_sel) & SPDM_SUPPORTED_ASYM_ALGOS;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c:114:73: error: invalid operands to binary | (have 'char *' and 'char *')
     114 | #define SPDM_SUPPORTED_HASH_ALGOS      (CONFIG_SPDM_HASH_SHA_256        | \
         |                                                                         ^
         |                                                                         |
         |                                                                         char *
   lib/spdm.c:779:51: note: in expansion of macro 'SPDM_SUPPORTED_HASH_ALGOS'
     779 |                 le32_to_cpu(rsp->base_hash_sel) & SPDM_SUPPORTED_HASH_ALGOS;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   lib/spdm.c: In function 'spdm_parse_algs':
   lib/spdm.c:734:1: error: control reaches end of non-void function [-Werror=return-type]
     734 | }
         | ^
   cc1: some warnings being treated as errors


vim +111 lib/spdm.c

0729c1605786d1 Jonathan Cameron 2022-09-06  109  
0729c1605786d1 Jonathan Cameron 2022-09-06  110  /* SPDM algorithms supported by this implementation */
0729c1605786d1 Jonathan Cameron 2022-09-06 @111  #define SPDM_SUPPORTED_ASYM_ALGOS      (CONFIG_SPDM_ASYM_RSA		| \
0729c1605786d1 Jonathan Cameron 2022-09-06  112  					CONFIG_SPDM_ASYM_ECDSA_ECC_NIST)
0729c1605786d1 Jonathan Cameron 2022-09-06  113  

:::::: The code at line 111 was first introduced by commit
:::::: 0729c1605786d18caf5d016cbbe0563378e73056 spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
