Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C70219E4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 04:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733286376; cv=none; b=eorSp4Hky1caP5cQ+g/qaMfTUykXvKioj/LlAPHdotWHK8iXG3MK/gNRM5s9Cb0z8I2xRmc+ZQyUq73f/eKecT0d/4fDEHq5wGsHCfD6Nl0UnuS3swb3BKIjfx9v3PxrF5LGgluIclUds+RhGPMzfsOrjhDXBA6s4enHDqAVXXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733286376; c=relaxed/simple;
	bh=3Z1qk4m+pH03tsOmJtQD5ILRiLlCq+eIG81CndTdUuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JFkgVhOUJSeYHj6DjTJEqUtes2pOe0/WL9oLB74n2H3/WuG99J0nmtVSgXfAkS9yRx/8DtHml3i5E17dczZkak75iKspdvoDGjKFFDGqWnlOr74wKunlZnfb6lfGhr+ssBTEQ7mtgcZWdFIRPfin3x60amlTU3McyXXW+PbGs7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeR63yyd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeR63yyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733286374; x=1764822374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Z1qk4m+pH03tsOmJtQD5ILRiLlCq+eIG81CndTdUuw=;
  b=AeR63yydUf2Nuk/Z78LEsmH6UboCeWXjBzlv7eMN3vJLwG1j4x6LC5xG
   VGaFDwK34eDtiNrKO3oX319cntCADWWU4GuhQBMatE+a8k2YuPxrevH8d
   oW8qmrBiaNerXMmMcr5MXGrHLkmJW7mzFNZ+wf+XFn4syoaK4aHlVRhAm
   SHsIaYhmVLeiCkW5Zh0RHlZJV+vcfJwW/LCGbWjJr+hTZQEvB1lDPwiDm
   3ZgvFfr6q8Fsq5j8OW8nZvwmojfrloFbGQnjTOD+bymD3+MSrdtx+z4Mp
   xG0BoHyqPYTW0CRQwbT7bBb0F6GV2egslvSl4V74ERCs2rr630IejgAjA
   A==;
X-CSE-ConnectionGUID: 2HpjfeUjRIuAfbQxkzy+GA==
X-CSE-MsgGUID: xV/Li3maR7O16RbYYjOkDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33283558"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="33283558"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 20:26:13 -0800
X-CSE-ConnectionGUID: 3sCjUsYHTvyf+CrP37AiQg==
X-CSE-MsgGUID: dk6a+3IkTrmlZMWp+tMEWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93833450"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 03 Dec 2024 20:26:12 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIgxl-0002XX-2d;
	Wed, 04 Dec 2024 04:26:09 +0000
Date: Wed, 4 Dec 2024 12:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yizhen Fan <fanyizhen@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516]
 drivers/ub/urma/ubcore/ubcore_netdev.c:49:5: warning: no previous prototype
 for 'ubcore_check_port_state'
