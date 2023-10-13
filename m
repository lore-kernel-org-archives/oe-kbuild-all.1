Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3645111AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfMKfe/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697193916; x=1728729916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IwnQO3fQDT9xuXNhkLo3ZfCGb89HdpCrpOwF4aszkro=;
  b=JfMKfe/+SS5iRZVrfi0R/fxqEipR3HLjQpS368VO09L6JbBUQ46zl2F5
   NyrSqEo3aYWT7+UPFU7gdinFQiMtxDGIylcDkpdYFQ15csq8rDeyp0woB
   YFt+7ATvqBk/KbM2PGYebBq3JpfM1tgVu3o6P+py5xEl8/inXVpwJDvPk
   PYasPSVAWtmNlVoaYwHRUrl4NQyD9qmSSL3DRGRWBkRwE5N1tN5uugSAI
   cSonc69owlia803JLyBC4hbz0h2rDdNvWV1MAboI5iYa/Zs9RM7UwcpRT
   vHLXyT+E1Hl6lPCPyMHiJoLiLhaC2i/rydT8i6I3zAtSbxIBRSz5elQI9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375503489"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="375503489"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 03:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731323643"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="731323643"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 03:45:11 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrFfJ-0004dx-1G;
	Fri, 13 Oct 2023 10:45:09 +0000
Date: Fri, 13 Oct 2023 18:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2462/30000]
 include/asm-generic/fixmap.h:32:26: error: comparison of unsigned expression
 in '>= 0' is always true
Message-ID: <202310131851.3xZXbL1Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: d30d0c1e963944b56c0b21744b1996039fa4eb8c [2462/30000] config: add SDK QBMan driver
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310131851.3xZXbL1Y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131851.3xZXbL1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131851.3xZXbL1Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/kernel.h:11,
                    from drivers/staging/fsl_qbman/dpa_sys.h:35,
                    from drivers/staging/fsl_qbman/dpa_alloc.c:32:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
>> include/asm-generic/fixmap.h:32:26: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:330:23: note: in definition of macro '__compiletime_assert'
     330 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:9: note: in expansion of macro 'BUILD_BUG_ON'
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from drivers/staging/fsl_qbman/dpa_sys.h:54:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
>> arch/um/include/asm/uaccess.h:17:36: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66:
   include/linux/fsl_qman.h: At top level:
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
   include/linux/fsl_qman.h:1679:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   cc1: all warnings being treated as errors
--
   cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/kernel.h:11,
                    from drivers/staging/fsl_qbman/dpa_sys.h:35,
                    from drivers/staging/fsl_qbman/bman_private.h:32,
                    from drivers/staging/fsl_qbman/bman_low.h:32,
                    from drivers/staging/fsl_qbman/bman_high.c:32:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
