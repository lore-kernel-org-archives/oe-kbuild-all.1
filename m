Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6AA8F44
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 19:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689534338; x=1721070338;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kN3YDa4FCvWYlHYRzSf0WzEGEWLLUJYrUQ9MH+e+PTM=;
  b=aZEWBc9SfNjOd95HEayTOwL2AQPLlTKH11lZuqQADFkMjEKehwerLHgD
   92Q4qkhqwgZM6K9yxAsk7dGDKN2HhMPVJnv7xsqExZcTECB0TSMjZ8EZI
   E4m0KpwfH8wilcY/eqmUoEuPSMExTs4n7Igz5hOmgew/n5xmZXeCL4iaY
   dB0FWhm/epvmUp5xT0azBNaYq/2ShDldHZvv1xNaGZtNDeNR3dB0qDwVr
   ddWw2gGrvOo1dx8PpOB0IPxC+tqTBxB+lO5e+ZYsodvwd0TCYtvEH1LyQ
   /4P3XEr7o4dqFNt/KHNJGn8MPF4+eHV1rRRzk2gNE04Ba1LayCCqSdY+D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="431960231"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="431960231"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 12:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="722971985"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="722971985"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jul 2023 12:05:28 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL73f-0008x6-1g;
	Sun, 16 Jul 2023 19:05:27 +0000
Date: Mon, 17 Jul 2023 03:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:spilt_pp_header 55/55]
 drivers/net/ethernet/freescale/fec_main.c:1484:20: error: implicit
 declaration of function 'page_pool_dev_alloc_pages'; did you mean
 'page_pool_alloc_pages'?
Message-ID: <202307170221.zYY5y3c2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/gestionlin/linux.git spilt_pp_header
head:   11ac8c1959f7eda06a7b987903f37212b490b292
commit: 11ac8c1959f7eda06a7b987903f37212b490b292 [55/55] net:page_pool: split page_pool.h
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230717/202307170221.zYY5y3c2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170221.zYY5y3c2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170221.zYY5y3c2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/fec_main.c: In function 'fec_enet_update_cbd':
>> drivers/net/ethernet/freescale/fec_main.c:1484:20: error: implicit declaration of function 'page_pool_dev_alloc_pages'; did you mean 'page_pool_alloc_pages'? [-Werror=implicit-function-declaration]
    1484 |         new_page = page_pool_dev_alloc_pages(rxq->page_pool);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                    page_pool_alloc_pages
>> drivers/net/ethernet/freescale/fec_main.c:1484:18: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1484 |         new_page = page_pool_dev_alloc_pages(rxq->page_pool);
         |                  ^
>> drivers/net/ethernet/freescale/fec_main.c:1489:21: error: implicit declaration of function 'page_pool_get_dma_addr'; did you mean 'page_pool_get_stats'? [-Werror=implicit-function-declaration]
    1489 |         phys_addr = page_pool_get_dma_addr(new_page) + FEC_ENET_XDP_HEADROOM;
         |                     ^~~~~~~~~~~~~~~~~~~~~~
         |                     page_pool_get_stats
   drivers/net/ethernet/freescale/fec_main.c: In function 'fec_enet_run_xdp':
>> drivers/net/ethernet/freescale/fec_main.c:1523:25: error: implicit declaration of function 'page_pool_put_page'; did you mean 'page_pool_put_page_bulk'? [-Werror=implicit-function-declaration]
    1523 |                         page_pool_put_page(rxq->page_pool, page, sync, true);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         page_pool_put_page_bulk
   drivers/net/ethernet/freescale/fec_main.c: In function 'fec_enet_rx_queue':
>> drivers/net/ethernet/freescale/fec_main.c:1663:25: error: implicit declaration of function 'page_pool_recycle_direct' [-Werror=implicit-function-declaration]
    1663 |                         page_pool_recycle_direct(rxq->page_pool, page);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/freescale/fec_main.c: In function 'fec_enet_free_buffers':
