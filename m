Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC01EB29
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 23:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBU26dtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703545880; x=1735081880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uVjapUJ3b1wE5mvnnPu/tL3fQvMonHYY3UHbFmxc1lw=;
  b=KBU26dtlKTPtML5QShkp6zY1pgP9Bd2Lp90zePsuXfOvVLKgM2BqWMjn
   Es7XCXQb2Wj4ZtHXePGzQiXFQiwjFKeADs0SDAxkiutNc8fTSVd7iKUVS
   8urd8bVKBUprcHvowpm4yqLQNx3zUcbxO9T/uOgTGhevO1RpEkib3aoaE
   c4zaD44egZPoEjqheJZRHlVj+u+TQg0ImHF+hD1SsyJ9y76tc76dx26PN
   f9oYehGXVg3SQuWqf9x4nrUqTs3cdrcY0FFQriqGMqvzjip0YNqXD+M6P
   NB/p623bwgcC3SVEBCSUy48TesTRbdLLyZiimT+urKnnbBK1a0YfBsSOp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="482483180"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="482483180"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 15:11:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="19849478"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Dec 2023 15:11:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHu6D-000DlH-2M;
	Mon, 25 Dec 2023 23:11:05 +0000
Date: Tue, 26 Dec 2023 07:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10128/10295] WARNING: modpost: vmlinux: section
 mismatch in reference: __open_metadata+0x1c6 (section: .text) ->
 init_ext2_fs (section: .init.text)
