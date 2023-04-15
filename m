Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9F2108
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 12:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681562384; x=1713098384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HLjgHGIm6tRtJ6Kc2u1WI5T7esfHOovptYwR1aYTOtU=;
  b=EpQWe0Dq98z+wbuCX9iMrmmL5emFpQu1C/U0PLU9zOnezdJBvWM+8hcI
   ABqnP+60w5B7+/JFNOJq+DFUvTAISc9IYJvB7DIw1lJ35EMM8R3ebb8Fg
   FofcuyS8PuBKCDvnBT3CU0mRQfJrcebSHhapdFMb68Mnm7DqwmA/SnNc/
   WE+3Kwkzkl8p8pIBUdVyJne/1uxV2tJ/GKb9C8tu5h5sKIYhpVqtIQ8jH
   1e4jYuGMtlMvTvYvJnXTOq5470qJBqPb8U90Kf/h3HletcABTYvwRUySq
   Gkt0rM8D7pRDQfXAENd5EYCsfAY5js/spbnogs7kFezAF4jCOxSj0g6YL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346484488"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="346484488"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 05:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="759451609"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="759451609"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2023 05:39:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnfBr-000b1c-1O;
	Sat, 15 Apr 2023 12:39:39 +0000
Date: Sat, 15 Apr 2023 20:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4270/9838]
 include/linux/fortify-string.h:186:9: error: expected identifier or '('
 before '__builtin_choose_expr'
Message-ID: <202304152003.85fNlTno-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 0eb345fbc43244aac2b6e72a2d4c677181d6765d [4270/9838] net: sdk_fman: remove obsolete modversions.h includes
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304152003.85fNlTno-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/0eb345fbc43244aac2b6e72a2d4c677181d6765d
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 0eb345fbc43244aac2b6e72a2d4c677181d6765d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304152003.85fNlTno-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:253,
                    from drivers/net/ethernet/freescale/sdk_fman/inc/string_ext.h:40,
                    from drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c:40:
>> include/linux/fortify-string.h:186:9: error: expected identifier or '(' before '__builtin_choose_expr'
     186 |         __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/inc/stdlib_ext.h:93:8: note: in expansion of macro 'strlen'
      93 | size_t strlen(const char * s);
         |        ^~~~~~
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c: In function 'Sprint':
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c:54:5: warning: function 'Sprint' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      54 |     i=vsprintf(buf,fmt,args);
         |     ^
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c: In function 'Snprint':
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c:65:5: warning: function 'Snprint' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      65 |     i=vsnprintf(buf,size,fmt,args);
         |     ^
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c: In function 'Sscan':
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c:77:5: warning: function 'Sscan' might be a candidate for 'gnu_scanf' format attribute [-Wsuggest-attribute=format]
      77 |     i = vsscanf(buf,fmt,args);
         |     ^
