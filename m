Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05BA15099C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721742950; cv=none; b=HC3C/ESTqnD6PWQHIGBywK53uHmazHIoTsw1dKXhtGNwaaTY52z/6wcLWQg1/sQTnKb3imGh51k57crQECokMOC4d14B9iLmpEPPTA9TYHXAwhmXejwypgDak44d2l+Gi6n6dbf8vG/b5WNXVMJn1q0lE9H1wgGUTWv0ckfHw50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721742950; c=relaxed/simple;
	bh=eelMt9Ja4VE5xPaURKvgeAkK6HKO5khg8Li/iL8VOuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W/ejh5VkUswLiDdREUWYL9SrZSFdMj6nD9Rag6R6ChMapubgvljHxuSBmBG/ahdgJ0fasMUX8gVoOsYQtmQoLrc8Dk1FkuhVq1Bd3fdf4E18EWivUD+zYEITISaVxFBFqX+6rCZXMwo2MLGYkCm2LaSSwui5rSt46dj29Aylo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bckULalD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bckULalD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721742948; x=1753278948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eelMt9Ja4VE5xPaURKvgeAkK6HKO5khg8Li/iL8VOuY=;
  b=bckULalDfcM+HIuyL3chRERO46/zDQiMLduBarEpwqEymxRinRrLu5ES
   nIoH5F2r3D4HSmcGfNM0vVjV2rrhphL0Izyxr4JPy0v28Mni0KTETUbiE
   OCxj9GvAZcKgfwWSmLzqH8bAxFblwLlAabS2K+pCEzwTwocOqIyqimQ45
   RJ4IK7h4g0Je7PX2pxWxv0Xc7HxwOc2Bgys5KW/+rl0gShniTo7AHaXlm
   BSTmpFOc+MT0g8HnX89C7J+ZjLczaAXbWIjINupynfa+gMoo3XRIxLotG
   VhuaocpENTL+8DTXmQQ3cbf+E0jbwU9RfTwpqHa6zV1Tn4WKIfX4+eaOx
   g==;
X-CSE-ConnectionGUID: ZlWsETvTR8i3x7Xp+gkJnQ==
X-CSE-MsgGUID: EbsH0wrhRh6yCWuf7nFB/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="22267695"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="22267695"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 06:55:37 -0700
X-CSE-ConnectionGUID: kZQq5430RO6XvyAX+91L8A==
X-CSE-MsgGUID: loqJ7dUySuyn5xmJVf+z2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="52181641"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jul 2024 06:55:35 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWFzJ-000m0T-3D;
	Tue, 23 Jul 2024 13:55:33 +0000
Date: Tue, 23 Jul 2024 21:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 4435/30000]
 drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2305:17:
 warning: implicit conversion from 'fm_macsec_unknown_sci_frame_treatment' to
 'e_FmMacsecUnknownSciFrameTreatment'
Message-ID: <202407232153.zgWPXliW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   411c52448fdc0906f70c4585c7e05359c0b05c11
commit: f8642d6c1b9918bf9a50e6449b09f17f60c6a3c6 [4435/30000] net: sdk_fman: remove obsolete modversions.h includes
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240723/202407232153.zgWPXliW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407232153.zgWPXliW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407232153.zgWPXliW-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66,
                    from drivers/staging/fsl_qbman/fsl_usdpaa.c:29:
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
   In file included from drivers/staging/fsl_qbman/fsl_usdpaa.c:32:
   drivers/staging/fsl_qbman/qman_low.h: In function 'qm_shutdown_fq':
   drivers/staging/fsl_qbman/qman_low.h:1291:29: error: variable 'dequeue_wq' set but not used [-Werror=unused-but-set-variable]
    1291 |                         u16 dequeue_wq = 0;
         |                             ^~~~~~~~~~
   drivers/staging/fsl_qbman/fsl_usdpaa.c: At top level:
>> drivers/staging/fsl_qbman/fsl_usdpaa.c:410:6: error: no previous prototype for 'dbci_portal' [-Werror=missing-prototypes]
     410 | void dbci_portal(void *addr)
         |      ^~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:37,
                    from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_sg.c:48:
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
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_sg.c: In function 'dpa_tx':
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_sg.c:1060:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1060 |         struct qman_fq *egress_fq, *conf_fq;
         |         ^~~~~~
