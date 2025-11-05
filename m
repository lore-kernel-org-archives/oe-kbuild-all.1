Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4936D3064B5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762354489; cv=none; b=B3jVGGPX6jBna4V5Tp9d5nHc7TA2p3M5eATjX+Y6XQOeg3nvvDHO3XA79jq4VkyvaAIU94TwXGZUsa3QuTGGvAkMXAzs11tV0je8VbHWTj/xV/9LKCWS8G6ZX+rLpEqWml4TmpJ5GxyLJMkV+dc50UzcETQ0+WAL69dbYkLAfJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762354489; c=relaxed/simple;
	bh=3mir7XsTOgpsQxuIoDzFxj7QERMU/fZ3iVTsjafxBiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W7wfrCgWiaZLwS0xjm1EbFDuO36PSzEECvJQrFQiHYQ+mv+Z1jCbJdDCPWQ8rkQgQZwQ3JgzxauixLq6jGAgCWfuQczJJwdAuQd8Oo5p5b4g+B2JcC/PrXlk61mNJRXiDqUK0ubC/ElzkDYmJ+FheS2jmaQ7GAJGmFPBr8g+3Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JE9v+K14; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JE9v+K14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762354487; x=1793890487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3mir7XsTOgpsQxuIoDzFxj7QERMU/fZ3iVTsjafxBiM=;
  b=JE9v+K14vuxsWKgZiX6AJzBalKi/KyxdolraynfWg1YNHNrQj3ASRTln
   ouVvjmolSRZCtB13saizLxE12vYvj4A6hYLC0K+r50Bdu21DDrNz18OuK
   PAkjOj6l9mln6BhZXQjUdv5jApDKxcqHoSS5DBF0DmVfQ/4sBTn4ClsG4
   R6UjjLfK3xfyZUSGqOOpJwr1vTBwEQETmOHB+TidalEkcf6IldOoILpZ+
   bvdTmYKl5ksfX6EUgAfa6x/oOjtO2c6cFNct7b+uJoy3u4FzF/zDdPk7y
   V1WIDjd+sS4FGy8h5jUtoTJ0+mmfCKj+AVJMlYLWhf/odQ/ml/U28IQcf
   Q==;
X-CSE-ConnectionGUID: 8GrD7BfNRr6dz6MdvEyd7A==
X-CSE-MsgGUID: vGZ59ZgAQa+rrQc8+doGJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75919126"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="75919126"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 06:52:33 -0800
X-CSE-ConnectionGUID: JdLzwkodSkmqtgbwxj6P0w==
X-CSE-MsgGUID: rJMwz0olRKCGZqisaGpffA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="187167367"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2025 06:52:31 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGerD-000Sig-0g;
	Wed, 05 Nov 2025 14:51:47 +0000
Date: Wed, 5 Nov 2025 22:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 4/4]
 drivers/net/ethernet/wangxun/ngbe/ngbe_lib.c:316: warning: Function
 parameter or member 'xdp_count' not described in 'ngbe_alloc_q_vector'