--
   In file included from drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fsl_fman.h:45,
                    from drivers/net/ethernet/freescale/sdk_dpaa/mac.h:40,
                    from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:69:
   include/linux/fsl_qman.h:415:1: warning: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Wpacked-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1679:1: warning: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Wpacked-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: warning: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Wpacked-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   In file included from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:76:
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.h:227:40: error: field 'bstats' has incomplete type
     227 |         struct gnet_stats_basic_packed bstats;
         |                                        ^~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:433:1: warning: no previous prototype for 'priv_rx_error_dqrr' [-Wmissing-prototypes]
     433 | priv_rx_error_dqrr(struct qman_portal           *portal,
         | ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:465:1: warning: no previous prototype for 'priv_rx_default_dqrr' [-Wmissing-prototypes]
     465 | priv_rx_default_dqrr(struct qman_portal         *portal,
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:505:1: warning: no previous prototype for 'priv_tx_conf_error_dqrr' [-Wmissing-prototypes]
     505 | priv_tx_conf_error_dqrr(struct qman_portal              *portal,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:527:1: warning: no previous prototype for 'priv_tx_conf_default_dqrr' [-Wmissing-prototypes]
     527 | priv_tx_conf_default_dqrr(struct qman_portal            *portal,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:552:6: warning: no previous prototype for 'priv_ern' [-Wmissing-prototypes]
     552 | void priv_ern(struct qman_portal        *portal,
         |      ^~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:685:29: error: initialization of 'u16 (*)(struct net_device *, struct sk_buff *, struct net_device *)' {aka 'short unsigned int (*)(struct net_device *, struct sk_buff *, struct net_device *)'} from incompatible pointer type 'u16 (*)(struct net_device *, struct sk_buff *, struct net_device *, u16 (*)(struct net_device *, struct sk_buff *, struct net_device *))' {aka 'short unsigned int (*)(struct net_device *, struct sk_buff *, struct net_device *, short unsigned int (*)(struct net_device *, struct sk_buff *, struct net_device *))'} [-Werror=incompatible-pointer-types]
     685 |         .ndo_select_queue = dpa_select_queue,
         |                             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:685:29: note: (near initialization for 'dpa_private_ops.ndo_select_queue')
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:107:19: warning: 'rtx' defined but not used [-Wunused-const-variable=]
     107 | static const char rtx[][3] = {
         |                   ^~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:54:
   include/linux/fsl_qman.h:415:1: warning: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Wpacked-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1679:1: warning: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Wpacked-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: warning: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Wpacked-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c: In function 'set_1gmac_loopback':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:197:16: error: implicit declaration of function 'macdev_priv'; did you mean 'netdev_priv'? [-Werror=implicit-function-declaration]
     197 |         priv = macdev_priv(mac_dev);
         |                ^~~~~~~~~~~
         |                netdev_priv
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:197:14: warning: assignment to 'struct mac_priv_s *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     197 |         priv = macdev_priv(mac_dev);
         |              ^
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:207:9: error: implicit declaration of function 'memac_set_loopback' [-Werror=implicit-function-declaration]
     207 |         memac_set_loopback(p_memac->p_MemMap, en);
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c: At top level:
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:326:20: warning: no previous prototype for 'match_dpa_to_fmt_port' [-Wmissing-prototypes]
     326 | struct fmt_port_s *match_dpa_to_fmt_port(
         |                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:349:6: warning: no previous prototype for 'dump_frame' [-Wmissing-prototypes]
     349 | void dump_frame(
         |      ^~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:365:6: warning: no previous prototype for 'test_and_steal_frame' [-Wmissing-prototypes]
     365 | bool test_and_steal_frame(struct fmt_port_s *fmt_port,
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:477:27: warning: no previous prototype for 'fmt_rx_default_hook' [-Wmissing-prototypes]
     477 | enum dpaa_eth_hook_result fmt_rx_default_hook(
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:515:27: warning: no previous prototype for 'fmt_rx_error_hook' [-Wmissing-prototypes]
     515 | enum dpaa_eth_hook_result fmt_rx_error_hook(
         |                           ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:556:27: warning: no previous prototype for 'fmt_tx_confirm_hook' [-Wmissing-prototypes]
     556 | enum dpaa_eth_hook_result fmt_tx_confirm_hook(
         |                           ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:597:27: warning: no previous prototype for 'fmt_tx_confirm_error_hook' [-Wmissing-prototypes]
     597 | enum dpaa_eth_hook_result fmt_tx_confirm_error_hook(
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:636:26: warning: no previous prototype for 'fmt_egress_dqrr' [-Wmissing-prototypes]
     636 | enum qman_cb_dqrr_result fmt_egress_dqrr(
         |                          ^~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:666:5: warning: no previous prototype for 'fmt_fq_alloc' [-Wmissing-prototypes]
     666 | int fmt_fq_alloc(
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:825:5: warning: no previous prototype for 'dpa_alloc_pcd_fqids' [-Wmissing-prototypes]
     825 | int dpa_alloc_pcd_fqids(
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:907:5: warning: no previous prototype for 'dpa_free_pcd_fqids' [-Wmissing-prototypes]
     907 | int dpa_free_pcd_fqids(
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c: In function 'fmt_port_init':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:1032:26: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
    1032 |                 _errno = of_address_to_resource(fm_node, 0, &res);
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c: At top level:
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:1371:9: warning: no previous prototype for 'fmt_read' [-Wmissing-prototypes]
    1371 | ssize_t fmt_read(
         |         ^~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:1470:9: warning: no previous prototype for 'fmt_write' [-Wmissing-prototypes]
    1470 | ssize_t fmt_write(
         |         ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +186 include/linux/fortify-string.h

369cd2165d7bea Kees Cook      2021-08-04  179  
67ebc3ab446230 Kees Cook      2022-02-08  180  /*
67ebc3ab446230 Kees Cook      2022-02-08  181   * Defined after fortified strnlen to reuse it. However, it must still be
67ebc3ab446230 Kees Cook      2022-02-08  182   * possible for strlen() to be used on compile-time strings for use in
67ebc3ab446230 Kees Cook      2022-02-08  183   * static initializers (i.e. as a constant expression).
67ebc3ab446230 Kees Cook      2022-02-08  184   */
67ebc3ab446230 Kees Cook      2022-02-08  185  #define strlen(p)							\
67ebc3ab446230 Kees Cook      2022-02-08 @186  	__builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),	\
67ebc3ab446230 Kees Cook      2022-02-08  187  		__builtin_strlen(p), __fortify_strlen(p))
92df138a8d663c Kees Cook      2022-02-08  188  __FORTIFY_INLINE __diagnose_as(__builtin_strlen, 1)
281d0c962752fb Kees Cook      2022-02-08  189  __kernel_size_t __fortify_strlen(const char * const POS p)
a28a6e860c6cf2 Francis Laniel 2021-02-25  190  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  191  	__kernel_size_t ret;
9f7d69c5cd2390 Kees Cook      2022-09-19  192  	size_t p_size = __member_size(p);
a28a6e860c6cf2 Francis Laniel 2021-02-25  193  
3009f891bb9f32 Kees Cook      2021-08-02  194  	/* Give up if we don't know how large p is. */
311fb40aa0569a Kees Cook      2022-09-02  195  	if (p_size == SIZE_MAX)
a28a6e860c6cf2 Francis Laniel 2021-02-25  196  		return __underlying_strlen(p);
a28a6e860c6cf2 Francis Laniel 2021-02-25  197  	ret = strnlen(p, p_size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  198  	if (p_size <= ret)
a28a6e860c6cf2 Francis Laniel 2021-02-25  199  		fortify_panic(__func__);
a28a6e860c6cf2 Francis Laniel 2021-02-25  200  	return ret;
a28a6e860c6cf2 Francis Laniel 2021-02-25  201  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  202  

:::::: The code at line 186 was first introduced by commit
:::::: 67ebc3ab446230c77fe3b545a9d8a11cac1cfb6e fortify: Make sure strlen() may still be used as a constant expression

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
