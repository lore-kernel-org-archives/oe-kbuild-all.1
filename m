Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7148148310
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455335; cv=none; b=UpkXKVNvC/9dT62Ud2Se3TpPz3tsQNCDerfku9w5LN/jpBI9XMWbxsu4uTPoNlJISyTf3vFqpyAbMwgA5E0XJeDPSHVNft/yK+l1HE8mt4ssSnXbgKXonIUmcT7h1Ujkw+BQqVhKnASuDIwIan29flwLhVa/bOgkbKAuAgd7A6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455335; c=relaxed/simple;
	bh=eCGKMvZqCTQCOn9cLvnDPiuvvwedDhAW1b8sQ9cVxVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SvYxxVIL40yhzNI9h8sgISHvn15bXB+Bs+3Bc3mtsVWmhU21WpDbC/2tYJS6NkqPR5hVe/GuC+d/fo0arAa2sYU0NB0nFhOue7My/kAcJDJxj0jpncuyN2dN/mI9CqHX5KvxDYoOGv4M4Y/CNi885qoY1Xmpnzr5zMiz8pRGn74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnVBUFWw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnVBUFWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720455333; x=1751991333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eCGKMvZqCTQCOn9cLvnDPiuvvwedDhAW1b8sQ9cVxVA=;
  b=FnVBUFWwv2VKsJXUAk5Yp931bd3HXEQmhsNcZ1oYyfblu1miJkUJjWHV
   +uaDcozgSs8J8Jui6mOY7OLziGLkR+3L61BwSIAzzZ3FS4vZt+dmzRBWf
   61SJ+0sm458BZ3tDk3edMgHg18LtKN4d5mV0SfvyF+a+W4h792BUCTqMU
   tu1sxrE26W3WN6tmqRYyV31XR9eBYToiv0JlmPCHrEi+KKC/WWeg8Q5u1
   Ll/usxLKJWayvIdBXxZaB9O5Bq/BidScGBVUJ56/s4VE/lIxMjbD1cMS/
   dVSqhHpq0dSYB45XNk+vVjTsnT9hNAXM0xTgdNBeBvXtgYjHS5sMbjZZy
   w==;
X-CSE-ConnectionGUID: nyqg9EGpSNeeFriEz1SCvQ==
X-CSE-MsgGUID: qhDVydu9TDia03Fhs48YDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="20568603"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="20568603"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 09:15:32 -0700
X-CSE-ConnectionGUID: vnTcu+tVRcW6VGvX+GnlKw==
X-CSE-MsgGUID: vDE/iBuRQzuv1YCn0/YrwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="47631485"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2024 09:15:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQr1U-000VrO-39;
	Mon, 08 Jul 2024 16:15:28 +0000
Date: Tue, 9 Jul 2024 00:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10192/10451] WARNING: modpost: vmlinux: section
 mismatch in reference: mgmt_index_removed+0x24 (section: .text) -> .LBB3864
 (section: .init.text)