Message-ID: <202511052214.3D3lLGAu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   788b1c9f47ec15f115d5709c98220c2c17992476
commit: 788b1c9f47ec15f115d5709c98220c2c17992476 [4/4] anolis:net: wangxun: ngbe: add support for wangxun 1G
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251105/202511052214.3D3lLGAu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511052214.3D3lLGAu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511052214.3D3lLGAu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c: In function 'ngbe_vlan_promisc_enable':
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3772:13: warning: variable 'vlvfb' set but not used [-Wunused-but-set-variable]
    3772 |         u32 vlvfb;
         |             ^~~~~
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_lib.c:316: warning: Function parameter or member 'xdp_count' not described in 'ngbe_alloc_q_vector'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_lib.c:316: warning: Function parameter or member 'xdp_idx' not described in 'ngbe_alloc_q_vector'
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c: In function 'ngbe_hic_get_lldp':
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:4270:13: warning: variable 'status' set but not used [-Wunused-but-set-variable]
    4270 |         int status;
         |             ^~~~~~
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:161: warning: expecting prototype for ngbe_pet_vfs(). Prototype was for ngbe_put_vfs() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_sriov.c:1173: warning: expecting prototype for nxgbe_set_all_vfs(). Prototype was for ngbe_set_all_vfs() instead
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:120: warning: Function parameter or member 'device_type' not described in 'ngbe_phy_read_reg_mdi'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:120: warning: expecting prototype for ngbe_read_phy_mdi(). Prototype was for ngbe_phy_read_reg_mdi() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:158: warning: expecting prototype for ngbe_write_phy_reg_mdi(). Prototype was for ngbe_phy_write_reg_mdi() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:877: warning: expecting prototype for ngbe_identify_module(). Prototype was for ngbe_phy_identify() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_phy.c:1737: warning: expecting prototype for ngbe_tn_check_overtemp(). Prototype was for ngbe_phy_check_overtemp() instead
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:190: warning: Function parameter or member 'timestamp' not described in 'ngbe_ptp_convert_to_hwtstamp'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:190: warning: Excess function parameter 'systim' description in 'ngbe_ptp_convert_to_hwtstamp'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:211: warning: expecting prototype for txgbe_ptp_adjfreq(). Prototype was for ngbe_ptp_adjfine() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:343: warning: Excess function parameter 'eicr' description in 'ngbe_ptp_check_pps_event'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:559: warning: Function parameter or member 'adapter' not described in 'ngbe_ptp_rx_hwtstamp'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:559: warning: expecting prototype for ngbe_ptp_rx_rgtstamp(). Prototype was for ngbe_ptp_rx_hwtstamp() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:586: warning: Function parameter or member 'ifr' not described in 'ngbe_ptp_get_ts_config'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:586: warning: Excess function parameter 'ifreq' description in 'ngbe_ptp_get_ts_config'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:726: warning: Function parameter or member 'ifr' not described in 'ngbe_ptp_set_ts_config'
   drivers/net/ethernet/wangxun/ngbe/ngbe_ptp.c:726: warning: Excess function parameter 'ifreq' description in 'ngbe_ptp_set_ts_config'
--
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:516: warning: Function parameter or member 'pools' not described in 'ngbe_set_rar'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:516: warning: Excess function parameter 'vmdq' description in 'ngbe_set_rar'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:653: warning: Function parameter or member 'vmdq' not described in 'ngbe_add_uc_addr'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:781: warning: Function parameter or member 'mc_addr' not described in 'ngbe_set_mta'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:781: warning: Excess function parameter 'hash_value' description in 'ngbe_set_mta'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:1376: warning: Function parameter or member 'pool' not described in 'ngbe_set_vmdq'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:1376: warning: Excess function parameter 'vmdq' description in 'ngbe_set_vmdq'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:1389: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    *  This function should only be involved in the IOV mode.
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2590: warning: bad line:                        (8.1542E-08)N^3 + (-1.6743E-11)N^4
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2596: warning: Excess function parameter 'data' description in 'ngbe_get_thermal_sensor_data'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2929: warning: Function parameter or member 'need_restart_AN' not described in 'ngbe_setup_copper_link'
   drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:2929: warning: Excess function parameter 'autoneg_wait_to_complete' description in 'ngbe_setup_copper_link'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3326: warning: expecting prototype for ngbe_read_ee_hostif(). Prototype was for ngbe_read_ee_hostif_data() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3629: warning: expecting prototype for ngbe_read_ee_hostif(). Prototype was for ngbe_read_ee_hostif_data32() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3665: warning: expecting prototype for ngbe_read_ee_hostif(). Prototype was for ngbe_read_ee_hostif32() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3686: warning: expecting prototype for ngbe_write_ee_hostif(). Prototype was for ngbe_write_ee_hostif_data() instead
