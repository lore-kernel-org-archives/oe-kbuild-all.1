Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D73594B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 19:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748202984; cv=none; b=AP9VThbDpKPbdHBYH9209siD2nD4jwazrvS8kfF0CLvx+NS2wX+zq6w/JfnrYeXHGPUkMhP2PiKMnK2zyRSesu+BhKyvC/7qPY+BujAgjEseLuL7jB+GB1LcHrDvfNaFVo6e84MqRnikfxkAC5ktnJhreDor1yHTYYrSy0/Yeb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748202984; c=relaxed/simple;
	bh=WnJAp8nU3cLQy0cfiRriomXLvZNXy7M8CBIqn5GXUWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XyRCyqBY8DzSXWCyg3eVTKe0ZnjeNl81myX3qxalPTmmP6kwcmZDaE5nAIqLRRVJqowb9f1Q85sl0r6stWyAbVunc2Gwz+k7GPe+qCxX2nZT3OUR6ja3kre3Ho5Rj6i9ghuZ/oFLi8FIA75tPxVnRWGLQND9kp/ssg9VSyby9/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEat5QKN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEat5QKN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748202982; x=1779738982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnJAp8nU3cLQy0cfiRriomXLvZNXy7M8CBIqn5GXUWs=;
  b=BEat5QKNm8bn/ZF6QTidwRwMZSb/zN0Se4UHTv3leNRjyDHB5kQgYht3
   4AFuiCgtf/i1TXT9HzPNVulPD8e84lYKA/837jvdFA7gXb9qH5s0QymZo
   /AFojp3lf8GK+34KasKHznHjuQ+kpsUCMvVc2Lz8NWgDDRkEfAZQqftof
   SBk1vGVDQXNfHl/3wtiQb8sNs1D7wWtWPg+Wjma/bPwlwjeGbtI84sAYX
   Y9H0y6cU23ty/Qi+0/yHywOhbiX3pEgkXt4SOgit99zgaeBY0Em0A2VVN
   gQtf4sbzjMukdHUy0LjksQ7WIbayzoJZ4st/pNkTZaadwaSLwQghNTyZo
   w==;
X-CSE-ConnectionGUID: pdTCMYAfQ7Oyzj1TLQJnEw==
X-CSE-MsgGUID: tEaz7e6rS4WInaADIGV3Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="50062202"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="50062202"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 12:56:20 -0700
X-CSE-ConnectionGUID: tl+W6/c1SL6fKQNfN+cu8g==
X-CSE-MsgGUID: ZtqIFXDiSsWxFzE2yoHSmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="141966953"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 May 2025 12:56:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJHSC-000Ryu-1H;
	Sun, 25 May 2025 19:56:16 +0000
Date: Mon, 26 May 2025 03:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:move-drivers 13/13] undefined reference to
 `mlx5_core_destroy_cq'
Message-ID: <202505260342.CmjxDTMi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git move-drivers
head:   a6117e3e8c160a2b7ce2a26ff23645a2a3072001
commit: a6117e3e8c160a2b7ce2a26ff23645a2a3072001 [13/13] drivers/lib: Move mlx5_core to dedicated place
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250526/202505260342.CmjxDTMi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505260342.CmjxDTMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505260342.CmjxDTMi-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `cq_destroy':
>> (.text+0xa60): undefined reference to `mlx5_core_destroy_cq'
   alpha-linux-ld: (.text+0xa8c): undefined reference to `mlx5_core_destroy_cq'
   alpha-linux-ld: (.text+0xae0): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: (.text+0xae8): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: (.text+0xafc): undefined reference to `mlx5_db_free'
   alpha-linux-ld: (.text+0xb00): undefined reference to `mlx5_db_free'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `unregister_link_notifier':
>> (.text+0xf44): undefined reference to `mlx5_notifier_unregister'
   alpha-linux-ld: (.text+0xf50): undefined reference to `mlx5_notifier_unregister'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `mlx5_vdpa_set_attr':
>> (.text+0x1110): undefined reference to `mlx5_mpfs_add_mac'
>> alpha-linux-ld: (.text+0x1118): undefined reference to `mlx5_mpfs_add_mac'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `mlx5_vdpa_free':
>> (.text+0x1294): undefined reference to `mlx5_cmd_cleanup_async_ctx'
   alpha-linux-ld: (.text+0x1298): undefined reference to `mlx5_cmd_cleanup_async_ctx'
