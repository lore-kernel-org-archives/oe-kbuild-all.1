Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7600233D3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 21:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694725491; x=1726261491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2iElsY6FRGm8D778zRdZeCjw8CbULn3WoX2Ok7ZiAGQ=;
  b=cXyFjAR3kQ5xiCZhvBootfHur5IzGsWXqh+GB/GraP6frpEEnDgjygIN
   JKOmWCx7WhUJNqCSmpkxB6v+Ury/2JExMmCO8ihy2CGW5xgZbWI342mDL
   +xE65zW4udB8kUgE/Wo/2gKkKzd5Ab9wqi54gGMckcR83dP8fKAzbKBwg
   CaPwzwTnD5Lv3Y5yylxbHUabAVi7fMID+lPm9sEJBHQ54JOYFtkLpmOc8
   hWtTWoz9m7p4FN/cMXMEDHQD1EyiQ5M2FM+m678L7+zHaUd+rs4W13rZ4
   kdmsGyAoM62mQjDaPmjK0hDRRinHPHADI23Z1kGkOU3ffTGZ8sLwNJLtQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="382887119"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="382887119"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 14:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="738039452"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="738039452"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Sep 2023 14:04:49 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgtW3-00024L-1C;
	Thu, 14 Sep 2023 21:04:47 +0000
Date: Fri, 15 Sep 2023 05:04:24 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tzungbi-chrome-platform:dev 3/3] ERROR: modpost:
 "cros_kunit_ec_cmd_xfer_mock_called"
 [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
Message-ID: <202309150434.QzCAyhhH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tzungbi/chrome-platform.git dev
head:   954092e5dbe055fb958354cbefbafbdf533d67fc
commit: 954092e5dbe055fb958354cbefbafbdf533d67fc [3/3] platform/chrome: add Kunit for cros_ec_i2c
config: i386-randconfig-013-20230914 (https://download.01.org/0day-ci/archive/20230915/202309150434.QzCAyhhH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150434.QzCAyhhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150434.QzCAyhhH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/videobuf2/videobuf2-dvb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/ttpci/budget-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/radio/si470x/radio-si470x-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/of_mmc_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/framebuffer-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/memconsole-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/vpd-sysfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_ec_proto_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_ec_i2c_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/acp/snd-acp-i2s.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/acp/snd-acp-pdm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/acp/snd-acp-legacy-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/acp/snd-acp-pci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/amd/acp/snd-acp-mach.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-dmic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-es8336.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-i2s-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-max98357a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt274.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt286.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt298.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-rt5663.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/intel/avs/boards/snd-soc-avs-ssm4567.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/core/dev_addr_lists_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/p8022.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/psnap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/stp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/mrp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/act_gate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_red.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_gred.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_multiq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_netem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_mqprio_lib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_taprio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/cls_basic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_nbyte.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_meta.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_text.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netlink/netlink_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_twos.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nft_fib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_defrag_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/nf_reject_ipv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/netfilter/iptable_raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tunnel4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/inet_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/tcp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/nf_defrag_ipv6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/esp6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/xfrm6_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/tunnel6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/sit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/ip6_udp_tunnel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/lec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtables.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_filter.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sctp/sctp_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/6lowpan/ieee802154_6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nci/nci.o
ERROR: modpost: "cros_kunit_ec_xfer_mock_add" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
ERROR: modpost: "cros_kunit_ec_xfer_mock_next" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
ERROR: modpost: "cros_kunit_ec_xfer_mock_addx" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
ERROR: modpost: "cros_kunit_ec_pkt_xfer_mock" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
ERROR: modpost: "cros_kunit_ec_pkt_xfer_mock_called" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
ERROR: modpost: "cros_kunit_ec_xfer_mock_default_ret" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
ERROR: modpost: "cros_kunit_ec_cmd_xfer_mock" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
>> ERROR: modpost: "cros_kunit_ec_cmd_xfer_mock_called" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
>> ERROR: modpost: "cros_kunit_ec_xfer_mock" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
>> ERROR: modpost: "cros_kunit_mock_reset" [drivers/platform/chrome/cros_ec_proto_test.ko] undefined!
WARNING: modpost: suppressed 3 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
