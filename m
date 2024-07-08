Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055F17345B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720475558; cv=none; b=L770F8/LXPVtNHjC9kb+W20z0+w7JAxOquy+N/JdipxQy3nkMkpOZ0spHKHl/jnIxqWbsq4cJn1vunk5FuN4LnS9+mxOfdCbqPNDglCz+YRWq5JUKhGaT9Zgi++b3afI5UvrhNKefWOEM7WjG4uvk+N/6ezjqI92Hl24/D7+wJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720475558; c=relaxed/simple;
	bh=T5OdKXpFrpjPXnegtOmgRdlmjev+KHicc7ZmYi18tj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4dOt+dijWVO9lvSCtcewJd1g6mpav1J/Pq+0VL07o68qdAikZST3JEM6DwELuewwkZw+70zpfL7JenDdIxh6/hl57IoUkANv766fahEnykC8/3WHYLjXEKYf62S13DnxuCVymRuEfyps65U3+7ZiGnufvR5SCRfsnB2+cFkpeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eweDSKxL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eweDSKxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720475556; x=1752011556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5OdKXpFrpjPXnegtOmgRdlmjev+KHicc7ZmYi18tj4=;
  b=eweDSKxLEePGIG3N+yle458MbwooMJAsbNvOwNxmz+4+ROdcqqd8Ecok
   sWsScp7zpKNH03cF1ZPWjadFEn/IohAGKQNbpdiY4CWLh7iTMpgjpARSX
   6LnRRIOYrabz/ETaXN7WK7vnoRH4YYspqYBKie8m/sInNpyCwAGBpmJz1
   50HQ2jDB+xgjDF05HM6CRxVG0h60A4axgXJh1koww46KoDr1G7kUah9Wf
   buwIK949VXCfJkGMDJ4IPnuZiSO35ThaHkomUEazzC93yOHaeytB+Geya
   HMMvWSTUmDEIhUknO3ANblX9BhiVMhl63JkSAEYZKEXwoJJ+6okgWd06m
   w==;
X-CSE-ConnectionGUID: 1z2MzVEQSTKCUCwByBPMAA==
X-CSE-MsgGUID: icHk8MEKRW20jaVLjhMCGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29099198"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="29099198"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 14:52:34 -0700
X-CSE-ConnectionGUID: roRoxDveT+upXbNlEvd8Eg==
X-CSE-MsgGUID: 7eBQtV2gTeGQNfChYsrl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="47582477"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jul 2024 14:52:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQwHd-000W4I-1u;
	Mon, 08 Jul 2024 21:52:29 +0000
Date: Tue, 9 Jul 2024 05:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Honggyu Kim <honggyu.kim@sk.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	SeongJae Park <sj@kernel.org>
Subject: [linux-next:master 7416/10451] WARNING: modpost: vmlinux: section
 mismatch in reference: svc_xprt_create_from_sa+0x6e (section: .text) -> .L96
 (section: .init.text)
