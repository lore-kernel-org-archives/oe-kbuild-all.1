Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D923A6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="db+WYrNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697358696; x=1728894696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Upkq0IRnJNkyJIQEonRx9SKYqoVGeMm8dPVFqQHHixg=;
  b=db+WYrNa+CMLGSvAfiqn0x2m5YeN0er8hDUedSJB4MP9LnBZUjz7Y6KO
   gCx6Vk6W7pT4Cwx/lCqxFBquaUBeEOxHDGOlfJUaTnEqJaCcAoRxJ2hBw
   4pNcFc+rz104J5nfTttXVV7J36IpCElrXmbB+lA7A/IhA6ZGibrRRRmyr
   d7JXo9jkMsMTtpnKSx1awS00ZObDciFsERU+ezC12r/XMA+iIEAwqMB92
   u2sBpfcLiUUtxEJVTv1SvTQ/q99sTwy7o5SEzeb4y/iV/OroQ00wogHnc
   1mFLU/vJiChUvLGMiZuB3gIVfJyFTciMLh+ObrAJaNlauDo5xnfHD1vGe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388233102"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="388233102"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:31:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1086710861"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1086710861"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Oct 2023 01:31:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrwX4-0007EH-36;
	Sun, 15 Oct 2023 08:31:30 +0000
Date: Sun, 15 Oct 2023 16:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2463/30000] include/linux/fsl_qman.h:415:1:
 warning: alignment 1 of 'struct qm_eqcr_entry' is less than 8
Message-ID: <202310151644.eY0lYtgX-lkp@intel.com>
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
commit: 8cf1c902a92d99b8780fc4259d94ffd3109a8242 [2463/30000] net: Makefile: re-add DPAA SDK drivers
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231015/202310151644.eY0lYtgX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151644.eY0lYtgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151644.eY0lYtgX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fsl_fman.h:44,
                    from drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fm_ext.h:157,
                    from drivers/net/ethernet/freescale/sdk_dpaa/mac.c:52:
>> include/linux/fsl_qman.h:415:1: warning: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Wpacked-not-aligned]
     415 | } __packed;
         | ^
>> include/linux/fsl_qman.h:469:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     469 |                 } __packed ern;
         |                 ^
>> include/linux/fsl_qman.h:468:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
>> include/linux/fsl_qman.h:1679:1: warning: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Wpacked-not-aligned]
    1679 | } __packed;
         | ^
>> include/linux/fsl_qman.h:1677:22: warning: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Wpacked-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   drivers/net/ethernet/freescale/sdk_dpaa/mac.c:79:10: error: 'PHY_INTERFACE_MODE_2500SGMII' undeclared here (not in a function); did you mean 'PHY_INTERFACE_MODE_QSGMII'?
      79 |         [PHY_INTERFACE_MODE_2500SGMII] = "sgmii-2500",
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |          PHY_INTERFACE_MODE_QSGMII
   drivers/net/ethernet/freescale/sdk_dpaa/mac.c:79:10: error: array index in initializer not of integer type
   drivers/net/ethernet/freescale/sdk_dpaa/mac.c:79:10: note: (near initialization for 'phy_str')
   drivers/net/ethernet/freescale/sdk_dpaa/mac.c:106:10: error: array index in initializer not of integer type
     106 |         [PHY_INTERFACE_MODE_2500SGMII] = SPEED_2500,
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/mac.c:106:10: note: (near initialization for 'phy2speed')
--
   In file included from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:36,
                    from drivers/net/ethernet/freescale/sdk_dpaa/mac-api.c:49:
>> include/linux/fsl_qman.h:415:1: warning: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Wpacked-not-aligned]
     415 | } __packed;
         | ^
>> include/linux/fsl_qman.h:469:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     469 |                 } __packed ern;
         |                 ^
>> include/linux/fsl_qman.h:468:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
>> include/linux/fsl_qman.h:1679:1: warning: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Wpacked-not-aligned]
    1679 | } __packed;
         | ^
>> include/linux/fsl_qman.h:1677:22: warning: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Wpacked-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:505:23: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     505 | static inline ssize_t __const __must_check __attribute__((nonnull))
         |                       ^~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:511:23: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     511 | static inline ssize_t __const __must_check __attribute__((nonnull))
         |                       ^~~~~~~
