Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2F5EA0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 18:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689530609; x=1721066609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A5cTc/seORw6t8udneUcL63USVe4zQjBiNlKamnikbs=;
  b=l6ky2+BewUKUFtSFaToSgU2Y8s8A6c8YYSuKwVBTiEBYRFjfxciGBKL7
   ws/srv32/TWp93MxPdZ1tnr+SPHPdSqP1+eCd36alQpCliKUIR771CB96
   3WUETte1bZPQ2pcEwWciMk+2I63hDGgWx4Ho8ezyBZAzKieV+XPuJ95N0
   AzewQEg57V4xbrwBrlOYOO3lBvbUq05gvQPEW10F1RO8hlYEDgx8H1phk
   iEpAE1+4I9qT3j/WDNWGWYAAmmieS8rkzPz+eiuuS3L+wyAAgzblPVdKE
   KLyJ+WGeyWL+kMYFsjoILMXzrNuiMGsbcx1XQ7ProdjsdDjG+SRSPHjiZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="431954162"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="431954162"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 11:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="896966366"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="896966366"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jul 2023 11:03:27 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL65e-0008vc-28;
	Sun, 16 Jul 2023 18:03:26 +0000
Date: Mon, 17 Jul 2023 02:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:spilt_pp_header 55/55]
 drivers/net/ethernet/engleder/tsnep_main.c:1025:36: warning: assignment to
 'struct page *' from 'int' makes pointer from integer without a cast
Message-ID: <202307170113.wMSbnI25-lkp@intel.com>
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
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230717/202307170113.wMSbnI25-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170113.wMSbnI25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170113.wMSbnI25-lkp@intel.com/

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
