Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0A13CF98
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jun 2024 12:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502482; cv=none; b=eWt45G6Jj6FU/hl7gM00++/RFsTQXuFsFwkCWQUuZ/rXFTTbXa8wPVLvOKhonoIOFs0RhzMFZJrk3+0LhPmtKpMYgaVqlPqT6SLtqvOSk+YGTpSeDOH+DE5mwx8ZIuEqTtCHR96DP6MH7WPaT70TCD3JcGMBI4THTFUF8tHQglI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502482; c=relaxed/simple;
	bh=pd9TpZhMXB1foCsPILZW38GM2ddYIqnRDlR7GwEinGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tWuGJPtSpa54uoim19K9CnAZ3ce0/OnzKLQf1bNtGGoEYkxA1WcNZqbCtpL74ZEyEK+90/HEGLDpy66DpLLRLQcS5VW2xWUhmAtDrbw0SuBSC0lhB2Dxw7iqwvkzaCEhQuBcNQ0VTXOAnr5nmrsonxkanxml3/0JrzX3hMikFv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dla61X1v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dla61X1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717502480; x=1749038480;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pd9TpZhMXB1foCsPILZW38GM2ddYIqnRDlR7GwEinGs=;
  b=dla61X1vZP7ZgLy7tXEiWXSrKZRQXlpZfd2ZzulvT9wE+UeGP/GlFVLQ
   ZyYk5YHyOPrpeCuw3Iyja7x2/Mq1+ylBuAIvmGqIAAAdUTiU/1semJYyx
   XnErZ00W1okaPI5DQYAMRiq29UteqnH9GSu98i+QwZ/RswJOSjjkUxizL
   k0D9CgZyP1ZGTYJt7xL5g1mveBWsT5iaPYgVFE3pYQCei2rW9NQXfd35h
   pas4i24EZ+OWLHHKxmUrQmBemj/lLe06ZBZ0MhLauWcylhkB/KMwrGBQi
   o94VtMzIxQCyOVh4qPOvEE73n+5DyrkPwgHJ5Z9nnkPVdBzca3MeftTTd
   w==;
X-CSE-ConnectionGUID: /YaFAdkWQA6qEOqGUNH8pA==
X-CSE-MsgGUID: W5RAtG7kTrOlaCNCRv62PQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13885126"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="13885126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 05:01:19 -0700
X-CSE-ConnectionGUID: 14YHTt9cTFyrBXA6gBYbNg==
X-CSE-MsgGUID: 0HY3R1dYRdaQvil4YD1lQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="68377489"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2024 05:01:17 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sESqp-000NBj-0v;
	Tue, 04 Jun 2024 12:01:15 +0000
Date: Tue, 4 Jun 2024 20:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 21/23]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:1244:37: warning: unused variable
 'page_phys_addr'