>> include/asm-generic/fixmap.h:32:26: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:330:23: note: in definition of macro '__compiletime_assert'
     330 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:9: note: in expansion of macro 'BUILD_BUG_ON'
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from drivers/staging/fsl_qbman/dpa_sys.h:54:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
>> arch/um/include/asm/uaccess.h:17:36: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66:
   include/linux/fsl_qman.h: At top level:
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
   include/linux/fsl_qman.h:1679:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   drivers/staging/fsl_qbman/bman_low.h: In function 'bm_rcr_init':
   drivers/staging/fsl_qbman/bman_low.h:223:44: error: 'BM_CL_RCR' undeclared (first use in this function)
     223 |         rcr->ring = portal->addr.addr_ce + BM_CL_RCR;
         |                                            ^~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:223:44: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:13,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:393,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12:
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_CI_CINH' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/swab.h:117:39: note: in definition of macro '__swab32'
     117 |         (__builtin_constant_p((__u32)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:224:19: note: in expansion of macro 'bm_in'
     224 |         rcr->ci = bm_in(RCR_CI_CINH) & (BM_RCR_SIZE - 1);
         |                   ^~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_PI_CINH' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/swab.h:117:39: note: in definition of macro '__swab32'
     117 |         (__builtin_constant_p((__u32)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:226:14: note: in expansion of macro 'bm_in'
     226 |         pi = bm_in(RCR_PI_CINH) & (BM_RCR_SIZE - 1);
         |              ^~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_ITR' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/swab.h:117:39: note: in definition of macro '__swab32'
     117 |         (__builtin_constant_p((__u32)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:231:24: note: in expansion of macro 'bm_in'
     231 |         rcr->ithresh = bm_in(RCR_ITR);
         |                        ^~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_CFG' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/swab.h:117:39: note: in definition of macro '__swab32'
     117 |         (__builtin_constant_p((__u32)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:237:16: note: in expansion of macro 'bm_in'
--
   cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/asm-generic/bug.h:5,
                    from ./arch/um/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9,
                    from include/asm-generic/cacheflush.h:6,
                    from arch/x86/include/asm/cacheflush.h:6,
                    from drivers/staging/fsl_qbman/bman_config.c:32:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
>> include/asm-generic/fixmap.h:32:26: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:330:23: note: in definition of macro '__compiletime_assert'
     330 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:9: note: in expansion of macro 'BUILD_BUG_ON'
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from drivers/staging/fsl_qbman/dpa_sys.h:54,
                    from drivers/staging/fsl_qbman/bman_private.h:32,
                    from drivers/staging/fsl_qbman/bman_config.c:33:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
>> arch/um/include/asm/uaccess.h:17:36: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66:
   include/linux/fsl_qman.h: At top level:
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
   include/linux/fsl_qman.h:1679:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   drivers/staging/fsl_qbman/bman_config.c: In function '__bm_in':
   drivers/staging/fsl_qbman/bman_config.c:187:16: error: implicit declaration of function 'in_be32' [-Werror=implicit-function-declaration]
     187 |         return in_be32((void *)bm + offset);
         |                ^~~~~~~
   drivers/staging/fsl_qbman/bman_config.c: In function '__bm_out':
   drivers/staging/fsl_qbman/bman_config.c:191:9: error: implicit declaration of function 'out_be32' [-Werror=implicit-function-declaration]
     191 |         out_be32((void *)bm + offset, val);
         |         ^~~~~~~~
   drivers/staging/fsl_qbman/bman_config.c: At top level:
   drivers/staging/fsl_qbman/bman_config.c:340:12: error: no previous prototype for 'bman_init_early' [-Werror=missing-prototypes]
     340 | __init int bman_init_early(void)
         |            ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   cc1: error: arch/um/include/uapi: No such file or directory [-Werror=missing-include-dirs]
   In file included from include/linux/kernel.h:11,
                    from drivers/staging/fsl_qbman/dpa_sys.h:35,
                    from drivers/staging/fsl_qbman/bman_private.h:32,
                    from drivers/staging/fsl_qbman/bman_low.h:32,
                    from drivers/staging/fsl_qbman/bman_driver.c:31:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
>> include/asm-generic/fixmap.h:32:26: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:330:23: note: in definition of macro '__compiletime_assert'
     330 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:32:9: note: in expansion of macro 'BUILD_BUG_ON'
      32 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:11,
                    from drivers/staging/fsl_qbman/dpa_sys.h:54:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
>> arch/um/include/asm/uaccess.h:17:36: error: comparison of unsigned expression in '>= 0' is always true [-Werror=type-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66:
   include/linux/fsl_qman.h: At top level:
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
   include/linux/fsl_qman.h:1679:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   drivers/staging/fsl_qbman/bman_low.h: In function 'bm_rcr_init':
   drivers/staging/fsl_qbman/bman_low.h:223:44: error: 'BM_CL_RCR' undeclared (first use in this function)
     223 |         rcr->ring = portal->addr.addr_ce + BM_CL_RCR;
         |                                            ^~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:223:44: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/little_endian.h:13,
                    from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/x86/include/asm/bitops.h:393,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12:
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_CI_CINH' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/swab.h:117:39: note: in definition of macro '__swab32'
     117 |         (__builtin_constant_p((__u32)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:224:19: note: in expansion of macro 'bm_in'
     224 |         rcr->ci = bm_in(RCR_CI_CINH) & (BM_RCR_SIZE - 1);
         |                   ^~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_PI_CINH' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/swab.h:117:39: note: in definition of macro '__swab32'
     117 |         (__builtin_constant_p((__u32)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:226:14: note: in expansion of macro 'bm_in'
     226 |         pi = bm_in(RCR_PI_CINH) & (BM_RCR_SIZE - 1);
         |              ^~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_RCR_ITR' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/swab.h:117:39: note: in definition of macro '__swab32'
     117 |         (__builtin_constant_p((__u32)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:231:24: note: in expansion of macro 'bm_in'
     231 |         rcr->ithresh = bm_in(RCR_ITR);
         |                        ^~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:56: error: 'BM_REG_CFG' undeclared (first use in this function)
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                                        ^~~~~~~
   include/uapi/linux/swab.h:117:39: note: in definition of macro '__swab32'
     117 |         (__builtin_constant_p((__u32)(x)) ?     \
         |                                       ^
   include/linux/byteorder/generic.h:95:21: note: in expansion of macro '__be32_to_cpu'
      95 | #define be32_to_cpu __be32_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:91:33: note: in expansion of macro '__bm_in'
      91 | #define bm_in(reg)              __bm_in(&portal->addr, BM_REG_##reg)
         |                                 ^~~~~~~
   drivers/staging/fsl_qbman/bman_low.h:237:16: note: in expansion of macro 'bm_in'
..


vim +32 include/asm-generic/fixmap.h

d57c33c5daa4ef Mark Salter 2014-01-23  23  
d57c33c5daa4ef Mark Salter 2014-01-23  24  #ifndef __ASSEMBLY__
d57c33c5daa4ef Mark Salter 2014-01-23  25  /*
d57c33c5daa4ef Mark Salter 2014-01-23  26   * 'index to address' translation. If anyone tries to use the idx
d57c33c5daa4ef Mark Salter 2014-01-23  27   * directly without translation, we catch the bug with a NULL-deference
d57c33c5daa4ef Mark Salter 2014-01-23  28   * kernel oops. Illegal ranges of incoming indices are caught too.
d57c33c5daa4ef Mark Salter 2014-01-23  29   */
d57c33c5daa4ef Mark Salter 2014-01-23  30  static __always_inline unsigned long fix_to_virt(const unsigned int idx)
d57c33c5daa4ef Mark Salter 2014-01-23  31  {
d57c33c5daa4ef Mark Salter 2014-01-23 @32  	BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
d57c33c5daa4ef Mark Salter 2014-01-23  33  	return __fix_to_virt(idx);
d57c33c5daa4ef Mark Salter 2014-01-23  34  }
d57c33c5daa4ef Mark Salter 2014-01-23  35  

:::::: The code at line 32 was first introduced by commit
:::::: d57c33c5daa4efa9e4d303bd0faf868080b532be add generic fixmap.h

:::::: TO: Mark Salter <msalter@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
