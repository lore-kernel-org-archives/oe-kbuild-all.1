Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12D28EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 10:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681987076; x=1713523076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kB2I+DzXASkhOojyf/Wq3VgzN8G+cYE4ker2NwO1s/Q=;
  b=l4NwdUHgd1CWPCjimJ05NQ4vq4sXU4U3UDAbmYCjSlHo/ZY+EnfFcvfI
   q2zGN44uP5tDVwa5GfgwYWwSvYz1OTKF2DiNrIbuUAno9hMqg8VCU7amM
   PoER3uAIxN63di5f2l4UiZMutyI3udI2gNI3QACrKk4/4x5vEEKGA+j3f
   95710lvlIpoxLxWZvKnBXvuG1CHH/1OFsvQyLvO5sVV/MG/4+0se9gkHE
   IDH7SgdIt+Fhbjs/d4EsVX8WPwMY+nMtvGMmXVs7E+bMoFgj6BCs2GtaY
   V9in62goTabjURMBsxtmNj3UuX90cPbY6PFIQdpo45svjb8DdpvvPzuIH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="326026828"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="326026828"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 03:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="691865869"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="691865869"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 03:37:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppRfV-000fks-2U;
	Thu, 20 Apr 2023 10:37:37 +0000
Date: Thu, 20 Apr 2023 18:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4853/9845]
 drivers/staging/fsl_qbman/bman_config.c:191:9: error: implicit declaration
 of function 'out_be32'
Message-ID: <202304201827.j6bIDsPR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   897d73a656fe33d0c4549c5de1d07797f99d6871
commit: fdb22c167ab293a7f792b3f46830be8ba69bda46 [4853/9845] Merge branch 'net/next' into next
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230420/202304201827.j6bIDsPR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/fdb22c167ab293a7f792b3f46830be8ba69bda46
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout fdb22c167ab293a7f792b3f46830be8ba69bda46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/staging/fsl_qbman/ drivers/video/fbdev/mxc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201827.j6bIDsPR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66,
                    from drivers/staging/fsl_qbman/bman_private.h:32,
                    from drivers/staging/fsl_qbman/bman_config.c:33:
   include/linux/fsl_qman.h:415:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1681:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1681 | } __packed;
         | ^
   include/linux/fsl_qman.h:1679:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1679 |         struct qm_fd fd;
         |                      ^~
   drivers/staging/fsl_qbman/bman_config.c: In function '__bm_in':
   drivers/staging/fsl_qbman/bman_config.c:187:16: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
     187 |         return in_be32((void *)bm + offset);
         |                ^~~~~~~
   drivers/staging/fsl_qbman/bman_config.c: In function '__bm_out':
>> drivers/staging/fsl_qbman/bman_config.c:191:9: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
     191 |         out_be32((void *)bm + offset, val);
         |         ^~~~~~~~
   drivers/staging/fsl_qbman/bman_config.c: At top level:
   drivers/staging/fsl_qbman/bman_config.c:340:12: error: no previous prototype for 'bman_init_early' [-Werror=missing-prototypes]
     340 | __init int bman_init_early(void)
         |            ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66,
                    from drivers/staging/fsl_qbman/qman_private.h:32,
                    from drivers/staging/fsl_qbman/qman_config.c:33:
   include/linux/fsl_qman.h:415:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1681:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1681 | } __packed;
         | ^
   include/linux/fsl_qman.h:1679:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1679 |         struct qm_fd fd;
         |                      ^~
   drivers/staging/fsl_qbman/qman_config.c: In function '__qm_in':