Message-ID: <202406041936.fhaUI4GM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   557b992217c1ed5778b0cf14e58e444c5ba05b91
commit: 351e71008abb8318ba76f6e6a81ced876166e486 [21/23] [NOT-FOR-UPSTREAM] remove all printk
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240604/202406041936.fhaUI4GM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041936.fhaUI4GM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041936.fhaUI4GM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function '__bnxt_rx_agg_pages':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:1244:37: warning: unused variable 'page_phys_addr' [-Wunused-variable]
    1244 |                         phys_addr_t page_phys_addr = page_to_phys(io_iov_get_page(netmem));
         |                                     ^~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_rx_pkt':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:2232:59: warning: variable 'frag' set but not used [-Wunused-but-set-variable]
    2232 |                                         const skb_frag_t *frag;
         |                                                           ^~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: At top level:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:14955:13: warning: 'bnxt_init_rx_ring_rxbd_pages' defined but not used [-Wunused-function]
   14955 | static void bnxt_init_rx_ring_rxbd_pages(struct bnxt *bp, struct bnxt_rx_ring_info *rxr)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:14942:12: warning: 'bnxt_alloc_rx_agg_bmap' defined but not used [-Wunused-function]
   14942 | static int bnxt_alloc_rx_agg_bmap(struct bnxt *bp, struct bnxt_rx_ring_info *rxr)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:14919:12: warning: 'bnxt_alloc_rx_ring_struct' defined but not used [-Wunused-function]
   14919 | static int bnxt_alloc_rx_ring_struct(struct bnxt *bp, struct bnxt_ring_struct *ring)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_setup_int_mode':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10472:48: warning: '%s' directive output may be truncated writing 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
   10472 |         snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |                                                ^~                     ~~~~~~
   In function 'bnxt_setup_inta',
       inlined from 'bnxt_setup_int_mode' at drivers/net/ethernet/broadcom/bnxt/bnxt.c:10492:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10472:9: note: 'snprintf' output between 8 and 23 bytes into a destination of size 18
   10472 |         snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10473 |                  0);
         |                  ~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_setup_int_mode':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10457:62: warning: '%s' directive output may be truncated writing between 2 and 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
   10457 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                                                              ^~
   In function 'bnxt_setup_msix',
       inlined from 'bnxt_setup_int_mode' at drivers/net/ethernet/broadcom/bnxt/bnxt.c:10490:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10457:58: note: directive argument in the range [-2147483643, 2147483646]
   10457 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                                                          ^~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:10457:17: note: 'snprintf' output between 6 and 33 bytes into a destination of size 18
   10457 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   10458 |                          attr, i);
         |                          ~~~~~~~~


vim +/page_phys_addr +1244 drivers/net/ethernet/broadcom/bnxt/bnxt.c