Message-ID: <202407090029.a72M25wz-lkp@intel.com>
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
commit: d009853d746532353e0d1517c75289bb7dbf0450 [10192/10451] Merge branch 'gpio/for-current' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407090029.a72M25wz-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090029.a72M25wz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407090029.a72M25wz-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: bt_sock_create+0xdc (section: .text) -> .LBB118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0x46 (section: .text) -> kvm_riscv_gstage_vmid_detect (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0x4e (section: .text) -> kvm_riscv_gstage_vmid_detect (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0x52 (section: .text) -> kvm_riscv_gstage_vmid_detect (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0x5c (section: .text) -> kvm_riscv_gstage_vmid_detect (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0x86 (section: .text) -> .LBE116 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0x8e (section: .text) -> .LBB124 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0xa2 (section: .text) -> .LBE124 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0xa8 (section: .text) -> .LBB125 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0xba (section: .text) -> .LBE125 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0xe0 (section: .text) -> .LBE118 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0x11e (section: .text) -> .LBB121 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: bt_accept_dequeue+0x132 (section: .text) -> .LBE121 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cc_read_rssi+0xaa (section: .text) -> proc_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_cc_read_rssi+0xf4 (section: .text) -> proc_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_phy_update_evt+0x4 (section: .text) -> proc_execdomains_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_phy_update_evt+0x78 (section: .text) -> mm_cache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_phy_update_evt+0x7c (section: .text) -> proc_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_phy_update_evt+0x80 (section: .text) -> proc_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_phy_update_evt+0xd8 (section: .text) -> proc_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_phy_update_evt+0xdc (section: .text) -> proc_caches_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_io_capa_request_evt+0x2e6 (section: .text) -> fork_idle (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_io_capa_request_evt+0x2ec (section: .text) -> fork_idle (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_io_capa_request_evt+0x2f8 (section: .text) -> fork_idle (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_io_capa_request_evt+0x336 (section: .text) -> mm_cache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0x2a (section: .text) -> .LBB9166 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0x54 (section: .text) -> .LBE9166 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0x5a (section: .text) -> .LBE9166 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0x82 (section: .text) -> .LBB9168 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0x8e (section: .text) -> .LBE9168 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0x92 (section: .text) -> .LBB9170 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0xb0 (section: .text) -> .LBE9170 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0xb6 (section: .text) -> .LBE9170 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0xc2 (section: .text) -> .LBE9170 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0xe4 (section: .text) -> .LBB9172 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0xec (section: .text) -> .LBE9172 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0x1a4 (section: .text) -> .LBE9168 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_create_big_complete_evt+0x2ae (section: .text) -> .LBB9172 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpa_expired+0x1e (section: .text) -> kernel_exit_sysctls_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: service_cache_off+0x16 (section: .text) -> kernel_exit_sysctls_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_device_id+0x20 (section: .text) -> kernel_exit_sysctls_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_name_complete+0x28 (section: .text) -> kernel_exit_sysctls_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_name_complete+0x4e (section: .text) -> kernel_exit_sysctls_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_name_complete+0x92 (section: .text) -> kernel_exit_sysctls_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_name_complete+0xac (section: .text) -> kernel_exit_sysctls_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: add_uuid_sync+0x14 (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_class_sync+0x1e (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_class_sync+0x36 (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0x16 (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0x1a (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0x24 (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0x4e (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0x66 (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0x8e (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0x9a (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0xc4 (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0xdc (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0x100 (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_init_hdev+0x10c (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_features+0xf2 (section: .text) -> kernel_exit_sysctls_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send+0x30 (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send+0x40 (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send+0x4c (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send+0x5e (section: .text) -> kernel_exit_sysctls_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send+0xaa (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send+0xc4 (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send+0xcc (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mesh_send+0xee (section: .text) -> kernel_exit_sysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_irks+0x1c8 (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_irks+0x1ce (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: load_irks+0x1d2 (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x34 (section: .text) -> __TRACE_SYSTEM_RCU_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x50 (section: .text) -> __TRACE_SYSTEM_HRTIMER_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0xcc (section: .text) -> __TRACE_SYSTEM_SCHED_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x142 (section: .text) -> __TRACE_SYSTEM_TASKLET_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x1b8 (section: .text) -> __TRACE_SYSTEM_IRQ_POLL_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x28a (section: .text) -> __TRACE_SYSTEM_BLOCK_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x294 (section: .text) -> __TRACE_SYSTEM_BLOCK_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x2fa (section: .text) -> __TRACE_SYSTEM_BLOCK_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x30c (section: .text) -> __TRACE_SYSTEM_NET_RX_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x324 (section: .text) -> __TRACE_SYSTEM_NET_TX_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_exp_features_info+0x328 (section: .text) -> __TRACE_SYSTEM_TIMER_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: set_blocked_keys+0x24 (section: .text) -> __TRACE_SYSTEM_HI_SOFTIRQ (section: .init.data)
WARNING: modpost: vmlinux: section mismatch in reference: read_controller_cap+0x50 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_missing_options+0x38 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_bondable+0xe8 (section: .text) -> .L0  (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: read_local_oob_ext_data+0x596 (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_get_connectable+0x1a (section: .text) -> ioresources_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_advertising_removed+0x3c (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_new_settings+0x48 (section: .text) -> arch_early_irq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_smp_complete+0x36 (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_smp_complete+0x3c (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_phy_configuration_changed+0x4e (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_adv_monitor_removed+0x30 (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_adv_monitor_removed+0x40 (section: .text) -> spawn_ksoftirqd (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_adv_monitor_removed+0x7e (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_index_added+0x1e (section: .text) -> softirq_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_index_added+0x32 (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_index_added+0x82 (section: .text) -> .LBB3862 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_index_added+0xa2 (section: .text) -> .LBE3862 (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: mgmt_index_removed+0x24 (section: .text) -> .LBB3864 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: mgmt_index_removed+0x32 (section: .text) -> arch_probe_nr_irqs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_add_cid+0x6c (section: .text) -> init_fs_exec_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_chan_create+0x6a (section: .text) -> init_fs_exec_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_read_buffer_size_sync+0x3e (section: .text) -> nsproxy_cache_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_read_buffer_size_sync+0x44 (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: hci_le_read_buffer_size_sync+0xa6 (section: .text) -> ksysfs_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: conn_min_interval_set+0x78 (section: .text) -> sched_core_sysctl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: resolv_list_show+0x36 (section: .text) -> setup_resched_latency_warn_ms (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: quirk_simultaneous_discovery_write+0x22 (section: .text) -> setup_schedstats (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: quirk_simultaneous_discovery_write+0x38 (section: .text) -> init_idle (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: quirk_simultaneous_discovery_write+0x46 (section: .text) -> .LBB14297 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: quirk_simultaneous_discovery_write+0x76 (section: .text) -> .LBB14298 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: quirk_simultaneous_discovery_write+0x7a (section: .text) -> .LBB14298 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: quirk_simultaneous_discovery_write+0x82 (section: .text) -> .LBB14298 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: quirk_strict_duplicate_filter_write+0x22 (section: .text) -> .LBB14303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: quirk_strict_duplicate_filter_write+0x38 (section: .text) -> .LBE14303 (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xprt_wait_for_reply_request_def+0x34 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xprt_wait_for_reply_request_def+0x4e (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xprt_wait_for_reply_request_rtt+0x72 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xprt_reserve_xprt+0x58 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xprt_reserve_xprt_cong+0x58 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xprt_connect+0x132 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xprt_connect+0x1b2 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_rpc_socket_shutdown+0x2e (section: .text) -> init_sched_fair_class (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_rpc_socket_nospace+0x16 (section: .text) -> cpu_idle_poll_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_xprt_connect+0x16 (section: .text) -> cpu_idle_poll_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_xprt_connect+0x28 (section: .text) -> cpu_idle_poll_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_xprt_disconnect_auto+0x28 (section: .text) -> cpu_idle_nopoll_setup (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_xprt_retransmit+0x28 (section: .text) -> sched_rt_sysctl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __traceiter_xprt_ping+0x16 (section: .text) -> sched_dl_sysctl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpc_clnt_clone_err+0x92 (section: .text) -> __setup_str_cpu_idle_nopoll_setup (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpc_clnt_clone_err+0xaa (section: .text) -> __setup_str_cpu_idle_poll_setup (section: .init.rodata)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpc_task_status+0x2e (section: .text) -> __setup_cpu_idle_nopoll_setup (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpc_task_status+0x42 (section: .text) -> __setup_cpu_idle_poll_setup (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: perf_trace_rpc_task_status+0xb8 (section: .text) -> __setup_cpu_idle_poll_setup (section: .init.setup)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_xdr_buf_class+0x86 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_clnt_class+0x58 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_clnt_clone_err+0x60 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_task_status+0x62 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_task_running+0x7c (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_failure+0x60 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_buf_alloc+0x76 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_call_rpcerror+0x70 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_socket_nospace+0x72 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xprt_transmit+0x98 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xprt_writelock_event+0x80 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xprt_cong_event+0x9c (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xprt_reserve+0x8c (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcb_setport+0x70 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_pmap_register+0x6e (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_xdr_msg_class+0x92 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_xdr_buf_class+0xa6 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_wake_up+0x54 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_alloc_arg_err+0x5c (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svcsock_lifetime_class+0x7e (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_xprt_lifetime_class+0xd6 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xs_data_ready+0xcc (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xs_stream_read_request+0x110 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_tls_class+0xdc (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_authenticate+0x110 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_rqst_event+0xec (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_rqst_status+0xf6 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_replace_page_err+0xfa (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_xprt_enqueue+0xb6 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_xprt_event+0xb6 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_xprt_accept+0x130 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_deferred_event+0x9c (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_request+0xf2 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_reply_event+0x152 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xprt_retransmit+0x126 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xs_socket_event+0xc2 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xs_socket_event_done+0xce (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_process+0x14a (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_xprt_dequeue+0xee (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_xprt_create_err+0x106 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcb_register+0xe2 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xs_stream_read_data+0xdc (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_xprt_ping+0xd4 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_xprt_event+0x102 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_xdr_alignment+0x136 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_xdr_overflow+0x140 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_stats_latency+0x16a (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_clnt_new_err+0xd4 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_clnt_new+0x15c (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_register_class+0xb6 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svcsock_tcp_recv_short+0xb4 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svcsock_class+0xac (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svcsock_tcp_state+0xba (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_unregister+0x9e (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcb_unregister+0x9e (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svcsock_accept_class+0xaa (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svcsock_marker+0xce (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_cache_event+0x98 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpcb_getport+0xc6 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_rpc_task_queued+0xf0 (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_event_raw_event_svc_stats_latency+0x17a (section: .text) -> init_fs_namei_sysctls (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rpcb_getport_async+0xc8 (section: .text) -> fcntl_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: seconds_since_boot+0x58 (section: .text) -> lockdep_proc_init (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: trace_cache_entry_make_negative+0x16 (section: .text) -> init_lockevent_counts (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: gss_unwrap_resp_integ+0x19c (section: .text) -> .LBE6652 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
