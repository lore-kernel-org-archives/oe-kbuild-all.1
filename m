Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167FB76C61
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687655; cv=none; b=cujt9ghU7SWUcbgLTDetUy2xek704vRfeAuupT4/kotD+hZAfGGq+K0Ib+CMlotiNvJGFwHY7LOQLY0K9NtRuD1qwMi9/dzbkJIN1ARQke3n+CMEyBxMaU48F5gbjEDXqjF/AE53B5rskdtNReO2Lp4+Gmsp9gRS1Oi+PBlBFk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687655; c=relaxed/simple;
	bh=SuqG7YAh50qOmBXG6MpcsS5zegSxfeuGUOR9Dc6iads=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AzwnbOh+gav/qyv9nWtWg2qh3blvrAbKsUSM4PEfqxcKuhn3ByyB63EO26bLdG9IqajUmGCTrzqdNg1SZc1N8eRHu1J5KMFmc3+oOuZHZ6pNN4JPmZ8tVY5FA/KUNho8P3oX23XMs1yAmsyFQMUd7l7h0tLlOzyIk2ptnBNMuXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjxWbeQ6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjxWbeQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750687652; x=1782223652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SuqG7YAh50qOmBXG6MpcsS5zegSxfeuGUOR9Dc6iads=;
  b=MjxWbeQ6B7TVkRNdY1K8WP/2VdfsxtBS9wkdQ+BBdWZIeATQxQtBZ49i
   J3NByIKIdvEUkSb/NUJxF6tvVIb9kSG+RiNGv5Do9bXgJQpvYVO6ovPh5
   vAvnSdnCXygUWrRAa6A11ZTpivLorTeZ3KqyPWmOdVAvbUpDAO24oUJbD
   UeSBLGcOAR5TiYbGpblrxXHrXRw4bKhWuWUf0SCahiXMBL1g/i1VcXfV2
   ubo0Fjnw1vb6MhzkZyYpjKFwU78xrx5jeF8k3nApQ1n8MM9vbq1Za8sie
   +Lh7VwlhJ92jMboR+wEYL9/3y1EhUOHzerH94I9x0J1cS1jaer9cqYLhk
   g==;
X-CSE-ConnectionGUID: 8ZjmLhQoR5mbCvvYtq3Mng==
X-CSE-MsgGUID: Vwpv8TL5Sya7WsfnHsdHdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64252600"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64252600"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 07:07:27 -0700
X-CSE-ConnectionGUID: IX6RYqDgRN+ngEpkrVI78g==
X-CSE-MsgGUID: U0iGk2GuTdGW3rAQcvYKqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152124642"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2025 07:07:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uThpU-000OzB-1l;
	Mon, 23 Jun 2025 14:07:24 +0000
Date: Mon, 23 Jun 2025 22:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shi Jing <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2978/2978]
 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:331:68: warning:
 suggest braces around empty body in an 'if' statement
