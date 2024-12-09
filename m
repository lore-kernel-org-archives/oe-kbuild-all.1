Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971F219067A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719666; cv=none; b=R93m7NyJivhgFnBcqhsXLygPffhrTEbYtv+h+QORnKXwuaEJXgM8ye1YHNFLFv0hwf/fPWmcY1XGGCV/eKoBFQgZxPFPHzTmPJXrkDCse0yUNps97LJg1QrQzXDNPkxC+QV2U4z7hJ0PRFjRdoxlBZ8F+iEY3nmuy1xXlzHn/YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719666; c=relaxed/simple;
	bh=ta5HyEkv4LyXIaiAiJmp/G5ALNhmPKY2Go1p98rKrbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zjsy3y3+VdqxWksKrSzA9k5UU4J2LYXcHFaWQTS63NZR7YCcd7dvdMTLw0bVUj6oq09k9mjHYgwG3mtxuavlgqVMMmOBTcOUc8ZsULiv+5PSFsDUOIVePEL5S2yLN5HXPfbIcgP+Rm9Fgs70iP4AespIUu27leNouC5T9z9reC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWJ8SIZw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWJ8SIZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719665; x=1765255665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ta5HyEkv4LyXIaiAiJmp/G5ALNhmPKY2Go1p98rKrbs=;
  b=BWJ8SIZwlvZ0FMbVu4KUThdMO1S/Yd8TqgVEVYPhDZ9efPbG9d8keO32
   f17c24ZA+Jf4ApzkW651oAILzRWaH7wlbZXL7YwWGtEJeb7ctGKbaeei4
   nVaNqFJh9rWaJ3JId9HCK257sVLOL8/BqNnhySGEYD8ueNjkOzEkIbfcC
   eQDixGgSeRMRw45poF+yQrOC46H09IHwn1mzYjz5IunzBanc5nAAkTsAU
   lqNjVHxzVCdTXEz2o2THjgbnPTij68Bwtvc3oWnCn9xp0CPwAZCmiVdlT
   56rVTFfvOB9+flAzFntDcQZqJYLsaxT26qbhzdyVnbbfZ2H+tia8y7pVS
   w==;
X-CSE-ConnectionGUID: sl5BQCxKSzafGWXn0I4oQA==
X-CSE-MsgGUID: eD5jm4h7Squ13dcODc1C8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34060166"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34060166"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:47:41 -0800
X-CSE-ConnectionGUID: WB2wvWQNSSO/iqvUWK9CMA==
X-CSE-MsgGUID: p6Eu0iETRiGnNBg1kq/jYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99012422"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:47:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVgG-0003uv-2x;
	Mon, 09 Dec 2024 04:47:36 +0000
Date: Mon, 9 Dec 2024 12:47:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, "gu.huiguang" <guhuiguang@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2544/2544]
 drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:389:9: sparse: sparse:
 incompatible types in conditional expression (different types):