--
   In file included from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:36,
                    from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_ethtool.c:46:
>> include/linux/fsl_qman.h:415:1: warning: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Wpacked-not-aligned]
     415 | } __packed;
         | ^
>> include/linux/fsl_qman.h:469:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     469 |                 } __packed ern;
         |                 ^
>> include/linux/fsl_qman.h:468:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
>> include/linux/fsl_qman.h:1679:1: warning: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Wpacked-not-aligned]
    1679 | } __packed;
         | ^
>> include/linux/fsl_qman.h:1677:22: warning: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Wpacked-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:505:23: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     505 | static inline ssize_t __const __must_check __attribute__((nonnull))
         |                       ^~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:511:23: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     511 | static inline ssize_t __const __must_check __attribute__((nonnull))
         |                       ^~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_ethtool.c: In function 'dpa_get_ksettings':
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_ethtool.c:109:16: warning: '_errno' may be used uninitialized [-Wmaybe-uninitialized]
     109 |         return _errno;
         |                ^~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_ethtool.c:93:34: note: '_errno' was declared here
      93 |         int                      _errno;
         |                                  ^~~~~~
--
   In file included from drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fsl_fman.h:44,
                    from drivers/net/ethernet/freescale/sdk_dpaa/mac.h:40,
                    from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:68:
>> include/linux/fsl_qman.h:415:1: warning: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Wpacked-not-aligned]
     415 | } __packed;
         | ^
>> include/linux/fsl_qman.h:469:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     469 |                 } __packed ern;
         |                 ^
>> include/linux/fsl_qman.h:468:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
>> include/linux/fsl_qman.h:1679:1: warning: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Wpacked-not-aligned]
    1679 | } __packed;
         | ^
