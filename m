Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5261BEA0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689530669; x=1721066669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wpB8XP5tUVEkFSWY/CAz5swlOgOzdr4TwxvmENYHpQI=;
  b=Zv7MoZDIwfyu3pg60kK9QbH1flbe60p/C3ksx9av7RgD4un688+ev8On
   AtAZD+8jG12c9XMEKyH4TobeTzJUUYvj2YzQ6J81KgGT5ZI+i2Gt6lzXA
   Nc9OQJl45/u7wdUMmHQ3ySZnSzdgCYxs2i5HXXPj4gF9TfWNZu9IxP8Pv
   5FnZaCV4GqVoKWl57r8XcXfoqCtAk7OKVg+xAUM6QYtAM/9vn5C0uUJJ+
   YI+Ikv56DLey+mXkd03FQXOIv5oq9Q9+RgdeJ51B5olOeZY6F2x3v1H1k
   f3XKY0w6+rZOWJfXEFqy8lzoc0n5/qCSEF0sj0L7i3r3Wsg2WcAkXAyIg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="369329513"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="369329513"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 11:04:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="700266821"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="700266821"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Jul 2023 11:04:27 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL66c-0008vi-2N;
	Sun, 16 Jul 2023 18:04:26 +0000
Date: Mon, 17 Jul 2023 02:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:spilt_pp_header 55/55]
 drivers/net/ethernet/engleder/tsnep_main.c:1025:36: warning: assignment to
 'struct page *' from 'int' makes pointer from integer without a cast
