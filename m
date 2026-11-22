Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795384162;
	b=ey+dw1ZVlLWj3wgIpN4+hr6cIdPGlG+4ao+ThFtF+gQJJWWrqjqgXPx2hjq7ULQykLe/
	 G8xSFdrcQbh+qbi2iHJ6riDQoq1FGyvVFUORdfu2PQMfCUsE92oh7Ibxi9EcbhlbtEuh6
	 U7o4TihKanOS4IDrgHSxLOV9dtV6AL2QEwuxV8DKuSFcaGOVgJRzPnJKkSJhTekaBJ8Vc
	 hqN7bxAoNrLWkKcJEf/18XART0MWooMeymXxBiE7Q+gNY9A0oy5YPz39GbmqxSNxc3FsG
	 OIGJPKyUxlRKPt6zI1h65uHXvDDfDpvrc1XhvAd/jEy64QYyL3VDl4J3Sk7b/coQ1ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384162;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Q4qFzTXjJnuyy9FP3HCM/8OE+0vzFium837KHwbqTtE=;
	b=eFFn2ed0frZYHTG2SITYTLb2Ylhi7y81cMnuJ0o6lF6yk3S4RBwFn0vzWgQEtE9NSumu
	 9P9oh1KQMrv5ejMV6PaTc7rKkyR/sgIRMeq9ttvtHCA8psUiFZQG1x63nRkEyE38z98Uh
	 SxORke0pvOfQKn6B0nx+sr+SiNgiTkbFVndppFc6GggvKYQtMKfLRotnBMfn8O56j90pr
	 OtmGSINZ9PzPlsTckvffZS5TwS6XMrjIKscVXsjBIv+4IkZ+ykrr2aryHsa4FsK2gfK52
	 hz7IcXN+XUHQ0bGY7XpkDMHzUGmZZOeZR0LxzQF39cX51KcUrtbxi+ATlLZctJqVW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SdiHbqqX;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF9D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 21:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF9D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SdiHbqqX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795384162; x=1826920162;
  h=date:from:to:cc:subject:message-id;
  bh=lmisMYVr/oH6ul/QTNvzlbEO1lDGYFDYd+gBhwoolmQ=;
  b=SdiHbqqXAbtedpmLtAb4JezXPzBYMZrdTw54H3iTozQss+c4iTBstzAp
   RJjtlNU71XSvYqvknU/ZZ3GiVaxDhIyhmkP9QW9Yt7sa64RtUM8vYJYlS
   Lg6WNuPOXpy1UN7yRyDG6HOoLQYyU/d1EZkEjGtJ+2Ue2dDP2DlyMP/J8
   2GJVxClWWV8C93rvZez1ojopYFO5J3JbkeayvMKMpnc4T3xz/IRgsFEyp
   mDp2WhCW1vc7g9nDgs2AwZa/1USm4z55CRUHvb5XH/lFeIPxzAPigjbbM
   93qS1ZCuLlltN9H5JMJjPqrMzv+2YDMd0irk3zx/tlOAOBOOT6UsmpRu/
   Q==;
X-CSE-ConnectionGUID: P9wQhQ/RTjqCktWDOrSglA==
X-CSE-MsgGUID: hVWoGkfgS1GUezLfg5Ml3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4233400"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4233400"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 13:49:21 -0800
X-CSE-ConnectionGUID: Vl+KEam6TOiQGZkifjGtHw==
X-CSE-MsgGUID: N3F6fXg4Rs62gWWCjyPtIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11035298"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 22 Nov 2026 13:49:19 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVFQz-000000004cI-05YY;
	Sun, 22 Nov 2026 21:49:17 +0000
Date: Sun, 22 Nov 2026 22:48:51 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.fixes 70/76] WARNING: modpost: vmlinux:
 section mismatch in reference: hsr_add_port+0xbc (section: .text) ->
 damon_init (section: .init.text)