c0c050c58d84099 Michael Chan    2015-10-22  1199  
23e4c0469ad03f6 Andy Gospodarek 2022-04-08  1200  static u32 __bnxt_rx_agg_pages(struct bnxt *bp,
e44758b78ae8146 Michael Chan    2018-10-14  1201  			       struct bnxt_cp_ring_info *cpr,
ca1df2dd8e2f2c1 Andy Gospodarek 2022-04-08  1202  			       struct skb_shared_info *shinfo,
31b9998bf225eca Andy Gospodarek 2022-04-08  1203  			       u16 idx, u32 agg_bufs, bool tpa,
31b9998bf225eca Andy Gospodarek 2022-04-08  1204  			       struct xdp_buff *xdp)
c0c050c58d84099 Michael Chan    2015-10-22  1205  {
e44758b78ae8146 Michael Chan    2018-10-14  1206  	struct bnxt_napi *bnapi = cpr->bnapi;
c0c050c58d84099 Michael Chan    2015-10-22  1207  	struct pci_dev *pdev = bp->pdev;
b6ab4b01f53b5f9 Michael Chan    2016-01-02  1208  	struct bnxt_rx_ring_info *rxr = bnapi->rx_ring;
c0c050c58d84099 Michael Chan    2015-10-22  1209  	u16 prod = rxr->rx_agg_prod;
ca1df2dd8e2f2c1 Andy Gospodarek 2022-04-08  1210  	u32 i, total_frag_len = 0;
bfcd8d791ec1849 Michael Chan    2019-07-29  1211  	bool p5_tpa = false;
c0c050c58d84099 Michael Chan    2015-10-22  1212  
1c7fd6ee2fe4ec6 Randy Schacher  2023-11-20  1213  	if ((bp->flags & BNXT_FLAG_CHIP_P5_PLUS) && tpa)
bfcd8d791ec1849 Michael Chan    2019-07-29  1214  		p5_tpa = true;
bfcd8d791ec1849 Michael Chan    2019-07-29  1215  
c0c050c58d84099 Michael Chan    2015-10-22  1216  	for (i = 0; i < agg_bufs; i++) {
ca1df2dd8e2f2c1 Andy Gospodarek 2022-04-08  1217  		skb_frag_t *frag = &shinfo->frags[i];
c0c050c58d84099 Michael Chan    2015-10-22  1218  		u16 cons, frag_len;
c0c050c58d84099 Michael Chan    2015-10-22  1219  		struct rx_agg_cmp *agg;
c0c050c58d84099 Michael Chan    2015-10-22  1220  		struct bnxt_sw_rx_agg_bd *cons_rx_buf;
c0c050c58d84099 Michael Chan    2015-10-22  1221  		struct page *page;
c0c050c58d84099 Michael Chan    2015-10-22  1222  		dma_addr_t mapping;
38a409a096b4e0d David Wei       2024-05-22  1223  		netmem_ref netmem;
c0c050c58d84099 Michael Chan    2015-10-22  1224  
bfcd8d791ec1849 Michael Chan    2019-07-29  1225  		if (p5_tpa)
bfcd8d791ec1849 Michael Chan    2019-07-29  1226  			agg = bnxt_get_tpa_agg_p5(bp, rxr, idx, i);
bfcd8d791ec1849 Michael Chan    2019-07-29  1227  		else
4a228a3a5e58e5c Michael Chan    2019-07-29  1228  			agg = bnxt_get_agg(bp, cpr, idx, i);
c0c050c58d84099 Michael Chan    2015-10-22  1229  		cons = agg->rx_agg_cmp_opaque;
c0c050c58d84099 Michael Chan    2015-10-22  1230  		frag_len = (le32_to_cpu(agg->rx_agg_cmp_len_flags_type) &
c0c050c58d84099 Michael Chan    2015-10-22  1231  			    RX_AGG_CMP_LEN) >> RX_AGG_CMP_LEN_SHIFT;
c0c050c58d84099 Michael Chan    2015-10-22  1232  
c0c050c58d84099 Michael Chan    2015-10-22  1233  		cons_rx_buf = &rxr->rx_agg_ring[cons];
38a409a096b4e0d David Wei       2024-05-22  1234  		// NOTE: sets frag->netmem and frag->offset and frag->size
38a409a096b4e0d David Wei       2024-05-22  1235  		// page is a netmem, and is net_iov if queue is 1
38a409a096b4e0d David Wei       2024-05-22  1236  		// frag->netmem = page_to_netmem(page)
b51f4113ebb0201 Yunsheng Lin    2023-05-11  1237  		skb_frag_fill_page_desc(frag, cons_rx_buf->page,
b51f4113ebb0201 Yunsheng Lin    2023-05-11  1238  					cons_rx_buf->offset, frag_len);
38a409a096b4e0d David Wei       2024-05-22  1239  		if (rxr->zc_enabled) {
38a409a096b4e0d David Wei       2024-05-22  1240  			WARN_ON(!skb_frag_is_net_iov(frag));
38a409a096b4e0d David Wei       2024-05-22  1241  			netmem = page_to_netmem(cons_rx_buf->page);
351e71008abb831 David Wei       2024-05-23  1242  			//printk(KERN_INFO "----- __bnxt_rx_agg_pages: adding frag=%d, total agg_bufs=%d\n", i, agg_bufs);
38a409a096b4e0d David Wei       2024-05-22  1243  			// buf = container_of(netmem_to_net_iov(netmem), struct io_zc_rx_buf, niov);
38a409a096b4e0d David Wei       2024-05-22 @1244  			phys_addr_t page_phys_addr = page_to_phys(io_iov_get_page(netmem));
351e71008abb831 David Wei       2024-05-23  1245  			//printk(KERN_INFO "----- __bnxt_rx_agg_pages: Page physical address: %#llx, dma_addr_t: %#lx\n", (unsigned long long)page_phys_addr, netmem_get_dma_addr(netmem));
38a409a096b4e0d David Wei       2024-05-22  1246  		}
ca1df2dd8e2f2c1 Andy Gospodarek 2022-04-08  1247  		shinfo->nr_frags = i + 1;
c0c050c58d84099 Michael Chan    2015-10-22  1248  		__clear_bit(cons, rxr->rx_agg_bmap);
c0c050c58d84099 Michael Chan    2015-10-22  1249  
c0c050c58d84099 Michael Chan    2015-10-22  1250  		/* It is possible for bnxt_alloc_rx_page() to allocate
c0c050c58d84099 Michael Chan    2015-10-22  1251  		 * a sw_prod index that equals the cons index, so we
c0c050c58d84099 Michael Chan    2015-10-22  1252  		 * need to clear the cons entry now.
c0c050c58d84099 Michael Chan    2015-10-22  1253  		 */
11cd119d31a71b3 Michael Chan    2017-02-06  1254  		mapping = cons_rx_buf->mapping;
38a409a096b4e0d David Wei       2024-05-22  1255  		// NOTE: page is saved here only for alloc failures
c0c050c58d84099 Michael Chan    2015-10-22  1256  		page = cons_rx_buf->page;
c0c050c58d84099 Michael Chan    2015-10-22  1257  		cons_rx_buf->page = NULL;
c0c050c58d84099 Michael Chan    2015-10-22  1258  
31b9998bf225eca Andy Gospodarek 2022-04-08  1259  		if (xdp && page_is_pfmemalloc(page))
31b9998bf225eca Andy Gospodarek 2022-04-08  1260  			xdp_buff_set_frag_pfmemalloc(xdp);
31b9998bf225eca Andy Gospodarek 2022-04-08  1261  
38a409a096b4e0d David Wei       2024-05-22  1262  		// NOTE: realloc a page for the nulled out rx_agg_buf
c0c050c58d84099 Michael Chan    2015-10-22  1263  		if (bnxt_alloc_rx_page(bp, rxr, prod, GFP_ATOMIC) != 0) {
278fda0d52f6724 Yunsheng Lin    2023-05-11  1264  			--shinfo->nr_frags;
c0c050c58d84099 Michael Chan    2015-10-22  1265  			cons_rx_buf->page = page;
c0c050c58d84099 Michael Chan    2015-10-22  1266  
c0c050c58d84099 Michael Chan    2015-10-22  1267  			/* Update prod since possibly some pages have been
c0c050c58d84099 Michael Chan    2015-10-22  1268  			 * allocated already.
c0c050c58d84099 Michael Chan    2015-10-22  1269  			 */
c0c050c58d84099 Michael Chan    2015-10-22  1270  			rxr->rx_agg_prod = prod;
4a228a3a5e58e5c Michael Chan    2019-07-29  1271  			bnxt_reuse_rx_agg_bufs(cpr, idx, i, agg_bufs - i, tpa);
ca1df2dd8e2f2c1 Andy Gospodarek 2022-04-08  1272  			return 0;
c0c050c58d84099 Michael Chan    2015-10-22  1273  		}
c0c050c58d84099 Michael Chan    2015-10-22  1274  
578fcfd26e2a1d0 Somnath Kotur   2023-08-17  1275  		dma_sync_single_for_cpu(&pdev->dev, mapping, BNXT_RX_PAGE_SIZE,
578fcfd26e2a1d0 Somnath Kotur   2023-08-17  1276  					bp->rx_dir);
c0c050c58d84099 Michael Chan    2015-10-22  1277  
ca1df2dd8e2f2c1 Andy Gospodarek 2022-04-08  1278  		total_frag_len += frag_len;
c0c050c58d84099 Michael Chan    2015-10-22  1279  		prod = NEXT_RX_AGG(prod);
c0c050c58d84099 Michael Chan    2015-10-22  1280  	}
c0c050c58d84099 Michael Chan    2015-10-22  1281  	rxr->rx_agg_prod = prod;
ca1df2dd8e2f2c1 Andy Gospodarek 2022-04-08  1282  	return total_frag_len;
ca1df2dd8e2f2c1 Andy Gospodarek 2022-04-08  1283  }
ca1df2dd8e2f2c1 Andy Gospodarek 2022-04-08  1284  

:::::: The code at line 1244 was first introduced by commit
:::::: 38a409a096b4e0d3501fa8fedae983a99dc02cd8 [NOT-FOR-UPSTREAM] bnxt: add support for zcrx

:::::: TO: David Wei <dw@davidwei.uk>
:::::: CC: Pavel Begunkov <asml.silence@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