>> drivers/net/ethernet/wangxun/ngbe/ngbe_hw.c:3737: warning: expecting prototype for ngbe_write_ee_hostif(). Prototype was for ngbe_write_ee_hostif_data32() instead
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:637: warning: Function parameter or member 'quiet' not described in 'ngbe_read_reg'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:825: warning: Function parameter or member 'txqueue' not described in 'ngbe_tx_timeout'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2478: warning: Function parameter or member 'queues' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2478: warning: Function parameter or member 'flush' not described in 'ngbe_irq_enable'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:2874: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_msi_and_legacy'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3047: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Return a number of entries in the RSS indirection table
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3059: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Write the RETA table to HW
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3270: warning: Function parameter or member 'adapter' not described in 'ngbe_configure_bridge_mode'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:3729: warning: Function parameter or member 'pool' not described in 'ngbe_write_uc_addr_list'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:4745: warning: cannot understand function prototype: 'const u32 def_rss_key[10] = '
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5694: warning: Function parameter or member 'adapter' not described in 'ngbe_check_hang_subtask'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5771: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_update_link_status'
>> drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5771: warning: expecting prototype for ngbe_watchdog_update_link(). Prototype was for ngbe_watchdog_update_link_status() instead
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5867: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_up'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5913: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_link_is_down'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:5984: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_flush_tx'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6051: warning: Function parameter or member 'adapter' not described in 'ngbe_watchdog_subtask'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6081: warning: Function parameter or member 't' not described in 'ngbe_service_timer'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6081: warning: Excess function parameter 'data' description in 'ngbe_service_timer'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6939: warning: Function parameter or member 'dev' not described in 'ngbe_setup_tc'
   drivers/net/ethernet/wangxun/ngbe/ngbe_main.c:6939: warning: Excess function parameter 'netdev' description in 'ngbe_setup_tc'
--
>> drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:34: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * data operation
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:198: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * reg_ops operation
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:335: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * netdev_ops operation
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:445: warning: Function parameter or member 'adapter' not described in 'ngbe_dbg_adapter_exit'
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:445: warning: Excess function parameter 'pf' description in 'ngbe_dbg_adapter_exit'
   drivers/net/ethernet/wangxun/ngbe/ngbe_debugfs.c:478: warning: Function parameter or member 'adapter' not described in 'ngbe_dump'


