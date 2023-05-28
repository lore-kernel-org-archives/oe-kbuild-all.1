Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272C623B8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 22:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685314039; x=1716850039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RS06GsMJfqyPnuWJtJyqI6iHAN5ScI38M1hZDXtMx0M=;
  b=KvsbY2nIMNvdpr5U94fnJGdqE0InQYBqq0uTKpERzNzqJuA8CDS3u1PH
   T+ZEMkUXbQ52fb309DXH7TRHMjNzLIhZV1WcpJyuUMq6Lpbwa4YoT3Qyu
   lehrTylGpYU2JvdN6WdjkY9yA0UjR/kWqryl0SNEFXzbZH59+qi43taMh
   30NxHsuNaWwGWEl8jE7wVdIBsbULXWUrfJcmSk2ltMcCCkYPd6kcdGy+R
   0ZNWCIbRenLeFVvCVFAAgrtIihxuzelKxXWIBORmBemrBZ221xuKxU19G
   Cq2inTsUf1IkDmBk3EEW4K+kss1CxgV7foYqqTfc4QPgSiBQoZf+i5Nwm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="334191713"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="334191713"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 15:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="1035992902"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="1035992902"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 May 2023 15:47:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3PAS-000KlK-12;
	Sun, 28 May 2023 22:47:16 +0000
