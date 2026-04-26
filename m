Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BF3231A3B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Apr 2026 08:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777192647; cv=none; b=EyAoEIivIiHTgqkLxYJJqUQynP4wNdrBKEZzZ+CvS0jDRL1nA8i2w9OAnwGVbefGlk5QZF+wIIPMpd/ozx/uQvB1awieMAihNm3DLYdvmJIrovKEwB5Wf9WmmVgj63ewg2HvEMDAtmytqRugbj216PqWqN9MPdTTY3eP5PRMz1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777192647; c=relaxed/simple;
	bh=9gZWqPJvRIHa+6Zzn2lg/Rtt0kMgoQ+AYfFh90l15Fk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SmkXbUYMW/Wu2E89ZKyDTvcAv/b4iKdYOaCr+hgslqXzCJcvKj1/38QA8R6CX0KXmsbv2ENLVjCmdubEURHy+ur8WUWXdIwOFdlTxW5wjaUkumzFB2YQkhAOCDdvghfTGq8wAj/9hbK2a5fxBKQpJFGgZoANJUWdDQu1bXfWgcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNVOQVg+; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNVOQVg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777192645; x=1808728645;
  h=date:from:to:cc:subject:message-id;
  bh=9gZWqPJvRIHa+6Zzn2lg/Rtt0kMgoQ+AYfFh90l15Fk=;
  b=WNVOQVg+B+ylJnBRYj1Tuyym63H1rJERmIirNwksTeaGq1TGUTEoPowx
   PFE6OdWcZkNRasHvbXFyN1p/R3pJCFdLMJK8wkxkIGE+d2MvDwAoh6hx5
   00tV7DFVDOlECi8TjLlvrz2qDZG3AOX75kGkHfP0IzVSwrZe1ns980W0m
   Z+ZpCegAlh7auLrKJFQ6GkOgcfl9swadh2c5meDbWZyxgxVYRxxYHJKme
   eBhfxIFwRidBQlZtenWcOma8uns+tJamjJ2Tq4gjIazPz0TA1qcptQ2Sj
   vv+n6sctEmPdICyDX98KoU9FB/cH0FVQFoFvvEHPCRt+I4UERqY2Afuag
   w==;
X-CSE-ConnectionGUID: 5KRrcRvUSPSBRNTNatjifw==
X-CSE-MsgGUID: 7yTsO7XtToKUblBtFtLD9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="95523548"
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="95523548"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2026 01:37:24 -0700
X-CSE-ConnectionGUID: GyyNAjg7Royc22xzX42JRg==
X-CSE-MsgGUID: JmamM/CRRfG/rTKf5Zza/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,199,1770624000"; 
   d="scan'208";a="232367618"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Apr 2026 01:37:22 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGuzP-000000007jh-35jO;
	Sun, 26 Apr 2026 08:37:19 +0000
Date: Sun, 26 Apr 2026 16:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Linus Walleij <linusw@kernel.org>
Subject: [drm-misc:drm-misc-next 5/5] WARNING: modpost: vmlinux:
 section mismatch in reference: bq_xmit_all+0x138 (section: .text) ->
 intel_cbphy_driver_init (section: .init.text)
Message-ID: <202604261602.m9OKmURa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   03af6c3afc4893988ceed54531f5dde4bebd6024
commit: 4c95b2b7d49edc5846730970cef322a6d8d967ba [5/5] drm/panel: ilitek-ili9881c: support Waveshare 7.0" DSI panel
config: mips-randconfig-r111-20260424 (https://download.01.org/0day-ci/archive/20260426/202604261602.m9OKmURa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260426/202604261602.m9OKmURa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604261602.m9OKmURa-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: sys_call_table+0xf4 (section: .text) -> keembay_emmc_phy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sys_call_table+0xfc (section: .text) -> keembay_emmc_phy_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: bq_xmit_all+0x138 (section: .text) -> intel_cbphy_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: bq_xmit_all+0x360 (section: .text) -> intel_cbphy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: bq_xmit_all+0x398 (section: .text) -> intel_cbphy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bq_xmit_all+0x40c (section: .text) -> intel_cbphy_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: dev_map_enqueue_multi+0x420 (section: .text) -> intel_cbphy_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: bq_flush_to_queue+0x9c (section: .text) -> intel_cbphy_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: cpu_map_kthread_run+0x800 (section: .text) -> intel_cbphy_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: brcmstb_l2_intc_probe+0x268 (section: .text) -> keembay_usb_phy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: brcmstb_l2_intc_probe+0x26c (section: .text) -> keembay_usb_phy_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: tun_get_user+0x1390 (section: .text) -> intel_cbphy_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: tun_xdp_act+0x230 (section: .text) -> intel_cbphy_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: tun_sendmsg+0x804 (section: .text) -> intel_cbphy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_poll+0xd00 (section: .text) -> intel_cbphy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_poll+0xf04 (section: .text) -> intel_cbphy_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: veth_get_strings+0xac (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_get_strings+0xc0 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_get_strings+0xd4 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_get_strings+0xe8 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_get_strings+0xfc (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_get_strings+0x110 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_get_strings+0x124 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_get_strings+0x174 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: veth_get_strings+0x188 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: veth_get_ethtool_stats+0x2d8 (section: .text) -> mvebu_a3700_utmi_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mmc_test_prepare_mrq+0x170 (section: .text) -> mv_hsic_phy_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: qcomtee_msg_buffers_alloc+0x22c (section: .text) -> mv_usb2_phy_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: qcomtee_msg_buffers_free+0x28 (section: .text) -> mv_usb2_phy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: qcomtee_msg_buffers_free+0x34 (section: .text) -> mv_usb2_phy_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: pool_op_free+0x2c (section: .text) -> mv_usb2_phy_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: bpf_prog_run_generic_xdp+0x490 (section: .text) -> intel_cbphy_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: page_pool_nl_stats_fill+0x60 (section: .text) -> mvebu_a3700_utmi_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: net_selftest_get_strings+0x50 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: net_selftest_get_strings+0x64 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: net_selftest_get_strings+0x78 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: net_selftest_get_strings+0x8c (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: net_selftest_get_strings+0xa0 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: net_selftest_get_strings+0xb4 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: net_selftest_get_strings+0xc8 (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: net_selftest_get_strings+0xdc (section: .text) -> mvebu_a3700_utmi_driver_init (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: bpf_test_run+0x1a0 (section: .text) -> intel_cbphy_driver_exit (section: .exit.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: bpf_test_run_xdp_live+0x698 (section: .text) -> intel_cbphy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xfrm_alloc_userspi+0x58 (section: .text) -> pxa_usb_phy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xfrm_alloc_userspi+0x154 (section: .text) -> pxa_usb_phy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rdev_set_ap_chanwidth+0x24 (section: .text) -> mtk_dp_phy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rdev_set_ap_chanwidth+0x28 (section: .text) -> mtk_dp_phy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __do_trace_rdev_set_tx_power+0x70 (section: .text) -> mtk_dp_phy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_rdev_set_ap_chanwidth+0x3c (section: .text) -> mtk_dp_phy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_rdev_set_ap_chanwidth+0x40 (section: .text) -> mtk_dp_phy_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: goldfish_pic_of_init+0xac (section: .init.text) -> keembay_usb_phy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __SCK__tp_func_rdev_set_tx_power+0x0 (section: .data) -> mtk_dp_phy_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_rdev_set_ap_chanwidth+0xc (section: .data) -> mtk_dp_phy_driver_init (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