vim +316 drivers/net/ethernet/wangxun/ngbe/ngbe_lib.c

   299	
   300	/**
   301	 * ngbe_alloc_q_vector - Allocate memory for a single interrupt vector
   302	 * @adapter: board private structure to initialize
   303	 * @v_count: q_vectors allocated on adapter, used for ring interleaving
   304	 * @v_idx: index of vector in adapter struct
   305	 * @txr_count: total number of Tx rings to allocate
   306	 * @txr_idx: index of first Tx ring to allocate
   307	 * @rxr_count: total number of Rx rings to allocate
   308	 * @rxr_idx: index of first Rx ring to allocate
   309	 * We allocate one q_vector.  If allocation fails we return -ENOMEM.
   310	 **/
   311	static int ngbe_alloc_q_vector(struct ngbe_adapter *adapter,
   312				       unsigned int v_count, unsigned int v_idx,
   313				       unsigned int txr_count, unsigned int txr_idx,
   314				       unsigned int xdp_count, unsigned int xdp_idx,
   315				       unsigned int rxr_count, unsigned int rxr_idx)
 > 316	{
   317		struct ngbe_q_vector *q_vector;
   318		struct ngbe_ring *ring;
   319		int node = -1;
   320		int cpu = -1;
   321		u8 tcs = netdev_get_num_tc(adapter->netdev);
   322	
   323		int ring_count, size;
   324	
   325		/* note this will allocate space for the ring structure as well! */
   326		ring_count = txr_count + rxr_count + xdp_count;
   327		size = sizeof(struct ngbe_q_vector) +
   328		       (sizeof(struct ngbe_ring) * ring_count);
   329	
   330		/* customize cpu for Flow Director mapping */
   331		if (tcs <= 1 && !(adapter->flags & NGBE_FLAG_VMDQ_ENABLED)) {
   332			u16 rss_i = adapter->ring_feature[RING_F_RSS].indices;
   333	
   334			if (rss_i > 1 && adapter->atr_sample_rate) {
   335				if (cpu_online(v_idx)) {
   336					cpu = v_idx;
   337					node = cpu_to_node(cpu);
   338				}
   339			}
   340		}
   341	
   342		/* allocate q_vector and rings */
   343		q_vector = kzalloc_node(size, GFP_KERNEL, node);
   344		if (!q_vector)
   345			q_vector = kzalloc(size, GFP_KERNEL);
   346		if (!q_vector)
   347			return -ENOMEM;
   348	
   349		/* setup affinity mask and node */
   350		if (cpu != -1)
   351			cpumask_set_cpu(cpu, &q_vector->affinity_mask);
   352		q_vector->numa_node = node;
   353	
   354		/* initialize CPU for DCA */
   355		q_vector->cpu = -1;
   356	
   357		/* initialize NAPI */
   358		netif_napi_add(adapter->netdev, &q_vector->napi, ngbe_poll);
   359	
   360		/* tie q_vector and adapter together */
   361		adapter->q_vector[v_idx] = q_vector;
   362		q_vector->adapter = adapter;
   363		q_vector->v_idx = v_idx;
   364	
   365		/* initialize work limits */
   366		q_vector->tx.work_limit = adapter->tx_work_limit;
   367		q_vector->rx.work_limit = adapter->rx_work_limit;
   368	
   369		/* initialize pointer to rings */
   370		ring = q_vector->ring;
   371	
   372		/* initialize ITR */
   373		if (txr_count && !rxr_count) {
   374			/* tx only vector */
   375			if (adapter->tx_itr_setting == 1)
   376				q_vector->itr = NGBE_7K_ITR;
   377			else
   378				q_vector->itr = adapter->tx_itr_setting;
   379		} else {
   380			/* rx or rx/tx vector */
   381			if (adapter->rx_itr_setting == 1)
   382				q_vector->itr = NGBE_7K_ITR;
   383			else
   384				q_vector->itr = adapter->rx_itr_setting;
   385		}
   386	
   387		while (txr_count) {
   388			/* assign generic ring traits */
   389			ring->dev = pci_dev_to_dev(adapter->pdev);
   390			ring->netdev = adapter->netdev;
   391	
   392			/* configure backlink on ring */
   393			ring->q_vector = q_vector;
   394	
   395			/* update q_vector Tx values */
   396			ngbe_add_ring(ring, &q_vector->tx);
   397	
   398			/* apply Tx specific ring traits */
   399			ring->count = adapter->tx_ring_count;
   400			if (adapter->num_vmdqs > 1)
   401				ring->queue_index = txr_idx % adapter->queues_per_pool;
   402			else
   403				ring->queue_index = txr_idx;
   404			clear_ring_xdp(ring);
   405			/* assign ring to adapter */
   406			adapter->tx_ring[txr_idx] = ring;
   407	
   408			/* update count and index */
   409			txr_count--;
   410			txr_idx += v_count;
   411	
   412			/* push pointer to next ring */
   413			ring++;
   414		}
   415		while (xdp_count) {
   416			/* assign generic ring traits */
   417			ring->dev = pci_dev_to_dev(adapter->pdev);
   418			ring->netdev = adapter->netdev;
   419	
   420			/* configure backlink on ring */
   421			ring->q_vector = q_vector;
   422	
   423			/* update q_vector Tx values */
   424			ngbe_add_ring(ring, &q_vector->tx);
   425	
   426			/* apply Tx specific ring traits */
   427			ring->count = adapter->tx_ring_count;
   428			ring->queue_index = xdp_idx;
   429			set_ring_xdp(ring);
   430	
   431			/* assign ring to adapter */
   432			adapter->xdp_ring[xdp_idx] = ring;
   433	
   434			/* update count and index */
   435			xdp_count--;
   436			xdp_idx += v_count;
   437	
   438			/* push pointer to next ring */
   439			ring++;
   440		}
   441		while (rxr_count) {
   442			/* assign generic ring traits */
   443			ring->dev = pci_dev_to_dev(adapter->pdev);
   444			ring->netdev = adapter->netdev;
   445	
   446			/* configure backlink on ring */
   447			ring->q_vector = q_vector;
   448	
   449			/* update q_vector Rx values */
   450			ngbe_add_ring(ring, &q_vector->rx);
   451	
   452			/* apply Rx specific ring traits */
   453			ring->count = adapter->rx_ring_count;
   454			if (adapter->num_vmdqs > 1)
   455				ring->queue_index = rxr_idx % adapter->queues_per_pool;
   456			else
   457				ring->queue_index = rxr_idx;
   458	
   459			/* assign ring to adapter */
   460			adapter->rx_ring[rxr_idx] = ring;
   461	
   462			/* update count and index */
   463			rxr_count--;
   464			rxr_idx += v_count;
   465	
   466			/* push pointer to next ring */
   467			ring++;
   468		}
   469	
   470		return 0;
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