Message-ID: <202412081856.3zlECgE7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   c8dbb3a6e214ad66d5d6099bf76e1f1c6eefc06f
commit: a0c5bfdbc099daf30cbadb9657803f0cb3f89d0b [2544/2544] drivers: support for rnpm drivers from Mucse Technology N10/N400
config: x86_64-randconfig-123-20241205 (https://download.01.org/0day-ci/archive/20241208/202412081856.3zlECgE7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412081856.3zlECgE7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081856.3zlECgE7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c: note: in included file (through include/linux/string.h, include/linux/uuid.h, include/linux/mod_devicetable.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c: note: in included file (through include/linux/kernel.h, include/asm-generic/bug.h, arch/x86/include/asm/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:389:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:389:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:389:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:747:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:747:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_lib.c:747:9: sparse:    void *
--
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: note: in included file (through include/linux/kernel.h, include/linux/list.h, include/linux/module.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: note: in included file (through include/linux/printk.h, include/linux/kernel.h, include/linux/list.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: note: in included file (through include/linux/string.h, include/linux/bitmap.h, include/linux/cpumask.h, ...):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c: note: in included file (through include/linux/filter.h, include/net/sock.h, include/linux/tcp.h):
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:44: sparse: sparse: got <
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-ab51eccf88/lib/clang/19/include/stdarg.h:22:22: sparse: sparse: bad constant expression type
>> drivers/net/ethernet/mucse/rnpm/rnpm_main.c:296:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:296:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:296:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2845:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2845:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2845:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2950:17: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2950:17: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:2950:17: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4748:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4748:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4748:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4847:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4847:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:4847:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5069:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5069:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5069:9: sparse:    void *
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5143:9: sparse: sparse: incompatible types in conditional expression (different types):
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5143:9: sparse:    void
   drivers/net/ethernet/mucse/rnpm/rnpm_main.c:5143:9: sparse:    void *

vim +389 drivers/net/ethernet/mucse/rnpm/rnpm_lib.c

   363	
   364	/**
   365	 * rnpm_alloc_q_vector - Allocate memory for a single interrupt vector
   366	 * @adapter: board private structure to initialize
   367	 * @v_count: q_vectors allocated on adapter, used for ring interleaving
   368	 * @v_idx: index of vector in adapter struct
   369	 * @txr_count: total number of Tx rings to allocate
   370	 * @txr_idx: index of first Tx ring to allocate
   371	 * @rxr_count: total number of Rx rings to allocate
   372	 * @rxr_idx: index of first Rx ring to allocate
   373	 *
   374	 * We allocate one q_vector.  If allocation fails we return -ENOMEM.
   375	 **/
   376	static int rnpm_alloc_q_vector(struct rnpm_adapter *adapter, int eth_queue_idx,
   377				       int v_idx, int r_idx, int r_count, int step)
   378	{
   379		struct rnpm_q_vector *q_vector;
   380		struct rnpm_ring *ring;
   381		struct rnpm_hw *hw = &adapter->hw;
   382		int node = NUMA_NO_NODE;
   383		int cpu = -1;
   384		int ring_count, size;
   385		int txr_count, rxr_count, idx;
   386		int rxr_idx = r_idx, txr_idx = r_idx;
   387		// u8 tcs = netdev_get_num_tc(adapter->netdev);
   388	
 > 389		DPRINTK(PROBE, INFO,
   390			"eth_queue_idx:%d v_idx:%d(off:%d) ring:%d ring_cnt:%d step:%d\n",
   391			eth_queue_idx, v_idx, adapter->vector_off, r_idx, r_count,
   392			step);
   393	
   394		txr_count = rxr_count = r_count;
   395	
   396		ring_count = txr_count + rxr_count;
   397	
   398		/* alloc ring memory together with q_vector */
   399		size = sizeof(struct rnpm_q_vector) +
   400		       (sizeof(struct rnpm_ring) * ring_count);
   401	
   402		/* should minis adapter->vector_off */
   403		if (cpu_online(v_idx - adapter->vector_off)) {
   404			/* cpu 1 - 7 */
   405			//cpu = 1 + v_idx - adapter->vector_off;
   406			cpu = v_idx - adapter->vector_off;
   407			node = cpu_to_node(cpu);
   408		}
   409	
   410		/* allocate q_vector and rings */
   411		q_vector = kzalloc_node(size, GFP_KERNEL, node);
   412		if (!q_vector)
   413			q_vector = kzalloc(size, GFP_KERNEL);
   414		if (!q_vector)
   415			return -ENOMEM;
   416	
   417		cpumask_copy(&q_vector->affinity_mask, cpu_possible_mask);
   418		/* setup affinity mask and node */
   419		q_vector->numa_node = node;
   420	
   421		/* initialize timer */
   422		q_vector->irq_check_usecs = RNPM_IRQ_CHECK_USEC;
   423		//q_vector->new_rx_count = RNPM_PKT_TIMEOUT;
   424		//q_vector->old_rx_count = RNPM_PKT_TIMEOUT;
   425	
   426		hrtimer_init(&q_vector->irq_miss_check_timer, CLOCK_MONOTONIC,
   427			     HRTIMER_MODE_REL_PINNED);
   428		q_vector->irq_miss_check_timer.function = irq_miss_check;
   429	
   430		/* initialize NAPI */
   431		netif_napi_add(adapter->netdev, &q_vector->napi, rnpm_poll,
   432			       adapter->napi_budge);
   433	
   434		/* tie q_vector and adapter together */
   435		adapter->q_vector[v_idx - adapter->vector_off] = q_vector;
   436		q_vector->adapter = adapter;
   437		/* this indicate vector table */
   438		q_vector->v_idx = v_idx;
   439	
   440		/* initialize work limits */
   441		q_vector->tx.work_limit = adapter->tx_work_limit;
   442	
   443		q_vector->rx.itr = q_vector->itr = adapter->rx_frames;
   444	#ifdef CONFIG_HZ
   445		q_vector->factor = DIV_ROUND_UP(1000, CONFIG_HZ);
   446	#else
   447		q_vector->factor = 1;
   448	#endif
   449	
   450		/* initialize pointer to rings */
   451		ring = q_vector->ring;
   452	
   453		for (idx = 0; idx < txr_count; idx++) {
   454			/* assign generic ring traits */
   455			ring->dev = &adapter->pdev->dev;
   456			ring->netdev = adapter->netdev;
   457	
   458			/* configure backlink on ring */
   459			ring->q_vector = q_vector;
   460	
   461			/* update q_vector Tx values */
   462			rnpm_add_ring(ring, &q_vector->tx);
   463	
   464			/* apply Tx specific ring traits */
   465			ring->count = adapter->tx_ring_item_count;
   466			ring->queue_index = eth_queue_idx + idx;
   467	
   468			/* rnpm_queue_idx can be changed after */
   469			/* it is used to location hw reg */
   470			ring->rnpm_queue_idx = txr_idx;
   471			ring->dma_int_stat =
   472				hw->hw_addr + RNPM_DMA_INT_STAT(ring->rnpm_queue_idx);
   473			ring->dma_int_mask = ring->dma_int_stat + 4;
   474			ring->dma_int_clr = ring->dma_int_stat + 8;
   475			ring->device_id = adapter->pdev->device;
   476			ring->pfvfnum = hw->pfvfnum;
   477	
   478			/* assign ring to adapter */
   479			adapter->tx_ring[ring->queue_index] = ring;
   480	
   481			/* update count and index */
   482			txr_idx += step;
   483	
   484			rnpm_dbg("\t\t%s:vector[%d] <--RNPM TxRing:%d, eth_queue:%d\n",
   485				 adapter->netdev->name, v_idx, ring->rnpm_queue_idx,
   486				 ring->queue_index);
   487	
   488			/* push pointer to next ring */
   489			ring++;
   490		}
   491	
   492		for (idx = 0; idx < rxr_count; idx++) {
   493			/* assign generic ring traits */
   494			ring->dev = &adapter->pdev->dev;
   495			ring->netdev = adapter->netdev;
   496	
   497			/* configure backlink on ring */
   498			ring->q_vector = q_vector;
   499	
   500			/* update q_vector Rx values */
   501			rnpm_add_ring(ring, &q_vector->rx);
   502	
   503			/* apply Rx specific ring traits */
   504			ring->count = adapter->rx_ring_item_count;
   505			/* rnpm_queue_idx can be changed after */
   506			/* it is used to location hw reg */
   507			ring->queue_index = eth_queue_idx + idx;
   508			ring->rnpm_queue_idx = rxr_idx;
   509			ring->dma_int_stat =
   510				hw->hw_addr + RNPM_DMA_INT_STAT(ring->rnpm_queue_idx);
   511			ring->dma_int_mask = ring->dma_int_stat + 4;
   512			ring->dma_int_clr = ring->dma_int_stat + 8;
   513			ring->device_id = adapter->pdev->device;
   514			ring->pfvfnum = hw->pfvfnum;
   515	
   516			/* assign ring to adapter */
   517			adapter->rx_ring[ring->queue_index] = ring;
   518			rnpm_dbg("\t\t%s:vector[%d] <--RNPM RxRing:%d, eth_queue:%d\n",
   519				 adapter->netdev->name, v_idx, ring->rnpm_queue_idx,
   520				 ring->queue_index);
   521	
   522			/* update count and index */
   523			rxr_idx += step;
   524	
   525			/* push pointer to next ring */
   526			ring++;
   527		}
   528	
   529		return 0;
   530	}
   531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