Date: Mon, 29 May 2023 06:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4270/9879]
 drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1016: warning:
 This comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202305290628.4xAVEW69-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: 0eb345fbc43244aac2b6e72a2d4c677181d6765d [4270/9879] net: sdk_fman: remove obsolete modversions.h includes
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230529/202305290628.4xAVEW69-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/0eb345fbc43244aac2b6e72a2d4c677181d6765d
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout 0eb345fbc43244aac2b6e72a2d4c677181d6765d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/ethernet/freescale/sdk_dpaa/ drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/ drivers/net/ethernet/freescale/sdk_fman/etc/ drivers/net/ethernet/freescale/sdk_fman/src/wrapper/ drivers/net/ethernet/freescale/sdk_fman/src/xx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305290628.4xAVEW69-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:433:1: warning: no previous prototype for 'priv_rx_error_dqrr' [-Wmissing-prototypes]
     433 | priv_rx_error_dqrr(struct qman_portal           *portal,
         | ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:465:1: warning: no previous prototype for 'priv_rx_default_dqrr' [-Wmissing-prototypes]
     465 | priv_rx_default_dqrr(struct qman_portal         *portal,
         | ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:505:1: warning: no previous prototype for 'priv_tx_conf_error_dqrr' [-Wmissing-prototypes]
     505 | priv_tx_conf_error_dqrr(struct qman_portal              *portal,
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:527:1: warning: no previous prototype for 'priv_tx_conf_default_dqrr' [-Wmissing-prototypes]
     527 | priv_tx_conf_default_dqrr(struct qman_portal            *portal,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:552:6: warning: no previous prototype for 'priv_ern' [-Wmissing-prototypes]
     552 | void priv_ern(struct qman_portal        *portal,
         |      ^~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:685:29: error: initialization of 'u16 (*)(struct net_device *, struct sk_buff *, struct net_device *)' {aka 'short unsigned int (*)(struct net_device *, struct sk_buff *, struct net_device *)'} from incompatible pointer type 'u16 (*)(struct net_device *, struct sk_buff *, struct net_device *, u16 (*)(struct net_device *, struct sk_buff *, struct net_device *))' {aka 'short unsigned int (*)(struct net_device *, struct sk_buff *, struct net_device *, short unsigned int (*)(struct net_device *, struct sk_buff *, struct net_device *))'} [-Werror=incompatible-pointer-types]
     685 |         .ndo_select_queue = dpa_select_queue,
         |                             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:685:29: note: (near initialization for 'dpa_private_ops.ndo_select_queue')
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.c:107:19: warning: 'rtx' defined but not used [-Wunused-const-variable=]
     107 | static const char rtx[][3] = {
         |                   ^~~
   cc1: some warnings being treated as errors
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
   In file included from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_sg.c:54:
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.h:227:40: error: field 'bstats' has incomplete type
     227 |         struct gnet_stats_basic_packed bstats;
         |                                        ^~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_sg.c: In function 'dpa_tx':
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_sg.c:1060:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1060 |         struct qman_fq *egress_fq, *conf_fq;
         |         ^~~~~~
--
   include/linux/fsl_qman.h:1679:1: warning: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Wpacked-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: warning: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Wpacked-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.h:227:40: error: field 'bstats' has incomplete type
     227 |         struct gnet_stats_basic_packed bstats;
         |                                        ^~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c: In function 'ceetm_dump':
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:623:49: error: invalid operands to binary + (have 'u64_stats_t' and 'u64_stats_t')
     623 |                         sch->bstats.bytes       += qdisc->bstats.bytes;
         |                         ~~~~~~~~~~~~~~~~~       ^~ ~~~~~~~~~~~~~~~~~~~
         |                                    |                            |
         |                                    u64_stats_t                  u64_stats_t
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:624:49: error: invalid operands to binary + (have 'u64_stats_t' and 'u64_stats_t')
     624 |                         sch->bstats.packets     += qdisc->bstats.packets;
         |                         ~~~~~~~~~~~~~~~~~~~     ^~ ~~~~~~~~~~~~~~~~~~~~~
         |                                    |                            |
         |                                    u64_stats_t                  u64_stats_t
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c: In function 'ceetm_cls_dump_stats':
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1824:40: error: storage size of 'tmp_bstats' isn't known
    1824 |         struct gnet_stats_basic_packed tmp_bstats;
         |                                        ^~~~~~~~~~
   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/debugobjects.h:6,
                    from include/linux/timer.h:8,
                    from include/linux/netdevice.h:24,
                    from include/linux/if_vlan.h:10,
                    from include/net/pkt_sched.h:7,
                    from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.h:35:
   include/linux/fortify-string.h:336:65: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     336 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                                                 ^
   include/linux/fortify-string.h:345:25: note: in expansion of macro '__fortify_memset_chk'
     345 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1831:9: note: in expansion of macro 'memset'
    1831 |         memset(&tmp_bstats, 0, sizeof(tmp_bstats));
         |         ^~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1862:35: error: implicit declaration of function 'qdisc_root_sleeping_running'; did you mean 'qdisc_root_sleeping_lock'? [-Werror=implicit-function-declaration]
    1862 |         if (gnet_stats_copy_basic(qdisc_root_sleeping_running(sch),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   qdisc_root_sleeping_lock
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1862:35: warning: passing argument 1 of 'gnet_stats_copy_basic' makes pointer from integer without a cast [-Wint-conversion]
    1862 |         if (gnet_stats_copy_basic(qdisc_root_sleeping_running(sch),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   int
   In file included from include/net/sch_generic.h:19,
                    from include/net/pkt_sched.h:9:
   include/net/gen_stats.h:49:45: note: expected 'struct gnet_dump *' but argument is of type 'int'
      49 | int gnet_stats_copy_basic(struct gnet_dump *d,
         |                           ~~~~~~~~~~~~~~~~~~^
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1863:35: error: passing argument 2 of 'gnet_stats_copy_basic' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1863 |                                   d, NULL, &tmp_bstats) < 0)
         |                                   ^
         |                                   |
         |                                   struct gnet_dump *
   include/net/gen_stats.h:50:66: note: expected 'struct gnet_stats_basic_sync *' but argument is of type 'struct gnet_dump *'
      50 |                           struct gnet_stats_basic_sync __percpu *cpu,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1824:40: warning: unused variable 'tmp_bstats' [-Wunused-variable]
    1824 |         struct gnet_stats_basic_packed tmp_bstats;
         |                                        ^~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c: At top level:
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
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1951:31: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1951 |                         *qerr = NET_XMIT_SUCCESS | __NET_XMIT_STOLEN;
         |                         ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_ceetm.c:1953:17: note: here
    1953 |                 case TC_ACT_SHOT:
         |                 ^~~~
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:231: warning: Cannot understand  * @param net_dev the device for which statistics are calculated
    on line 231 - I thought it was a doc line
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1016: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Congestion group state change notification callback.
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c:1630: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Turn on HW checksum computation for this outgoing frame.
--
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_Config':
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:3442:45: warning: implicit conversion from 'enum e_FmDmaAidMode' to 'enum fman_dma_aid_mode' [-Wenum-conversion]
    3442 |         p_Fm->p_FmDriverParam->dma_aid_mode = e_FM_DMA_AID_OUT_PORT_ID;
         |                                             ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_Init':
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:3691:51: warning: cast between incompatible function types from 't_Error (*)(void *)' {aka 'unsigned int (*)(void *)'} to 'void (*)(void *)' [-Wcast-function-type]
    3691 |         XX_SetIntr(p_Fm->p_FmStateStruct->errIrq, (void (*) (t_Handle))FM_ErrorIsr, p_Fm);
         |                                                   ^
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: At top level:
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:5204:6: warning: no previous prototype for 'FM_ChangeClock' [-Wmissing-prototypes]
    5204 | void FM_ChangeClock(t_Handle h_Fm, int hardwarePortId)
         |      ^~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c: In function 'FM_ChangeClock':
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/fm.c:5206:13: warning: variable 'macId' set but not used [-Wunused-but-set-variable]
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
   In file included from include/linux/string.h:253,
                    from drivers/net/ethernet/freescale/sdk_fman/inc/string_ext.h:40,
                    from drivers/net/ethernet/freescale/sdk_fman/etc/sprint.c:40:
   include/linux/fortify-string.h:186:9: error: expected identifier or '(' before '__builtin_choose_expr'
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
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/Pcd/fm_pcd.c:2090:10: warning: no previous prototype for 'FM_PCD_GetHcPort' [-Wmissing-prototypes]
    2090 | t_Handle FM_PCD_GetHcPort(t_Handle h_FmPcd)
         |          ^~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/Pcd/fm_prs.c:196:5: warning: no previous prototype for 'PrsIsEnabled' [-Wmissing-prototypes]
     196 | int PrsIsEnabled(t_FmPcd *p_FmPcd)
         |     ^~~~~~~~~~~~
--
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/Pcd/fm_replic.c:646:9: warning: no previous prototype for 'FrmReplicGroupTryLock' [-Wmissing-prototypes]
     646 | t_Error FrmReplicGroupTryLock(t_Handle h_ReplicGroup)
         |         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/Peripherals/FM/Pcd/fm_replic.c:658:6: warning: no previous prototype for 'FrmReplicGroupUnlock' [-Wmissing-prototypes]
     658 | void FrmReplicGroupUnlock(t_Handle h_ReplicGroup)
         |      ^~~~~~~~~~~~~~~~~~~~
..


vim +1016 drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.c

885733df6cae0b Madalin Bucur 2020-02-27  1014  
885733df6cae0b Madalin Bucur 2020-02-27  1015  /**
885733df6cae0b Madalin Bucur 2020-02-27 @1016   * Congestion group state change notification callback.
885733df6cae0b Madalin Bucur 2020-02-27  1017   * Stops the device's egress queues while they are congested and
885733df6cae0b Madalin Bucur 2020-02-27  1018   * wakes them upon exiting congested state.
885733df6cae0b Madalin Bucur 2020-02-27  1019   * Also updates some CGR-related stats.
885733df6cae0b Madalin Bucur 2020-02-27  1020   */
885733df6cae0b Madalin Bucur 2020-02-27  1021  static void dpaa_eth_cgscn(struct qman_portal *qm, struct qman_cgr *cgr,
885733df6cae0b Madalin Bucur 2020-02-27  1022  
885733df6cae0b Madalin Bucur 2020-02-27  1023  	int congested)
885733df6cae0b Madalin Bucur 2020-02-27  1024  {
885733df6cae0b Madalin Bucur 2020-02-27  1025  	struct dpa_priv_s *priv = (struct dpa_priv_s *)container_of(cgr,
885733df6cae0b Madalin Bucur 2020-02-27  1026  		struct dpa_priv_s, cgr_data.cgr);
885733df6cae0b Madalin Bucur 2020-02-27  1027  
885733df6cae0b Madalin Bucur 2020-02-27  1028  	if (congested) {
885733df6cae0b Madalin Bucur 2020-02-27  1029  		priv->cgr_data.congestion_start_jiffies = jiffies;
885733df6cae0b Madalin Bucur 2020-02-27  1030  		netif_tx_stop_all_queues(priv->net_dev);
885733df6cae0b Madalin Bucur 2020-02-27  1031  		priv->cgr_data.cgr_congested_count++;
885733df6cae0b Madalin Bucur 2020-02-27  1032  	} else {
885733df6cae0b Madalin Bucur 2020-02-27  1033  		priv->cgr_data.congested_jiffies +=
885733df6cae0b Madalin Bucur 2020-02-27  1034  			(jiffies - priv->cgr_data.congestion_start_jiffies);
885733df6cae0b Madalin Bucur 2020-02-27  1035  		netif_tx_wake_all_queues(priv->net_dev);
885733df6cae0b Madalin Bucur 2020-02-27  1036  	}
885733df6cae0b Madalin Bucur 2020-02-27  1037  }
885733df6cae0b Madalin Bucur 2020-02-27  1038  

:::::: The code at line 1016 was first introduced by commit
:::::: 885733df6cae0b4e5d5382a9bbcd307ce04db780 sdk_dpaa: add LSDK-19.09-V4.14 SDK DPAA Ethernet files

:::::: TO: Madalin Bucur <madalin.bucur@oss.nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
