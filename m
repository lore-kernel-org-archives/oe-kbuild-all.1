Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8110817AAB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691580695; x=1723116695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2o3bEcSkXT8FaeuleLP6WX/oVpGvEzqAJN5et2KNmg=;
  b=MWBJyxZpAJo3vtgYNK0OOAjaFZwtSEEe/gjfB3enqj7wk6aMci35iMZf
   eVthIKrCP2hsT/Qxudc5iSv3lxgUzW+/nKn+rBNiAdiK396WDOA5VElEI
   8SPNRh7NCXfOoFmqNOBizs+NG6RW6xSaPXMwoCbH0aQ8ofMfghgDMD2uI
   TIJCXhtH3uKqcgRIIpyHg3sQ24y0aQGAwDVfSo0YZ4bQKN01VvNwcTTaF
   5b+JO7kKezEOTYYVPue8b4TlQQrHTvM07hYyomTUCQ+B8jddycNOewKvs
   r1xWCOCLW2Seq4ZVLq56KSWvDIq0t2fKIK/FPa8ZzRfwDfmtbOFLX1qKb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368554090"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="368554090"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 04:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="731771500"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="731771500"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 04:31:32 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qThPX-00064b-15;
	Wed, 09 Aug 2023 11:31:31 +0000
Date: Wed, 9 Aug 2023 19:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/virt-to-phys-s390 2/2]
 drivers/net/ethernet/mediatek/mtk_wed.c:341:21: warning: assignment discards
 'const' qualifier from pointer target type
Message-ID: <202308091929.ui1duGgY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-phys-s390
head:   8ecc52ceb357c56a3841a03f5743120a217d08b0
commit: 8ecc52ceb357c56a3841a03f5743120a217d08b0 [2/2] s390/mm: Make virt_to_pfn() a static inline
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230809/202308091929.ui1duGgY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091929.ui1duGgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091929.ui1duGgY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from drivers/net/ethernet/mediatek/mtk_wed.c:5:
   include/linux/mm.h: In function 'lowmem_page_address':
   arch/s390/include/asm/page.h:207:33: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     207 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2120:16: note: in expansion of macro 'page_to_virt'
    2120 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_wed.c: In function 'mtk_wed_tx_buffer_alloc':
>> drivers/net/ethernet/mediatek/mtk_wed.c:341:21: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     341 |                 buf = page_to_virt(page);
         |                     ^
--
   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/smp.h:110,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:35,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:29:
   include/linux/mm.h: In function 'lowmem_page_address':
   arch/s390/include/asm/page.h:207:33: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     207 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2120:16: note: in expansion of macro 'page_to_virt'
    2120 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c: In function 'amdgpu_gart_table_ram_alloc':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:192:24: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     192 |         adev->gart.ptr = page_to_virt(p);
         |                        ^
--
   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from arch/s390/include/asm/timex.h:13,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/skbuff.h:15,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/ethernet/aquantia/atlantic/aq_common.h:13,
                    from drivers/net/ethernet/aquantia/atlantic/aq_main.h:12,
                    from drivers/net/ethernet/aquantia/atlantic/aq_main.c:10:
   include/linux/mm.h: In function 'lowmem_page_address':
   arch/s390/include/asm/page.h:207:33: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     207 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2120:16: note: in expansion of macro 'page_to_virt'
    2120 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   In file included from drivers/net/ethernet/aquantia/atlantic/aq_ptp.h:15,
                    from drivers/net/ethernet/aquantia/atlantic/aq_main.c:14:
   drivers/net/ethernet/aquantia/atlantic/aq_ring.h: In function 'aq_buf_vaddr':
>> drivers/net/ethernet/aquantia/atlantic/aq_ring.h:165:43: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     165 |         return page_to_virt(rxpage->page) + rxpage->pg_off;
--
   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from arch/s390/include/asm/timex.h:13,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/skbuff.h:15,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/ethernet/aquantia/atlantic/hw_atl/../aq_common.h:13,
                    from drivers/net/ethernet/aquantia/atlantic/hw_atl/../aq_hw.h:15,
                    from drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_a0.c:10:
   include/linux/mm.h: In function 'lowmem_page_address':
   arch/s390/include/asm/page.h:207:33: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     207 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2120:16: note: in expansion of macro 'page_to_virt'
    2120 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   In file included from drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_a0.c:12:
   drivers/net/ethernet/aquantia/atlantic/hw_atl/../aq_ring.h: In function 'aq_buf_vaddr':
>> drivers/net/ethernet/aquantia/atlantic/hw_atl/../aq_ring.h:165:43: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     165 |         return page_to_virt(rxpage->page) + rxpage->pg_off;
--
   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:10:
   include/linux/mm.h: In function 'lowmem_page_address':
   arch/s390/include/asm/page.h:207:33: warning: return discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     207 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm.h:2120:16: note: in expansion of macro 'page_to_virt'
    2120 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c: In function 'mvpp2_buf_alloc':
>> drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c:754:22: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     754 |                 data = page_to_virt(page);
         |                      ^


vim +/const +341 drivers/net/ethernet/mediatek/mtk_wed.c

804775dfc2885e Felix Fietkau    2022-04-05  290  
804775dfc2885e Felix Fietkau    2022-04-05  291  static int
4c5de09eb0d05f Lorenzo Bianconi 2022-11-05  292  mtk_wed_tx_buffer_alloc(struct mtk_wed_device *dev)
804775dfc2885e Felix Fietkau    2022-04-05  293  {
804775dfc2885e Felix Fietkau    2022-04-05  294  	struct mtk_wdma_desc *desc;
804775dfc2885e Felix Fietkau    2022-04-05  295  	dma_addr_t desc_phys;
804775dfc2885e Felix Fietkau    2022-04-05  296  	void **page_list;
804775dfc2885e Felix Fietkau    2022-04-05  297  	int token = dev->wlan.token_start;
804775dfc2885e Felix Fietkau    2022-04-05  298  	int ring_size;
804775dfc2885e Felix Fietkau    2022-04-05  299  	int n_pages;
804775dfc2885e Felix Fietkau    2022-04-05  300  	int i, page_idx;
804775dfc2885e Felix Fietkau    2022-04-05  301  
804775dfc2885e Felix Fietkau    2022-04-05  302  	ring_size = dev->wlan.nbuf & ~(MTK_WED_BUF_PER_PAGE - 1);
804775dfc2885e Felix Fietkau    2022-04-05  303  	n_pages = ring_size / MTK_WED_BUF_PER_PAGE;
804775dfc2885e Felix Fietkau    2022-04-05  304  
804775dfc2885e Felix Fietkau    2022-04-05  305  	page_list = kcalloc(n_pages, sizeof(*page_list), GFP_KERNEL);
804775dfc2885e Felix Fietkau    2022-04-05  306  	if (!page_list)
804775dfc2885e Felix Fietkau    2022-04-05  307  		return -ENOMEM;
804775dfc2885e Felix Fietkau    2022-04-05  308  
4c5de09eb0d05f Lorenzo Bianconi 2022-11-05  309  	dev->tx_buf_ring.size = ring_size;
4c5de09eb0d05f Lorenzo Bianconi 2022-11-05  310  	dev->tx_buf_ring.pages = page_list;
804775dfc2885e Felix Fietkau    2022-04-05  311  
804775dfc2885e Felix Fietkau    2022-04-05  312  	desc = dma_alloc_coherent(dev->hw->dev, ring_size * sizeof(*desc),
804775dfc2885e Felix Fietkau    2022-04-05  313  				  &desc_phys, GFP_KERNEL);
804775dfc2885e Felix Fietkau    2022-04-05  314  	if (!desc)
804775dfc2885e Felix Fietkau    2022-04-05  315  		return -ENOMEM;
804775dfc2885e Felix Fietkau    2022-04-05  316  
4c5de09eb0d05f Lorenzo Bianconi 2022-11-05  317  	dev->tx_buf_ring.desc = desc;
4c5de09eb0d05f Lorenzo Bianconi 2022-11-05  318  	dev->tx_buf_ring.desc_phys = desc_phys;
804775dfc2885e Felix Fietkau    2022-04-05  319  
804775dfc2885e Felix Fietkau    2022-04-05  320  	for (i = 0, page_idx = 0; i < ring_size; i += MTK_WED_BUF_PER_PAGE) {
804775dfc2885e Felix Fietkau    2022-04-05  321  		dma_addr_t page_phys, buf_phys;
804775dfc2885e Felix Fietkau    2022-04-05  322  		struct page *page;
804775dfc2885e Felix Fietkau    2022-04-05  323  		void *buf;
804775dfc2885e Felix Fietkau    2022-04-05  324  		int s;
804775dfc2885e Felix Fietkau    2022-04-05  325  
804775dfc2885e Felix Fietkau    2022-04-05  326  		page = __dev_alloc_pages(GFP_KERNEL, 0);
804775dfc2885e Felix Fietkau    2022-04-05  327  		if (!page)
804775dfc2885e Felix Fietkau    2022-04-05  328  			return -ENOMEM;
804775dfc2885e Felix Fietkau    2022-04-05  329  
804775dfc2885e Felix Fietkau    2022-04-05  330  		page_phys = dma_map_page(dev->hw->dev, page, 0, PAGE_SIZE,
804775dfc2885e Felix Fietkau    2022-04-05  331  					 DMA_BIDIRECTIONAL);
804775dfc2885e Felix Fietkau    2022-04-05  332  		if (dma_mapping_error(dev->hw->dev, page_phys)) {
804775dfc2885e Felix Fietkau    2022-04-05  333  			__free_page(page);
804775dfc2885e Felix Fietkau    2022-04-05  334  			return -ENOMEM;
804775dfc2885e Felix Fietkau    2022-04-05  335  		}
804775dfc2885e Felix Fietkau    2022-04-05  336  
804775dfc2885e Felix Fietkau    2022-04-05  337  		page_list[page_idx++] = page;
804775dfc2885e Felix Fietkau    2022-04-05  338  		dma_sync_single_for_cpu(dev->hw->dev, page_phys, PAGE_SIZE,
804775dfc2885e Felix Fietkau    2022-04-05  339  					DMA_BIDIRECTIONAL);
804775dfc2885e Felix Fietkau    2022-04-05  340  
804775dfc2885e Felix Fietkau    2022-04-05 @341  		buf = page_to_virt(page);
804775dfc2885e Felix Fietkau    2022-04-05  342  		buf_phys = page_phys;
804775dfc2885e Felix Fietkau    2022-04-05  343  
804775dfc2885e Felix Fietkau    2022-04-05  344  		for (s = 0; s < MTK_WED_BUF_PER_PAGE; s++) {
804775dfc2885e Felix Fietkau    2022-04-05  345  			u32 txd_size;
4d65f9b6869a75 Felix Fietkau    2022-04-08  346  			u32 ctrl;
804775dfc2885e Felix Fietkau    2022-04-05  347  
804775dfc2885e Felix Fietkau    2022-04-05  348  			txd_size = dev->wlan.init_buf(buf, buf_phys, token++);
804775dfc2885e Felix Fietkau    2022-04-05  349  
4d65f9b6869a75 Felix Fietkau    2022-04-08  350  			desc->buf0 = cpu_to_le32(buf_phys);
4d65f9b6869a75 Felix Fietkau    2022-04-08  351  			desc->buf1 = cpu_to_le32(buf_phys + txd_size);
de84a090d99a3b Lorenzo Bianconi 2022-09-20  352  
de84a090d99a3b Lorenzo Bianconi 2022-09-20  353  			if (dev->hw->version == 1)
4d65f9b6869a75 Felix Fietkau    2022-04-08  354  				ctrl = FIELD_PREP(MTK_WDMA_DESC_CTRL_LEN0, txd_size) |
804775dfc2885e Felix Fietkau    2022-04-05  355  				       FIELD_PREP(MTK_WDMA_DESC_CTRL_LEN1,
804775dfc2885e Felix Fietkau    2022-04-05  356  						  MTK_WED_BUF_SIZE - txd_size) |
804775dfc2885e Felix Fietkau    2022-04-05  357  				       MTK_WDMA_DESC_CTRL_LAST_SEG1;
de84a090d99a3b Lorenzo Bianconi 2022-09-20  358  			else
de84a090d99a3b Lorenzo Bianconi 2022-09-20  359  				ctrl = FIELD_PREP(MTK_WDMA_DESC_CTRL_LEN0, txd_size) |
de84a090d99a3b Lorenzo Bianconi 2022-09-20  360  				       FIELD_PREP(MTK_WDMA_DESC_CTRL_LEN1_V2,
de84a090d99a3b Lorenzo Bianconi 2022-09-20  361  						  MTK_WED_BUF_SIZE - txd_size) |
de84a090d99a3b Lorenzo Bianconi 2022-09-20  362  				       MTK_WDMA_DESC_CTRL_LAST_SEG0;
4d65f9b6869a75 Felix Fietkau    2022-04-08  363  			desc->ctrl = cpu_to_le32(ctrl);
804775dfc2885e Felix Fietkau    2022-04-05  364  			desc->info = 0;
804775dfc2885e Felix Fietkau    2022-04-05  365  			desc++;
804775dfc2885e Felix Fietkau    2022-04-05  366  
804775dfc2885e Felix Fietkau    2022-04-05  367  			buf += MTK_WED_BUF_SIZE;
804775dfc2885e Felix Fietkau    2022-04-05  368  			buf_phys += MTK_WED_BUF_SIZE;
804775dfc2885e Felix Fietkau    2022-04-05  369  		}
804775dfc2885e Felix Fietkau    2022-04-05  370  
804775dfc2885e Felix Fietkau    2022-04-05  371  		dma_sync_single_for_device(dev->hw->dev, page_phys, PAGE_SIZE,
804775dfc2885e Felix Fietkau    2022-04-05  372  					   DMA_BIDIRECTIONAL);
804775dfc2885e Felix Fietkau    2022-04-05  373  	}
804775dfc2885e Felix Fietkau    2022-04-05  374  
804775dfc2885e Felix Fietkau    2022-04-05  375  	return 0;
804775dfc2885e Felix Fietkau    2022-04-05  376  }
804775dfc2885e Felix Fietkau    2022-04-05  377  

:::::: The code at line 341 was first introduced by commit
:::::: 804775dfc2885e93a0a4b35db1914c2cc25172b5 net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)

:::::: TO: Felix Fietkau <nbd@nbd.name>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