Message-ID: <202506232147.n7w5pLY6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5e8b5c945557e13053f64d08e9859d56c789362f
commit: 79871cd2cd720225eb582c9ed49fb4a96a270b3b [2978/2978] net/hinic3: Synchronize new NIC features and bug fixes
config: x86_64-buildonly-randconfig-002-20250623 (https://download.01.org/0day-ci/archive/20250623/202506232147.n7w5pLY6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232147.n7w5pLY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506232147.n7w5pLY6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:103:6: warning: no previous prototype for 'hinic3_uld_lock_init' [-Wmissing-prototypes]
     103 | void hinic3_uld_lock_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:525:5: warning: no previous prototype for 'hinic3_pdev_is_virtfn' [-Wmissing-prototypes]
     525 | u32 hinic3_pdev_is_virtfn(struct pci_dev *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:785:5: warning: no previous prototype for '__set_vroce_func_state' [-Wmissing-prototypes]
     785 | int __set_vroce_func_state(struct hinic3_pcidev *pci_adapter)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:826:6: warning: no previous prototype for 'slave_host_mgmt_vroce_work' [-Wmissing-prototypes]
     826 | void slave_host_mgmt_vroce_work(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:834:7: warning: no previous prototype for 'hinic3_get_roce_uld_by_pdev' [-Wmissing-prototypes]
     834 | void *hinic3_get_roce_uld_by_pdev(struct pci_dev *pdev)
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1796:6: warning: no previous prototype for 'hinic3_set_func_state' [-Wmissing-prototypes]
    1796 | void hinic3_set_func_state(struct hinic3_pcidev *pci_adapter)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_lld.c:1822:6: warning: no previous prototype for 'slave_host_mgmt_work' [-Wmissing-prototypes]
    1822 | void slave_host_mgmt_work(struct work_struct *work)
         |      ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_dev_mgmt.c:618:6: warning: no previous prototype for 'hinic3_write_oshr_info' [-Wmissing-prototypes]
     618 | void hinic3_write_oshr_info(struct os_hot_replace_info *out_oshr_info,
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:865:5: warning: no previous prototype for 'hinic3_global_func_id_hw' [-Wmissing-prototypes]
     865 | u16 hinic3_global_func_id_hw(void *hwdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c: In function 'cqm_buf_vram_free':
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:331:68: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     331 |                               (u64)buf->buf_size * buf->buf_number);
         |                                                                    ^
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:342:5: warning: no previous prototype for 'hinic3_rx_queue_stat_pack' [-Wmissing-prototypes]
     342 | int hinic3_rx_queue_stat_pack(struct hinic3_show_item *item,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_ethtool_stats.c:357:5: warning: no previous prototype for 'hinic3_tx_queue_stat_pack' [-Wmissing-prototypes]
     357 | int hinic3_tx_queue_stat_pack(struct hinic3_show_item *item,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hw_comm.c:1671:6: warning: no previous prototype for 'hinic3_is_optical_module_mode' [-Wmissing-prototypes]
    1671 | bool hinic3_is_optical_module_mode(void *hwdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:623:6: warning: no previous prototype for 'print_port_info' [-Wmissing-prototypes]
     623 | void print_port_info(struct hinic3_nic_io *nic_io,
         |      ^~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:802:6: warning: no previous prototype for 'hinic3_notify_vf_bond_status' [-Wmissing-prototypes]
     802 | void hinic3_notify_vf_bond_status(struct hinic3_nic_io *nic_io,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:832:6: warning: no previous prototype for 'hinic3_notify_all_vfs_bond_changed' [-Wmissing-prototypes]
     832 | void hinic3_notify_all_vfs_bond_changed(void *hwdev, u8 bond_status)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1678:5: warning: no previous prototype for 'set_fecparam' [-Wmissing-prototypes]
    1678 | int set_fecparam(void *hwdev, u8 fecparam)
         |     ^~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c:1706:5: warning: no previous prototype for 'get_fecparam' [-Wmissing-prototypes]
    1706 | int get_fecparam(void *hwdev, u8 *advertised_fec, u8 *supported_fec)
         |     ^~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hinic3_main.c:1211:6: warning: no previous prototype for 'hinic3_need_proc_link_event' [-Wmissing-prototypes]
    1211 | bool hinic3_need_proc_link_event(struct hinic3_lld_dev *lld_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/hinic3_main.c:1258:6: warning: no previous prototype for 'hinic3_need_proc_bond_event' [-Wmissing-prototypes]
    1258 | bool hinic3_need_proc_bond_event(struct hinic3_lld_dev *lld_dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/ethernet/huawei/hinic3/cqm/cqm_object.h:7,
                    from drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.h:11,
                    from drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:15:
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:13:44: warning: no previous prototype for 'cqm3_cmd_alloc' [-Wmissing-prototypes]
      13 | #define cqm_cmd_alloc                      cqm3_cmd_alloc
         |                                            ^~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:24:25: note: in expansion of macro 'cqm_cmd_alloc'
      24 | struct tag_cqm_cmd_buf *cqm_cmd_alloc(void *ex_handle)
         |                         ^~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:14:44: warning: no previous prototype for 'cqm3_cmd_free' [-Wmissing-prototypes]
      14 | #define cqm_cmd_free                       cqm3_cmd_free
         |                                            ^~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:44:6: note: in expansion of macro 'cqm_cmd_free'
      44 | void cqm_cmd_free(void *ex_handle, struct tag_cqm_cmd_buf *cmd_buf)
         |      ^~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:15:44: warning: no previous prototype for 'cqm3_send_cmd_box' [-Wmissing-prototypes]
      15 | #define cqm_send_cmd_box                   cqm3_send_cmd_box
         |                                            ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:79:5: note: in expansion of macro 'cqm_send_cmd_box'
      79 | s32 cqm_send_cmd_box(void *ex_handle, u8 mod, u8 cmd, struct tag_cqm_cmd_buf *buf_in,
         |     ^~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:16:44: warning: no previous prototype for 'cqm3_lb_send_cmd_box' [-Wmissing-prototypes]
      16 | #define cqm_lb_send_cmd_box                cqm3_lb_send_cmd_box
         |                                            ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:120:5: note: in expansion of macro 'cqm_lb_send_cmd_box'
     120 | s32 cqm_lb_send_cmd_box(void *ex_handle, u8 mod, u8 cmd, u8 cos_id,
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_define.h:17:44: warning: no previous prototype for 'cqm3_lb_send_cmd_box_async' [-Wmissing-prototypes]
      17 | #define cqm_lb_send_cmd_box_async          cqm3_lb_send_cmd_box_async
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_cmd.c:158:5: note: in expansion of macro 'cqm_lb_send_cmd_box_async'
     158 | s32 cqm_lb_send_cmd_box_async(void *ex_handle, u8 mod, u8 cmd,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_sriov.c:176:5: warning: no previous prototype for 'hinic3_pci_sriov_check' [-Wmissing-prototypes]
     176 | int hinic3_pci_sriov_check(struct hinic3_sriov_info *sriov_info, struct pci_dev *dev, int num_vfs)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/if +331 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c

   320	
   321	static void cqm_buf_vram_free(struct tag_cqm_buf *buf)
   322	{
   323		s32 i;
   324	
   325		if (buf->buf_list == NULL) {
   326			return;
   327		}
   328	
   329		if (buf->buf_list[0].va)
   330			hi_vram_kfree(buf->buf_list[0].va, buf->buf_info.buf_vram_name,
 > 331				      (u64)buf->buf_size * buf->buf_number);
   332	
   333		for (i = 0; i < (s32)buf->buf_number; i++)
   334			buf->buf_list[i].va = NULL;
   335	}
   336	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