Message-ID: <202312260721.U6QN7qqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: ae88786e2fadaa01813e15f1f14455fe2396c7d3 [10128/10295] Merge branch 'reset/next' of https://git.pengutronix.de/git/pza/linux
config: riscv-randconfig-r016-20230807 (https://download.01.org/0day-ci/archive/20231226/202312260721.U6QN7qqC-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260721.U6QN7qqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312260721.U6QN7qqC-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: vmlinux: section mismatch in reference: cpu_pm_suspend+0x12 (section: .text) -> init_ramfs_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ntfs_fallocate+0x4d0 (section: .text) -> init_ramfs_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ntfs_extend+0x150 (section: .text) -> init_ramfs_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xfs_sbblock_init+0x12 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xfs_log_sb+0x68 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xfs_update_secondary_sbs+0x100 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xfs_add_incompat_log_feature+0x68 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: xfs_fs_fill_super+0x5e6 (section: .text) -> (unknown) (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: xfs_buf_item_pin+0x22 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_ref_for_cow+0x292 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: update_ref_for_cow+0x340 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: walk_down_proc+0x16c (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: walk_up_proc+0x176 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: create_pending_snapshot+0xdde (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btrfs_delete_subvolume+0x510 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btrfs_uuid_scan_kthread+0x1d6 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btrfs_uuid_scan_kthread+0x1e4 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btrfs_uuid_scan_kthread+0x200 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btrfs_uuid_scan_kthread+0x308 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: btrfs_ioctl_dev_info+0x6e (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _btrfs_ioctl_set_received_subvol+0xfa (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: _btrfs_ioctl_set_received_subvol+0x346 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: send_subvol_begin+0x1d8 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: send_subvol_begin+0x268 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: send_clone+0x122 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ZSTD_loadDictionaryContent+0x11c (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ZSTD_decodeLiteralsBlock+0x1ce (section: .text) -> exit_ext2_fs (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: should_fail_usercopy+0x12 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stack_depot_save_flags+0x48 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: kcs_bmc_serio_event+0x46 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __mtk_clk_simple_probe+0x16c (section: .text) -> (unknown) (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: clk_mt6795_pericfg_probe+0x8e (section: .text) -> (unknown) (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtk_topckgen_init+0x7c (section: .text) -> (unknown) (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtk_pericfg_init+0x78 (section: .text) -> (unknown) (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: mtk_topckgen_init+0x94 (section: .text) -> (unknown) (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: clk_mt8188_topck_probe+0x15a (section: .text) -> (unknown) (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vm_setup_vq+0x1bc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: tty_port_init+0x1c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_mode_atomic_ioctl+0x428 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_client_modeset_dpms_legacy+0x12e (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_client_modeset_commit_atomic+0xec (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_client_firmware_config.isra.0+0x202 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_mode_gamma_set_ioctl+0x1b0 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_mode_setcrtc+0x3ac (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: atomic_remove_fb+0x11c (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drmm_mode_config_init+0x2e8 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: set_property_legacy+0xfa (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_mode_obj_get_properties_ioctl+0xd4 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_mode_obj_set_property_ioctl+0x100 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_modeset_lock_all+0x74 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_mode_cursor_common+0x106 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_mode_setplane+0x1a0 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_mode_page_flip_ioctl+0x34c (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_atomic_helper_shutdown+0x98 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_atomic_helper_suspend+0xae (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_atomic_helper_resume+0x90 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_atomic_helper_dirtyfb+0xd4 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_helper_probe_detect_ctx+0x7a (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_helper_probe_single_connector_modes+0xbc (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: drm_self_refresh_helper_entry_work+0xb6 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: komeda_layer_check_cfg+0x22 (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: vc4_hdmi_connector_detect_ctx+0xba (section: .text) -> fat_destroy_inodecache (section: .exit.text)
WARNING: modpost: vmlinux: section mismatch in reference: release_ipu_resources+0xc8 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: serport_ldisc_receive+0x9a (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: altera_ps2_rxint+0x32 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: arc_ps2_interrupt+0x54 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: apbps2_isr+0x6e (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sun4i_ps2_interrupt+0xdc (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rmi_f03_attention+0xfa (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: rmi_f03_attention+0x15c (section: .text) -> init_ext2_fs (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __open_metadata+0x1c6 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __format_metadata+0xb0 (section: .text) -> init_ext2_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: stm_assign_first_policy+0x3c (section: .text) -> init_ramfs_fs (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_readable_reg+0x22 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_readable_reg+0x2c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_readable_reg+0x36 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_readable_reg+0x58 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_readable_reg+0x62 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_readable_reg+0x6a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_readable_reg+0x70 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_writeable_reg+0xa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_writeable_reg+0x12 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_writeable_reg+0x20 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_writeable_reg+0x2a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_writeable_reg+0x4e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_writeable_reg+0x56 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_writeable_reg+0x60 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_writeable_reg+0x6e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_volatile_reg+0xa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_volatile_reg+0x1a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_volatile_reg+0x3a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_volatile_reg+0x42 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_get_osr+0x1a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_get_osr+0x32 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_get_osr+0x66 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_dai_startup+0x1c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_dai_startup+0x22 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_dai_startup+0x46 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_int_status_clear_all+0x3c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: div_u64_rem+0x18 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x36 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x3e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x4c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x58 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x66 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x6e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x76 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x84 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0xa2 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0xaa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0xb2 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x118 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x120 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x12e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x154 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x15c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x16a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x172 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x17a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x188 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x190 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x198 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x1a6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x1ae (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x1b6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x1c4 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x1ca (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x1ce (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x1dc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x1e4 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x20c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x216 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x21a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x23a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x272 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x276 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_read_device_properties+0x288 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_sema_acquire+0x22 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_sema_acquire+0x26 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_resume+0x36 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: clk_prepare_enable+0x18 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: clk_prepare_enable+0x26 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x14 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x18 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x28 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x46 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x52 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x54 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x58 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x7a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x9a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0x9c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0xa0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0xa4 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_mclk_prepare+0xaa (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_suspend+0x2c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_suspend+0x30 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_suspend+0x3e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_suspend+0x42 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0x3e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0x48 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0x50 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0x66 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0x68 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0x6c (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0x7a (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0x7e (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0xd0 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0xd6 (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0xdc (section: .text) -> (unknown) (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: nau8825_jack_insert+0x114 (section: .text) -> (unknown) (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
