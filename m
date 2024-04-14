Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CA221360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 08:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713081827; cv=none; b=YY667kAeOoEwXnVurVPYXiZ9uSpxDAyG3x7PFHsutCuZVtILAYR8ggUmQyBKQz8z1NROuLAAJv1+yXsdGeboEHaXJ5yYWHgG5JltF+hq1CEb1SjxHW5rd4wmirkG5r0lTlk/iIY9C5lyM/nK3p0yVnJz1YbVYnXffjyOQbjl/VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713081827; c=relaxed/simple;
	bh=SENvX4Aa5tJ/Su9xd+v/BGqPs+5i6udtl4c8yrkzbA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTx2YSK6qHybz407tjRp4dOgslbvAPNeQLp+qeBz01pwjL3P9xYv+liOtKDcIryD865VKiqfWx5ldVJAs1PIHaDkXaxB8PFbcI1mpXbUVCVI2ZyTFFzwCK2S4cxwhuucDgxg3A2pqSXz8YvKMqKGUXhrdlmRcCdFuFrNWQm99LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mG0XDA6K; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mG0XDA6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713081825; x=1744617825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SENvX4Aa5tJ/Su9xd+v/BGqPs+5i6udtl4c8yrkzbA8=;
  b=mG0XDA6KjqVgN8X/2Etxwt33Dso0mw6w92NeHXbZMUN/ylf+iL70hMmN
   jKWlj1h0eR0+aFz4gCWBgRVe6aT/qwKQ+7AUG8ODW0gEUo6p89UqKJKpK
   dGp8/RxRQz6NGLXaAYmtZTdRhN3ESM6iDZojSF2Jfy5tcqyjK60hHIWey
   hgZGVKEaH+eLlD85uzyac3q1Whwe9P6m9XyUSAeJ6YCGqBQD2ML5c8vTk
   cBbvpKYhYS/i3jkwnvw2oKhPfW46KxBWXYejEWnhJSPioCX9bemIjoHn+
   wWI+Zwv2YRuJEsZh/7iwN5u8qHgHwIItpAKbliwWFQhxZyJcviduOFkFG
   w==;
X-CSE-ConnectionGUID: +PGT5tXHQXCoAd/3exRSQA==
X-CSE-MsgGUID: cRIzWHnUQGKCx4CGp+EV8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="19632133"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="19632133"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 01:03:44 -0700
X-CSE-ConnectionGUID: iTCJkyMWS167LviTDhfLGQ==
X-CSE-MsgGUID: K6jWeD24QhiW/JYisUzgfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="21608573"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 14 Apr 2024 01:03:43 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvupw-0003UC-1Z;
	Sun, 14 Apr 2024 08:03:40 +0000
Date: Sun, 14 Apr 2024 16:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, nebula_matrix <open@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 20421/30000]
 drivers/net/ethernet/nebula-matrix/m1600/debug.c:267:21: sparse: sparse:
 cast removes address space '__iomem' of expression