>> drivers/net/ethernet/freescale/fec_main.c:3234:25: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    3234 |                         page_pool_put_full_page(rxq->page_pool, rxq->rx_skb_info[i].page, false);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                         page_pool_put_defragged_page
   drivers/net/ethernet/freescale/fec_main.c: In function 'fec_enet_alloc_rxq_buffers':
   drivers/net/ethernet/freescale/fec_main.c:3348:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    3348 |                 page = page_pool_dev_alloc_pages(rxq->page_pool);
         |                      ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mmio.c:6:
   drivers/net/wireless/mediatek/mt76/mt76.h: In function 'mt76_put_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
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
>> drivers/net/wireless/mediatek/mt76/mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   drivers/net/wireless/mediatek/mt76/dma.c: In function 'mt76_dma_get_buf':
>> drivers/net/wireless/mediatek/mt76/dma.c:414:33: error: implicit declaration of function 'page_pool_get_dma_dir'; did you mean 'page_pool_get_stats'? [-Werror=implicit-function-declaration]
     414 |                                 page_pool_get_dma_dir(q->page_pool));
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 page_pool_get_stats
   drivers/net/wireless/mediatek/mt76/dma.c: In function 'mt76_dma_rx_fill':
>> drivers/net/wireless/mediatek/mt76/dma.c:611:24: error: implicit declaration of function 'page_pool_get_dma_addr'; did you mean 'page_pool_get_stats'? [-Werror=implicit-function-declaration]
     611 |                 addr = page_pool_get_dma_addr(virt_to_head_page(buf)) + offset;
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        page_pool_get_stats
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt76x0/../mt76x02.h:12,
                    from drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h:20,
                    from drivers/net/wireless/mediatek/mt76/mt76x0/usb.c:10:
   drivers/net/wireless/mediatek/mt76/mt76x0/../mt76.h: In function 'mt76_put_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt76x0/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt76x0/../mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt76x0/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
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
>> drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt76x2/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
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
>> drivers/net/wireless/mediatek/mt76/mt7603/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7603/../mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt7603/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
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
>> drivers/net/wireless/mediatek/mt76/mt7615/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7615/../mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt7615/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
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
>> drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7915/../mt76_connac.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h:9,
                    from drivers/net/wireless/mediatek/mt76/mt7915/mmio.c:10:
   drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h: In function 'mt76_put_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   drivers/net/wireless/mediatek/mt76/mt7915/mmio.c: In function 'mt7915_mmio_wed_init_rx_buf':
>> drivers/net/wireless/mediatek/mt76/mt7915/mmio.c:645:24: error: implicit declaration of function 'page_pool_get_dma_addr'; did you mean 'page_pool_get_stats'? [-Werror=implicit-function-declaration]
     645 |                 addr = page_pool_get_dma_addr(virt_to_head_page(buf)) + offset;
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        page_pool_get_stats
>> drivers/net/wireless/mediatek/mt76/mt7915/mmio.c:646:23: error: implicit declaration of function 'page_pool_get_dma_dir'; did you mean 'page_pool_get_stats'? [-Werror=implicit-function-declaration]
     646 |                 dir = page_pool_get_dma_dir(q->page_pool);
         |                       ^~~~~~~~~~~~~~~~~~~~~
         |                       page_pool_get_stats
   cc1: some warnings being treated as errors
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7921/../mt76_connac.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7921/../mt76_connac_mcu.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h:9,
                    from drivers/net/wireless/mediatek/mt76/mt7921/mac.c:7:
   drivers/net/wireless/mediatek/mt76/mt7921/../mt76.h: In function 'mt76_put_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt7921/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7921/../mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt7921/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
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
>> drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h:1450:9: error: implicit declaration of function 'page_pool_put_full_page'; did you mean 'page_pool_put_defragged_page'? [-Werror=implicit-function-declaration]
    1450 |         page_pool_put_full_page(page->pp, page, allow_direct);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         page_pool_put_defragged_page
   drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h: In function 'mt76_get_page_pool_buf':
>> drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h:1458:16: error: implicit declaration of function 'page_pool_dev_alloc_frag'; did you mean 'page_pool_alloc_frag'? [-Werror=implicit-function-declaration]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                page_pool_alloc_frag
>> drivers/net/wireless/mediatek/mt76/mt7996/../mt76.h:1458:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1458 |         page = page_pool_dev_alloc_frag(q->page_pool, offset, size);
         |              ^
   cc1: some warnings being treated as errors
..


vim +1484 drivers/net/ethernet/freescale/fec_main.c

^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1477  
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1478  static void fec_enet_update_cbd(struct fec_enet_priv_rx_q *rxq,
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1479  				struct bufdesc *bdp, int index)
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1480  {
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1481  	struct page *new_page;
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1482  	dma_addr_t phys_addr;
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1483  
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30 @1484  	new_page = page_pool_dev_alloc_pages(rxq->page_pool);
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1485  	WARN_ON(!new_page);
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1486  	rxq->rx_skb_info[index].page = new_page;
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1487  
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1488  	rxq->rx_skb_info[index].offset = FEC_ENET_XDP_HEADROOM;
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30 @1489  	phys_addr = page_pool_get_dma_addr(new_page) + FEC_ENET_XDP_HEADROOM;
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1490  	bdp->cbd_bufaddr = cpu_to_fec32(phys_addr);
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1491  }
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1492  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1493  static u32
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1494  fec_enet_run_xdp(struct fec_enet_private *fep, struct bpf_prog *prog,
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1495  		 struct xdp_buff *xdp, struct fec_enet_priv_rx_q *rxq, int index)
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1496  {
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1497  	unsigned int sync, len = xdp->data_end - xdp->data;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1498  	u32 ret = FEC_ENET_XDP_PASS;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1499  	struct page *page;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1500  	int err;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1501  	u32 act;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1502  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1503  	act = bpf_prog_run_xdp(prog, xdp);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1504  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1505  	/* Due xdp_adjust_tail: DMA sync for_device cover max len CPU touch */
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1506  	sync = xdp->data_end - xdp->data_hard_start - FEC_ENET_XDP_HEADROOM;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1507  	sync = max(sync, len);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1508  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1509  	switch (act) {
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1510  	case XDP_PASS:
6970ef27ff7fd1 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-11  1511  		rxq->stats[RX_XDP_PASS]++;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1512  		ret = FEC_ENET_XDP_PASS;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1513  		break;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1514  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1515  	case XDP_REDIRECT:
6970ef27ff7fd1 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-11  1516  		rxq->stats[RX_XDP_REDIRECT]++;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1517  		err = xdp_do_redirect(fep->netdev, xdp, prog);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1518  		if (!err) {
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1519  			ret = FEC_ENET_XDP_REDIR;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1520  		} else {
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1521  			ret = FEC_ENET_XDP_CONSUMED;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1522  			page = virt_to_head_page(xdp->data);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31 @1523  			page_pool_put_page(rxq->page_pool, page, sync, true);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1524  		}
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1525  		break;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1526  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1527  	default:
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1528  		bpf_warn_invalid_xdp_action(fep->netdev, prog, act);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1529  		fallthrough;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1530  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1531  	case XDP_TX:
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1532  		bpf_warn_invalid_xdp_action(fep->netdev, prog, act);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1533  		fallthrough;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1534  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1535  	case XDP_ABORTED:
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1536  		fallthrough;    /* handle aborts by dropping packet */
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1537  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1538  	case XDP_DROP:
6970ef27ff7fd1 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-11  1539  		rxq->stats[RX_XDP_DROP]++;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1540  		ret = FEC_ENET_XDP_CONSUMED;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1541  		page = virt_to_head_page(xdp->data);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1542  		page_pool_put_page(rxq->page_pool, page, sync, true);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1543  		break;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1544  	}
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1545  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1546  	return ret;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1547  }
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1548  
7355f2760620b3 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1549  /* During a receive, the bd_rx.cur points to the current incoming buffer.
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1550   * When we update through the ring, if the next incoming buffer has
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1551   * not been given to the system, we just set the empty indicator,
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1552   * effectively tossing the packet.
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1553   */
dc975382d2ef36 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-28  1554  static int
4d494cdc92b3b9 drivers/net/ethernet/freescale/fec_main.c Fugang Duan        2014-09-13  1555  fec_enet_rx_queue(struct net_device *ndev, int budget, u16 queue_id)
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1556  {
c556167f819160 drivers/net/fec.c                         Uwe Kleine-König   2011-01-19  1557  	struct fec_enet_private *fep = netdev_priv(ndev);
4d494cdc92b3b9 drivers/net/ethernet/freescale/fec_main.c Fugang Duan        2014-09-13  1558  	struct fec_enet_priv_rx_q *rxq;
2e28532f7e63c3 drivers/net/fec.c                         Sascha Hauer       2009-04-15  1559  	struct bufdesc *bdp;
0e702ab38b0eed drivers/net/fec.c                         Greg Ungerer       2006-06-27  1560  	unsigned short status;
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1561  	struct  sk_buff *skb;
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1562  	ushort	pkt_len;
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1563  	__u8 *data;
dc975382d2ef36 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-28  1564  	int	pkt_received = 0;
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1565  	struct	bufdesc_ex *ebdp = NULL;
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1566  	bool	vlan_packet_rcvd = false;
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1567  	u16	vlan_tag;
d842a31f121ecc drivers/net/ethernet/freescale/fec_main.c Duan Fugang-B38611 2013-11-14  1568  	int	index = 0;
6b7e4008389c8c drivers/net/ethernet/freescale/fec_main.c Lothar Waßmann     2014-11-17  1569  	bool	need_swap = fep->quirks & FEC_QUIRK_SWAP_FRAME;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1570  	struct bpf_prog *xdp_prog = READ_ONCE(fep->xdp_prog);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1571  	u32 ret, xdp_result = FEC_ENET_XDP_PASS;
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1572  	u32 data_start = FEC_ENET_XDP_HEADROOM;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1573  	struct xdp_buff xdp;
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1574  	struct page *page;
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1575  	u32 sub_len = 4;
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1576  
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1577  #if !defined(CONFIG_M5272)
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1578  	/*If it has the FEC_QUIRK_HAS_RACC quirk property, the bit of
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1579  	 * FEC_RACC_SHIFT16 is set by default in the probe function.
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1580  	 */
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1581  	if (fep->quirks & FEC_QUIRK_HAS_RACC) {
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1582  		data_start += 2;
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1583  		sub_len += 2;
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1584  	}
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1585  #endif
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1586  
0e702ab38b0eed drivers/net/fec.c                         Greg Ungerer       2006-06-27  1587  #ifdef CONFIG_M532x
0e702ab38b0eed drivers/net/fec.c                         Greg Ungerer       2006-06-27  1588  	flush_cache_all();
0e702ab38b0eed drivers/net/fec.c                         Greg Ungerer       2006-06-27  1589  #endif
4d494cdc92b3b9 drivers/net/ethernet/freescale/fec_main.c Fugang Duan        2014-09-13  1590  	rxq = fep->rx_queue[queue_id];
0e702ab38b0eed drivers/net/fec.c                         Greg Ungerer       2006-06-27  1591  
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1592  	/* First, grab all of the stats for the incoming packet.
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1593  	 * These get messed up if we get called due to a busy condition.
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1594  	 */
7355f2760620b3 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1595  	bdp = rxq->bd.cur;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1596  	xdp_init_buff(&xdp, PAGE_SIZE, &rxq->xdp_rxq);
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1597  
5cfa30397bc367 drivers/net/ethernet/freescale/fec_main.c Johannes Berg      2016-01-24  1598  	while (!((status = fec16_to_cpu(bdp->cbd_sc)) & BD_ENET_RX_EMPTY)) {
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1599  
dc975382d2ef36 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-28  1600  		if (pkt_received >= budget)
dc975382d2ef36 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-28  1601  			break;
dc975382d2ef36 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-28  1602  		pkt_received++;
dc975382d2ef36 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-28  1603  
b5bd95d17102b6 drivers/net/ethernet/freescale/fec_main.c Joakim Zhang       2021-12-06  1604  		writel(FEC_ENET_RXF_GET(queue_id), fep->hwp + FEC_IEVENT);
db3421c114cfa6 drivers/net/ethernet/freescale/fec_main.c Russell King       2014-07-08  1605  
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1606  		/* Check for errors. */
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1607  		status ^= BD_ENET_RX_LAST;
0e702ab38b0eed drivers/net/fec.c                         Greg Ungerer       2006-06-27  1608  		if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH | BD_ENET_RX_NO |
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1609  			   BD_ENET_RX_CR | BD_ENET_RX_OV | BD_ENET_RX_LAST |
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1610  			   BD_ENET_RX_CL)) {
c556167f819160 drivers/net/fec.c                         Uwe Kleine-König   2011-01-19  1611  			ndev->stats.rx_errors++;
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1612  			if (status & BD_ENET_RX_OV) {
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1613  				/* FIFO overrun */
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1614  				ndev->stats.rx_fifo_errors++;
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1615  				goto rx_processing_done;
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1616  			}
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1617  			if (status & (BD_ENET_RX_LG | BD_ENET_RX_SH
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1618  						| BD_ENET_RX_LAST)) {
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1619  				/* Frame too long or too short. */
c556167f819160 drivers/net/fec.c                         Uwe Kleine-König   2011-01-19  1620  				ndev->stats.rx_length_errors++;
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1621  				if (status & BD_ENET_RX_LAST)
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1622  					netdev_err(ndev, "rcv is not +last\n");
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1623  			}
0e702ab38b0eed drivers/net/fec.c                         Greg Ungerer       2006-06-27  1624  			if (status & BD_ENET_RX_CR)	/* CRC Error */
c556167f819160 drivers/net/fec.c                         Uwe Kleine-König   2011-01-19  1625  				ndev->stats.rx_crc_errors++;
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1626  			/* Report late collisions as a frame error. */
095098e194d135 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1627  			if (status & (BD_ENET_RX_NO | BD_ENET_RX_CL))
c556167f819160 drivers/net/fec.c                         Uwe Kleine-König   2011-01-19  1628  				ndev->stats.rx_frame_errors++;
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1629  			goto rx_processing_done;
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1630  		}
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1631  
22f6b860da25ab drivers/net/fec.c                         Sascha Hauer       2009-04-15  1632  		/* Process the incoming frame. */
c556167f819160 drivers/net/fec.c                         Uwe Kleine-König   2011-01-19  1633  		ndev->stats.rx_packets++;
5cfa30397bc367 drivers/net/ethernet/freescale/fec_main.c Johannes Berg      2016-01-24  1634  		pkt_len = fec16_to_cpu(bdp->cbd_datlen);
c556167f819160 drivers/net/fec.c                         Uwe Kleine-König   2011-01-19  1635  		ndev->stats.rx_bytes += pkt_len;
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1636  
7355f2760620b3 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1637  		index = fec_enet_get_bd_index(bdp, &rxq->bd);
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1638  		page = rxq->rx_skb_info[index].page;
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1639  		dma_sync_single_for_cpu(&fep->pdev->dev,
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1640  					fec32_to_cpu(bdp->cbd_bufaddr),
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1641  					pkt_len,
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1642  					DMA_FROM_DEVICE);
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1643  		prefetch(page_address(page));
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1644  		fec_enet_update_cbd(rxq, bdp, index);
1b7bde6d659d30 drivers/net/ethernet/freescale/fec_main.c Nimrod Andy        2014-09-30  1645  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1646  		if (xdp_prog) {
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1647  			xdp_buff_clear_frags_flag(&xdp);
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1648  			/* subtract 16bit shift and FCS */
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1649  			xdp_prepare_buff(&xdp, page_address(page),
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1650  					 data_start, pkt_len - sub_len, false);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1651  			ret = fec_enet_run_xdp(fep, xdp_prog, &xdp, rxq, index);
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1652  			xdp_result |= ret;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1653  			if (ret != FEC_ENET_XDP_PASS)
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1654  				goto rx_processing_done;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1655  		}
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1656  
1b7bde6d659d30 drivers/net/ethernet/freescale/fec_main.c Nimrod Andy        2014-09-30  1657  		/* The packet length includes FCS, but we don't want to
1b7bde6d659d30 drivers/net/ethernet/freescale/fec_main.c Nimrod Andy        2014-09-30  1658  		 * include that when passing upstream as it messes up
1b7bde6d659d30 drivers/net/ethernet/freescale/fec_main.c Nimrod Andy        2014-09-30  1659  		 * bridging applications.
1b7bde6d659d30 drivers/net/ethernet/freescale/fec_main.c Nimrod Andy        2014-09-30  1660  		 */
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1661  		skb = build_skb(page_address(page), PAGE_SIZE);
19e72b064fc32c drivers/net/ethernet/freescale/fec_main.c Wei Fang           2022-12-19  1662  		if (unlikely(!skb)) {
19e72b064fc32c drivers/net/ethernet/freescale/fec_main.c Wei Fang           2022-12-19 @1663  			page_pool_recycle_direct(rxq->page_pool, page);
19e72b064fc32c drivers/net/ethernet/freescale/fec_main.c Wei Fang           2022-12-19  1664  			ndev->stats.rx_dropped++;
19e72b064fc32c drivers/net/ethernet/freescale/fec_main.c Wei Fang           2022-12-19  1665  
19e72b064fc32c drivers/net/ethernet/freescale/fec_main.c Wei Fang           2022-12-19  1666  			netdev_err_once(ndev, "build_skb failed!\n");
19e72b064fc32c drivers/net/ethernet/freescale/fec_main.c Wei Fang           2022-12-19  1667  			goto rx_processing_done;
19e72b064fc32c drivers/net/ethernet/freescale/fec_main.c Wei Fang           2022-12-19  1668  		}
19e72b064fc32c drivers/net/ethernet/freescale/fec_main.c Wei Fang           2022-12-19  1669  
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1670  		skb_reserve(skb, data_start);
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1671  		skb_put(skb, pkt_len - sub_len);
95698ff6177b5f drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-09-30  1672  		skb_mark_for_recycle(skb);
3ac72b7b63d57b drivers/net/ethernet/freescale/fec_main.c Eric Nelson        2016-09-24  1673  
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1674  		if (unlikely(need_swap)) {
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1675  			data = page_address(page) + FEC_ENET_XDP_HEADROOM;
235bde1ed3f0ff drivers/net/ethernet/freescale/fec_main.c Fabio Estevam      2016-10-21  1676  			swap_buffer(data, pkt_len);
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1677  		}
6c8fae0caf5dd8 drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-11-03  1678  		data = skb->data;
3ac72b7b63d57b drivers/net/ethernet/freescale/fec_main.c Eric Nelson        2016-09-24  1679  
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1680  		/* Extract the enhanced buffer descriptor */
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1681  		ebdp = NULL;
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1682  		if (fep->bufdesc_ex)
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1683  			ebdp = (struct bufdesc_ex *)bdp;
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1684  
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1685  		/* If this is a VLAN packet remove the VLAN Tag */
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1686  		vlan_packet_rcvd = false;
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1687  		if ((ndev->features & NETIF_F_HW_VLAN_CTAG_RX) &&
5cfa30397bc367 drivers/net/ethernet/freescale/fec_main.c Johannes Berg      2016-01-24  1688  		    fep->bufdesc_ex &&
5cfa30397bc367 drivers/net/ethernet/freescale/fec_main.c Johannes Berg      2016-01-24  1689  		    (ebdp->cbd_esc & cpu_to_fec32(BD_ENET_RX_VLAN))) {
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1690  			/* Push and remove the vlan tag */
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1691  			struct vlan_hdr *vlan_header =
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1692  					(struct vlan_hdr *) (data + ETH_HLEN);
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1693  			vlan_tag = ntohs(vlan_header->h_vlan_TCI);
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1694  
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1695  			vlan_packet_rcvd = true;
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1696  
af5cbc9822f6bb drivers/net/ethernet/freescale/fec_main.c Nimrod Andy        2015-03-10  1697  			memmove(skb->data + VLAN_HLEN, data, ETH_ALEN * 2);
1b7bde6d659d30 drivers/net/ethernet/freescale/fec_main.c Nimrod Andy        2014-09-30  1698  			skb_pull(skb, VLAN_HLEN);
1b7bde6d659d30 drivers/net/ethernet/freescale/fec_main.c Nimrod Andy        2014-09-30  1699  		}
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1700  
c556167f819160 drivers/net/fec.c                         Uwe Kleine-König   2011-01-19  1701  		skb->protocol = eth_type_trans(skb, ndev);
ff43da86c69d76 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-03  1702  
6605b730c061f6 drivers/net/ethernet/freescale/fec.c      Frank Li           2012-10-30  1703  		/* Get receive timestamp from the skb */
bfd4ecdd87d350 drivers/net/ethernet/freescale/fec_main.c Russell King       2014-07-08  1704  		if (fep->hwts_rx_en && fep->bufdesc_ex)
5cfa30397bc367 drivers/net/ethernet/freescale/fec_main.c Johannes Berg      2016-01-24  1705  			fec_enet_hwtstamp(fep, fec32_to_cpu(ebdp->ts),
bfd4ecdd87d350 drivers/net/ethernet/freescale/fec_main.c Russell King       2014-07-08  1706  					  skb_hwtstamps(skb));
ff43da86c69d76 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-03  1707  
4c09eed9dc422e drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-04-19  1708  		if (fep->bufdesc_ex &&
4c09eed9dc422e drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-04-19  1709  		    (fep->csum_flags & FLAG_RX_CSUM_ENABLED)) {
5cfa30397bc367 drivers/net/ethernet/freescale/fec_main.c Johannes Berg      2016-01-24  1710  			if (!(ebdp->cbd_esc & cpu_to_fec32(FLAG_RX_CSUM_ERROR))) {
4c09eed9dc422e drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-04-19  1711  				/* don't check it */
4c09eed9dc422e drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-04-19  1712  				skb->ip_summed = CHECKSUM_UNNECESSARY;
4c09eed9dc422e drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-04-19  1713  			} else {
4c09eed9dc422e drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-04-19  1714  				skb_checksum_none_assert(skb);
4c09eed9dc422e drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-04-19  1715  			}
4c09eed9dc422e drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-04-19  1716  		}
4c09eed9dc422e drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-04-19  1717  
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1718  		/* Handle received VLAN packets */
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1719  		if (vlan_packet_rcvd)
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1720  			__vlan_hwaccel_put_tag(skb,
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1721  					       htons(ETH_P_8021Q),
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1722  					       vlan_tag);
cdffcf1bc72103 drivers/net/ethernet/freescale/fec_main.c Jim Baxter         2013-07-02  1723  
7cdaa4cc4bdfa2 drivers/net/ethernet/freescale/fec_main.c Tobias Waldekranz  2020-07-03  1724  		skb_record_rx_queue(skb, queue_id);
dc975382d2ef36 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-28  1725  		napi_gro_receive(&fep->napi, skb);
f0b3fbeae11a52 drivers/net/fec.c                         Sascha Hauer       2009-04-15  1726  
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1727  rx_processing_done:
22f6b860da25ab drivers/net/fec.c                         Sascha Hauer       2009-04-15  1728  		/* Clear the status flags for this buffer */
0e702ab38b0eed drivers/net/fec.c                         Greg Ungerer       2006-06-27  1729  		status &= ~BD_ENET_RX_STATS;
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1730  
22f6b860da25ab drivers/net/fec.c                         Sascha Hauer       2009-04-15  1731  		/* Mark the buffer empty */
0e702ab38b0eed drivers/net/fec.c                         Greg Ungerer       2006-06-27  1732  		status |= BD_ENET_RX_EMPTY;
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1733  
ff43da86c69d76 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-03  1734  		if (fep->bufdesc_ex) {
ff43da86c69d76 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-03  1735  			struct bufdesc_ex *ebdp = (struct bufdesc_ex *)bdp;
ff43da86c69d76 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-03  1736  
5cfa30397bc367 drivers/net/ethernet/freescale/fec_main.c Johannes Berg      2016-01-24  1737  			ebdp->cbd_esc = cpu_to_fec32(BD_ENET_RX_INT);
ff43da86c69d76 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-03  1738  			ebdp->cbd_prot = 0;
ff43da86c69d76 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-03  1739  			ebdp->cbd_bdu = 0;
ff43da86c69d76 drivers/net/ethernet/freescale/fec.c      Frank Li           2013-01-03  1740  		}
be293467b87c30 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1741  		/* Make sure the updates to rest of the descriptor are
be293467b87c30 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1742  		 * performed before transferring ownership.
be293467b87c30 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1743  		 */
be293467b87c30 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1744  		wmb();
be293467b87c30 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1745  		bdp->cbd_sc = cpu_to_fec16(status);
6605b730c061f6 drivers/net/ethernet/freescale/fec.c      Frank Li           2012-10-30  1746  
22f6b860da25ab drivers/net/fec.c                         Sascha Hauer       2009-04-15  1747  		/* Update BD pointer to next entry */
7355f2760620b3 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1748  		bdp = fec_enet_get_nextdesc(bdp, &rxq->bd);
36e24e2ee29e25 drivers/net/ethernet/freescale/fec_main.c Duan Fugang-B38611 2013-09-03  1749  
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1750  		/* Doing this here will keep the FEC running while we process
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1751  		 * incoming frames.  On a heavily loaded network, we should be
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1752  		 * able to keep up at the expense of system resources.
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1753  		 */
53bb20d1fabacc drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1754  		writel(0, rxq->bd.reg_desc_active);
4d494cdc92b3b9 drivers/net/ethernet/freescale/fec_main.c Fugang Duan        2014-09-13  1755  	}
7355f2760620b3 drivers/net/ethernet/freescale/fec_main.c Troy Kisky         2016-02-05  1756  	rxq->bd.cur = bdp;
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1757  
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1758  	if (xdp_result & FEC_ENET_XDP_REDIR)
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1759  		xdp_do_flush_map();
6d6b39f180b83d drivers/net/ethernet/freescale/fec_main.c Shenwei Wang       2022-10-31  1760  
4d494cdc92b3b9 drivers/net/ethernet/freescale/fec_main.c Fugang Duan        2014-09-13  1761  	return pkt_received;
22f6b860da25ab drivers/net/fec.c                         Sascha Hauer       2009-04-15  1762  }
^1da177e4c3f41 drivers/net/fec.c                         Linus Torvalds     2005-04-16  1763  

:::::: The code at line 1484 was first introduced by commit
:::::: 95698ff6177b5f1f13f251da60e7348413046ae4 net: fec: using page pool to manage RX buffers

:::::: TO: Shenwei Wang <shenwei.wang@nxp.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