>> alpha-linux-ld: (.text+0x12d8): undefined reference to `mlx5_mpfs_del_mac'
   alpha-linux-ld: (.text+0x12e0): undefined reference to `mlx5_mpfs_del_mac'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `umem_destroy':
>> (.text+0x1570): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x15c0): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x15d4): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: (.text+0x15dc): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `qp_destroy':
   (.text+0x1640): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x16cc): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x172c): undefined reference to `mlx5_db_free'
   alpha-linux-ld: (.text+0x1734): undefined reference to `mlx5_db_free'
   alpha-linux-ld: (.text+0x1748): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: (.text+0x174c): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `config_func_mtu':
   (.text+0x18dc): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x19d0): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `query_vport_state.constprop.0':
   (.text+0x1c68): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x1c98): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `mlx5_vdpa_add_mac_vlan_rules':
>> (.text+0x1f3c): undefined reference to `mlx5_fc_create'
   alpha-linux-ld: (.text+0x1f54): undefined reference to `mlx5_fc_create'
   alpha-linux-ld: (.text+0x1f84): undefined reference to `mlx5_fc_create'
   alpha-linux-ld: (.text+0x1f8c): undefined reference to `mlx5_fc_create'
   alpha-linux-ld: (.text+0x1fac): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x1fb8): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x1fe0): undefined reference to `mlx5_add_flow_rules'
   alpha-linux-ld: (.text+0x2000): undefined reference to `mlx5_add_flow_rules'
   alpha-linux-ld: (.text+0x2050): undefined reference to `mlx5_add_flow_rules'
   alpha-linux-ld: (.text+0x2074): undefined reference to `mlx5_add_flow_rules'
   alpha-linux-ld: (.text+0x2090): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x2098): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x20f8): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x20fc): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x2110): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x2114): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `destroy_virtqueue':
   (.text+0x2820): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x28b0): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `mac_vlan_del':
>> (.text+0x2ac0): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x2ac4): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x2ad4): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x2ad8): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x2aec): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x2af0): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x2b04): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x2b08): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `handle_ctrl_mac':
>> (.text+0x32f8): undefined reference to `mlx5_mpfs_del_mac'
   alpha-linux-ld: (.text+0x3304): undefined reference to `mlx5_mpfs_del_mac'
   alpha-linux-ld: (.text+0x3350): undefined reference to `mlx5_mpfs_add_mac'
   alpha-linux-ld: (.text+0x335c): undefined reference to `mlx5_mpfs_add_mac'
   alpha-linux-ld: (.text+0x34ec): undefined reference to `mlx5_mpfs_del_mac'
   alpha-linux-ld: (.text+0x34f8): undefined reference to `mlx5_mpfs_del_mac'
   alpha-linux-ld: (.text+0x353c): undefined reference to `mlx5_mpfs_add_mac'
   alpha-linux-ld: (.text+0x3548): undefined reference to `mlx5_mpfs_add_mac'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `read_umem_params':
   (.text+0x3ad0): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x3b74): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `qp_prepare':
>> (.text+0x3fa4): undefined reference to `mlx5_fill_page_frag_array'
   alpha-linux-ld: (.text+0x4168): undefined reference to `mlx5_fill_page_frag_array'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `counter_set_dealloc':
   (.text+0x4ca4): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x4cf8): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `counter_set_alloc':
   (.text+0x4e20): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x4e54): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `counter_set_query':
   (.text+0x4f64): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o:(.text+0x4fb8): more undefined references to `mlx5_cmd_exec' follow
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `create_umem':
>> (.text+0x5ed0): undefined reference to `mlx5_frag_buf_alloc_node'
   alpha-linux-ld: (.text+0x5ef0): undefined reference to `mlx5_frag_buf_alloc_node'
   alpha-linux-ld: (.text+0x5f48): undefined reference to `mlx5_fill_page_frag_array_perm'
   alpha-linux-ld: (.text+0x6080): undefined reference to `mlx5_fill_page_frag_array_perm'
   alpha-linux-ld: (.text+0x6098): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x60a4): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x6160): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: (.text+0x616c): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `qp_create':
   (.text+0x6238): undefined reference to `mlx5_frag_buf_alloc_node'
   alpha-linux-ld: (.text+0x6248): undefined reference to `mlx5_frag_buf_alloc_node'
   alpha-linux-ld: (.text+0x6260): undefined reference to `mlx5_db_alloc_node'
   alpha-linux-ld: (.text+0x626c): undefined reference to `mlx5_db_alloc_node'
   alpha-linux-ld: (.text+0x6448): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x64ac): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x6568): undefined reference to `mlx5_db_free'
   alpha-linux-ld: (.text+0x6570): undefined reference to `mlx5_db_free'
   alpha-linux-ld: (.text+0x6588): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: (.text+0x6590): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `teardown_vq_resources':
   (.text+0x78bc): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x78c0): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x78d0): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x78d4): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x78e8): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x78ec): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x7900): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x7904): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x7964): undefined reference to `mlx5_destroy_flow_table'
   alpha-linux-ld: (.text+0x7968): undefined reference to `mlx5_destroy_flow_table'
   alpha-linux-ld: (.text+0x7a54): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x7a58): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x7a68): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x7a6c): undefined reference to `mlx5_del_flow_rules'
   alpha-linux-ld: (.text+0x7a80): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x7a84): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x7a98): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: (.text+0x7a9c): undefined reference to `mlx5_fc_destroy'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `cq_create':