Message-ID: <202404141531.eh0C6OjT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4134526a9cfd552230ec7a66a1738a9066d9a0c6
commit: 01e6e2075c432fde7fb5a66202b41bbd469de620 [20421/30000] Net: m1600: Add m1600-driver for nebula-matrix m1600 series smart NIC.
config: x86_64-randconfig-122-20240413 (https://download.01.org/0day-ci/archive/20240414/202404141531.eh0C6OjT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404141531.eh0C6OjT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404141531.eh0C6OjT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/nebula-matrix/m1600/debug.c:267:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/nebula-matrix/m1600/debug.c:440:21: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/net/ethernet/nebula-matrix/m1600/debug.c:444:21: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/net/ethernet/nebula-matrix/m1600/ethtool.c:507:5: sparse: sparse: symbol 'nbl_get_eeprom_len' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/m1600/ethtool.c:643:5: sparse: sparse: symbol 'nbl_query_link_speed' was not declared. Should it be static?
--
>> drivers/net/ethernet/nebula-matrix/m1600/main.c:155:6: sparse: sparse: symbol 'nbl_service_task2_schedule' was not declared. Should it be static?
>> drivers/net/ethernet/nebula-matrix/m1600/main.c:436:6: sparse: sparse: symbol 'nbl_check_and_set_module_info' was not declared. Should it be static?
--
>> drivers/net/ethernet/nebula-matrix/m1600/txrx.c:822:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [usertype] buffer_addr @@     got restricted __le64 [usertype] @@
   drivers/net/ethernet/nebula-matrix/m1600/txrx.c:822:38: sparse:     expected unsigned long long [usertype] buffer_addr
   drivers/net/ethernet/nebula-matrix/m1600/txrx.c:822:38: sparse:     got restricted __le64 [usertype]

vim +/__iomem +267 drivers/net/ethernet/nebula-matrix/m1600/debug.c

   251	
   252	/* ring */
   253	static int ring_seq_show(struct seq_file *m, void *v)
   254	{
   255		int i, j, n;
   256		struct nbl_rx_desc *rx_desc;
   257		struct nbl_tx_desc *tx_desc;
   258		struct nbl_ring *ring = m->private;
   259	
   260		seq_printf(m, "size=%d\n", ring->size);
   261		seq_printf(m, "dma=0x%llX\n", (unsigned long long)ring->dma);
   262		seq_printf(m, "desc=0x%llX\n", (unsigned long long)ring->desc);
   263		seq_printf(m, "desc_num=%d\n", ring->desc_num);
   264		seq_printf(m, "local_qid=%d\n", ring->local_qid);
   265		seq_printf(m, "queue_index=%d\n", ring->queue_index);
   266		seq_printf(m, "notify_addr=0x%llX\n",
 > 267			   (unsigned long long)ring->notify_addr);
   268		seq_printf(m, "buf_len=%d\n", ring->buf_len);
   269		seq_printf(m, "next_to_use=%d\n", ring->next_to_use);
   270		seq_printf(m, "next_to_clean=%d\n", ring->next_to_clean);
   271		seq_printf(m, "next_to_alloc=%d\n", ring->next_to_alloc);
   272		seq_printf(m, "tail_ptr=%d\n", ring->tail_ptr);
   273		if (!ring->desc) {
   274			seq_puts(m, "[Unallocated]\n");
   275			return 0;
   276		}
   277	
   278		if (ring->local_qid & 1) {
   279			tx_desc = (struct nbl_tx_desc *)ring->desc;
   280			n = sizeof(struct nbl_tx_desc) / sizeof(u32);
   281			for (i = 0; i < ring->desc_num; i++) {
   282				seq_printf(m, "[desc-%03d]: ", i);
   283				for (j = 0; j < n; j++)
   284					seq_printf(m, "%08X ", ((u32 *)tx_desc)[j]);
   285				seq_printf(m, "dlen:%d ", tx_desc->data_len);
   286				seq_printf(m, "plen:%d ", tx_desc->pkt_len);
   287				seq_printf(m, "dd:%d ", tx_desc->dd);
   288				seq_printf(m, "eop:%d ", tx_desc->eop);
   289				seq_printf(m, "sop:%d ", tx_desc->sop);
   290				seq_printf(m, "fwd:%d ", tx_desc->fwd);
   291				seq_printf(m, "dp:%d ", tx_desc->dport);
   292				seq_printf(m, "dpi:%d ", tx_desc->dport_id);
   293				seq_printf(m, "l3c:%d ", tx_desc->l3_checksum);
   294				seq_printf(m, "l4c:%d ", tx_desc->l4_checksum);
   295				seq_printf(m, "rsslag:%d ", tx_desc->rss_lag);
   296				seq_printf(m, "l3_off:%d\n", tx_desc->l3_start_offset);
   297				tx_desc++;
   298			}
   299		} else {
   300			rx_desc = (struct nbl_rx_desc *)ring->desc;
   301			n = sizeof(struct nbl_rx_desc) / sizeof(u32);
   302			for (i = 0; i < ring->desc_num; i++) {
   303				seq_printf(m, "[desc-%03d]: ", i);
   304				for (j = 0; j < n; j++)
   305					seq_printf(m, "%08X ", ((u32 *)rx_desc)[j]);
   306				seq_printf(m, "dlen:%d ", rx_desc->data_len);
   307				seq_printf(m, "dd:%d ", rx_desc->dd);
   308				seq_printf(m, "eop:%d ", rx_desc->eop);
   309				seq_printf(m, "sop:%d ", rx_desc->sop);
   310				seq_printf(m, "fwd:%d ", rx_desc->fwd);
   311				seq_printf(m, "sp:%d ", rx_desc->sport);
   312				seq_printf(m, "spi:%d ", rx_desc->sport_id);
   313				seq_printf(m, "cks:%d ", rx_desc->checksum_status);
   314				seq_printf(m, "ptype:%d ", rx_desc->ptype);
   315				seq_printf(m, "lag:%d ", rx_desc->lag);
   316				seq_printf(m, "lagid:%d\n", rx_desc->lag_id);
   317				rx_desc++;
   318			}
   319		}
   320	
   321		return 0;
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