Message-ID: <20261122224146.20CL26tn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   d5b84d3d7e902c44b05b106718c579f3d3834812
commit: f7c58bf3c30f1cd479b66276dbfc63281030bd2d [70/76] fs: don't reset userspace_init_fs when PID 1 stops sharing it
config: loongarch-randconfig-r2106-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122224146.20CL26tn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122224146.20CL26tn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122224146.20CL26tn-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_i2c_result+0x14 (section: .text) -> rt4803_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_del_driver+0x1c (section: .text) -> rt4803_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_detect_slave_mode+0x10 (section: .text) -> rt5190a_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_detect_slave_mode+0x44 (section: .text) -> rt5739_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_detect_slave_mode+0x100 (section: .text) -> rt5190a_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: i2c_detect_slave_mode+0x104 (section: .text) -> rt5739_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdio_read_cccr+0x30 (section: .text) -> .LVL489 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdio_read_cccr+0xf4 (section: .text) -> .LVL490 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_sdio_switch_hs+0x14 (section: .text) -> .LVL491 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_sdio_switch_hs+0x54 (section: .text) -> .LVL492 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdio_set_bus_speed_mode+0x14 (section: .text) -> .LVL493 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdio_set_bus_speed_mode+0x8c (section: .text) -> .LVL494 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_rca_show+0x14 (section: .text) -> amdgpu_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: info4_show+0x44 (section: .text) -> .LDL1 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: info3_show+0x44 (section: .text) -> .LVL0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: info2_show+0x44 (section: .text) -> .LVL1 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: info1_show+0x44 (section: .text) -> .LVL3 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_revision_show+0x18 (section: .text) -> .LVL4 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_revision_show+0x1c (section: .text) -> .LVL6 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_device_show+0x14 (section: .text) -> .LVL9 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mmc_vendor_show+0x14 (section: .text) -> .LVL10 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rdma_accept+0xf4 (section: .text) -> start_dirtytime_writeback (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mthca_table_get+0x120 (section: .text) -> __TRACE_SYSTEM_WB_REASON_FORKER_THREAD (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: mthca_alloc_icm_table+0x140 (section: .text) -> __TRACE_SYSTEM_WB_REASON_FORKER_THREAD (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: sbefifo_probe+0x100 (section: .text) -> start_dirtytime_writeback (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rds_rdma_map+0x144 (section: .text) -> early_ioremap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rds_rdma_map+0x324 (section: .text) -> early_iounmap (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __rds_rdma_map+0x328 (section: .text) -> early_memremap_ro (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_get_mr+0x18 (section: .text) -> early_memremap_prot (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_cm_handle_connect+0x120 (section: .text) -> start_dirtytime_writeback (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_send_ack+0x15c (section: .text) -> .LBI2634 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_send_ack+0x1d4 (section: .text) -> .LBB2634 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_refill_one_inc+0xc4 (section: .text) -> .LBI2635 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_refill_one_inc+0xcc (section: .text) -> .LBB2635 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_refill_one_inc+0x100 (section: .text) -> .LBB2635 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_frag_free+0x58 (section: .text) -> .LBI2636 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_process_recv+0xe4 (section: .text) -> .LBB2636 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_process_recv+0x1e8 (section: .text) -> .LBI2637 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_process_recv+0x244 (section: .text) -> .LBB2637 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_refill_one_frag+0x98 (section: .text) -> .LBI2638 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_refill_one_frag+0x120 (section: .text) -> .LBB2635 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_refill_one_frag+0x124 (section: .text) -> .LBB2638 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_refill_one_frag+0x1c0 (section: .text) -> .LBB2635 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_free_caches+0xe8 (section: .text) -> .LBB2635 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_free_caches+0x218 (section: .text) -> .LBB2635 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_free_caches+0x21c (section: .text) -> .LBI2639 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_free_caches+0x28c (section: .text) -> .LBB2639 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_inc_copy_to_user+0x58 (section: .text) -> .LBI2641 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_attempt_ack+0x14 (section: .text) -> .LBB2641 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_cqe_handler+0x48 (section: .text) -> .LBI2642 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_cqe_handler+0xd8 (section: .text) -> .LBB2642 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_init+0x18 (section: .text) -> .LBI2643 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_init+0x4c (section: .text) -> .LBB2643 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_init+0x98 (section: .text) -> .LBB2635 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_init+0xbc (section: .text) -> .LBI2644 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_init+0xf4 (section: .text) -> .LBB2644 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rds_ib_recv_exit+0x14 (section: .text) -> .LBB2635 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: do_trace_event_raw_event_rdev_channel_switch+0x1bc (section: .text) -> lockdep_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_start_radar_detection+0x154 (section: .text) -> tk_debug_sleep_time_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_start_radar_detection+0x1e4 (section: .text) -> tk_debug_sleep_time_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_set_mon_options+0x280 (section: .text) -> time_ns_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_set_tx_power+0x30 (section: .text) -> time_ns_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_set_tx_power+0x134 (section: .text) -> time_ns_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_downgrade_queue+0x1ac (section: .text) -> audit_net_ops (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_select_queue+0x150 (section: .text) -> __setup_str_audit_backlog_limit_set (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_select_queue+0x154 (section: .text) -> __setup_str_audit_enable (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_select_queue+0x164 (section: .text) -> __setup_audit_backlog_limit_set (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_select_queue+0x168 (section: .text) -> __setup_audit_enable (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: __ieee80211_create_tpt_led_trigger+0xc8 (section: .text) -> .LVL4897 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_led_init+0x20 (section: .text) -> .L3318 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_led_init+0x28 (section: .text) -> .LBB8873 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_led_init+0xb4 (section: .text) -> .LVL4902 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_led_init+0xbc (section: .text) -> .LVL4880 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_led_init+0xfc (section: .text) -> .LVL4883 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_led_init+0x104 (section: .text) -> .LVL4884 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_led_init+0x150 (section: .text) -> .LVL4886 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ieee80211_led_init+0x158 (section: .text) -> .LVL4891 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_fast_tx_gc+0x88 (section: .text) -> .LVL1 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_nametbl_unsubscribe+0xcc (section: .text) -> __TRACE_SYSTEM_WB_REASON_FOREIGN_FLUSH (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: tipc_node_pre_cleanup_net+0x254 (section: .text) -> bpf_global_ma_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_stop+0x94 (section: .text) -> .LBI1808 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_stop+0xc8 (section: .text) -> .LBB1808 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_stop+0x148 (section: .text) -> .LBB1810 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x18 (section: .text) -> .LBB1811 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0xac (section: .text) -> .LBI1812 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x148 (section: .text) -> .LBB1812 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x388 (section: .text) -> .LBI1813 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x394 (section: .text) -> .LBB1813 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x488 (section: .text) -> .LBI1814 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x498 (section: .text) -> .LBB1814 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x588 (section: .text) -> .LBI1815 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x594 (section: .text) -> .LBB1815 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x654 (section: .text) -> .LBB1817 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drv_start+0x68c (section: .text) -> .LVL171 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_meshif_vlan_release+0x58 (section: .text) -> start_dirtytime_writeback (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_meshif_create_vlan+0x20c (section: .text) -> start_dirtytime_writeback (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: netdev_create+0x260 (section: .text) -> .Lpcadd_hi114 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: netdev_destroy+0x18 (section: .text) -> .Lpcadd_hi112 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: netdev_destroy+0x78 (section: .text) -> .Lpcadd_hi112 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_netdev_notify+0x28 (section: .text) -> .LVL753 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0xbc (section: .text) -> damon_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x27c (section: .text) -> .Lpcadd_hi14 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x340 (section: .text) -> .Lpcadd_hi15 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x344 (section: .text) -> .Lpcadd_hi16 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x350 (section: .text) -> .Lpcadd_hi15 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x354 (section: .text) -> damon_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x368 (section: .text) -> .Lpcadd_hi15 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x378 (section: .text) -> .Lpcadd_hi15 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x390 (section: .text) -> damon_va_initcall (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x3a0 (section: .text) -> damon_va_initcall (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x3b8 (section: .text) -> .Lpcadd_hi15 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x3c8 (section: .text) -> .Lpcadd_hi15 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hsr_add_port+0x3e4 (section: .text) -> .Lpcadd_hi15 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nt35510_driver+0x18 (section: .data) -> .LBB1089 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nt35510_driver+0x54 (section: .data) -> .LBB1087 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: s6e63j0x03_driver+0x0 (section: .data) -> .LBB2565 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: chipone_dsi_driver+0x18 (section: .data) -> .LBB1754 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: chipone_i2c_driver+0x30 (section: .data) -> .LBB1754 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_eeprom4+0x0 (section: .data) -> .LVL394 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_rdac4+0x0 (section: .data) -> dlm_user_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_region_mmio_size+0x0 (section: .data) -> init_nls_cp855 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_region_dus_size+0x0 (section: .data) -> exit_nls_cp855 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: ksphy_driver+0x10e4 (section: .data) -> landlock_add_cap_hooks (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ksphy_driver+0x1384 (section: .data) -> landlock_add_ns_hooks (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ksphy_driver+0x14b8 (section: .data) -> landlock_add_ns_hooks (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0x58 (section: .data) -> default_measure_policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0xa0 (section: .data) -> default_appraise_policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0x1e4 (section: .data) -> default_appraise_policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0x328 (section: .data) -> default_appraise_policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0x46c (section: .data) -> default_appraise_policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0x5a8 (section: .data) -> policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0x6ec (section: .data) -> policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0x830 (section: .data) -> policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0x974 (section: .data) -> policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0xac0 (section: .data) -> default_appraise_policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0xc04 (section: .data) -> default_appraise_policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: vsc82xx_driver+0xd48 (section: .data) -> default_appraise_policy_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: serio_device_attr_groups+0x0 (section: .data) -> .LBB1586 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: serio_device_attr_groups+0x4 (section: .data) -> .LBB1588 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: serio_mutex+0x2c (section: .data) -> .LBB1599 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: driver_attr_bind_mode+0x14 (section: .data) -> .LBB1231 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: driver_attr_bind_mode+0x18 (section: .data) -> .LBB1268 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: driver_attr_description+0x14 (section: .data) -> .LBB1232 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_bind_mode+0x18 (section: .data) -> .LBB1266 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: dev_attr_type+0x14 (section: .data) -> dma_channel_table_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdio_std_attrs+0x1c (section: .data) -> amdgpu_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: sdio_std_attrs+0x20 (section: .data) -> .LVL488 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __SCK__tp_func_tcp_hash_bad_header+0x0 (section: .data) -> __TRACE_SYSTEM_WB_REASON_DONTCACHE (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: event_api_start_tx_ba_cb+0x8 (section: .data) -> audit_watch_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_api_start_tx_ba_session+0x8 (section: .data) -> .LBB485 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: event_api_return_bool+0x8 (section: .data) -> audit_fsnotify_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: p9_virtio_trans+0x24 (section: .data) -> bpf_link_iter_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: uacce_init+0x10 (section: .init.text) -> exit_nls_cp936 (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a28 (section: __ex_table) -> .LASF1327 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a28 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a2c (section: __ex_table) -> .LASF1328 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a2c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a34 (section: __ex_table) -> .LASF1329 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a34 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a38 (section: __ex_table) -> .LASF1330 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a38 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a40 (section: __ex_table) -> .LASF1331 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a40 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a44 (section: __ex_table) -> .LASF1332 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a44 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a4c (section: __ex_table) -> .LASF1333 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a4c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a50 (section: __ex_table) -> .LASF1334 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a50 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a58 (section: __ex_table) -> .LASF1335 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a58 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a5c (section: __ex_table) -> .LASF1336 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a5c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a64 (section: __ex_table) -> .LASF1337 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a64 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a68 (section: __ex_table) -> .LASF1338 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a68 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a70 (section: __ex_table) -> .LASF1339 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a70 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a74 (section: __ex_table) -> .LASF1340 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a74 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a7c (section: __ex_table) -> .LVUS212 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1a7c references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a80 (section: __ex_table) -> .LLST213 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1a80 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a88 (section: __ex_table) -> .LVUS213 (section: .debug_loclists)
ERROR: modpost: __ex_table+0x1a88 references non-executable section '.debug_loclists'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a94 (section: __ex_table) -> .LASF3623 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a94 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1a98 (section: __ex_table) -> .LASF3624 (section: .debug_str)
ERROR: modpost: __ex_table+0x1a98 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa0 (section: __ex_table) -> .LASF3625 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aa4 (section: __ex_table) -> .LASF3626 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aa4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1aac (section: __ex_table) -> .LASF3627 (section: .debug_str)
ERROR: modpost: __ex_table+0x1aac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab0 (section: __ex_table) -> .LASF3628 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ab8 (section: __ex_table) -> .LASF3629 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ab8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1abc (section: __ex_table) -> .LASF3630 (section: .debug_str)
ERROR: modpost: __ex_table+0x1abc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac4 (section: __ex_table) -> .LASF3631 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ac8 (section: __ex_table) -> .LASF3632 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ac8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1ad0 (section: __ex_table) -> .LASF1665 (section: .debug_str)
ERROR: modpost: __ex_table+0x1ad0 references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