>> include/linux/fsl_qman.h:1677:22: warning: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Wpacked-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   In file included from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:69:
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:505:23: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     505 | static inline ssize_t __const __must_check __attribute__((nonnull))
         |                       ^~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:511:23: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
     511 | static inline ssize_t __const __must_check __attribute__((nonnull))
         |                       ^~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c: In function 'dpaa_eth_poll':
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:383:21: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
     383 |                 int tmp;
         |                     ^~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c: At top level:
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:430:1: warning: no previous prototype for 'priv_rx_error_dqrr' [-Wmissing-prototypes]
     430 | priv_rx_error_dqrr(struct qman_portal           *portal,
         | ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:462:1: warning: no previous prototype for 'priv_rx_default_dqrr' [-Wmissing-prototypes]
     462 | priv_rx_default_dqrr(struct qman_portal         *portal,
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:502:1: warning: no previous prototype for 'priv_tx_conf_error_dqrr' [-Wmissing-prototypes]
     502 | priv_tx_conf_error_dqrr(struct qman_portal              *portal,
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:524:1: warning: no previous prototype for 'priv_tx_conf_default_dqrr' [-Wmissing-prototypes]
     524 | priv_tx_conf_default_dqrr(struct qman_portal            *portal,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:549:6: warning: no previous prototype for 'priv_ern' [-Wmissing-prototypes]
     549 | void priv_ern(struct qman_portal        *portal,
         |      ^~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:103:19: warning: 'rtx' defined but not used [-Wunused-const-variable=]
     103 | static const char rtx[][3] = {
         |                   ^~~
--
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:231: warning: Cannot understand  * @param net_dev the device for which statistics are calculated
    on line 231 - I thought it was a doc line
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1024: warning: Function parameter or member 'qm' not described in 'dpaa_eth_cgscn'
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1024: warning: Function parameter or member 'cgr' not described in 'dpaa_eth_cgscn'
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1024: warning: Function parameter or member 'congested' not described in 'dpaa_eth_cgscn'
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1641: warning: Function parameter or member 'priv' not described in 'dpa_enable_tx_csum'
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1641: warning: Function parameter or member 'skb' not described in 'dpa_enable_tx_csum'
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1641: warning: Function parameter or member 'fd' not described in 'dpa_enable_tx_csum'
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1641: warning: Function parameter or member 'parse_results' not described in 'dpa_enable_tx_csum'
--
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_Config':
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:3440:45: warning: implicit conversion from 'enum e_FmDmaAidMode' to 'enum fman_dma_aid_mode' [-Wenum-conversion]
    3440 |         p_Fm->p_FmDriverParam->dma_aid_mode = e_FM_DMA_AID_OUT_PORT_ID;
         |                                             ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_Init':
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:3689:51: warning: cast between incompatible function types from 't_Error (*)(void *)' {aka 'unsigned int (*)(void *)'} to 'void (*)(void *)' [-Wcast-function-type]
    3689 |         XX_SetIntr(p_Fm->p_FmStateStruct->errIrq, (void (*) (t_Handle))FM_ErrorIsr, p_Fm);
         |                                                   ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: At top level:
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:5197:6: warning: no previous prototype for 'FM_ChangeClock' [-Wmissing-prototypes]
    5197 | void FM_ChangeClock(t_Handle h_Fm, int hardwarePortId)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_ChangeClock':
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:5199:13: warning: variable 'macId' set but not used [-Wunused-but-set-variable]
    5199 |         int macId;
         |             ^~~~~
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_GetCounter':
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:4804:16: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4804 |             if ((p_Fm->p_FmStateStruct->revInfo.majorRev == 4) ||
         |                ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:4810:9: note: here
    4810 |         case (e_FM_COUNTERS_ENQ_TOTAL_FRAME):
         |         ^~~~
--
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c: In function 'Sprint':
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c:54:5: warning: function 'Sprint' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      54 |     i=vsprintf(buf,fmt,args);
         |     ^
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c: In function 'Snprint':
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c:65:5: warning: function 'Snprint' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      65 |     i=vsnprintf(buf,size,fmt,args);
         |     ^
   drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c: In function 'Sscan':
>> drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c:77:5: warning: function 'Sscan' might be a candidate for 'gnu_scanf' format attribute [-Wsuggest-attribute=format]
      77 |     i = vsscanf(buf,fmt,args);
         |     ^
--
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/MAC/dtsec.c:1454:11: warning: no previous prototype for 'DTSEC_Config' [-Wmissing-prototypes]
    1454 | t_Handle  DTSEC_Config(t_FmMacParams *p_FmMacParam)
         |           ^~~~~~~~~~~~
--
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/MAC/tgec.c:971:10: warning: no previous prototype for 'TGEC_Config' [-Wmissing-prototypes]
     971 | t_Handle TGEC_Config(t_FmMacParams *p_FmMacParam)
         |          ^~~~~~~~~~~
--
   In file included from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.h:45,
                    from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:80:
>> include/linux/fsl_qman.h:415:1: warning: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Wpacked-not-aligned]
     415 | } __packed;
         | ^
>> include/linux/fsl_qman.h:469:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     469 |                 } __packed ern;
         |                 ^
>> include/linux/fsl_qman.h:468:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: warning: alignment 1 of 'struct <anonymous>' is less than 8 [-Wpacked-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: warning: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Wpacked-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
>> include/linux/fsl_qman.h:1679:1: warning: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Wpacked-not-aligned]
    1679 | } __packed;
         | ^
>> include/linux/fsl_qman.h:1677:22: warning: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Wpacked-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_get_max_frm':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:158:5: warning: old-style function definition [-Wold-style-definition]
     158 | int fm_get_max_frm()
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_get_rx_extra_headroom':
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:164:5: warning: old-style function definition [-Wold-style-definition]
     164 | int fm_get_rx_extra_headroom()
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: At top level:
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:762:21: warning: no previous prototype for 'GetFmAdvArgsDevTreeNode' [-Wmissing-prototypes]
     762 | struct device_node *GetFmAdvArgsDevTreeNode (uint8_t fmIndx)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:1592:5: warning: no previous prototype for 'ar_showmem' [-Wmissing-prototypes]
    1592 | int ar_showmem(struct file *file, const char __user *buffer,
         |     ^~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_config_unknown_sci_frame_treatment':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2280:17: warning: implicit conversion from 'fm_macsec_unknown_sci_frame_treatment' to 'e_FmMacsecUnknownSciFrameTreatment' [-Wenum-conversion]
    2280 |                 treat_mode);
         |                 ^~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_config_untag_frame_treatment':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2327:66: warning: implicit conversion from 'fm_macsec_untag_frame_treatment' to 'e_FmMacsecUntagFrameTreatment' [-Wenum-conversion]
    2327 |         err = FM_MACSEC_ConfigUntagFrameTreatment(fm_macsec_dev, treat_mode);
         |                                                                  ^~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_config_exception':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2385:56: warning: implicit conversion from 'fm_macsec_exception' to 'e_FmMacsecExceptions' [-Wenum-conversion]
    2385 |         err = FM_MACSEC_ConfigException(fm_macsec_dev, exception, enable);
         |                                                        ^~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_set_exception':
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2443:53: warning: implicit conversion from 'fm_macsec_exception' to 'e_FmMacsecExceptions' [-Wenum-conversion]
    2443 |         err = FM_MACSEC_SetException(fm_macsec_dev, exception, enable);
         |                                                     ^~~~~~~~~
   In file included from include/uapi/linux/swab.h:6,
                    from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:40:
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2458:37: warning: ordered comparison of pointer with integer zero [-Wextra]
    2458 |         if (unlikely(fm_macsec_secy < 0))
         |                                     ^
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config_sci_insertion_mode':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2500:41: warning: implicit conversion from 'fm_macsec_sci_insertion_mode' to 'e_FmMacsecSciInsertionMode' [-Wenum-conversion]
    2500 |                                         sci_insertion_mode);
         |                                         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config_validation_mode':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2548:53: warning: implicit conversion from 'fm_macsec_valid_frame_behavior' to 'e_FmMacsecValidFrameBehavior' [-Wenum-conversion]
    2548 |                                                     validate_frames);
         |                                                     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config_exception':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2598:66: warning: implicit conversion from 'fm_macsec_secy_exception' to 'e_FmMacsecSecYExceptions' [-Wenum-conversion]
    2598 |         err = FM_MACSEC_SECY_ConfigException(fm_macsec_secy_dev, exception,
         |                                                                  ^~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config_event':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2616:62: warning: implicit conversion from 'fm_macsec_secy_event' to 'e_FmMacsecSecYEvents' [-Wenum-conversion]
    2616 |         err = FM_MACSEC_SECY_ConfigEvent(fm_macsec_secy_dev, event, enable);
         |                                                              ^~~~~
--
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:1002: warning: Cannot understand  * @Function            ResetOnInitErrata_A007273
    on line 1002 - I thought it was a doc line
..


vim +415 include/linux/fsl_qman.h

16ff861424bca7 Madalin Bucur 2017-05-10  366  
16ff861424bca7 Madalin Bucur 2017-05-10  367  /* Macro, so we compile better if 'v' isn't always 64-bit */
16ff861424bca7 Madalin Bucur 2017-05-10  368  #define qm_sg_entry_set64(sg, v) \
16ff861424bca7 Madalin Bucur 2017-05-10  369  	do { \
16ff861424bca7 Madalin Bucur 2017-05-10  370  		struct qm_sg_entry *__sg931 = (sg); \
16ff861424bca7 Madalin Bucur 2017-05-10  371  		__sg931->opaque = cpu_to_be64(v); \
16ff861424bca7 Madalin Bucur 2017-05-10  372  	} while (0)
16ff861424bca7 Madalin Bucur 2017-05-10  373  #define qm_sg_entry_set_ext(sg, v) \
16ff861424bca7 Madalin Bucur 2017-05-10  374  	do { \
16ff861424bca7 Madalin Bucur 2017-05-10  375  		union qm_sg_efl __u932; \
16ff861424bca7 Madalin Bucur 2017-05-10  376  		__u932.efl = be32_to_cpu((sg)->sgt_efl); \
16ff861424bca7 Madalin Bucur 2017-05-10  377  		__u932.extension = v; \
16ff861424bca7 Madalin Bucur 2017-05-10  378  		(sg)->sgt_efl = cpu_to_be32(__u932.efl); \
16ff861424bca7 Madalin Bucur 2017-05-10  379  	} while (0)
16ff861424bca7 Madalin Bucur 2017-05-10  380  #define qm_sg_entry_set_final(sg, v) \
16ff861424bca7 Madalin Bucur 2017-05-10  381  	do { \
16ff861424bca7 Madalin Bucur 2017-05-10  382  		union qm_sg_efl __u933; \
16ff861424bca7 Madalin Bucur 2017-05-10  383  		__u933.efl = be32_to_cpu((sg)->sgt_efl); \
16ff861424bca7 Madalin Bucur 2017-05-10  384  		__u933.final = v; \
16ff861424bca7 Madalin Bucur 2017-05-10  385  		(sg)->sgt_efl = cpu_to_be32(__u933.efl); \
16ff861424bca7 Madalin Bucur 2017-05-10  386  	} while (0)
16ff861424bca7 Madalin Bucur 2017-05-10  387  #define qm_sg_entry_set_len(sg, v) \
16ff861424bca7 Madalin Bucur 2017-05-10  388  	do { \
16ff861424bca7 Madalin Bucur 2017-05-10  389  		union qm_sg_efl __u934; \
16ff861424bca7 Madalin Bucur 2017-05-10  390  		__u934.efl = be32_to_cpu((sg)->sgt_efl); \
16ff861424bca7 Madalin Bucur 2017-05-10  391  		__u934.length = v; \
16ff861424bca7 Madalin Bucur 2017-05-10  392  		(sg)->sgt_efl = cpu_to_be32(__u934.efl); \
16ff861424bca7 Madalin Bucur 2017-05-10  393  	} while (0)
16ff861424bca7 Madalin Bucur 2017-05-10  394  #define qm_sg_entry_set_bpid(sg, v) \
16ff861424bca7 Madalin Bucur 2017-05-10  395  	do { \
16ff861424bca7 Madalin Bucur 2017-05-10  396  		struct qm_sg_entry *__u935 = (sg); \
16ff861424bca7 Madalin Bucur 2017-05-10  397  		__u935->bpid = v; \
16ff861424bca7 Madalin Bucur 2017-05-10  398  	} while (0)
16ff861424bca7 Madalin Bucur 2017-05-10  399  #define qm_sg_entry_set_offset(sg, v) \
16ff861424bca7 Madalin Bucur 2017-05-10  400  	do { \
16ff861424bca7 Madalin Bucur 2017-05-10  401  		struct qm_sg_entry *__u936 = (sg); \
16ff861424bca7 Madalin Bucur 2017-05-10  402  		__u936->opaque_offset = cpu_to_be16(v); \
16ff861424bca7 Madalin Bucur 2017-05-10  403  	} while (0)
16ff861424bca7 Madalin Bucur 2017-05-10  404  
16ff861424bca7 Madalin Bucur 2017-05-10  405  /* See 1.5.8.1: "Enqueue Command" */
16ff861424bca7 Madalin Bucur 2017-05-10  406  struct qm_eqcr_entry {
16ff861424bca7 Madalin Bucur 2017-05-10  407  	u8 __dont_write_directly__verb;
16ff861424bca7 Madalin Bucur 2017-05-10  408  	u8 dca;
16ff861424bca7 Madalin Bucur 2017-05-10  409  	u16 seqnum;
16ff861424bca7 Madalin Bucur 2017-05-10  410  	u32 orp;	/* 24-bit */
16ff861424bca7 Madalin Bucur 2017-05-10  411  	u32 fqid;	/* 24-bit */
16ff861424bca7 Madalin Bucur 2017-05-10  412  	u32 tag;
16ff861424bca7 Madalin Bucur 2017-05-10  413  	struct qm_fd fd;
16ff861424bca7 Madalin Bucur 2017-05-10  414  	u8 __reserved3[32];
16ff861424bca7 Madalin Bucur 2017-05-10 @415  } __packed;
16ff861424bca7 Madalin Bucur 2017-05-10  416  #define QM_EQCR_VERB_VBIT		0x80
16ff861424bca7 Madalin Bucur 2017-05-10  417  #define QM_EQCR_VERB_CMD_MASK		0x61	/* but only one value; */
16ff861424bca7 Madalin Bucur 2017-05-10  418  #define QM_EQCR_VERB_CMD_ENQUEUE	0x01
16ff861424bca7 Madalin Bucur 2017-05-10  419  #define QM_EQCR_VERB_COLOUR_MASK	0x18	/* 4 possible values; */
16ff861424bca7 Madalin Bucur 2017-05-10  420  #define QM_EQCR_VERB_COLOUR_GREEN	0x00
16ff861424bca7 Madalin Bucur 2017-05-10  421  #define QM_EQCR_VERB_COLOUR_YELLOW	0x08
16ff861424bca7 Madalin Bucur 2017-05-10  422  #define QM_EQCR_VERB_COLOUR_RED		0x10
16ff861424bca7 Madalin Bucur 2017-05-10  423  #define QM_EQCR_VERB_COLOUR_OVERRIDE	0x18
16ff861424bca7 Madalin Bucur 2017-05-10  424  #define QM_EQCR_VERB_INTERRUPT		0x04	/* on command consumption */
16ff861424bca7 Madalin Bucur 2017-05-10  425  #define QM_EQCR_VERB_ORP		0x02	/* enable order restoration */
16ff861424bca7 Madalin Bucur 2017-05-10  426  #define QM_EQCR_DCA_ENABLE		0x80
16ff861424bca7 Madalin Bucur 2017-05-10  427  #define QM_EQCR_DCA_PARK		0x40
16ff861424bca7 Madalin Bucur 2017-05-10  428  #define QM_EQCR_DCA_IDXMASK		0x0f	/* "DQRR::idx" goes here */
16ff861424bca7 Madalin Bucur 2017-05-10  429  #define QM_EQCR_SEQNUM_NESN		0x8000	/* Advance NESN */
16ff861424bca7 Madalin Bucur 2017-05-10  430  #define QM_EQCR_SEQNUM_NLIS		0x4000	/* More fragments to come */
16ff861424bca7 Madalin Bucur 2017-05-10  431  #define QM_EQCR_SEQNUM_SEQMASK		0x3fff	/* sequence number goes here */
16ff861424bca7 Madalin Bucur 2017-05-10  432  #define QM_EQCR_FQID_NULL		0	/* eg. for an ORP seqnum hole */
16ff861424bca7 Madalin Bucur 2017-05-10  433  
16ff861424bca7 Madalin Bucur 2017-05-10  434  /* See 1.5.8.2: "Frame Dequeue Response" */
16ff861424bca7 Madalin Bucur 2017-05-10  435  struct qm_dqrr_entry {
16ff861424bca7 Madalin Bucur 2017-05-10  436  	u8 verb;
16ff861424bca7 Madalin Bucur 2017-05-10  437  	u8 stat;
16ff861424bca7 Madalin Bucur 2017-05-10  438  	u16 seqnum;	/* 15-bit */
16ff861424bca7 Madalin Bucur 2017-05-10  439  	u8 tok;
16ff861424bca7 Madalin Bucur 2017-05-10  440  	u8 __reserved2[3];
16ff861424bca7 Madalin Bucur 2017-05-10  441  	u32 fqid;	/* 24-bit */
16ff861424bca7 Madalin Bucur 2017-05-10  442  	u32 contextB;
16ff861424bca7 Madalin Bucur 2017-05-10  443  	struct qm_fd fd;
16ff861424bca7 Madalin Bucur 2017-05-10  444  	u8 __reserved4[32];
16ff861424bca7 Madalin Bucur 2017-05-10  445  };
16ff861424bca7 Madalin Bucur 2017-05-10  446  #define QM_DQRR_VERB_VBIT		0x80
16ff861424bca7 Madalin Bucur 2017-05-10  447  #define QM_DQRR_VERB_MASK		0x7f	/* where the verb contains; */
16ff861424bca7 Madalin Bucur 2017-05-10  448  #define QM_DQRR_VERB_FRAME_DEQUEUE	0x60	/* "this format" */
16ff861424bca7 Madalin Bucur 2017-05-10  449  #define QM_DQRR_STAT_FQ_EMPTY		0x80	/* FQ empty */
16ff861424bca7 Madalin Bucur 2017-05-10  450  #define QM_DQRR_STAT_FQ_HELDACTIVE	0x40	/* FQ held active */
16ff861424bca7 Madalin Bucur 2017-05-10  451  #define QM_DQRR_STAT_FQ_FORCEELIGIBLE	0x20	/* FQ was force-eligible'd */
16ff861424bca7 Madalin Bucur 2017-05-10  452  #define QM_DQRR_STAT_FD_VALID		0x10	/* has a non-NULL FD */
16ff861424bca7 Madalin Bucur 2017-05-10  453  #define QM_DQRR_STAT_UNSCHEDULED	0x02	/* Unscheduled dequeue */
16ff861424bca7 Madalin Bucur 2017-05-10  454  #define QM_DQRR_STAT_DQCR_EXPIRED	0x01	/* VDQCR or PDQCR expired*/
16ff861424bca7 Madalin Bucur 2017-05-10  455  
16ff861424bca7 Madalin Bucur 2017-05-10  456  /* See 1.5.8.3: "ERN Message Response" */
16ff861424bca7 Madalin Bucur 2017-05-10  457  /* See 1.5.8.4: "FQ State Change Notification" */
16ff861424bca7 Madalin Bucur 2017-05-10  458  struct qm_mr_entry {
16ff861424bca7 Madalin Bucur 2017-05-10  459  	u8 verb;
16ff861424bca7 Madalin Bucur 2017-05-10  460  	union {
16ff861424bca7 Madalin Bucur 2017-05-10  461  		struct {
16ff861424bca7 Madalin Bucur 2017-05-10  462  			u8 dca;
16ff861424bca7 Madalin Bucur 2017-05-10  463  			u16 seqnum;
16ff861424bca7 Madalin Bucur 2017-05-10  464  			u8 rc;		/* Rejection Code */
16ff861424bca7 Madalin Bucur 2017-05-10  465  			u32 orp:24;
16ff861424bca7 Madalin Bucur 2017-05-10  466  			u32 fqid;	/* 24-bit */
16ff861424bca7 Madalin Bucur 2017-05-10  467  			u32 tag;
16ff861424bca7 Madalin Bucur 2017-05-10 @468  			struct qm_fd fd;
16ff861424bca7 Madalin Bucur 2017-05-10 @469  		} __packed ern;
16ff861424bca7 Madalin Bucur 2017-05-10  470  		struct {
16ff861424bca7 Madalin Bucur 2017-05-10  471  #if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
16ff861424bca7 Madalin Bucur 2017-05-10  472  			u8 colour:2;	/* See QM_MR_DCERN_COLOUR_* */
16ff861424bca7 Madalin Bucur 2017-05-10  473  			u8 __reserved1:3;
16ff861424bca7 Madalin Bucur 2017-05-10  474  			enum qm_dc_portal portal:3;
16ff861424bca7 Madalin Bucur 2017-05-10  475  #else
16ff861424bca7 Madalin Bucur 2017-05-10  476  			enum qm_dc_portal portal:3;
16ff861424bca7 Madalin Bucur 2017-05-10  477  			u8 __reserved1:3;
16ff861424bca7 Madalin Bucur 2017-05-10  478  			u8 colour:2;	/* See QM_MR_DCERN_COLOUR_* */
16ff861424bca7 Madalin Bucur 2017-05-10  479  #endif
16ff861424bca7 Madalin Bucur 2017-05-10  480  			u16 __reserved2;
16ff861424bca7 Madalin Bucur 2017-05-10  481  			u8 rc;		/* Rejection Code */
16ff861424bca7 Madalin Bucur 2017-05-10  482  			u32 __reserved3:24;
16ff861424bca7 Madalin Bucur 2017-05-10  483  			u32 fqid;	/* 24-bit */
16ff861424bca7 Madalin Bucur 2017-05-10  484  			u32 tag;
16ff861424bca7 Madalin Bucur 2017-05-10  485  			struct qm_fd fd;
16ff861424bca7 Madalin Bucur 2017-05-10 @486  		} __packed dcern;
16ff861424bca7 Madalin Bucur 2017-05-10  487  		struct {
16ff861424bca7 Madalin Bucur 2017-05-10  488  			u8 fqs;		/* Frame Queue Status */
16ff861424bca7 Madalin Bucur 2017-05-10  489  			u8 __reserved1[6];
16ff861424bca7 Madalin Bucur 2017-05-10  490  			u32 fqid;	/* 24-bit */
16ff861424bca7 Madalin Bucur 2017-05-10  491  			u32 contextB;
16ff861424bca7 Madalin Bucur 2017-05-10  492  			u8 __reserved2[16];
16ff861424bca7 Madalin Bucur 2017-05-10  493  		} __packed fq;		/* FQRN/FQRNI/FQRL/FQPN */
16ff861424bca7 Madalin Bucur 2017-05-10  494  	};
16ff861424bca7 Madalin Bucur 2017-05-10  495  	u8 __reserved2[32];
16ff861424bca7 Madalin Bucur 2017-05-10  496  } __packed;
16ff861424bca7 Madalin Bucur 2017-05-10  497  #define QM_MR_VERB_VBIT			0x80
16ff861424bca7 Madalin Bucur 2017-05-10  498  /* The "ern" VERB bits match QM_EQCR_VERB_*** so aren't reproduced here. ERNs
16ff861424bca7 Madalin Bucur 2017-05-10  499   * originating from direct-connect portals ("dcern") use 0x20 as a verb which
16ff861424bca7 Madalin Bucur 2017-05-10  500   * would be invalid as a s/w enqueue verb. A s/w ERN can be distinguished from
16ff861424bca7 Madalin Bucur 2017-05-10  501   * the other MR types by noting if the 0x20 bit is unset. */
16ff861424bca7 Madalin Bucur 2017-05-10  502  #define QM_MR_VERB_TYPE_MASK		0x27
16ff861424bca7 Madalin Bucur 2017-05-10  503  #define QM_MR_VERB_DC_ERN		0x20
16ff861424bca7 Madalin Bucur 2017-05-10  504  #define QM_MR_VERB_FQRN			0x21
16ff861424bca7 Madalin Bucur 2017-05-10  505  #define QM_MR_VERB_FQRNI		0x22
16ff861424bca7 Madalin Bucur 2017-05-10  506  #define QM_MR_VERB_FQRL			0x23
16ff861424bca7 Madalin Bucur 2017-05-10  507  #define QM_MR_VERB_FQPN			0x24
16ff861424bca7 Madalin Bucur 2017-05-10  508  #define QM_MR_RC_MASK			0xf0	/* contains one of; */
16ff861424bca7 Madalin Bucur 2017-05-10  509  #define QM_MR_RC_CGR_TAILDROP		0x00
16ff861424bca7 Madalin Bucur 2017-05-10  510  #define QM_MR_RC_WRED			0x10
16ff861424bca7 Madalin Bucur 2017-05-10  511  #define QM_MR_RC_ERROR			0x20
16ff861424bca7 Madalin Bucur 2017-05-10  512  #define QM_MR_RC_ORPWINDOW_EARLY	0x30
16ff861424bca7 Madalin Bucur 2017-05-10  513  #define QM_MR_RC_ORPWINDOW_LATE		0x40
16ff861424bca7 Madalin Bucur 2017-05-10  514  #define QM_MR_RC_FQ_TAILDROP		0x50
16ff861424bca7 Madalin Bucur 2017-05-10  515  #define QM_MR_RC_ORPWINDOW_RETIRED	0x60
16ff861424bca7 Madalin Bucur 2017-05-10  516  #define QM_MR_RC_ORP_ZERO		0x70
16ff861424bca7 Madalin Bucur 2017-05-10  517  #define QM_MR_FQS_ORLPRESENT		0x02	/* ORL fragments to come */
16ff861424bca7 Madalin Bucur 2017-05-10  518  #define QM_MR_FQS_NOTEMPTY		0x01	/* FQ has enqueued frames */
16ff861424bca7 Madalin Bucur 2017-05-10  519  #define QM_MR_DCERN_COLOUR_GREEN	0x00
16ff861424bca7 Madalin Bucur 2017-05-10  520  #define QM_MR_DCERN_COLOUR_YELLOW	0x01
16ff861424bca7 Madalin Bucur 2017-05-10  521  #define QM_MR_DCERN_COLOUR_RED		0x02
16ff861424bca7 Madalin Bucur 2017-05-10  522  #define QM_MR_DCERN_COLOUR_OVERRIDE	0x03
16ff861424bca7 Madalin Bucur 2017-05-10  523  

:::::: The code at line 415 was first introduced by commit
:::::: 16ff861424bca768a19e92df2cf1920a25c8aa7e fsl_qbman: SDK DPAA 1.x QBMan drivers

:::::: TO: Madalin Bucur <madalin.bucur@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