Message-ID: <202307170126.Z9WNVtmG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git spilt_pp_header
head:   11ac8c1959f7eda06a7b987903f37212b490b292
commit: 11ac8c1959f7eda06a7b987903f37212b490b292 [55/55] net:page_pool: split page_pool.h
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230717/202307170126.Z9WNVtmG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170126.Z9WNVtmG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170126.Z9WNVtmG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/engleder/tsnep_main.c: In function 'tsnep_xdp_tx_map':
   drivers/net/ethernet/engleder/tsnep_main.c:586:31: error: implicit declaration of function 'page_pool_get_dma_addr'; did you mean 'page_pool_get_stats'? [-Werror=implicit-function-declaration]
     586 |                         dma = page_pool_get_dma_addr(page);
         |                               ^~~~~~~~~~~~~~~~~~~~~~
         |                               page_pool_get_stats
   drivers/net/ethernet/engleder/tsnep_main.c: In function 'tsnep_rx_ring_cleanup':
   drivers/net/ethernet/engleder/tsnep_main.c:885:25: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
     885 |                         page_pool_put_full_page(rx->page_pool, entry->page,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                         page_pool_put_defragged_page
   drivers/net/ethernet/engleder/tsnep_main.c: In function 'tsnep_rx_alloc_page_buffer':
   drivers/net/ethernet/engleder/tsnep_main.c:1025:38: error: implicit declaration of function 'page_pool_dev_alloc_pages'; did you mean 'page_pool_alloc_pages'? [-Werror=implicit-function-declaration]
    1025 |                 rx->page_buffer[i] = page_pool_dev_alloc_pages(rx->page_pool);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      page_pool_alloc_pages
>> drivers/net/ethernet/engleder/tsnep_main.c:1025:36: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1025 |                 rx->page_buffer[i] = page_pool_dev_alloc_pages(rx->page_pool);
         |                                    ^
   drivers/net/ethernet/engleder/tsnep_main.c: In function 'tsnep_rx_alloc_buffer':
   drivers/net/ethernet/engleder/tsnep_main.c:1050:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1050 |         page = page_pool_dev_alloc_pages(rx->page_pool);
         |              ^
   drivers/net/ethernet/engleder/tsnep_main.c: In function 'tsnep_xdp_run_prog':
   drivers/net/ethernet/engleder/tsnep_main.c:1241:17: error: implicit declaration of function 'page_pool_put_page'; did you mean 'page_pool_put_page_bulk'? [-Werror=implicit-function-declaration]
    1241 |                 page_pool_put_page(rx->page_pool, virt_to_head_page(xdp->data),
         |                 ^~~~~~~~~~~~~~~~~~
         |                 page_pool_put_page_bulk
   drivers/net/ethernet/engleder/tsnep_main.c: In function 'tsnep_rx_page':
   drivers/net/ethernet/engleder/tsnep_main.c:1345:17: error: implicit declaration of function 'page_pool_recycle_direct' [-Werror=implicit-function-declaration]
    1345 |                 page_pool_recycle_direct(rx->page_pool, page);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/engleder/tsnep_main.c: In function 'tsnep_rx_poll':
   drivers/net/ethernet/engleder/tsnep_main.c:1367:19: error: implicit declaration of function 'page_pool_get_dma_dir'; did you mean 'page_pool_get_stats'? [-Werror=implicit-function-declaration]
    1367 |         dma_dir = page_pool_get_dma_dir(rx->page_pool);
         |                   ^~~~~~~~~~~~~~~~~~~~~
         |                   page_pool_get_stats
   drivers/net/ethernet/engleder/tsnep_main.c: In function 'tsnep_rx_poll_zc':
   drivers/net/ethernet/engleder/tsnep_main.c:1544:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1544 |                 page = page_pool_dev_alloc_pages(rx->page_pool);
         |                      ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mmio.c:6:
   drivers/net/wireless/mediatek/mt76/mt76.h: In function 'mt76_put_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt76.h: In function 'mt76_get_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/dma.c:7:
   drivers/net/wireless/mediatek/mt76/mt76.h: In function 'mt76_put_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt76.h: In function 'mt76_get_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   drivers/net/wireless/mediatek/mt76/dma.c: In function 'mt76_dma_get_buf':
   drivers/net/wireless/mediatek/mt76/dma.c:414:33: error: implicit declaration of function 'page_pool_get_dma_dir'; did you mean 'page_pool_get_stats'? [-Werror=implicit-function-declaration]
     414 |                                 page_pool_get_dma_dir(q->page_pool));
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 page_pool_get_stats
   drivers/net/wireless/mediatek/mt76/dma.c: In function 'mt76_dma_rx_fill':
   drivers/net/wireless/mediatek/mt76/dma.c:611:24: error: implicit declaration of function 'page_pool_get_dma_addr'; did you mean 'page_pool_get_stats'? [-Werror=implicit-function-declaration]
     611 |                 addr = page_pool_get_dma_addr(virt_to_head_page(buf)) + offset;
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        page_pool_get_stats
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt76x0/../mt76x02.h:12,
                    from drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h:20,
                    from drivers/net/wireless/mediatek/mt76/mt76x0/usb.c:10:
   drivers/net/wireless/mediatek/mt76/mt76x0/../mt76.h: In function 'mt76_put_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt76x0/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt76x0/../mt76.h: In function 'mt76_get_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt76x0/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt76x0/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt76x2/../mt76x02.h:12,
                    from drivers/net/wireless/mediatek/mt76/mt76x2/mt76x2.h:23,
                    from drivers/net/wireless/mediatek/mt76/mt76x2/eeprom.c:9:
   drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h: In function 'mt76_put_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h: In function 'mt76_get_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h:8,
                    from drivers/net/wireless/mediatek/mt76/mt7603/pci.c:7:
   drivers/net/wireless/mediatek/mt76/mt7603/../mt76.h: In function 'mt76_put_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7603/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7603/../mt76.h: In function 'mt76_get_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7603/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt7603/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7615/../mt76_connac.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7615/../mt76_connac_mcu.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h:11,
                    from drivers/net/wireless/mediatek/mt76/mt7615/main.c:12:
   drivers/net/wireless/mediatek/mt76/mt7615/../mt76.h: In function 'mt76_put_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7615/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7615/../mt76.h: In function 'mt76_get_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7615/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt7615/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7915/../mt76_connac.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h:9,
                    from drivers/net/wireless/mediatek/mt76/mt7915/pci.c:11:
   drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h: In function 'mt76_put_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h: In function 'mt76_get_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7921/../mt76_connac.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7921/../mt76_connac_mcu.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h:9,
                    from drivers/net/wireless/mediatek/mt76/mt7921/mac.c:7:
   drivers/net/wireless/mediatek/mt76/mt7921/../mt76.h: In function 'mt76_put_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7921/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7921/../mt76.h: In function 'mt76_get_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7921/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt7921/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7996/../mt76_connac.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h:11,
                    from drivers/net/wireless/mediatek/mt76/mt7996/pci.c:10:
   drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h: In function 'mt76_put_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h: In function 'mt76_get_page_pool_buf':
   drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors


vim +1025 drivers/net/ethernet/engleder/tsnep_main.c

3fc2333933fdf1 Gerhard Engleder 2023-04-21  1016  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1017  static int tsnep_rx_alloc_page_buffer(struct tsnep_rx *rx)
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1018  {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1019  	int i;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1020  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1021  	/* alloc for all ring entries except the last one, because ring cannot
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1022  	 * be filled completely
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1023  	 */
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1024  	for (i = 0; i < TSNEP_RING_SIZE - 1; i++) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21 @1025  		rx->page_buffer[i] = page_pool_dev_alloc_pages(rx->page_pool);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1026  		if (!rx->page_buffer[i]) {
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1027  			tsnep_rx_free_page_buffer(rx);
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1028  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1029  			return -ENOMEM;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1030  		}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1031  	}
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1032  
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1033  	return 0;
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1034  }
3fc2333933fdf1 Gerhard Engleder 2023-04-21  1035  

:::::: The code at line 1025 was first introduced by commit
:::::: 3fc2333933fdf1148b694d15db824e10449ecbc1 tsnep: Add XDP socket zero-copy RX support

:::::: TO: Gerhard Engleder <gerhard@engleder-embedded.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
