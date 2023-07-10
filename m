Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42573320A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jul 2023 09:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688980515; x=1720516515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fv7AanyXNy4Rsg11fek5q2GzLIqj28O6UnAbGDoXOaY=;
  b=E7V+cNTGhr4HQ0OfzWBiND85YxuAQM5R/vmU2EapB/Z38Z51eyL1OahM
   lc5CcKFrAJN7+5/FQsRqcnZzMqlyQDux1R4sHXeGA4SN0sefqkP5keUJG
   qlSpC61bI+PBDLvpBUej4l9NyHwHvdm4FXxr+yitE2sFKiu9YNfwQdDAS
   DSC170/gSXL20LqZlJYEImFSVAw65D+FRo+QnUb8843L1Eead+rFVBwDl
   FcEj2PL3bZndBrYOR8jFdLmoTmGaisH5L8b5KJOky6F0RMvShITx8CDGP
   bdQ3PToDkgmurHNS7GdMNc4EAcSeqn/MpYqqYaJvHDxBnVdKi4t0OTM0Q
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="450653876"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="450653876"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 02:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="670878848"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="670878848"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jul 2023 02:15:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qImz9-0003dm-2H;
	Mon, 10 Jul 2023 09:15:11 +0000
Date: Mon, 10 Jul 2023 17:14:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 5/11] lib/spdm_requester.c:511:29: error: invalid
 application of 'sizeof' to incomplete type 'struct spdm_header'
Message-ID: <202307101730.GrGTiVpY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

First bad commit (maybe != root cause):

tree:   https://github.com/l1k/linux doe
head:   e18cb7292230c20204fcf62e44cdb3bfa5155ac6
commit: 98f7f6bf14dbf5eb3be09d69724a8433dfd2278d [5/11] PCI/CMA: Authenticate devices on enumeration
config: alpha-randconfig-r036-20230710 (https://download.01.org/0day-ci/archive/20230710/202307101730.GrGTiVpY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307101730.GrGTiVpY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307101730.GrGTiVpY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/bits.h:5,
                    from include/linux/capability.h:18,
                    from include/linux/cred.h:11,
                    from lib/spdm_requester.c:14:
   include/vdso/bits.h:7:37: error: expected identifier or '(' before numeric constant
       7 | #define BIT(nr)                 (UL(1) << (nr))
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
>> lib/spdm_requester.c:146:1: warning: empty declaration
     146 | } __packed;
         | ^
   lib/spdm_requester.c: In function '__spdm_exchange':
>> lib/spdm_requester.c:511:29: error: invalid application of 'sizeof' to incomplete type 'struct spdm_header'
     511 |         if (length < sizeof(struct spdm_header))
         |                             ^~~~~~
>> lib/spdm_requester.c:514:21: error: invalid use of undefined type 'struct spdm_header'
     514 |         if (response->code == SPDM_ERROR)
         |                     ^~
   lib/spdm_requester.c:517:21: error: invalid use of undefined type 'struct spdm_header'
     517 |         if (response->code != (request->code & ~SPDM_REQ)) {
         |                     ^~
>> lib/spdm_requester.c:517:39: error: invalid use of undefined type 'const struct spdm_header'
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
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/alpha/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/alpha/include/asm/bitops.h:452,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rbtree.h:24,
                    from include/linux/key.h:15,
                    from include/linux/cred.h:13:
   lib/spdm_requester.c: In function 'spdm_negotiate_algs':
>> include/uapi/linux/byteorder/little_endian.h:34:52: error: expected expression before ')' token
      34 | #define __cpu_to_le32(x) ((__force __le32)(__u32)(x))
         |                                                    ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   lib/spdm_requester.c:775:31: note: in expansion of macro 'cpu_to_le32'
     775 |         req->base_asym_algo = cpu_to_le32(SPDM_ASYM_ALGOS);
         |                               ^~~~~~~~~~~
>> lib/spdm_requester.c:1379:1: error: expected declaration or statement at end of input
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


vim +511 lib/spdm_requester.c

c64b9f8147bc84 Jonathan Cameron 2022-09-06  495  
c64b9f8147bc84 Jonathan Cameron 2022-09-06  496  static int __spdm_exchange(struct spdm_state *spdm_state,
c64b9f8147bc84 Jonathan Cameron 2022-09-06  497  			   const void *req, size_t req_sz,
c64b9f8147bc84 Jonathan Cameron 2022-09-06  498  			   void *rsp, size_t rsp_sz)
c64b9f8147bc84 Jonathan Cameron 2022-09-06  499  {
c64b9f8147bc84 Jonathan Cameron 2022-09-06  500  	const struct spdm_header *request = req;
c64b9f8147bc84 Jonathan Cameron 2022-09-06  501  	struct spdm_header *response = rsp;
c64b9f8147bc84 Jonathan Cameron 2022-09-06  502  	int length;
c64b9f8147bc84 Jonathan Cameron 2022-09-06  503  	int rc;
c64b9f8147bc84 Jonathan Cameron 2022-09-06  504  
c64b9f8147bc84 Jonathan Cameron 2022-09-06  505  	rc = spdm_state->transport(spdm_state->transport_priv, spdm_state->dev,
c64b9f8147bc84 Jonathan Cameron 2022-09-06  506  				   req, req_sz, rsp, rsp_sz);
c64b9f8147bc84 Jonathan Cameron 2022-09-06  507  	if (rc < 0)
c64b9f8147bc84 Jonathan Cameron 2022-09-06  508  		return rc;
c64b9f8147bc84 Jonathan Cameron 2022-09-06  509  
c64b9f8147bc84 Jonathan Cameron 2022-09-06  510  	length = rc;
c64b9f8147bc84 Jonathan Cameron 2022-09-06 @511  	if (length < sizeof(struct spdm_header))
c64b9f8147bc84 Jonathan Cameron 2022-09-06  512  		return -EPROTO;
c64b9f8147bc84 Jonathan Cameron 2022-09-06  513  
c64b9f8147bc84 Jonathan Cameron 2022-09-06 @514  	if (response->code == SPDM_ERROR)
c64b9f8147bc84 Jonathan Cameron 2022-09-06  515  		return spdm_err(spdm_state->dev, (struct spdm_error_rsp *)rsp);
c64b9f8147bc84 Jonathan Cameron 2022-09-06  516  
c64b9f8147bc84 Jonathan Cameron 2022-09-06 @517  	if (response->code != (request->code & ~SPDM_REQ)) {
c64b9f8147bc84 Jonathan Cameron 2022-09-06  518  		dev_err(spdm_state->dev,
c64b9f8147bc84 Jonathan Cameron 2022-09-06  519  			"Response code %#x does not match request code %#x\n",
c64b9f8147bc84 Jonathan Cameron 2022-09-06  520  			response->code, request->code);
c64b9f8147bc84 Jonathan Cameron 2022-09-06  521  		return -EPROTO;
c64b9f8147bc84 Jonathan Cameron 2022-09-06  522  	}
c64b9f8147bc84 Jonathan Cameron 2022-09-06  523  
c64b9f8147bc84 Jonathan Cameron 2022-09-06  524  	return length;
c64b9f8147bc84 Jonathan Cameron 2022-09-06  525  }
c64b9f8147bc84 Jonathan Cameron 2022-09-06  526  

:::::: The code at line 511 was first introduced by commit
:::::: c64b9f8147bc8474fbcb28c236f081b77d427e87 spdm: Introduce library to authenticate devices

:::::: TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>
:::::: CC: Lukas Wunner <lukas@wunner.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