>> drivers/staging/fsl_qbman/qman_config.c:317:16: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
     317 |         return in_be32((void *)qm + offset);
         |                ^~~~~~~
   drivers/staging/fsl_qbman/qman_config.c: In function '__qm_out':
   drivers/staging/fsl_qbman/qman_config.c:321:9: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
     321 |         out_be32((void *)qm + offset, val);
         |         ^~~~~~~~
   drivers/staging/fsl_qbman/qman_config.c: In function 'qm_init_pfdr':
   drivers/staging/fsl_qbman/qman_config.c:428:9: error: implicit declaration of function 'lwsync' [-Werror=implicit-function-declaration]
     428 |         lwsync();
         |         ^~~~~~
   drivers/staging/fsl_qbman/qman_config.c: In function 'get_qman_fqd_size':
   drivers/staging/fsl_qbman/qman_config.c:482:8: error: old-style function definition [-Werror=old-style-definition]
     482 | size_t get_qman_fqd_size()
         |        ^~~~~~~~~~~~~~~~~
   drivers/staging/fsl_qbman/qman_config.c: In function 'parse_mem_property':
   drivers/staging/fsl_qbman/qman_config.c:514:17: error: implicit declaration of function 'flush_dcache_range'; did you mean 'flush_cache_range'? [-Werror=implicit-function-declaration]
     514 |                 flush_dcache_range((unsigned long)tmpp,
         |                 ^~~~~~~~~~~~~~~~~~
         |                 flush_cache_range
   drivers/staging/fsl_qbman/qman_config.c: At top level:
   drivers/staging/fsl_qbman/qman_config.c:599:12: error: no previous prototype for 'qman_init_early' [-Werror=missing-prototypes]
     599 | __init int qman_init_early(void)
         |            ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
         |                                                    ^
   drivers/staging/fsl_qbman/bman_low.h:330:9: note: in expansion of macro 'bm_cl_out'
     330 |         bm_cl_out(RCR_PI, RCR_PTR2IDX(rcr->cursor));
         |         ^~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h: In function 'bm_rcr_cci_update':
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_CI_CINH' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:358:19: note: in expansion of macro 'bm_in'
     358 |         rcr->ci = bm_in(RCR_CI_CINH) & (BM_RCR_SIZE - 1);
         |                   ^~~~~
   drivers/staging/fsl_qbman/bman_low.h: In function 'bm_rcr_cce_prefetch':
   drivers/staging/fsl_qbman/bman_low.h:105:61: error: 'BM_CL_RCR_CI_CENA' undeclared (first use in this function)
     105 | #define bm_cl_touch_ro(reg) __bm_cl_touch_ro(&portal->addr, BM_CL_##reg##_CENA)
         |                                                             ^~~~~~
   drivers/staging/fsl_qbman/bman_low.h:95:58: note: in definition of macro '__bm_cl_touch_ro'
      95 | #define __bm_cl_touch_ro(bm, o) dcbt_ro((bm)->addr_ce + (o))
         |                                                          ^
   drivers/staging/fsl_qbman/bman_low.h:368:9: note: in expansion of macro 'bm_cl_touch_ro'
     368 |         bm_cl_touch_ro(RCR_CI);
         |         ^~~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h: In function 'bm_rcr_cce_update':
   drivers/staging/fsl_qbman/bman_low.h:107:55: error: 'BM_CL_RCR_CI_CENA' undeclared (first use in this function)
     107 | #define bm_cl_in(reg)       __bm_cl_in(&portal->addr, BM_CL_##reg##_CENA)
         |                                                       ^~~~~~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:107:29: note: in expansion of macro '__bm_cl_in'
     107 | #define bm_cl_in(reg)       __bm_cl_in(&portal->addr, BM_CL_##reg##_CENA)
         |                             ^~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:376:19: note: in expansion of macro 'bm_cl_in'
     376 |         rcr->ci = bm_cl_in(RCR_CI) & (BM_RCR_SIZE - 1);
         |                   ^~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h: In function 'bm_rcr_set_ithresh':
   drivers/staging/fsl_qbman/bman_low.h:92:57: error: 'BM_REG_RCR_ITR' undeclared (first use in this function)
      92 | #define bm_out(reg, val)        __bm_out(&portal->addr, BM_REG_##reg, val)
         |                                                         ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:90:63: note: in definition of macro '__bm_out'
      90 |                                              (bm)->addr_ci + (o));
         |                                                               ^
   drivers/staging/fsl_qbman/bman_low.h:393:9: note: in expansion of macro 'bm_out'
     393 |         bm_out(RCR_ITR, ithresh);
         |         ^~~~~~
   drivers/staging/fsl_qbman/bman_low.h: In function 'bm_mc_init':
   drivers/staging/fsl_qbman/bman_low.h:415:41: error: 'BM_CL_CR' undeclared (first use in this function)
     415 |         mc->cr = portal->addr.addr_ce + BM_CL_CR;
         |                                         ^~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:416:41: error: 'BM_CL_RR0' undeclared (first use in this function)
     416 |         mc->rr = portal->addr.addr_ce + BM_CL_RR0;
         |                                         ^~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h: In function 'bm_isr_bscn_mask':
   drivers/staging/fsl_qbman/bman_low.h:505:23: error: implicit declaration of function 'BM_REG_SCN' [-Werror=implicit-function-declaration]
     505 | #define SCN_REG(bpid) BM_REG_SCN((bpid) / 32)
         |                       ^~~~~~~~~~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:513:15: note: in expansion of macro '__bm_in'
     513 |         val = __bm_in(&portal->addr, SCN_REG(bpid));
         |               ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:513:38: note: in expansion of macro 'SCN_REG'
     513 |         val = __bm_in(&portal->addr, SCN_REG(bpid));
         |                                      ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h: In function '__bm_isr_read':
   drivers/staging/fsl_qbman/bman_low.h:526:39: error: 'BM_REG_ISR' undeclared (first use in this function)
     526 |         return __bm_in(&portal->addr, BM_REG_ISR + (n << 2));
         |                                       ^~~~~~~~~~
   include/uapi/linux/swab.h:115:54: note: in definition of macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:526:16: note: in expansion of macro '__bm_in'
     526 |         return __bm_in(&portal->addr, BM_REG_ISR + (n << 2));
         |                ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h: In function '__bm_isr_write':
   drivers/staging/fsl_qbman/bman_low.h:536:33: error: 'BM_REG_ISR' undeclared (first use in this function)
     536 |         __bm_out(&portal->addr, BM_REG_ISR + (n << 2), val);
         |                                 ^~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:90:63: note: in definition of macro '__bm_out'
      90 |                                              (bm)->addr_ci + (o));
         |                                                               ^
   drivers/staging/fsl_qbman/fsl_usdpaa_irq.c: In function 'usdpaa_irq_release':
