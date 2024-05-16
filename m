Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA311465A3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 May 2024 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715864402; cv=none; b=I260Pl7x7FrOTun3igUtHwUQvwfzKC45xYMaD8slYrl+dQgJSVbHfx1AUrnkYy74x9529j4ZudhxzFhPGRLKHdsxDJOwuz/sfV6gM0R6Q+/+EyRef0l8nzl9sFP6FODquZvR5Fse2RObplHJtxj+LS2s+y2g3CGbiZU59u0wWz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715864402; c=relaxed/simple;
	bh=/GKddSYKVeJ61JiQrXOmDp7UjBB3fy6NIyyrPqV3+i4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXk7S1nAP2Rm7lxIxNAqmTNvV8EE4dIiLuL+0EXKNthWrCjyvpAWpQI5uJOGSPH424oc+syquYnAhhx4df8ucz7UfGFHuAPxDyEXZG0ruipXHiiNGOAiWcI/A9m+oUtH42x9aBzAPtqltKR4BfCV9WSWxvqiMabwknL0XsB03Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chY61jnF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chY61jnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715864402; x=1747400402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/GKddSYKVeJ61JiQrXOmDp7UjBB3fy6NIyyrPqV3+i4=;
  b=chY61jnFuRljKHrabWCOLuaPFiSQmd2bzoYj6TDY348fo54So7WGQ15P
   6jKWYfrRbPIBDi4I5TpDwlEq4SngbWP0RnowwNxe1Jc0AL4yFFhStbura
   Hbb5XLmPFs2PsTN1zp2g5/q3SSFuavvZHCEG3WDZCAA2q6AwTlJk0Wwg2
   Askauf0ukYTnNUlXaxycZy3ra45f3WHx4Evi8IzdS3E/hlIAFXSGziAj6
   QY9lKD+N/uHrM4aBiLZars47qsE/oLKkByqwyC8S3G3ySRanTIkhJwB5M
   khdtJSm/2aWk6phbhbLb094bLJ7EBHYcApStmlJLJNNAQABXM7O4U1nV4
   A==;
X-CSE-ConnectionGUID: qLl3blr2SWyrtiN4490jNA==
X-CSE-MsgGUID: GYiZSgCiR8edXlyS3XVfSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29470807"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="29470807"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 06:00:02 -0700
X-CSE-ConnectionGUID: rnjt7OJMQnWhk5R/iJzyuw==
X-CSE-MsgGUID: xsz8MzL5TrCd598JGeek+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31450468"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 May 2024 05:59:59 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7aiC-000EFN-2w;
	Thu, 16 May 2024 12:59:56 +0000
Date: Thu, 16 May 2024 20:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next 25/27]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:1242:67: error: implicit
 declaration of function 'io_iov_get_page'; did you mean
 'iov_iter_get_pages2'?
