Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8721FAD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 02:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk1Wd6Fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697337016; x=1728873016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bDUZ62rlttkAZMAvDv+mi7zgUMlgXL6TgLs+yq7cnCs=;
  b=Nk1Wd6Fh76HU78FufRWuvKlcUTfnpDdk9ripx6FotP8eFWHy68n/6jaK
   0RJdkOhGRi5k21o92WVLacWPlSIKcrGHk827+bJISDytJUHmFNxmpkCTE
   3wt8O2y3lGdS0PgaZxfE+X+re899OpEeucqKiW4Qr+kbT7j8EDHuOfrq3
   kyE0RjtD4pIxwjjq4c+fqCVo0RiY1eVfoEP8rLXJWV29ybL+MTy8NSyC/
   NAGoyfECCiOHzfWb3OGx49o8fsCMkSAdux3s+FO9Xjq1EWqMQqUrcfUXM
   M142huJQ9Ju7BxAC8TBmKHx+47/NuoggXn8j8YdJIDmfZ7I1ewAis9wou
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="388217585"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="388217585"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 19:30:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784628936"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="784628936"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 19:30:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrqtQ-0006wD-0i;
	Sun, 15 Oct 2023 02:30:12 +0000
Date: Sun, 15 Oct 2023 10:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4270/15768]
 drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_sg.c:1060:9: warning: ISO
 C90 forbids mixed declarations and code
Message-ID: <202310151002.GVsA7Db2-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 0eb345fbc43244aac2b6e72a2d4c677181d6765d [4270/15768] net: sdk_fman: remove obsolete modversions.h includes
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231015/202310151002.GVsA7Db2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151002.GVsA7Db2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151002.GVsA7Db2-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:197:16: error: implicit declaration of function 'macdev_priv'; did you mean 'netdev_priv'? [-Werror=implicit-function-declaration]
     197 |         priv = macdev_priv(mac_dev);
         |                ^~~~~~~~~~~
         |                netdev_priv
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:197:14: warning: assignment to 'struct mac_priv_s *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     197 |         priv = macdev_priv(mac_dev);
         |              ^
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:207:9: error: implicit declaration of function 'memac_set_loopback' [-Werror=implicit-function-declaration]
     207 |         memac_set_loopback(p_memac->p_MemMap, en);
         |         ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c: At top level:
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:326:20: warning: no previous prototype for 'match_dpa_to_fmt_port' [-Wmissing-prototypes]
     326 | struct fmt_port_s *match_dpa_to_fmt_port(
         |                    ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:349:6: warning: no previous prototype for 'dump_frame' [-Wmissing-prototypes]
     349 | void dump_frame(
         |      ^~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:365:6: warning: no previous prototype for 'test_and_steal_frame' [-Wmissing-prototypes]
     365 | bool test_and_steal_frame(struct fmt_port_s *fmt_port,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:477:27: warning: no previous prototype for 'fmt_rx_default_hook' [-Wmissing-prototypes]
     477 | enum dpaa_eth_hook_result fmt_rx_default_hook(
         |                           ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:515:27: warning: no previous prototype for 'fmt_rx_error_hook' [-Wmissing-prototypes]
     515 | enum dpaa_eth_hook_result fmt_rx_error_hook(
         |                           ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:556:27: warning: no previous prototype for 'fmt_tx_confirm_hook' [-Wmissing-prototypes]
     556 | enum dpaa_eth_hook_result fmt_tx_confirm_hook(
         |                           ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:597:27: warning: no previous prototype for 'fmt_tx_confirm_error_hook' [-Wmissing-prototypes]
     597 | enum dpaa_eth_hook_result fmt_tx_confirm_error_hook(
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:636:26: warning: no previous prototype for 'fmt_egress_dqrr' [-Wmissing-prototypes]
     636 | enum qman_cb_dqrr_result fmt_egress_dqrr(
         |                          ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:666:5: warning: no previous prototype for 'fmt_fq_alloc' [-Wmissing-prototypes]
     666 | int fmt_fq_alloc(
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:825:5: warning: no previous prototype for 'dpa_alloc_pcd_fqids' [-Wmissing-prototypes]
     825 | int dpa_alloc_pcd_fqids(
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:907:5: warning: no previous prototype for 'dpa_free_pcd_fqids' [-Wmissing-prototypes]
     907 | int dpa_free_pcd_fqids(
         |     ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c: In function 'fmt_port_init':
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:1032:26: error: implicit declaration of function 'of_address_to_resource' [-Werror=implicit-function-declaration]
    1032 |                 _errno = of_address_to_resource(fm_node, 0, &res);
         |                          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c: At top level:
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:1371:9: warning: no previous prototype for 'fmt_read' [-Wmissing-prototypes]
    1371 | ssize_t fmt_read(
         |         ^~~~~~~~
>> drivers/net/ethernet/freescale/sdk_fman/src/wrapper/fman_test.c:1470:9: warning: no previous prototype for 'fmt_write' [-Wmissing-prototypes]
    1470 | ssize_t fmt_write(
         |         ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +1060 drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_sg.c

885733df6cae0b Madalin Bucur 2020-02-27  1055  
885733df6cae0b Madalin Bucur 2020-02-27  1056  int __hot dpa_tx(struct sk_buff *skb, struct net_device *net_dev)
885733df6cae0b Madalin Bucur 2020-02-27  1057  {
885733df6cae0b Madalin Bucur 2020-02-27  1058  	struct dpa_priv_s	*priv;
885733df6cae0b Madalin Bucur 2020-02-27  1059  	int queue_mapping = dpa_get_queue_mapping(skb);
885733df6cae0b Madalin Bucur 2020-02-27 @1060  	struct qman_fq *egress_fq, *conf_fq;
885733df6cae0b Madalin Bucur 2020-02-27  1061  

:::::: The code at line 1060 was first introduced by commit
:::::: 885733df6cae0b4e5d5382a9bbcd307ce04db780 sdk_dpaa: add LSDK-19.09-V4.14 SDK DPAA Ethernet files

:::::: TO: Madalin Bucur <madalin.bucur@oss.nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
