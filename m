Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F342626B76E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 23:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754522404; cv=none; b=ELBB9LhzIgu5/iHRxPby5+j2rK3aESQvjwN4GLjQR1GkaKnVwVnGGjX44XxBGRSAN8PIm39wQMi3siuNQodxYj9MuD7VjEUItltuP9EKr32Gs3LBO2laaJz2VF4CWMOqgawn/c2HDHHqrgWTa/lWgKwPF2gO2qFt7yzMCDi54HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754522404; c=relaxed/simple;
	bh=zQ7N300C5i3qko69oledCOECWw0nJ0Uj6oqaPNF4wCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ri8eBzr0KHbF01NYxLr04Vub8s9fx/PPZET7zLI4kvr/uxmXOQp6Io/JoiYBmFwAMEgXVOTy/OQGwVfjRKdpHh/yBN3CxzdF6bzC1fdVIxp/b2/aT+xeRI4Kvr0Lg3bvj7wN8hGAcQzLNpQj59G/wwsXdQAbCDpbTLYEfzSRCxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akdiIDV4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akdiIDV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754522402; x=1786058402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQ7N300C5i3qko69oledCOECWw0nJ0Uj6oqaPNF4wCY=;
  b=akdiIDV48Y0bKeLpVfh0Raoa+tgProF5t5eiGJgQP5cGdenVIUH1Fk75
   fEGWuLPJW9qrqk1Hr/LSfpAduKFZ4gFpTTQuUhXQ/1jgvkbOUQoFWfikb
   SMuH2GttlbtsCCjdZAO7PnuPOcGyNzx8Y8GHEDEDECiOlDrs86a+n10J1
   w7zhEDUzvd6fT/zakH1jqK6965nKfN/T1g0letW1pC1lG0SgDSp5FXyl7
   K13yTMMQiA5XcHriafiGH+wnuQVmXzhGyGPxmxnGZ1BkkSJk5YRmIhgO2
   c3xkly/7xfoRQswyIQndDoxMteyYZLZWIYGCzKgZcfeRqpxTavTDqHRF5
   A==;
X-CSE-ConnectionGUID: HelSNj6/T2KanKBL2bzTOQ==
X-CSE-MsgGUID: NtwqizrzR0iEbc3fO/DrZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67929236"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67929236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 16:20:02 -0700
X-CSE-ConnectionGUID: FYy0WPs5S8C0TyZplrRBAw==
X-CSE-MsgGUID: hFcpJ/p2QnuZPsWPW4Cygg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="202061047"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2025 16:20:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujnQL-0002As-2L;
	Wed, 06 Aug 2025 23:19:57 +0000
Date: Thu, 7 Aug 2025 07:19:40 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13336/13338] ERROR: modpost: __ex_table+0x1584
 references non-executable section '.rodata.visl_trace_ctrls.isra.7.str1.4'