Message-ID: <202412041258.OQhOgdm4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yizhen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   50144653bfd09743bb9ce60543744e9e8cbb6489
commit: 84e122368ec3a37e074c9657bc09422b62f6ccd0 [2516/2516] ub: add new feature for urma
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041258.OQhOgdm4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041258.OQhOgdm4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041258.OQhOgdm4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ub/urma/ubcore/ubcore_uvs_cmd.c: In function 'ubcore_uvs_cmd_channel_init':
>> drivers/ub/urma/ubcore/ubcore_uvs_cmd.c:47:15: warning: 'strncpy' output truncated before terminating nul copying 10 bytes from a string of the same length [-Wstringop-truncation]
      47 |         (void)strncpy(arg.out.kernel_out, "Hello uvs!", strlen("Hello uvs!"));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_netdev.c:49:5: warning: no previous prototype for 'ubcore_check_port_state' [-Wmissing-prototypes]
      49 | int ubcore_check_port_state(struct ubcore_device *dev, uint8_t port_idx)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:73:5: warning: no previous prototype for 'ubcore_find_port_netdev' [-Wmissing-prototypes]
      73 | int ubcore_find_port_netdev(struct ubcore_device *dev, struct net_device *ndev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:90:5: warning: no previous prototype for 'ubcore_find_port_with_dev_name' [-Wmissing-prototypes]
      90 | int ubcore_find_port_with_dev_name(struct ubcore_device *dev, char *dev_name)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:113:5: warning: no previous prototype for 'ubcore_set_port_netdev' [-Wmissing-prototypes]
     113 | int ubcore_set_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:149:6: warning: no previous prototype for 'ubcore_put_port_netdev' [-Wmissing-prototypes]
     149 | void ubcore_put_port_netdev(struct ubcore_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:169:10: warning: no previous prototype for 'ubcore_sip_idx_alloc' [-Wmissing-prototypes]
     169 | uint32_t ubcore_sip_idx_alloc(uint32_t idx)
         |          ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:197:5: warning: no previous prototype for 'ubcore_sip_idx_free' [-Wmissing-prototypes]
     197 | int ubcore_sip_idx_free(uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:210:6: warning: no previous prototype for 'ubcore_sip_table_init' [-Wmissing-prototypes]
     210 | void ubcore_sip_table_init(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:216:6: warning: no previous prototype for 'ubcore_sip_table_uninit' [-Wmissing-prototypes]
     216 | void ubcore_sip_table_uninit(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:230:5: warning: no previous prototype for 'ubcore_add_sip_entry' [-Wmissing-prototypes]
     230 | int ubcore_add_sip_entry(const struct ubcore_sip_info *sip, uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:250:5: warning: no previous prototype for 'ubcore_del_sip_entry' [-Wmissing-prototypes]
     250 | int ubcore_del_sip_entry(uint32_t idx)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:264:5: warning: no previous prototype for 'ubcore_lookup_sip_idx' [-Wmissing-prototypes]
     264 | int ubcore_lookup_sip_idx(struct ubcore_sip_info *sip, uint32_t *idx)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:285:10: warning: no previous prototype for 'ubcore_get_sip_max_cnt' [-Wmissing-prototypes]
     285 | uint32_t ubcore_get_sip_max_cnt(void)
         |          ^~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_netdev.c:290:25: warning: no previous prototype for 'ubcore_lookup_sip_info' [-Wmissing-prototypes]
     290 | struct ubcore_sip_info *ubcore_lookup_sip_info(uint32_t idx)
         |                         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:301:5: warning: no previous prototype for 'ubcore_notify_uvs_del_sip' [-Wmissing-prototypes]
     301 | int ubcore_notify_uvs_del_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_netdev.c:343:5: warning: no previous prototype for 'ubcore_notify_uvs_add_sip' [-Wmissing-prototypes]
     343 | int ubcore_notify_uvs_add_sip(struct ubcore_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/ub/urma/ubcore/ubcore_device.c:344:6: warning: no previous prototype for 'ubcore_destroy_upi_list' [-Wmissing-prototypes]
     344 | void ubcore_destroy_upi_list(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/ub/urma/uburma/uburma_cmd.c:315:6: warning: no previous prototype for 'uburma_jfc_event_cb' [-Wmissing-prototypes]
     315 | void uburma_jfc_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:327:6: warning: no previous prototype for 'uburma_jfs_event_cb' [-Wmissing-prototypes]
     327 | void uburma_jfs_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:339:6: warning: no previous prototype for 'uburma_jfr_event_cb' [-Wmissing-prototypes]
     339 | void uburma_jfr_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/uburma/uburma_cmd.c:351:6: warning: no previous prototype for 'uburma_jetty_event_cb' [-Wmissing-prototypes]
     351 | void uburma_jetty_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/uburma/uburma_cmd.c:363:6: warning: no previous prototype for 'uburma_jetty_grp_event_cb' [-Wmissing-prototypes]
     363 | void uburma_jetty_grp_event_cb(struct ubcore_event *event, struct ubcore_ucontext *ctx)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ubcore_check_port_state +49 drivers/ub/urma/ubcore/ubcore_netdev.c

    48	
  > 49	int ubcore_check_port_state(struct ubcore_device *dev, uint8_t port_idx)
    50	{
    51		struct ubcore_device_status status;
    52	
    53		if (dev == NULL || port_idx >= UBCORE_MAX_PORT_CNT) {
    54			ubcore_log_err("Invalid parameter.\n");
    55			return -EINVAL;
    56		}
    57	
    58		if (ubcore_query_device_status(dev, &status) != 0) {
    59			ubcore_log_err("query device status for state failed with dev name %s\n",
    60				dev->dev_name);
    61			return -EPERM;
    62		}
    63	
    64		if (status.port_status[port_idx].state != UBCORE_PORT_ACTIVE) {
    65			ubcore_log_err("port state is not active with dev name: %s and port_idx: %hhu\n",
    66				dev->dev_name, port_idx);
    67			return -EPERM;
    68		}
    69		ubcore_log_info("Success to query dev %s port state and it's active.\n", dev->dev_name);
    70		return 0;
    71	}
    72	
  > 73	int ubcore_find_port_netdev(struct ubcore_device *dev, struct net_device *ndev)
    74	{
    75		struct ubcore_ndev_port *port_info;
    76	
    77		down_write(&g_port_list_lock);
    78		list_for_each_entry(port_info, &dev->port_list, node) {
    79			if (port_info->ndev == ndev) {
    80				up_write(&g_port_list_lock);
    81				return (int)port_info->port_id;
    82			}
    83		}
    84		up_write(&g_port_list_lock);
    85		ubcore_log_warn("ndev:%s no available port found.\n", netdev_name(ndev));
    86		/* Currently assigned port0 by default */
    87		return 0;
    88	}
    89	
  > 90	int ubcore_find_port_with_dev_name(struct ubcore_device *dev, char *dev_name)
    91	{
    92		struct ubcore_ndev_port *port_info;
    93	
    94		if (dev == NULL || dev_name == NULL) {
    95			ubcore_log_err("Invalid input parameter\n");
    96			return 0;
    97		}
    98	
    99		down_write(&g_port_list_lock);
   100		list_for_each_entry(port_info, &dev->port_list, node) {
   101			if (strcmp(port_info->dev_name, dev_name) == 0) {
   102				up_write(&g_port_list_lock);
   103				ubcore_log_info("ndev:%s dev name:%s with port id %u found.\n",
   104					netdev_name(port_info->ndev), dev_name, port_info->port_id);
   105				return (int)port_info->port_id;
   106			}
   107		}
   108		up_write(&g_port_list_lock);
   109		ubcore_log_warn("dev name:%s no available port found.\n", dev_name);
   110		return 0;
   111	}
   112	
 > 113	int ubcore_set_port_netdev(struct ubcore_device *dev, struct net_device *ndev,
   114		unsigned int port_id)
   115	{
   116		struct ubcore_ndev_port *port_info, *new_node;
   117	
   118		if (dev == NULL || ndev == NULL) {
   119			ubcore_log_err("invalid input parameter.\n");
   120			return -1;
   121		}
   122		down_write(&g_port_list_lock);
   123		list_for_each_entry(port_info, &dev->port_list, node) {
   124			if (port_info->ndev == ndev) {
   125				up_write(&g_port_list_lock);
   126				ubcore_log_warn("ndev:%s is already bound port: %d\n",
   127					netdev_name(ndev), port_info->port_id);
   128				return 0;
   129			}
   130		}
   131		up_write(&g_port_list_lock);
   132	
   133		new_node = kzalloc(sizeof(struct ubcore_ndev_port), GFP_ATOMIC);
   134		if (new_node == NULL)
   135			return -ENOMEM;
   136	
   137		new_node->ndev = ndev;
   138		new_node->port_id = port_id;
   139		(void)strcpy(new_node->dev_name, dev->dev_name);
   140		down_write(&g_port_list_lock);
   141		list_add_tail(&new_node->node, &dev->port_list);
   142		up_write(&g_port_list_lock);
   143		ubcore_log_info("ndev:%s dev_name: %s bound port: %d\n", netdev_name(ndev),
   144			dev->dev_name, new_node->port_id);
   145		return 0;
   146	}
   147	EXPORT_SYMBOL(ubcore_set_port_netdev);
   148	
 > 149	void ubcore_put_port_netdev(struct ubcore_device *dev)
   150	{
   151		struct ubcore_ndev_port *port_info, *next;
   152	
   153		down_write(&g_port_list_lock);
   154		list_for_each_entry_safe(port_info, next, &dev->port_list, node) {
   155			if (port_info != NULL) {
   156				list_del(&port_info->node);
   157				kfree(port_info);
   158			}
   159		}
   160		up_write(&g_port_list_lock);
   161	}
   162	EXPORT_SYMBOL(ubcore_put_port_netdev);
   163	
   164	static void ubcore_sip_bitmap_init(void)
   165	{
   166		bitmap_zero(g_sip_bitmap, UBCORE_MAX_SIP);
   167	}
   168	
 > 169	uint32_t ubcore_sip_idx_alloc(uint32_t idx)
   170	{
   171		uint32_t ret_idx = idx;
   172		int ret;
   173	
   174		spin_lock(&g_sip_spinlock);
   175		if (ret_idx > 0) {
   176			ret = test_bit(ret_idx, g_sip_bitmap);
   177			if (ret == 0) {
   178				set_bit(ret_idx, g_sip_bitmap);
   179				spin_unlock(&g_sip_spinlock);
   180				return ret_idx;
   181			}
   182			spin_unlock(&g_sip_spinlock);
   183			ubcore_log_err("ret_idx allocation failed.\n");
   184			return 0;
   185		}
   186		ret_idx = (uint32_t)find_first_zero_bit(g_sip_bitmap, UBCORE_MAX_SIP);
   187		if (ret_idx >= UBCORE_MAX_SIP) {
   188			ubcore_log_err("ret_idx allocation failed.\n");
   189			spin_unlock(&g_sip_spinlock);
   190			return 0;
   191		}
   192		set_bit(ret_idx, g_sip_bitmap);
   193		spin_unlock(&g_sip_spinlock);
   194		return ret_idx;
   195	}
   196	
 > 197	int ubcore_sip_idx_free(uint32_t idx)
   198	{
   199		spin_lock(&g_sip_spinlock);
   200		if (test_bit(idx, g_sip_bitmap) == false) {
   201			spin_unlock(&g_sip_spinlock);
   202			ubcore_log_err("idx is used.\n");
   203			return -EINVAL;
   204		}
   205		clear_bit(idx, g_sip_bitmap);
   206		spin_unlock(&g_sip_spinlock);
   207		return 0;
   208	}
   209	
 > 210	void ubcore_sip_table_init(void)
   211	{
   212		ubcore_sip_bitmap_init();
   213		mutex_init(&g_sip_table.lock);
   214	}
   215	
 > 216	void ubcore_sip_table_uninit(void)
   217	{
   218		uint32_t i;
   219	
   220		mutex_lock(&g_sip_table.lock);
   221		for (i = 0; i < UBCORE_SIP_TABLE_SIZE; i++) {
   222			if (g_sip_table.entry[i] != NULL) {
   223				kfree(g_sip_table.entry[i]);
   224				g_sip_table.entry[i] = NULL;
   225			}
   226		}
   227		mutex_unlock(&g_sip_table.lock);
   228	}
   229	
 > 230	int ubcore_add_sip_entry(const struct ubcore_sip_info *sip, uint32_t idx)
   231	{
   232		struct ubcore_sip_info *new_sip;
   233	
   234		if (idx >= UBCORE_SIP_TABLE_SIZE || g_sip_table.entry[idx] != NULL) {
   235			ubcore_log_err("add sip failed.\n");
   236			return -1;
   237		}
   238		new_sip = kzalloc(sizeof(struct ubcore_sip_info), GFP_ATOMIC);
   239		if (new_sip == NULL)
   240			return -ENOMEM;
   241	
   242		(void)memcpy(new_sip, sip, sizeof(struct ubcore_sip_info));
   243		mutex_lock(&g_sip_table.lock);
   244		g_sip_table.entry[idx] = new_sip;
   245		mutex_unlock(&g_sip_table.lock);
   246		ubcore_log_info("sip table add netdev: %s, entry idx: %d.\n", new_sip->dev_name, idx);
   247		return 0;
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