>> drivers/staging/fsl_qbman/fsl_usdpaa_irq.c:84:17: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
      84 |                 out_be32(ctx->inhibit_addr, 0x1);
         |                 ^~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66,
                    from drivers/staging/fsl_qbman/qman_private.h:32,
                    from drivers/staging/fsl_qbman/qman_debugfs.c:31:
   include/linux/fsl_qman.h:415:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1681:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1681 | } __packed;
         | ^
   include/linux/fsl_qman.h:1679:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1679 |         struct qm_fd fd;
         |                      ^~
   drivers/staging/fsl_qbman/qman_debugfs.c: In function 'qman_ccsrmempeek':
>> drivers/staging/fsl_qbman/qman_debugfs.c:926:16: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
     926 |         *val = in_be32(addr);
         |                ^~~~~~~
   cc1: all warnings being treated as errors


vim +/out_be32 +191 drivers/staging/fsl_qbman/bman_config.c

4c43588a2cdb7e Madalin Bucur 2020-02-27  184  
4c43588a2cdb7e Madalin Bucur 2020-02-27  185  static inline u32 __bm_in(struct bman *bm, u32 offset)
4c43588a2cdb7e Madalin Bucur 2020-02-27  186  {
4c43588a2cdb7e Madalin Bucur 2020-02-27  187  	return in_be32((void *)bm + offset);
4c43588a2cdb7e Madalin Bucur 2020-02-27  188  }
4c43588a2cdb7e Madalin Bucur 2020-02-27  189  static inline void __bm_out(struct bman *bm, u32 offset, u32 val)
4c43588a2cdb7e Madalin Bucur 2020-02-27  190  {
4c43588a2cdb7e Madalin Bucur 2020-02-27 @191  	out_be32((void *)bm + offset, val);
4c43588a2cdb7e Madalin Bucur 2020-02-27  192  }
4c43588a2cdb7e Madalin Bucur 2020-02-27  193  #define bm_in(reg)		__bm_in(bm, REG_##reg)
4c43588a2cdb7e Madalin Bucur 2020-02-27  194  #define bm_out(reg, val)	__bm_out(bm, REG_##reg, val)
4c43588a2cdb7e Madalin Bucur 2020-02-27  195  

:::::: The code at line 191 was first introduced by commit
:::::: 4c43588a2cdb7e8b01447a8a1d523cc6886e0e4c staging/fsl_qbman: add LSDK-19.09-V4.14 SDK DPAA QBMan files

:::::: TO: Madalin Bucur <madalin.bucur@oss.nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