--
   In file included from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.h:45,
                    from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.h:38,
                    from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:34:
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
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1911:33: error: initialization of 'int (*)(struct Qdisc *, long unsigned int,  struct netlink_ext_ack *)' from incompatible pointer type 'int (*)(struct Qdisc *, long unsigned int)' [-Werror=incompatible-pointer-types]
    1911 |         .delete         =       ceetm_cls_delete,
         |                                 ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1911:33: note: (near initialization for 'ceetm_cls_ops.delete')
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c: In function 'ceetm_classify':
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1945:51: error: passing argument 2 of 'tcf_classify' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1945 |         while (tcf && (result = tcf_classify(skb, tcf, &res, false)) >= 0) {
         |                                                   ^~~
         |                                                   |
         |                                                   struct tcf_proto *
   In file included from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.h:36:
   include/net/pkt_cls.h:80:42: note: expected 'const struct tcf_block *' but argument is of type 'struct tcf_proto *'
      80 |                  const struct tcf_block *block,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1945:56: error: passing argument 3 of 'tcf_classify' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1945 |         while (tcf && (result = tcf_classify(skb, tcf, &res, false)) >= 0) {
         |                                                        ^~~~
         |                                                        |
         |                                                        struct tcf_result *
   include/net/pkt_cls.h:81:42: note: expected 'const struct tcf_proto *' but argument is of type 'struct tcf_result *'
      81 |                  const struct tcf_proto *tp, struct tcf_result *res,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~^~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1945:33: error: too few arguments to function 'tcf_classify'
    1945 |         while (tcf && (result = tcf_classify(skb, tcf, &res, false)) >= 0) {
         |                                 ^~~~~~~~~~~~
   include/net/pkt_cls.h:79:5: note: declared here
      79 | int tcf_classify(struct sk_buff *skb,
         |     ^~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c: In function 'ceetm_tx':
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:2016:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    2016 |         struct Qdisc *sch = net_dev->qdisc;
         |         ^~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c: In function 'ceetm_classify':
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1951:31: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1951 |                         *qerr = NET_XMIT_SUCCESS | __NET_XMIT_STOLEN;
         |                         ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1953:17: note: here
    1953 |                 case TC_ACT_SHOT:
         |                 ^~~~
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_Config':
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:3442:45: warning: implicit conversion from 'enum e_FmDmaAidMode' to 'enum fman_dma_aid_mode' [-Wenum-conversion]
    3442 |         p_Fm->p_FmDriverParam->dma_aid_mode = e_FM_DMA_AID_OUT_PORT_ID;
         |                                             ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_Init':
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:3691:51: warning: cast between incompatible function types from 't_Error (*)(void *)' {aka 'unsigned int (*)(void *)'} to 'void (*)(void *)' [-Wcast-function-type]
    3691 |         XX_SetIntr(p_Fm->p_FmStateStruct->errIrq, (void (*) (t_Handle))FM_ErrorIsr, p_Fm);
         |                                                   ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: At top level:
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:5204:6: warning: no previous prototype for 'FM_ChangeClock' [-Wmissing-prototypes]
    5204 | void FM_ChangeClock(t_Handle h_Fm, int hardwarePortId)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_ChangeClock':
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:5206:13: warning: variable 'macId' set but not used [-Wunused-but-set-variable]
    5206 |         int macId;
         |             ^~~~~
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_GetCounter':
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:4809:64: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4809 |             if ((p_Fm->p_FmStateStruct->revInfo.majorRev == 4) ||
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
    4810 |                 (p_Fm->p_FmStateStruct->revInfo.majorRev >= 6))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:4816:9: note: here
    4816 |         case (e_FM_COUNTERS_ENQ_TOTAL_FRAME):
         |         ^~~~
--
   In file included from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.h:45,
                    from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:75:
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
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_get_max_frm':
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:157:5: warning: old-style function definition [-Wold-style-definition]
     157 | int fm_get_max_frm()
         |     ^~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_get_rx_extra_headroom':
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:163:5: warning: old-style function definition [-Wold-style-definition]
     163 | int fm_get_rx_extra_headroom()
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: At top level:
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:769:21: warning: no previous prototype for 'GetFmAdvArgsDevTreeNode' [-Wmissing-prototypes]
     769 | struct device_node *GetFmAdvArgsDevTreeNode (uint8_t fmIndx)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:1615:5: warning: no previous prototype for 'ar_showmem' [-Wmissing-prototypes]
    1615 | int ar_showmem(struct file *file, const char __user *buffer,
         |     ^~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_config_unknown_sci_frame_treatment':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2305:17: warning: implicit conversion from 'fm_macsec_unknown_sci_frame_treatment' to 'e_FmMacsecUnknownSciFrameTreatment' [-Wenum-conversion]
    2305 |                 treat_mode);
         |                 ^~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_config_untag_frame_treatment':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2352:66: warning: implicit conversion from 'fm_macsec_untag_frame_treatment' to 'e_FmMacsecUntagFrameTreatment' [-Wenum-conversion]
    2352 |         err = FM_MACSEC_ConfigUntagFrameTreatment(fm_macsec_dev, treat_mode);
         |                                                                  ^~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_config_exception':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2410:56: warning: implicit conversion from 'fm_macsec_exception' to 'e_FmMacsecExceptions' [-Wenum-conversion]
    2410 |         err = FM_MACSEC_ConfigException(fm_macsec_dev, exception, enable);
         |                                                        ^~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_set_exception':
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2468:53: warning: implicit conversion from 'fm_macsec_exception' to 'e_FmMacsecExceptions' [-Wenum-conversion]
    2468 |         err = FM_MACSEC_SetException(fm_macsec_dev, exception, enable);
         |                                                     ^~~~~~~~~
   In file included from include/uapi/linux/swab.h:6,
                    from include/linux/swab.h:5,
                    from arch/arm/include/asm/opcodes.h:86,
                    from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:41:
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config':
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2483:37: warning: ordered comparison of pointer with integer zero [-Wextra]
    2483 |         if (unlikely(fm_macsec_secy < 0))
         |                                     ^
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config_sci_insertion_mode':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2525:41: warning: implicit conversion from 'fm_macsec_sci_insertion_mode' to 'e_FmMacsecSciInsertionMode' [-Wenum-conversion]
    2525 |                                         sci_insertion_mode);
         |                                         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config_validation_mode':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2573:53: warning: implicit conversion from 'fm_macsec_valid_frame_behavior' to 'e_FmMacsecValidFrameBehavior' [-Wenum-conversion]
    2573 |                                                     validate_frames);
         |                                                     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config_exception':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2623:66: warning: implicit conversion from 'fm_macsec_secy_exception' to 'e_FmMacsecSecYExceptions' [-Wenum-conversion]
    2623 |         err = FM_MACSEC_SECY_ConfigException(fm_macsec_secy_dev, exception,
         |                                                                  ^~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c: In function 'fm_macsec_secy_config_event':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c:2641:62: warning: implicit conversion from 'fm_macsec_secy_event' to 'e_FmMacsecSecYEvents' [-Wenum-conversion]
    2641 |         err = FM_MACSEC_SECY_ConfigEvent(fm_macsec_secy_dev, event, enable);
         |                                                              ^~~~~
--
   In file included from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.h:45,
                    from drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c:80:
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
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c: In function 'LnxwrpFmPcdIOCTL':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c:735:69: warning: implicit conversion from 'ioc_fm_pcd_exceptions' to 'e_FmPcdExceptions' [-Wenum-conversion]
     735 |             err = FM_PCD_SetException(p_LnxWrpFmDev->h_PcdDev, param->exception, param->enable);
         |                                                                ~~~~~^~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c: At top level:
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c:3441:6: warning: no previous prototype for 'FM_Get_Api_Version' [-Wmissing-prototypes]
    3441 | void FM_Get_Api_Version(ioc_fm_api_version_t *p_version)
         |      ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c: In function 'LnxwrpFmIOCTL':
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c:3554:63: warning: implicit conversion from 'ioc_fm_counters' to 'e_FmCounters' [-Wenum-conversion]
    3554 |             err = FM_ModifyCounter(p_LnxWrpFmDev->h_Dev, param->cnt, param->val);
         |                                                          ~~~~~^~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_ioctls_fm.c:3589:67: warning: implicit conversion from 'ioc_fm_counters' to 'e_FmCounters' [-Wenum-conversion]
    3589 |             param->val = FM_GetCounter(p_LnxWrpFmDev->h_Dev, param->cnt);
         |                                                              ~~~~~^~~~~
--
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c: In function 'FM_VSP_Config':
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c:430:64: warning: implicit conversion from 'enum fman_dma_cache_option' to 'e_FmDmaCacheOption' [-Wenum-conversion]
     430 |     p_FmVspEntry->p_FmVspEntryDriverParams->dmaHeaderCacheAttr = fm_vsp_params.header_cache_attr;
         |                                                                ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c:431:68: warning: implicit conversion from 'enum fman_dma_cache_option' to 'e_FmDmaCacheOption' [-Wenum-conversion]
     431 |     p_FmVspEntry->p_FmVspEntryDriverParams->dmaIntContextCacheAttr = fm_vsp_params.int_context_cache_attr;
         |                                                                    ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c:432:71: warning: implicit conversion from 'enum fman_dma_cache_option' to 'e_FmDmaCacheOption' [-Wenum-conversion]
     432 |     p_FmVspEntry->p_FmVspEntryDriverParams->dmaScatterGatherCacheAttr = fm_vsp_params.scatter_gather_cache_attr;
         |                                                                       ^
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c:433:57: warning: implicit conversion from 'enum fman_dma_swap_option' to 'e_FmDmaSwapOption' [-Wenum-conversion]
     433 |     p_FmVspEntry->p_FmVspEntryDriverParams->dmaSwapData = fm_vsp_params.dma_swap_data;
         |                                                         ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c: In function 'FM_VSP_Init':
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c:507:46: warning: implicit conversion from 'e_FmDmaSwapOption' to 'enum fman_dma_swap_option' [-Wenum-conversion]
     507 |     fm_vsp_params.dma_swap_data              = p_FmVspEntry->p_FmVspEntryDriverParams->dmaSwapData;
         |                                              ^
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c:508:46: warning: implicit conversion from 'e_FmDmaCacheOption' to 'enum fman_dma_cache_option' [-Wenum-conversion]
     508 |     fm_vsp_params.int_context_cache_attr     = p_FmVspEntry->p_FmVspEntryDriverParams->dmaIntContextCacheAttr;
         |                                              ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c:509:46: warning: implicit conversion from 'e_FmDmaCacheOption' to 'enum fman_dma_cache_option' [-Wenum-conversion]
     509 |     fm_vsp_params.header_cache_attr          = p_FmVspEntry->p_FmVspEntryDriverParams->dmaHeaderCacheAttr;
         |                                              ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/SP/fm_sp.c:510:46: warning: implicit conversion from 'e_FmDmaCacheOption' to 'enum fman_dma_cache_option' [-Wenum-conversion]
     510 |     fm_vsp_params.scatter_gather_cache_attr  = p_FmVspEntry->p_FmVspEntryDriverParams->dmaScatterGatherCacheAttr;
         |                                              ^


vim +2305 drivers/net/ethernet/freescale/sdk_fman/src/wrapper/lnxwrp_fm.c

3f9aacad7d9737 Madalin Bucur 2020-02-27  2296  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2297  int fm_macsec_config_unknown_sci_frame_treatment(struct fm_macsec_dev
3f9aacad7d9737 Madalin Bucur 2020-02-27  2298  				*fm_macsec_dev,
3f9aacad7d9737 Madalin Bucur 2020-02-27  2299  				fm_macsec_unknown_sci_frame_treatment treat_mode)
3f9aacad7d9737 Madalin Bucur 2020-02-27  2300  {
3f9aacad7d9737 Madalin Bucur 2020-02-27  2301  	int err;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2302  	int _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2303  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2304  	err = FM_MACSEC_ConfigUnknownSciFrameTreatment(fm_macsec_dev,
3f9aacad7d9737 Madalin Bucur 2020-02-27 @2305  		treat_mode);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2306  	_errno = -GET_ERROR_TYPE(err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2307  	if (unlikely(_errno < 0))
3f9aacad7d9737 Madalin Bucur 2020-02-27  2308  		pr_err("FM_MACSEC_ConfigUnknownSciFrameTreatmen() = 0x%08x\n", err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2309  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2310  	return _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2311  }
3f9aacad7d9737 Madalin Bucur 2020-02-27  2312  EXPORT_SYMBOL(fm_macsec_config_unknown_sci_frame_treatment);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2313  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2314  int fm_macsec_config_invalid_tags_frame_treatment(struct fm_macsec_dev *fm_macsec_dev,
3f9aacad7d9737 Madalin Bucur 2020-02-27  2315  				bool deliver_uncontrolled)
3f9aacad7d9737 Madalin Bucur 2020-02-27  2316  {
3f9aacad7d9737 Madalin Bucur 2020-02-27  2317  	int err;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2318  	int _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2319  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2320  	err = FM_MACSEC_ConfigInvalidTagsFrameTreatment(fm_macsec_dev,
3f9aacad7d9737 Madalin Bucur 2020-02-27  2321  						deliver_uncontrolled);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2322  	_errno = -GET_ERROR_TYPE(err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2323  	if (unlikely(_errno < 0))
3f9aacad7d9737 Madalin Bucur 2020-02-27  2324  		pr_err("FM_MAC_ConfigMaxFrameLength() = 0x%08x\n", err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2325  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2326  	return _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2327  }
3f9aacad7d9737 Madalin Bucur 2020-02-27  2328  EXPORT_SYMBOL(fm_macsec_config_invalid_tags_frame_treatment);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2329  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2330  int fm_macsec_config_kay_frame_treatment(struct fm_macsec_dev *fm_macsec_dev,
3f9aacad7d9737 Madalin Bucur 2020-02-27  2331  				bool discard_uncontrolled)
3f9aacad7d9737 Madalin Bucur 2020-02-27  2332  {
3f9aacad7d9737 Madalin Bucur 2020-02-27  2333  	int err;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2334  	int _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2335  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2336  	err = FM_MACSEC_ConfigEncryptWithNoChangedTextFrameTreatment(fm_macsec_dev,
3f9aacad7d9737 Madalin Bucur 2020-02-27  2337  						discard_uncontrolled);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2338  	_errno = -GET_ERROR_TYPE(err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2339  	if (unlikely(_errno < 0))
3f9aacad7d9737 Madalin Bucur 2020-02-27  2340  		pr_err("FM_MACSEC_ConfigEncryptWithNoChangedTextFrameTreatmen() = 0x%08x\n", err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2341  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2342  	return _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2343  }
3f9aacad7d9737 Madalin Bucur 2020-02-27  2344  EXPORT_SYMBOL(fm_macsec_config_kay_frame_treatment);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2345  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2346  int fm_macsec_config_untag_frame_treatment(struct fm_macsec_dev *fm_macsec_dev,
3f9aacad7d9737 Madalin Bucur 2020-02-27  2347  				    fm_macsec_untag_frame_treatment treat_mode)
3f9aacad7d9737 Madalin Bucur 2020-02-27  2348  {
3f9aacad7d9737 Madalin Bucur 2020-02-27  2349  	int err;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2350  	int _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2351  
3f9aacad7d9737 Madalin Bucur 2020-02-27 @2352  	err = FM_MACSEC_ConfigUntagFrameTreatment(fm_macsec_dev, treat_mode);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2353  	_errno = -GET_ERROR_TYPE(err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2354  	if (unlikely(_errno < 0))
3f9aacad7d9737 Madalin Bucur 2020-02-27  2355  		pr_err("FM_MACSEC_ConfigUntagFrameTreatment() = 0x%08x\n", err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2356  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2357  	return _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2358  }
3f9aacad7d9737 Madalin Bucur 2020-02-27  2359  EXPORT_SYMBOL(fm_macsec_config_untag_frame_treatment);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2360  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2361  int fm_macsec_config_pn_exhaustion_threshold(struct fm_macsec_dev *fm_macsec_dev,
3f9aacad7d9737 Madalin Bucur 2020-02-27  2362  					uint32_t pn_exh_thr)
3f9aacad7d9737 Madalin Bucur 2020-02-27  2363  {
3f9aacad7d9737 Madalin Bucur 2020-02-27  2364  	int err;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2365  	int _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2366  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2367  	err = FM_MACSEC_ConfigPnExhaustionThreshold(fm_macsec_dev, pn_exh_thr);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2368  	_errno = -GET_ERROR_TYPE(err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2369  	if (unlikely(_errno < 0))
3f9aacad7d9737 Madalin Bucur 2020-02-27  2370  		pr_err("FM_MACSEC_ConfigPnExhaustionThreshold() = 0x%08x\n", err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2371  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2372  	return _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2373  }
3f9aacad7d9737 Madalin Bucur 2020-02-27  2374  EXPORT_SYMBOL(fm_macsec_config_pn_exhaustion_threshold);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2375  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2376  int fm_macsec_config_keys_unreadable(struct fm_macsec_dev *fm_macsec_dev)
3f9aacad7d9737 Madalin Bucur 2020-02-27  2377  {
3f9aacad7d9737 Madalin Bucur 2020-02-27  2378  	int err;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2379  	int _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2380  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2381  	err =  FM_MACSEC_ConfigKeysUnreadable(fm_macsec_dev);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2382  	_errno = -GET_ERROR_TYPE(err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2383  	if (unlikely(_errno < 0))
3f9aacad7d9737 Madalin Bucur 2020-02-27  2384  		pr_err("FM_MACSEC_ConfigKeysUnreadable() = 0x%08x\n", err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2385  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2386  	return _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2387  }
3f9aacad7d9737 Madalin Bucur 2020-02-27  2388  EXPORT_SYMBOL(fm_macsec_config_keys_unreadable);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2389  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2390  int fm_macsec_config_sectag_without_sci(struct fm_macsec_dev *fm_macsec_dev)
3f9aacad7d9737 Madalin Bucur 2020-02-27  2391  {
3f9aacad7d9737 Madalin Bucur 2020-02-27  2392  	int err;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2393  	int _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2394  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2395  	err =  FM_MACSEC_ConfigSectagWithoutSCI(fm_macsec_dev);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2396  	_errno = -GET_ERROR_TYPE(err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2397  	if (unlikely(_errno < 0))
3f9aacad7d9737 Madalin Bucur 2020-02-27  2398  		pr_err("FM_MACSEC_ConfigSectagWithoutSCI() = 0x%08x\n", err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2399  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2400  	return _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2401  }
3f9aacad7d9737 Madalin Bucur 2020-02-27  2402  EXPORT_SYMBOL(fm_macsec_config_sectag_without_sci);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2403  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2404  int fm_macsec_config_exception(struct fm_macsec_dev *fm_macsec_dev,
3f9aacad7d9737 Madalin Bucur 2020-02-27  2405  			    fm_macsec_exception exception, bool enable)
3f9aacad7d9737 Madalin Bucur 2020-02-27  2406  {
3f9aacad7d9737 Madalin Bucur 2020-02-27  2407  	int err;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2408  	int _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2409  
3f9aacad7d9737 Madalin Bucur 2020-02-27 @2410  	err = FM_MACSEC_ConfigException(fm_macsec_dev, exception, enable);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2411  	_errno = -GET_ERROR_TYPE(err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2412  	if (unlikely(_errno < 0))
3f9aacad7d9737 Madalin Bucur 2020-02-27  2413  		pr_err("FM_MACSEC_ConfigException() = 0x%08x\n", err);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2414  
3f9aacad7d9737 Madalin Bucur 2020-02-27  2415  	return _errno;
3f9aacad7d9737 Madalin Bucur 2020-02-27  2416  }
3f9aacad7d9737 Madalin Bucur 2020-02-27  2417  EXPORT_SYMBOL(fm_macsec_config_exception);
3f9aacad7d9737 Madalin Bucur 2020-02-27  2418  

:::::: The code at line 2305 was first introduced by commit
:::::: 3f9aacad7d973711cdfbdc9dbbf19f972f39c7d9 sdk_fman: add LSDK-19.09-V4.14 SDK DPAA FMan files

:::::: TO: Madalin Bucur <madalin.bucur@oss.nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