Message-ID: <202407090506.BxtnYHgZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: c3bf782bb0fffebcc4e467033cf6bf5e5e1b0784 [7416/10451] mm: make alloc_demote_folio externally invokable for migration
config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407090506.BxtnYHgZ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090506.BxtnYHgZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090506.BxtnYHgZ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0x5c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0x84 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0x88 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0x98 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0xa8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0xb4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0xc6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0xf0 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0x100 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0x114 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0x118 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_entries_get_doit+0x126 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_headers_get_doit+0x8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_table_counters_set_doit+0x18 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_table_counters_set_doit+0x20 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_table_counters_set_doit+0x3c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_table_counters_set_doit+0x40 (section: .text) -> riscv_set_dma_cache_alignment (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_table_counters_set_doit+0x4a (section: .text) -> riscv_set_dma_cache_alignment (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_table_counters_set_doit+0x5e (section: .text) -> riscv_set_dma_cache_alignment (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_table_counters_set_doit+0x60 (section: .text) -> riscv_set_dma_cache_alignment (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_dpipe_table_counters_set_doit+0x68 (section: .text) -> riscv_set_dma_cache_alignment (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_seq_socket_stop+0x8 (section: .text) -> init_fs_inode_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_seq_socket_stop+0xc (section: .text) -> init_fs_inode_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_seq_socket_start+0xa (section: .text) -> init_fs_inode_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: atalk_seq_socket_start+0xe (section: .text) -> init_fs_inode_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cs_create_conn+0xc6 (section: .text) -> .LBE7149 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cs_create_conn+0x10a (section: .text) -> .LBB7152 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cs_create_conn+0x120 (section: .text) -> .LBB7152 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cs_create_conn+0x124 (section: .text) -> .LBE7152 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cs_create_conn+0x13e (section: .text) -> .LBB7152 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cs_create_conn+0x142 (section: .text) -> .LBB7152 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cs_create_conn+0x1aa (section: .text) -> .LBB7152 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_ioctl+0x17c (section: .text) -> init_fs_inode_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_sock_bind+0x1d0 (section: .text) -> init_fs_inode_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: l2cap_publish_rx_avail+0x3c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: l2cap_publish_rx_avail+0x4e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: l2cap_publish_rx_avail+0x60 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_add_cid+0x3c (section: .text) -> cpus_dont_share (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_add_cid+0x40 (section: .text) -> cpus_share_numa (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_add_cid+0x48 (section: .text) -> cpus_share_numa (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_add_cid+0x5a (section: .text) -> cpus_share_numa (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_add_cid+0x5e (section: .text) -> restrict_unbound_cpumask (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_add_cid+0x66 (section: .text) -> restrict_unbound_cpumask (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_create+0x3a (section: .text) -> cpus_share_numa (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_create+0x42 (section: .text) -> cpus_share_numa (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_create+0x5e (section: .text) -> restrict_unbound_cpumask (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_create+0x66 (section: .text) -> restrict_unbound_cpumask (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_destroy+0x9c (section: .text) -> restrict_unbound_cpumask (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_destroy+0xba (section: .text) -> wq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_destroy+0xda (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_destroy+0xf4 (section: .text) -> wq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_destroy+0x106 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_destroy+0x12e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_destroy+0x1c4 (section: .text) -> wq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_irk_matches+0x22 (section: .text) -> wq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_irk_matches+0x28 (section: .text) -> wq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_irk_matches+0x40 (section: .text) -> workqueue_unbound_cpus_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_irk_matches+0x52 (section: .text) -> workqueue_unbound_cpus_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_irk_matches+0x72 (section: .text) -> wq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_generate_rpa+0x8 (section: .text) -> workqueue_unbound_cpus_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_generate_rpa+0xe (section: .text) -> workqueue_unbound_cpus_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_generate_oob+0x8 (section: .text) -> init_pod_type.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_generate_oob+0x18 (section: .text) -> init_pod_type.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_generate_oob+0x3e (section: .text) -> workqueue_unbound_cpus_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_cmd_security_req+0x78 (section: .text) -> init_pod_type.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_cmd_security_req+0x80 (section: .text) -> init_pod_type.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_cmd_security_req+0x9a (section: .text) -> cpus_share_smt (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_cmd_security_req+0xa2 (section: .text) -> cpus_share_smt (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_cmd_security_req+0xb6 (section: .text) -> init_pod_type.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_cmd_security_req+0x1c6 (section: .text) -> init_pod_type.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_cmd_security_req+0x1ca (section: .text) -> init_pod_type.isra.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_sig_channel+0x130 (section: .text) -> cpus_share_smt (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_sig_channel+0x13a (section: .text) -> init_cpu_worker_pool.constprop.0 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_update_accept_list_sync+0x380 (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_update_accept_list_sync+0x38a (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_active_scan_sync+0x2c (section: .text) -> cred_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_active_scan_sync+0x8c (section: .text) -> .L3 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_call_sync+0x86 (section: .text) -> vfs_caches_init_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: call_refreshresult+0xe2 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xs_tcp_set_socket_timeouts+0x110 (section: .text) -> init_fs_dcache_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xs_tcp_setup_socket+0xb4 (section: .text) -> sched_init_granularity (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xs_tcp_setup_socket+0xbc (section: .text) -> sched_init_granularity (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xs_tcp_setup_socket+0xd2 (section: .text) -> init_sched_fair_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xs_tcp_setup_socket+0x26a (section: .text) -> init_sched_fair_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xs_tcp_setup_socket+0x2be (section: .text) -> init_sched_fair_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_raw_output_pmap_register+0x22 (section: .text) -> sched_dl_sysctl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_raw_output_pmap_register+0x42 (section: .text) -> setup_autogroup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_raw_output_pmap_register+0x48 (section: .text) -> setup_autogroup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_sysfs_xprt_state_show+0x7e (section: .text) -> pm_states_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_sysfs_xprt_state_show+0x86 (section: .text) -> pm_states_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpc_sysfs_xprt_state_show+0x8a (section: .text) -> noresume_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_destroy_all+0x162 (section: .text) -> init_fs_dcache_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _svc_xprt_create+0x160 (section: .text) -> pm_disk_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _svc_xprt_create+0x17a (section: .text) -> .L49 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _svc_xprt_create+0x1b2 (section: .text) -> .L50 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _svc_xprt_create+0x1bc (section: .text) -> .L50 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _svc_xprt_create+0x1c6 (section: .text) -> .L50 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _svc_xprt_create+0x1d4 (section: .text) -> .L71 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _svc_xprt_create+0x1ee (section: .text) -> .L71 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create_from_sa+0x34 (section: .text) -> hibernate_setup (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create_from_sa+0x6e (section: .text) -> .L96 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create_from_sa+0x70 (section: .text) -> resumedelay_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create_from_sa+0x76 (section: .text) -> resumedelay_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create_from_sa+0x9a (section: .text) -> hibernate_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create+0x66 (section: .text) -> .L98 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create+0x90 (section: .text) -> .L99 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x38 (section: .text) -> software_resume_initcall (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x42 (section: .text) -> software_resume_initcall (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x90 (section: .text) -> hibernate_reserved_size_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x9e (section: .text) -> .L451 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0xac (section: .text) -> hibernate_reserved_size_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0xba (section: .text) -> .L421 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0xbe (section: .text) -> .L422 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0xf8 (section: .text) -> .L423 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x102 (section: .text) -> .L423 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x10c (section: .text) -> .L423 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x126 (section: .text) -> .L424 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x14e (section: .text) -> .L425 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x182 (section: .text) -> .L426 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x18c (section: .text) -> .L426 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x196 (section: .text) -> .L426 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x1ae (section: .text) -> .L428 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x1cc (section: .text) -> .L452 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x1e8 (section: .text) -> .L452 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x210 (section: .text) -> .L427 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: svc_revisit+0x22a (section: .text) -> .L427 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssx_dec_buffer+0x1a (section: .text) -> .L183 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssx_dec_buffer+0x50 (section: .text) -> .L182 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssx_dec_buffer+0x56 (section: .text) -> .L196 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssx_dec_buffer+0x58 (section: .text) -> .L182 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssx_dec_buffer+0x60 (section: .text) -> .L186 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssx_dec_buffer+0x96 (section: .text) -> .L187 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssx_dec_buffer+0x9c (section: .text) -> .L185 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_host_u32+0x46 (section: .text) -> .L204 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssx_dec_linux_creds+0x2a (section: .text) -> set_handle_irq (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gssx_dec_linux_creds+0x5a (section: .text) -> .L205 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_ctx_class+0x106 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_ctx_class+0x108 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_ctx_class+0x10e (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_ctx_class+0x116 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_ctx_class+0x11a (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_ctx_class+0x120 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x34 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x46 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x58 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x86 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0xa8 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0xf4 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x13a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x158 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x15a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x15c (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x160 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x164 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x166 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x16c (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x170 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_wrap_failed+0x174 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x34 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x46 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x58 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x86 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0xa8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0xf4 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x13a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x158 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x15a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x15c (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x160 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x164 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x166 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x16c (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x170 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_svc_unwrap_failed+0x174 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0x28 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0x48 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0x6a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0xde (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0xf6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0xf8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0xfe (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0x106 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0x10a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_upcall_msg+0x110 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0x4a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0x72 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0xb2 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0xfa (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0x11a (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0x11c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0x11e (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0x122 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0x126 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpcgss_context+0x12c (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcgss_context+0x4e (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcgss_context+0x70 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcgss_context+0x94 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcgss_context+0xc6 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcgss_context+0xde (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcgss_context+0xe2 (section: .text) -> irq_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcgss_context+0xe6 (section: .text) -> .L0  (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
