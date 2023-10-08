Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C11173A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Oct 2023 20:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeTuV61N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696795697; x=1728331697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SbWbcrrNmeBqA9BQqzmtaXxtcav7MKoPuFe4Z8z/M9w=;
  b=HeTuV61NwKXekomNswZaS+E2VyhL+B0vNeDKgnOqvdNSp8jPcRbi9eJk
   0voTkrd8eszHIJEek9hmBt07EvXE8177eMSRruZ7TgnD8vIKGykkRdM1g
   +A5bKkkXcbiyFmYdq/aUBeaHtniLkIDeOaesXwvewaJcHywnMOFcnllNc
   jMOqZ4mZot5z8rfgK1D974fOafJirkCaqXRqgdRF2nljmrdRGdNy0c9Jq
   7OVDXw52hDiKU+ZAbseHBon6k4V3X4JCEeTJjGPTaHsj2+Mr9fu9xBlo5
   s1RmvNboBgb2ag0H9RQlXoUaOob4wtYer3kO7Ixy0nJBuvEgAVHJF+YqI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="381296769"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="381296769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 13:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="787956763"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="787956763"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Oct 2023 13:08:14 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpa4S-0005iX-0I;
	Sun, 08 Oct 2023 20:08:12 +0000
Date: Mon, 9 Oct 2023 04:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: Karsten Graul <kgraul@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: net/smc/smc_llc.c:40:1: warning: alignment 1 of 'struct smc_llc_hdr'
 is less than 4
Message-ID: <202310090453.06oMLpnk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Karsten,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b9ddbb0cde2adcedda26045cc58f31316a492215
commit: b4ba4652b3f8b7c9bbb5786f8acf4724bdab2196 net/smc: extend LLC layer for SMC-Rv2
date:   2 years ago
config: arm-randconfig-002-20231002 (https://download.01.org/0day-ci/archive/20231009/202310090453.06oMLpnk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231009/202310090453.06oMLpnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310090453.06oMLpnk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/fs.h:15,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/linux/tcp.h:17,
                    from include/net/tcp.h:20,
                    from net/smc/smc_llc.c:13:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   net/smc/smc_llc.c: At top level:
>> net/smc/smc_llc.c:40:1: warning: alignment 1 of 'struct smc_llc_hdr' is less than 4 [-Wpacked-not-aligned]
      40 | } __packed;             /* format defined in
         | ^
   In file included from <command-line>:
   In function 'smc_llc_add_pending_send',
       inlined from 'smc_llc_send_message' at net/smc/smc_llc.c:760:7:
   include/linux/compiler_types.h:322:45: error: call to '__compiletime_assert_569' declared with attribute error: must increase SMC_WR_BUF_SIZE to at least sizeof(struct smc_llc_msg)
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:303:25: note: in definition of macro '__compiletime_assert'
     303 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:322:9: note: in expansion of macro '_compiletime_assert'
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   net/smc/smc_llc.c:409:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     409 |         BUILD_BUG_ON_MSG(
         |         ^~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:322:45: error: call to '__compiletime_assert_570' declared with attribute error: must adapt SMC_WR_TX_SIZE to sizeof(struct smc_llc_msg); if not all smc_wr upper layer protocols use the same message size any more, must start to set link->wr_tx_sges[i].length on each individual smc_wr_tx_send()
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:303:25: note: in definition of macro '__compiletime_assert'
     303 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:322:9: note: in expansion of macro '_compiletime_assert'
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   net/smc/smc_llc.c:412:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     412 |         BUILD_BUG_ON_MSG(
         |         ^~~~~~~~~~~~~~~~
   In function 'smc_llc_add_pending_send',
       inlined from 'smc_llc_send_confirm_rkey' at net/smc/smc_llc.c:492:7:
   include/linux/compiler_types.h:322:45: error: call to '__compiletime_assert_569' declared with attribute error: must increase SMC_WR_BUF_SIZE to at least sizeof(struct smc_llc_msg)
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:303:25: note: in definition of macro '__compiletime_assert'
     303 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:322:9: note: in expansion of macro '_compiletime_assert'
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   net/smc/smc_llc.c:409:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     409 |         BUILD_BUG_ON_MSG(
         |         ^~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:322:45: error: call to '__compiletime_assert_570' declared with attribute error: must adapt SMC_WR_TX_SIZE to sizeof(struct smc_llc_msg); if not all smc_wr upper layer protocols use the same message size any more, must start to set link->wr_tx_sges[i].length on each individual smc_wr_tx_send()
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:303:25: note: in definition of macro '__compiletime_assert'
     303 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:322:9: note: in expansion of macro '_compiletime_assert'
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   net/smc/smc_llc.c:412:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     412 |         BUILD_BUG_ON_MSG(
         |         ^~~~~~~~~~~~~~~~
   In function 'smc_llc_add_pending_send',
       inlined from 'smc_llc_add_link_cont' at net/smc/smc_llc.c:833:7:
   include/linux/compiler_types.h:322:45: error: call to '__compiletime_assert_569' declared with attribute error: must increase SMC_WR_BUF_SIZE to at least sizeof(struct smc_llc_msg)
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:303:25: note: in definition of macro '__compiletime_assert'
     303 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:322:9: note: in expansion of macro '_compiletime_assert'
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   net/smc/smc_llc.c:409:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     409 |         BUILD_BUG_ON_MSG(
         |         ^~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:322:45: error: call to '__compiletime_assert_570' declared with attribute error: must adapt SMC_WR_TX_SIZE to sizeof(struct smc_llc_msg); if not all smc_wr upper layer protocols use the same message size any more, must start to set link->wr_tx_sges[i].length on each individual smc_wr_tx_send()
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:303:25: note: in definition of macro '__compiletime_assert'
     303 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:322:9: note: in expansion of macro '_compiletime_assert'
     322 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   net/smc/smc_llc.c:412:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     412 |         BUILD_BUG_ON_MSG(
         |         ^~~~~~~~~~~~~~~~
   In function 'smc_llc_add_pending_send',


vim +40 net/smc/smc_llc.c

    23	
    24	struct smc_llc_hdr {
    25		struct smc_wr_rx_hdr common;
    26		union {
    27			struct {
    28				u8 length;	/* 44 */
    29		#if defined(__BIG_ENDIAN_BITFIELD)
    30				u8 reserved:4,
    31				   add_link_rej_rsn:4;
    32	#elif defined(__LITTLE_ENDIAN_BITFIELD)
    33				u8 add_link_rej_rsn:4,
    34				   reserved:4;
    35	#endif
    36			};
    37			u16 length_v2;	/* 44 - 8192*/
    38		};
    39		u8 flags;
  > 40	} __packed;		/* format defined in
    41				 * IBM Shared Memory Communications Version 2
    42				 * (https://www.ibm.com/support/pages/node/6326337)
    43				 */
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