>> (.text+0x7c68): undefined reference to `mlx5_db_alloc_node'
   alpha-linux-ld: (.text+0x7c78): undefined reference to `mlx5_db_alloc_node'
   alpha-linux-ld: (.text+0x7c90): undefined reference to `mlx5_frag_buf_alloc_node'
   alpha-linux-ld: (.text+0x7cbc): undefined reference to `mlx5_frag_buf_alloc_node'
   alpha-linux-ld: (.text+0x7db4): undefined reference to `mlx5_fill_page_frag_array'
   alpha-linux-ld: (.text+0x7e00): undefined reference to `mlx5_fill_page_frag_array'
   alpha-linux-ld: (.text+0x7e28): undefined reference to `mlx5_comp_eqn_get'
   alpha-linux-ld: (.text+0x7e8c): undefined reference to `mlx5_comp_eqn_get'
   alpha-linux-ld: (.text+0x7ed8): undefined reference to `mlx5_core_create_cq'
   alpha-linux-ld: (.text+0x7ff0): undefined reference to `mlx5_core_create_cq'
   alpha-linux-ld: (.text+0x8104): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: (.text+0x8110): undefined reference to `mlx5_frag_buf_free'
   alpha-linux-ld: (.text+0x8124): undefined reference to `mlx5_db_free'
   alpha-linux-ld: (.text+0x8130): undefined reference to `mlx5_db_free'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `create_virtqueue':
   (.text+0x8a88): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0x8aa0): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `setup_vq_resources':
>> (.text+0x93c4): undefined reference to `mlx5_get_flow_namespace'
   alpha-linux-ld: (.text+0x93e4): undefined reference to `mlx5_get_flow_namespace'
   alpha-linux-ld: (.text+0x9440): undefined reference to `mlx5_create_auto_grouped_flow_table'
   alpha-linux-ld: (.text+0x9448): undefined reference to `mlx5_create_auto_grouped_flow_table'
   alpha-linux-ld: (.text+0x9504): undefined reference to `mlx5_destroy_flow_table'
   alpha-linux-ld: (.text+0x9508): undefined reference to `mlx5_destroy_flow_table'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `mlx5_vdpa_set_status':
>> (.text+0x9cf4): undefined reference to `mlx5_notifier_register'
   alpha-linux-ld: (.text+0x9d04): undefined reference to `mlx5_notifier_register'
   alpha-linux-ld: drivers/vdpa/mlx5/net/mlx5_vnet.o: in function `mlx5_vdpa_dev_add':
>> (.text+0xa734): undefined reference to `mlx5_query_nic_vport_mtu'
   alpha-linux-ld: (.text+0xa748): undefined reference to `mlx5_query_nic_vport_mtu'
   alpha-linux-ld: (.text+0xa77c): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0xa7a4): undefined reference to `mlx5_cmd_exec'
   alpha-linux-ld: (.text+0xa858): undefined reference to `mlx5_query_nic_vport_mac_address'
   alpha-linux-ld: (.text+0xa870): undefined reference to `mlx5_query_nic_vport_mac_address'
   alpha-linux-ld: (.text+0xa8b4): undefined reference to `mlx5_mpfs_add_mac'
   alpha-linux-ld: (.text+0xa8bc): undefined reference to `mlx5_mpfs_add_mac'
   alpha-linux-ld: (.text+0xa978): undefined reference to `mlx5_cmd_init_async_ctx'
   alpha-linux-ld: (.text+0xa988): undefined reference to `mlx5_cmd_init_async_ctx'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_modify_rq_vsd':
