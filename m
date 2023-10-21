Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942BC8F3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuIIz/9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697895131; x=1729431131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xZpBEDOeinxW1pmcneqNSl3MNK0jkLebIluRpqEtjU0=;
  b=VuIIz/9u0WNtTkVaMVhq+UAN5vLiDTlmvHLFEcSZVXwYzq8FzT+pDciJ
   YwQzHMZyeUCZAHTRXPXG+sB4DKLzy15fAVGcz2V+r5WImpEh2TyAv2daX
   IZkUfpqUBGJEeOoV8EE4Qs7T+NA5cBf6kPEUNaEghDC7j7RU8MIGZlAff
   Xz09KdI9ZIa6TjnlshAHsDmLbNvXEF1a/yj3DZAYcynNP2BdEekoVSTwj
   HsY8D/A2vKAlhMbj3EsdkP8qoPxPFaH9qon7kBpioNJA2Rch8u6OxS82u
   u4vm9HFXltNZ6KsmWo3tO1tC8CndQRs3/cMqqMww+lNuq9oxuwBU+WoIF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="377010207"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="377010207"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 06:32:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="823527494"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="823527494"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Oct 2023 06:32:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quC5G-0004sw-0S;
	Sat, 21 Oct 2023 13:32:06 +0000
Date: Sat, 21 Oct 2023 21:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v13 08/18] scsi: sd: Add a unit test for sd_cmp_sector()
Message-ID: <202310212107.7k5Ge7Z1-lkp@intel.com>
References: <20231018175602.2148415-9-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018175602.2148415-9-bvanassche@acm.org>

Hi Bart,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.6-rc6 next-20231020]
[cannot apply to jejb-scsi/for-next mkp-scsi/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/block-Introduce-more-member-variables-related-to-zone-write-locking/20231019-020007
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20231018175602.2148415-9-bvanassche%40acm.org
patch subject: [PATCH v13 08/18] scsi: sd: Add a unit test for sd_cmp_sector()
config: loongarch-randconfig-001-20231021 (https://download.01.org/0day-ci/archive/20231021/202310212107.7k5Ge7Z1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310212107.7k5Ge7Z1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310212107.7k5Ge7Z1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-vega-s9x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-m1f.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-s350.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-tv-pvr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videostrong-kii-pro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-wetek-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-wetek-play2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-winfast.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-x96max.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-xbox-360.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-xbox-dvd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-zx-irdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/radio/si470x/radio-si470x-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/libnvdimm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_pmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_btt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_virtio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/atm/nicstar.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/atm/iphase.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/atm/suni.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/atm/eni.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_cif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_aec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_netx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/act_gate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_hfsc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_plug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_skbprio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_cbs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_etf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/cls_route.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/cls_basic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_cmp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_nbyte.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/em_meta.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack_netlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/nf_conntrack_broadcast.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_wlc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_fo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_ovf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_lblcr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_dh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_sh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netfilter/ipvs/ip_vs_nq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ipip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_gre.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/raw_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/xfrm/xfrm_user.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv6/netfilter/ip6table_raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/nf_conntrack_bridge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtables.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_broute.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/netfilter/ebtable_nat.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ar9331.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_brcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_dsa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_hellcreek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ksz.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_lan9303.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_mtk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_none.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ocelot_8021q.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_qca.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl4_a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl8_4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_sja1105.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_trailer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_xrs700x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/8021q/8021q.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/nfc/nfc_digital.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_crypto_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/mptcp/mptcp_token_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/key/af_key.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/sunrpc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/auth_rpcgss.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sunrpc/auth_gss/rpcsec_gss_krb5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/atm/atm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/smc/smc_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/caif_usb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/6lowpan/ieee802154_6lowpan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ieee802154/ieee802154_socket.o
>> ERROR: modpost: "scsi_call_prepare_resubmit" [drivers/scsi/sd_mod.ko] was exported without definition
WARNING: modpost: "sd_cmp_sector" [drivers/scsi/sd_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