Message-ID: <202508070734.mtvNONjv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b7d4e259682caccb51a25283655f2c8f02e32d23
commit: 979e5b7b5d42b16860b3a8d6c4f97af42b75dc71 [13336/13338] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git
config: riscv-randconfig-002-20250807 (https://download.01.org/0day-ci/archive/20250807/202508070734.mtvNONjv-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508070734.mtvNONjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508070734.mtvNONjv-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x13e (section: .text.batadv_gw_out_of_range) -> st7735r_spi_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x142 (section: .text.batadv_gw_out_of_range) -> cn_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x1ba (section: .text.batadv_gw_out_of_range) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x1f0 (section: .text.batadv_gw_out_of_range) -> cn_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x20c (section: .text.batadv_gw_out_of_range) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x226 (section: .text.batadv_gw_out_of_range) -> cn_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x23e (section: .text.batadv_gw_out_of_range) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x260 (section: .text.batadv_gw_out_of_range) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x26e (section: .text.batadv_gw_out_of_range) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x274 (section: .text.batadv_gw_out_of_range) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x27c (section: .text.batadv_gw_out_of_range) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_gw_out_of_range+0x284 (section: .text.batadv_gw_out_of_range) -> st7735r_spi_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_mesh_init+0x3e (section: .text.batadv_mesh_init) -> cn_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_mesh_init+0x42 (section: .text.batadv_mesh_init) -> component_debug_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_mesh_init+0xe6 (section: .text.batadv_mesh_init) -> component_debug_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_mesh_init+0xfa (section: .text.batadv_mesh_init) -> cn_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_is_my_mac+0x17c (section: .text.batadv_is_my_mac) -> component_debug_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_batman_skb_recv+0x34 (section: .text.batadv_batman_skb_recv) -> component_debug_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_batman_skb_recv+0x50 (section: .text.batadv_batman_skb_recv) -> devlink_class_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x1e6 (section: .text.batadv_recv_unicast_packet) -> firmware_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x1ee (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x1f0 (section: .text.batadv_recv_unicast_packet) -> .LVL0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x240 (section: .text.batadv_recv_unicast_packet) -> firmware_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x248 (section: .text.batadv_recv_unicast_packet) -> firmware_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x272 (section: .text.batadv_recv_unicast_packet) -> firmware_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x284 (section: .text.batadv_recv_unicast_packet) -> firmware_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x28a (section: .text.batadv_recv_unicast_packet) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x29e (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x2a8 (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x2be (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x2ce (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x2d4 (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x2ea (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x328 (section: .text.batadv_recv_unicast_packet) -> firmware_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x33a (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x362 (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x368 (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x37a (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x38a (section: .text.batadv_recv_unicast_packet) -> firmware_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x394 (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_recv_unicast_packet+0x4b6 (section: .text.batadv_recv_unicast_packet) -> driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tp_sender_finish+0x12 (section: .text.batadv_tp_sender_finish) -> container_dev_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tp_sender_timeout+0x9c (section: .text.batadv_tp_sender_timeout) -> container_dev_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tp_sender_timeout+0xac (section: .text.batadv_tp_sender_timeout) -> topology_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tp_sender_timeout+0xb6 (section: .text.batadv_tp_sender_timeout) -> topology_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tp_list_find+0x1a (section: .text.batadv_tp_list_find) -> container_dev_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_local_table_free.isra.23+0x28 (section: .text.batadv_tt_local_table_free.isra.23) -> cacheinfo_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_local_table_free.isra.23+0x52 (section: .text.batadv_tt_local_table_free.isra.23) -> software_node_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_local_table_free.isra.23+0x56 (section: .text.batadv_tt_local_table_free.isra.23) -> cacheinfo_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_local_table_free.isra.23+0x58 (section: .text.batadv_tt_local_table_free.isra.23) -> software_node_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_local_table_free.isra.23+0x6e (section: .text.batadv_tt_local_table_free.isra.23) -> software_node_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_local_table_free.isra.23+0x70 (section: .text.batadv_tt_local_table_free.isra.23) -> software_node_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_local_table_free.isra.23+0x90 (section: .text.batadv_tt_local_table_free.isra.23) -> software_node_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_global_dump+0x6f2 (section: .text.batadv_tt_global_dump) -> cacheinfo_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_global_dump+0x6fe (section: .text.batadv_tt_global_dump) -> cacheinfo_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_global_dump+0x724 (section: .text.batadv_tt_global_dump) -> cacheinfo_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: batadv_tt_global_dump+0x74e (section: .text.batadv_tt_global_dump) -> cacheinfo_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport_do_socket_init+0x9a (section: .text.virtio_transport_do_socket_init) -> wakeup_sources_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport_do_socket_init+0x9e (section: .text.virtio_transport_do_socket_init) -> firmware_class_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport_deliver_tap_pkt+0x1a (section: .text.virtio_transport_deliver_tap_pkt) -> firmware_class_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport_deliver_tap_pkt+0x1e (section: .text.virtio_transport_deliver_tap_pkt) -> wakeup_sources_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: virtio_transport_purge_skbs+0x26 (section: .text.virtio_transport_purge_skbs) -> firmware_class_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xsk_release+0xba (section: .text.xsk_release) -> wm8994_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xsk_map_sock_delete+0x80 (section: .text.xsk_map_sock_delete) -> wm8994_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xsk_map_meta_equal+0x14 (section: .text.xsk_map_meta_equal) -> wm8994_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xsk_map_update_elem+0x188 (section: .text.xsk_map_update_elem) -> wm8994_i2c_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: current_is_single_threaded+0x84 (section: .text.current_is_single_threaded) -> lkdtm_usercopy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: current_is_single_threaded+0x8c (section: .text.current_is_single_threaded) -> lkdtm_usercopy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: current_is_single_threaded+0x9c (section: .text.current_is_single_threaded) -> lkdtm_usercopy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: current_is_single_threaded+0xa4 (section: .text.current_is_single_threaded) -> lkdtm_perms_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: current_is_single_threaded+0xa8 (section: .text.current_is_single_threaded) -> lkdtm_usercopy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: current_is_single_threaded+0xbc (section: .text.current_is_single_threaded) -> lkdtm_usercopy_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_new_root+0xc2 (section: .text.mas_new_root) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_new_root+0x18c (section: .text.mas_new_root) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mt_destroy+0x4e (section: .text.__mt_destroy) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mt_destroy+0xec (section: .text.__mt_destroy) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mt_validate+0x938 (section: .text.mt_validate) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next+0x18 (section: .text.mas_next) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_next_range+0x18 (section: .text.mas_next_range) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_topiary_replace+0x862 (section: .text.mas_topiary_replace) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_topiary_replace+0x880 (section: .text.mas_topiary_replace) -> bh1770_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_spanning_store.isra.63+0x242 (section: .text.mas_wr_spanning_store.isra.63) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_spanning_store.isra.63+0x2fa (section: .text.mas_wr_spanning_store.isra.63) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_bnode+0x1234 (section: .text.mas_wr_bnode) -> apds990x_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x23e (section: .text.mas_wr_store_entry) -> apds990x_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mas_wr_store_entry+0x296 (section: .text.mas_wr_store_entry) -> bh1770_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_insert_color+0x8c (section: .text.rb_insert_color) -> uacce_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_insert_color+0xa2 (section: .text.rb_insert_color) -> .L0  (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_insert_color+0xba (section: .text.rb_insert_color) -> uacce_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_insert_color+0xe2 (section: .text.rb_insert_color) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_erase+0xa (section: .text.rb_erase) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_erase+0xe (section: .text.rb_erase) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rb_erase+0x16 (section: .text.rb_erase) -> hi6421v600_irq_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: strcasecmp+0x24 (section: .text.strcasecmp) -> tps6594_esm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: strncpy+0x1c (section: .text.strncpy) -> tps6594_esm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: stpcpy+0x6 (section: .text.stpcpy) -> tps6594_esm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stpcpy+0x18 (section: .text.stpcpy) -> tps6594_esm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: strcat+0xa (section: .text.strcat) -> tps6594_pfsm_driver_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: strnchrnul+0x26 (section: .text.strnchrnul) -> tps6594_esm_driver_exit (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: 0x1584 (section: __ex_table) -> 0x0 (section: .rodata.visl_trace_ctrls.isra.7.str1.4)
>> ERROR: modpost: __ex_table+0x1584 references non-executable section '.rodata.visl_trace_ctrls.isra.7.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1588 (section: __ex_table) -> str__visl_fwht_controls__trace_system_name (section: .rodata.str__visl_fwht_controls__trace_system_name)
>> ERROR: modpost: __ex_table+0x1588 references non-executable section '.rodata.str__visl_fwht_controls__trace_system_name'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1590 (section: __ex_table) -> str__visl_hevc_controls__trace_system_name (section: .rodata.str__visl_hevc_controls__trace_system_name)
>> ERROR: modpost: __ex_table+0x1590 references non-executable section '.rodata.str__visl_hevc_controls__trace_system_name'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1594 (section: __ex_table) -> str__visl_vp8_controls__trace_system_name (section: .rodata.str__visl_vp8_controls__trace_system_name)
>> ERROR: modpost: __ex_table+0x1594 references non-executable section '.rodata.str__visl_vp8_controls__trace_system_name'
WARNING: modpost: vmlinux: section mismatch in reference: 0x159c (section: __ex_table) -> 0x0 (section: .rodata.trace_raw_output_v4l2_ctrl_av1_film_grain_tmpl.str1.4)
>> ERROR: modpost: __ex_table+0x159c references non-executable section '.rodata.trace_raw_output_v4l2_ctrl_av1_film_grain_tmpl.str1.4'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a0 (section: __ex_table) -> str__visl_vp8_controls__trace_system_name (section: .rodata.str__visl_vp8_controls__trace_system_name)
ERROR: modpost: __ex_table+0x15a0 references non-executable section '.rodata.str__visl_vp8_controls__trace_system_name'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15a8 (section: __ex_table) -> .LASF2778 (section: .debug_str)
ERROR: modpost: __ex_table+0x15a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15ac (section: __ex_table) -> .LASF2780 (section: .debug_str)
ERROR: modpost: __ex_table+0x15ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b4 (section: __ex_table) -> .LASF2782 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15b8 (section: __ex_table) -> .LASF2784 (section: .debug_str)
ERROR: modpost: __ex_table+0x15b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c0 (section: __ex_table) -> .LASF2786 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15c4 (section: __ex_table) -> .LASF2788 (section: .debug_str)
ERROR: modpost: __ex_table+0x15c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15cc (section: __ex_table) -> .LASF2790 (section: .debug_str)
ERROR: modpost: __ex_table+0x15cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d0 (section: __ex_table) -> .LASF2788 (section: .debug_str)
ERROR: modpost: __ex_table+0x15d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15d8 (section: __ex_table) -> .LASF2793 (section: .debug_str)
ERROR: modpost: __ex_table+0x15d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x15dc (section: __ex_table) -> .LASF2788 (section: .debug_str)
ERROR: modpost: __ex_table+0x15dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1674 (section: __ex_table) -> .LLST38 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1674 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1684 (section: __ex_table) -> .LLST40 (section: .debug_loc)
ERROR: modpost: __ex_table+0x1684 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x168c (section: __ex_table) -> .LLST41 (section: .debug_loc)
ERROR: modpost: __ex_table+0x168c references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a4 (section: __ex_table) -> .LLST46 (section: .debug_loc)
ERROR: modpost: __ex_table+0x16a4 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16a8 (section: __ex_table) -> .LLST47 (section: .debug_loc)
ERROR: modpost: __ex_table+0x16a8 references non-executable section '.debug_loc'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16b4 (section: __ex_table) -> .LASF2625 (section: .debug_str)
ERROR: modpost: __ex_table+0x16b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16bc (section: __ex_table) -> .LASF2627 (section: .debug_str)
ERROR: modpost: __ex_table+0x16bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c0 (section: __ex_table) -> .LASF2633 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16c8 (section: __ex_table) -> .LASF5754 (section: .debug_str)
ERROR: modpost: __ex_table+0x16c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x16cc (section: __ex_table) -> .LASF5756 (section: .debug_str)
ERROR: modpost: __ex_table+0x16cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a0 (section: __ex_table) -> .LASF6211 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17a4 (section: __ex_table) -> .LASF6213 (section: .debug_str)
ERROR: modpost: __ex_table+0x17a4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17ac (section: __ex_table) -> .LASF6215 (section: .debug_str)
ERROR: modpost: __ex_table+0x17ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b0 (section: __ex_table) -> .LASF6213 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17b8 (section: __ex_table) -> .LASF6218 (section: .debug_str)
ERROR: modpost: __ex_table+0x17b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17bc (section: __ex_table) -> .LASF6213 (section: .debug_str)
ERROR: modpost: __ex_table+0x17bc references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c4 (section: __ex_table) -> .LASF6221 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17c8 (section: __ex_table) -> .LASF6223 (section: .debug_str)
ERROR: modpost: __ex_table+0x17c8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d0 (section: __ex_table) -> .LASF6225 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x17d4 (section: __ex_table) -> .LASF6213 (section: .debug_str)
ERROR: modpost: __ex_table+0x17d4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1860 (section: __ex_table) -> .LASF1389 (section: .debug_str)
ERROR: modpost: __ex_table+0x1860 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1864 (section: __ex_table) -> .LASF1391 (section: .debug_str)
ERROR: modpost: __ex_table+0x1864 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x186c (section: __ex_table) -> .LASF1393 (section: .debug_str)
ERROR: modpost: __ex_table+0x186c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1870 (section: __ex_table) -> .LASF1395 (section: .debug_str)
ERROR: modpost: __ex_table+0x1870 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1878 (section: __ex_table) -> .LASF1397 (section: .debug_str)
ERROR: modpost: __ex_table+0x1878 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x187c (section: __ex_table) -> .LASF1399 (section: .debug_str)
ERROR: modpost: __ex_table+0x187c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1884 (section: __ex_table) -> .LASF1401 (section: .debug_str)
ERROR: modpost: __ex_table+0x1884 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1888 (section: __ex_table) -> .LASF1403 (section: .debug_str)
ERROR: modpost: __ex_table+0x1888 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1890 (section: __ex_table) -> .LASF1405 (section: .debug_str)
ERROR: modpost: __ex_table+0x1890 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x1894 (section: __ex_table) -> .LASF1407 (section: .debug_str)
ERROR: modpost: __ex_table+0x1894 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x189c (section: __ex_table) -> .LASF1409 (section: .debug_str)
ERROR: modpost: __ex_table+0x189c references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a0 (section: __ex_table) -> .LASF1411 (section: .debug_str)
ERROR: modpost: __ex_table+0x18a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18a8 (section: __ex_table) -> .LASF1413 (section: .debug_str)
ERROR: modpost: __ex_table+0x18a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18ac (section: __ex_table) -> .LASF1415 (section: .debug_str)
ERROR: modpost: __ex_table+0x18ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b4 (section: __ex_table) -> .LASF1417 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18b8 (section: __ex_table) -> .LASF1415 (section: .debug_str)
ERROR: modpost: __ex_table+0x18b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18c0 (section: __ex_table) -> .LASF1420 (section: .debug_str)
ERROR: modpost: __ex_table+0x18c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18c4 (section: __ex_table) -> .LASF1415 (section: .debug_str)
ERROR: modpost: __ex_table+0x18c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux: section mismatch in reference: 0x18cc (section: __ex_table) -> .LASF1423 (section: .debug_str)
ERROR: modpost: __ex_table+0x18cc references non-executable section '.debug_str'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