>> (.text+0x8e4): undefined reference to `mlx5_core_modify_rq'
>> alpha-linux-ld: (.text+0x9e4): undefined reference to `mlx5_core_modify_rq'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_modify_rq_state':
>> (.text+0xae0): undefined reference to `mlx5_wq_ll_reset'
>> alpha-linux-ld: (.text+0xae4): undefined reference to `mlx5_wq_ll_reset'
   alpha-linux-ld: (.text+0xb00): undefined reference to `mlx5_wq_cyc_reset'
   alpha-linux-ld: (.text+0xb04): undefined reference to `mlx5_wq_cyc_reset'
   alpha-linux-ld: (.text+0xb24): undefined reference to `mlx5_core_modify_rq'
   alpha-linux-ld: (.text+0xbd8): undefined reference to `mlx5_core_modify_rq'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_profile_max_num_channels':
   (.text+0x1248): undefined reference to `mlx5_comp_vectors_max'
   alpha-linux-ld: (.text+0x1264): undefined reference to `mlx5_comp_vectors_max'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_modify_admin_state':
   (.text+0x1318): undefined reference to `mlx5_set_port_admin_status'
   alpha-linux-ld: (.text+0x133c): undefined reference to `mlx5_set_port_admin_status'
   alpha-linux-ld: (.text+0x134c): undefined reference to `mlx5_eswitch_mode'
   alpha-linux-ld: (.text+0x1350): undefined reference to `mlx5_eswitch_mode'
   alpha-linux-ld: (.text+0x1384): undefined reference to `mlx5_eswitch_set_vport_state'
   alpha-linux-ld: (.text+0x139c): undefined reference to `mlx5_eswitch_set_vport_state'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_set_vf_link_state':
   (.text+0x1434): undefined reference to `mlx5_eswitch_set_vport_state'
   alpha-linux-ld: (.text+0x1454): undefined reference to `mlx5_eswitch_set_vport_state'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_set_rx_port_ts':
   (.text+0x1da0): undefined reference to `mlx5_query_ports_check'
   alpha-linux-ld: (.text+0x1dac): undefined reference to `mlx5_query_ports_check'
   alpha-linux-ld: (.text+0x1e18): undefined reference to `mlx5_set_ports_check'
   alpha-linux-ld: (.text+0x1e9c): undefined reference to `mlx5_set_ports_check'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_set_vf_mac':
   (.text+0x20dc): undefined reference to `mlx5_eswitch_set_vport_mac'
   alpha-linux-ld: (.text+0x20f4): undefined reference to `mlx5_eswitch_set_vport_mac'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_set_vf_rate':
   (.text+0x212c): undefined reference to `mlx5_eswitch_set_vport_rate'
   alpha-linux-ld: (.text+0x2150): undefined reference to `mlx5_eswitch_set_vport_rate'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_get_vf_stats':
   (.text+0x219c): undefined reference to `mlx5_eswitch_get_vport_stats'
   alpha-linux-ld: (.text+0x21b4): undefined reference to `mlx5_eswitch_get_vport_stats'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_bridge_getlink':
   (.text+0x21ec): undefined reference to `mlx5_eswitch_get_vepa'
   alpha-linux-ld: (.text+0x2238): undefined reference to `mlx5_eswitch_get_vepa'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_set_vf_trust':
   (.text+0x243c): undefined reference to `mlx5_eswitch_set_vport_trust'
   alpha-linux-ld: (.text+0x2454): undefined reference to `mlx5_eswitch_set_vport_trust'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_set_vf_spoofchk':
   (.text+0x248c): undefined reference to `mlx5_eswitch_set_vport_spoofchk'
   alpha-linux-ld: (.text+0x24a4): undefined reference to `mlx5_eswitch_set_vport_spoofchk'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_set_vf_vlan':
   (.text+0x24f4): undefined reference to `mlx5_eswitch_set_vport_vlan'
   alpha-linux-ld: (.text+0x2500): undefined reference to `mlx5_eswitch_set_vport_vlan'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_vxlan_unset_port':
   (.text+0x25e0): undefined reference to `mlx5_vxlan_del_port'
   alpha-linux-ld: (.text+0x2600): undefined reference to `mlx5_vxlan_del_port'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_vxlan_set_port':
   (.text+0x2640): undefined reference to `mlx5_vxlan_add_port'
   alpha-linux-ld: (.text+0x2660): undefined reference to `mlx5_vxlan_add_port'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_devcom_event_mpv':
   (.text+0x2724): undefined reference to `mlx5_devcom_comp_set_ready'
   alpha-linux-ld: (.text+0x272c): undefined reference to `mlx5_devcom_comp_set_ready'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_calc_max_nch':
   (.text+0x28e8): undefined reference to `mlx5_qos_is_supported'
   alpha-linux-ld: (.text+0x2904): undefined reference to `mlx5_qos_is_supported'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_bridge_setlink':
   (.text+0x2a30): undefined reference to `mlx5_eswitch_set_vepa'
   alpha-linux-ld: (.text+0x2a38): undefined reference to `mlx5_eswitch_set_vepa'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_rq_free_shampo':
   (.text+0x3094): undefined reference to `mlx5_core_destroy_mkey'
   alpha-linux-ld: (.text+0x309c): undefined reference to `mlx5_core_destroy_mkey'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_update_carrier':
   (.text+0x30ec): undefined reference to `mlx5_query_vport_state'
   alpha-linux-ld: (.text+0x310c): undefined reference to `mlx5_query_vport_state'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_alloc_cq_common':
   (.text+0x31ec): undefined reference to `mlx5_cqwq_create'
   alpha-linux-ld: (.text+0x322c): undefined reference to `mlx5_cqwq_create'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_free_rq':
   (.text+0x3400): undefined reference to `mlx5_core_destroy_mkey'
   alpha-linux-ld: (.text+0x3428): undefined reference to `mlx5_core_destroy_mkey'
   alpha-linux-ld: (.text+0x34a8): undefined reference to `mlx5_wq_destroy'
   alpha-linux-ld: (.text+0x34b4): undefined reference to `mlx5_wq_destroy'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_tunnel_features_check':
   (.text+0x3ba8): undefined reference to `mlx5_vxlan_lookup_port'
   alpha-linux-ld: (.text+0x3bc4): undefined reference to `mlx5_vxlan_lookup_port'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_get_vf_config':
   (.text+0x3f84): undefined reference to `mlx5_eswitch_get_vport_config'
   alpha-linux-ld: (.text+0x3f90): undefined reference to `mlx5_eswitch_get_vport_config'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `blocking_event':
   (.text+0x4070): undefined reference to `mlx5_devcom_register_component'
   alpha-linux-ld: (.text+0x4080): undefined reference to `mlx5_devcom_register_component'
   alpha-linux-ld: (.text+0x40ec): undefined reference to `mlx5_devcom_send_event'
   alpha-linux-ld: (.text+0x4100): undefined reference to `mlx5_devcom_send_event'
   alpha-linux-ld: (.text+0x4180): undefined reference to `mlx5_devcom_send_event'
   alpha-linux-ld: (.text+0x4190): undefined reference to `mlx5_devcom_send_event'
   alpha-linux-ld: (.text+0x41b8): undefined reference to `mlx5_devcom_unregister_component'
   alpha-linux-ld: (.text+0x41bc): undefined reference to `mlx5_devcom_unregister_component'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_create_umr_ksm_mkey.constprop.0':
   (.text+0x49b0): undefined reference to `mlx5_core_create_mkey'
   alpha-linux-ld: (.text+0x4aa4): undefined reference to `mlx5_core_create_mkey'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5_rq_shampo_alloc':
   (.text+0x4dcc): undefined reference to `mlx5_core_destroy_mkey'
   alpha-linux-ld: (.text+0x4ddc): undefined reference to `mlx5_core_destroy_mkey'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_create_sq':
   (.text+0x5130): undefined reference to `mlx5_fill_page_frag_array'
   alpha-linux-ld: (.text+0x52c4): undefined reference to `mlx5_fill_page_frag_array'
   alpha-linux-ld: (.text+0x52dc): undefined reference to `mlx5_core_create_sq'
   alpha-linux-ld: (.text+0x52e4): undefined reference to `mlx5_core_create_sq'
   alpha-linux-ld: drivers/net/ethernet/mellanox/mlx5/core/en_main.o: in function `mlx5e_create_cq':
   (.text+0x53dc): undefined reference to `mlx5_comp_eqn_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