Message-ID: <202405162009.sogTdGw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next
head:   8f99f44fc1fabf943cf0d1989f0afdff15e064e8
commit: 26fa2c4456e3c703b1dc7d61ec32180e4e7864d6 [25/27] wip: bnxt
config: i386-buildonly-randconfig-004-20240516 (https://download.01.org/0day-ci/archive/20240516/202405162009.sogTdGw5-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405162009.sogTdGw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405162009.sogTdGw5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/page.h:89,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/net/ethernet/broadcom/bnxt/bnxt.c:11:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function '__bnxt_rx_agg_pages':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:1242:67: error: implicit declaration of function 'io_iov_get_page'; did you mean 'iov_iter_get_pages2'? [-Werror=implicit-function-declaration]
    1242 |                         phys_addr_t page_phys_addr = page_to_phys(io_iov_get_page(netmem));
         |                                                                   ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:19:51: note: in definition of macro '__page_to_pfn'
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                   ^~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:1242:54: note: in expansion of macro 'page_to_phys'
    1242 |                         phys_addr_t page_phys_addr = page_to_phys(io_iov_get_page(netmem));
         |                                                      ^~~~~~~~~~~~
   include/asm-generic/memory_model.h:19:57: error: invalid operands to binary - (have 'int' and 'struct page *')
      19 | #define __page_to_pfn(page)     ((unsigned long)((page) - mem_map) + \
         |                                                  ~~~~~~ ^
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   arch/x86/include/asm/io.h:156:44: note: in expansion of macro 'page_to_pfn'
     156 | #define page_to_phys(page)    ((dma_addr_t)page_to_pfn(page) << PAGE_SHIFT)
         |                                            ^~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:1242:54: note: in expansion of macro 'page_to_phys'
    1242 |                         phys_addr_t page_phys_addr = page_to_phys(io_iov_get_page(netmem));
         |                                                      ^~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_alloc_rx_page_pool':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:3685:47: error: 'io_uring_pp_zc_ops' undeclared (first use in this function)
    3685 |                 pp.queue->mp_params.mp_ops = &io_uring_pp_zc_ops;
         |                                               ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:3685:47: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +1242 drivers/net/ethernet/broadcom/bnxt/bnxt.c

  1197	
  1198	static u32 __bnxt_rx_agg_pages(struct bnxt *bp,
  1199				       struct bnxt_cp_ring_info *cpr,
  1200				       struct skb_shared_info *shinfo,
  1201				       u16 idx, u32 agg_bufs, bool tpa,
  1202				       struct xdp_buff *xdp)
  1203	{
  1204		struct bnxt_napi *bnapi = cpr->bnapi;
  1205		struct pci_dev *pdev = bp->pdev;
  1206		struct bnxt_rx_ring_info *rxr = bnapi->rx_ring;
  1207		u16 prod = rxr->rx_agg_prod;
  1208		u32 i, total_frag_len = 0;
  1209		bool p5_tpa = false;
  1210	
  1211		if ((bp->flags & BNXT_FLAG_CHIP_P5_PLUS) && tpa)
  1212			p5_tpa = true;
  1213	
  1214		for (i = 0; i < agg_bufs; i++) {
  1215			skb_frag_t *frag = &shinfo->frags[i];
  1216			u16 cons, frag_len;
  1217			struct rx_agg_cmp *agg;
  1218			struct bnxt_sw_rx_agg_bd *cons_rx_buf;
  1219			struct page *page;
  1220			dma_addr_t mapping;
  1221			netmem_ref netmem;
  1222	
  1223			if (p5_tpa)
  1224				agg = bnxt_get_tpa_agg_p5(bp, rxr, idx, i);
  1225			else
  1226				agg = bnxt_get_agg(bp, cpr, idx, i);
  1227			cons = agg->rx_agg_cmp_opaque;
  1228			frag_len = (le32_to_cpu(agg->rx_agg_cmp_len_flags_type) &
  1229				    RX_AGG_CMP_LEN) >> RX_AGG_CMP_LEN_SHIFT;
  1230	
  1231			cons_rx_buf = &rxr->rx_agg_ring[cons];
  1232			// NOTE: sets frag->netmem and frag->offset and frag->size
  1233			// page is a netmem, and is net_iov if queue is 1
  1234			// frag->netmem = page_to_netmem(page)
  1235			skb_frag_fill_page_desc(frag, cons_rx_buf->page,
  1236						cons_rx_buf->offset, frag_len);
  1237			if (rxr->zc_enabled) {
  1238				WARN_ON(!skb_frag_is_net_iov(frag));
  1239				netmem = page_to_netmem(cons_rx_buf->page);
  1240				printk(KERN_INFO "----- __bnxt_rx_agg_pages: adding frag=%d, total agg_bufs=%d\n", i, agg_bufs);
  1241				// buf = container_of(netmem_to_net_iov(netmem), struct io_zc_rx_buf, niov);
> 1242				phys_addr_t page_phys_addr = page_to_phys(io_iov_get_page(netmem));
  1243				printk(KERN_INFO "----- __bnxt_rx_agg_pages: Page physical address: %#llx, dma_addr_t: %#lx\n", (unsigned long long)page_phys_addr, netmem_get_dma_addr(netmem));
  1244			}
  1245			shinfo->nr_frags = i + 1;
  1246			__clear_bit(cons, rxr->rx_agg_bmap);
  1247	
  1248			/* It is possible for bnxt_alloc_rx_page() to allocate
  1249			 * a sw_prod index that equals the cons index, so we
  1250			 * need to clear the cons entry now.
  1251			 */
  1252			mapping = cons_rx_buf->mapping;
  1253			// NOTE: page is saved here only for alloc failures
  1254			page = cons_rx_buf->page;
  1255			cons_rx_buf->page = NULL;
  1256	
  1257			if (xdp && page_is_pfmemalloc(page))
  1258				xdp_buff_set_frag_pfmemalloc(xdp);
  1259	
  1260			// NOTE: realloc a page for the nulled out rx_agg_buf
  1261			if (bnxt_alloc_rx_page(bp, rxr, prod, GFP_ATOMIC) != 0) {
  1262				--shinfo->nr_frags;
  1263				cons_rx_buf->page = page;
  1264	
  1265				/* Update prod since possibly some pages have been
  1266				 * allocated already.
  1267				 */
  1268				rxr->rx_agg_prod = prod;
  1269				bnxt_reuse_rx_agg_bufs(cpr, idx, i, agg_bufs - i, tpa);
  1270				return 0;
  1271			}
  1272	
  1273			dma_sync_single_for_cpu(&pdev->dev, mapping, BNXT_RX_PAGE_SIZE,
  1274						bp->rx_dir);
  1275	
  1276			total_frag_len += frag_len;
  1277			prod = NEXT_RX_AGG(prod);
  1278		}
  1279		rxr->rx_agg_prod = prod;
  1280		return total_frag_len;
  1281	}
  1282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
