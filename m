Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C032F342C8E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376194; cv=none; b=LmbyPoXEDia/m7VD0isE6wCG6VO7tPlbrktofCJB+Pma403Sg8ObmTiFoYA3uIbwaoYlijPoK3COUTVgW/gqtvM9W7L+l34xJ36zSG9drrBP36LLOwPUVloI1QbqoJXnEdwQyq5bPrt4j63SD28beri6bY6hiCGVVE9t0P8nrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376194; c=relaxed/simple;
	bh=zpHYukj9ipiCTolCPzVGKNpR60Dbz0khnXqmU2g5Fdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZkLSxAgCHYyEVcg05VAPYJeYf7y3Z20Gz+s9CbwJ5mbK3W51plQmZcpJl6b4aibBAGjMwoP8Xj2jkYTtJDTd8FNFrG5yljFp9yTGR4RCoaXTQry7GKcf0wbfx2L7soH96EljhsybnfjZVRV6LUQkTGwZZvc8adt/tmnaIyIYN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjD+e1e2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjD+e1e2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768376189; x=1799912189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zpHYukj9ipiCTolCPzVGKNpR60Dbz0khnXqmU2g5Fdg=;
  b=KjD+e1e2qmMceM/wiA0mRN0HoBTO9K/rMXeIEnONBXLYRX/Py5ckiNsQ
   SxcaZiSOIewg5r7IhVyz4KHDWlxqBXbdrMQ+4/eauW+vHXLQoh+E/C8Vv
   Ll161O4vw7Jz0XXTON2vk2fbtzkEmExy7Ar09Fkvw1nO/JpbNmEf3OAmv
   LUhYMnOmJVt7vd5TR8cahDMbpwh+2+ZyaEhp28Gkm/Ip19/45VszUezWV
   M3da3UNhNHyzQeO0HlAM2pI/8HMNL5L9CgXF9/9eNhSlCoKnQJMc1xVBB
   h9lmfCMQnPrBHQeUfCLYX1UotZ1OOeKN77somD/hpNpy2x//Fgby7iiLY
   g==;
X-CSE-ConnectionGUID: xoMujw1uT0GJblIijnRV6w==
X-CSE-MsgGUID: 4IU4OhdGQQqWp1COYNkqyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69727490"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69727490"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:36:23 -0800
X-CSE-ConnectionGUID: 5RJF+h97QGSp6VpiHWYFCw==
X-CSE-MsgGUID: ZDGyrzeTROCzkBeETNC6kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="208761724"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 23:36:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfvQS-00000000G0S-1v1W;
	Wed, 14 Jan 2026 07:36:20 +0000
Date: Wed, 14 Jan 2026 15:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] dmaengine: introduce dmaengine_bh_wq and bh
 helpers
Message-ID: <202601141510.JE2HHJ51-lkp@intel.com>
References: <20260108080332.2341725-2-allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108080332.2341725-2-allen.lkml@gmail.com>

Hi Allen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on shawnguo/for-next sunxi/sunxi/for-next soc/for-next linus/master v6.19-rc5 next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Allen-Pais/dmaengine-introduce-dmaengine_bh_wq-and-bh-helpers/20260108-164201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260108080332.2341725-2-allen.lkml%40gmail.com
patch subject: [RFC PATCH 1/1] dmaengine: introduce dmaengine_bh_wq and bh helpers
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20260114/202601141510.JE2HHJ51-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141510.JE2HHJ51-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141510.JE2HHJ51-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma/mediatek/mtk-hsdma.c:644:8: error: unknown type name 'irqreturn_t'
     644 | static irqreturn_t mtk_hsdma_irq(int irq, void *devid)
         |        ^~~~~~~~~~~
   drivers/dma/mediatek/mtk-hsdma.c: In function 'mtk_hsdma_irq':
   drivers/dma/mediatek/mtk-hsdma.c:656:16: error: 'IRQ_HANDLED' undeclared (first use in this function)
     656 |         return IRQ_HANDLED;
         |                ^~~~~~~~~~~
   drivers/dma/mediatek/mtk-hsdma.c:656:16: note: each undeclared identifier is reported only once for each function it appears in
   drivers/dma/mediatek/mtk-hsdma.c: In function 'mtk_hsdma_probe':
   drivers/dma/mediatek/mtk-hsdma.c:988:15: error: implicit declaration of function 'devm_request_irq'; did you mean 'devm_request_region'? [-Wimplicit-function-declaration]
     988 |         err = devm_request_irq(&pdev->dev, hsdma->irq,
         |               ^~~~~~~~~~~~~~~~
         |               devm_request_region
   drivers/dma/mediatek/mtk-hsdma.c: In function 'mtk_hsdma_remove':
   drivers/dma/mediatek/mtk-hsdma.c:1030:9: error: implicit declaration of function 'synchronize_irq'; did you mean 'synchronize_srcu'? [-Wimplicit-function-declaration]
    1030 |         synchronize_irq(hsdma->irq);
         |         ^~~~~~~~~~~~~~~
         |         synchronize_srcu
   drivers/dma/mediatek/mtk-hsdma.c: In function 'mtk_hsdma_irq':
>> drivers/dma/mediatek/mtk-hsdma.c:657:1: warning: control reaches end of non-void function [-Wreturn-type]
     657 | }
         | ^
--
   In file included from drivers/dma/sf-pdma/sf-pdma.c:26:
   drivers/dma/sf-pdma/sf-pdma.h:102:41: error: field 'done_tasklet' has incomplete type
     102 |         struct tasklet_struct           done_tasklet;
         |                                         ^~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.h:103:41: error: field 'err_tasklet' has incomplete type
     103 |         struct tasklet_struct           err_tasklet;
         |                                         ^~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_donebh_tasklet':
   drivers/dma/sf-pdma/sf-pdma.c:300:37: error: implicit declaration of function 'from_tasklet' [-Wimplicit-function-declaration]
     300 |         struct sf_pdma_chan *chan = from_tasklet(chan, t, done_tasklet);
         |                                     ^~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:300:59: error: 'done_tasklet' undeclared (first use in this function)
     300 |         struct sf_pdma_chan *chan = from_tasklet(chan, t, done_tasklet);
         |                                                           ^~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:300:59: note: each undeclared identifier is reported only once for each function it appears in
   drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_errbh_tasklet':
   drivers/dma/sf-pdma/sf-pdma.c:324:59: error: 'err_tasklet' undeclared (first use in this function)
     324 |         struct sf_pdma_chan *chan = from_tasklet(chan, t, err_tasklet);
         |                                                           ^~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c: At top level:
   drivers/dma/sf-pdma/sf-pdma.c:344:8: error: unknown type name 'irqreturn_t'
     344 | static irqreturn_t sf_pdma_done_isr(int irq, void *dev_id)
         |        ^~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_done_isr':
   drivers/dma/sf-pdma/sf-pdma.c:355:17: error: implicit declaration of function 'tasklet_hi_schedule' [-Wimplicit-function-declaration]
     355 |                 tasklet_hi_schedule(&chan->done_tasklet);
         |                 ^~~~~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:369:16: error: 'IRQ_HANDLED' undeclared (first use in this function)
     369 |         return IRQ_HANDLED;
         |                ^~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c: At top level:
   drivers/dma/sf-pdma/sf-pdma.c:372:8: error: unknown type name 'irqreturn_t'
     372 | static irqreturn_t sf_pdma_err_isr(int irq, void *dev_id)
         |        ^~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_err_isr':
   drivers/dma/sf-pdma/sf-pdma.c:381:9: error: implicit declaration of function 'tasklet_schedule' [-Wimplicit-function-declaration]
     381 |         tasklet_schedule(&chan->err_tasklet);
         |         ^~~~~~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:383:16: error: 'IRQ_HANDLED' undeclared (first use in this function)
     383 |         return IRQ_HANDLED;
         |                ^~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_irq_init':
   drivers/dma/sf-pdma/sf-pdma.c:413:21: error: implicit declaration of function 'devm_request_irq'; did you mean 'devm_request_region'? [-Wimplicit-function-declaration]
     413 |                 r = devm_request_irq(&pdev->dev, irq, sf_pdma_done_isr, 0,
         |                     ^~~~~~~~~~~~~~~~
         |                     devm_request_region
   drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_setup_chans':
   drivers/dma/sf-pdma/sf-pdma.c:491:17: error: implicit declaration of function 'tasklet_setup'; did you mean 'timer_setup'? [-Wimplicit-function-declaration]
     491 |                 tasklet_setup(&chan->done_tasklet, sf_pdma_donebh_tasklet);
         |                 ^~~~~~~~~~~~~
         |                 timer_setup
   drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_remove':
   drivers/dma/sf-pdma/sf-pdma.c:603:17: error: implicit declaration of function 'devm_free_irq'; did you mean 'devm_free_pages'? [-Wimplicit-function-declaration]
     603 |                 devm_free_irq(&pdev->dev, ch->txirq, ch);
         |                 ^~~~~~~~~~~~~
         |                 devm_free_pages
   drivers/dma/sf-pdma/sf-pdma.c:606:17: error: implicit declaration of function 'tasklet_kill' [-Wimplicit-function-declaration]
     606 |                 tasklet_kill(&ch->vchan.task);
         |                 ^~~~~~~~~~~~
   drivers/dma/sf-pdma/sf-pdma.c:606:40: error: 'struct virt_dma_chan' has no member named 'task'
     606 |                 tasklet_kill(&ch->vchan.task);
         |                                        ^
   drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_err_isr':
>> drivers/dma/sf-pdma/sf-pdma.c:384:1: warning: control reaches end of non-void function [-Wreturn-type]
     384 | }
         | ^
   drivers/dma/sf-pdma/sf-pdma.c: In function 'sf_pdma_done_isr':
   drivers/dma/sf-pdma/sf-pdma.c:370:1: warning: control reaches end of non-void function [-Wreturn-type]
     370 | }
         | ^
--
   drivers/dma/stm32/stm32-dma.c:760:8: error: unknown type name 'irqreturn_t'
     760 | static irqreturn_t stm32_dma_chan_irq(int irq, void *devid)
         |        ^~~~~~~~~~~
   drivers/dma/stm32/stm32-dma.c: In function 'stm32_dma_chan_irq':
   drivers/dma/stm32/stm32-dma.c:813:16: error: 'IRQ_HANDLED' undeclared (first use in this function)
     813 |         return IRQ_HANDLED;
         |                ^~~~~~~~~~~
   drivers/dma/stm32/stm32-dma.c:813:16: note: each undeclared identifier is reported only once for each function it appears in
   drivers/dma/stm32/stm32-dma.c: In function 'stm32_dma_probe':
   drivers/dma/stm32/stm32-dma.c:1669:23: error: implicit declaration of function 'devm_request_irq'; did you mean 'devm_request_region'? [-Wimplicit-function-declaration]
    1669 |                 ret = devm_request_irq(&pdev->dev, chan->irq,
         |                       ^~~~~~~~~~~~~~~~
         |                       devm_request_region
   drivers/dma/stm32/stm32-dma.c: In function 'stm32_dma_chan_irq':
>> drivers/dma/stm32/stm32-dma.c:814:1: warning: control reaches end of non-void function [-Wreturn-type]
     814 | }
         | ^
--
   drivers/dma/stm32/stm32-mdma.c:1399:8: error: unknown type name 'irqreturn_t'
    1399 | static irqreturn_t stm32_mdma_irq_handler(int irq, void *devid)
         |        ^~~~~~~~~~~
   drivers/dma/stm32/stm32-mdma.c: In function 'stm32_mdma_irq_handler':
   drivers/dma/stm32/stm32-mdma.c:1409:24: error: 'IRQ_NONE' undeclared (first use in this function)
    1409 |                 return IRQ_NONE;
         |                        ^~~~~~~~
   drivers/dma/stm32/stm32-mdma.c:1409:24: note: each undeclared identifier is reported only once for each function it appears in
   drivers/dma/stm32/stm32-mdma.c:1478:16: error: 'IRQ_HANDLED' undeclared (first use in this function)
    1478 |         return IRQ_HANDLED;
         |                ^~~~~~~~~~~
   drivers/dma/stm32/stm32-mdma.c: In function 'stm32_mdma_probe':
   drivers/dma/stm32/stm32-mdma.c:1714:15: error: implicit declaration of function 'devm_request_irq'; did you mean 'devm_request_region'? [-Wimplicit-function-declaration]
    1714 |         ret = devm_request_irq(&pdev->dev, dmadev->irq, stm32_mdma_irq_handler,
         |               ^~~~~~~~~~~~~~~~
         |               devm_request_region
   drivers/dma/stm32/stm32-mdma.c: In function 'stm32_mdma_irq_handler':
>> drivers/dma/stm32/stm32-mdma.c:1479:1: warning: control reaches end of non-void function [-Wreturn-type]
    1479 | }
         | ^
--
   drivers/dma/stm32/stm32-dma3.c:1012:8: error: unknown type name 'irqreturn_t'
    1012 | static irqreturn_t stm32_dma3_chan_irq(int irq, void *devid)
         |        ^~~~~~~~~~~
   drivers/dma/stm32/stm32-dma3.c: In function 'stm32_dma3_chan_irq':
   drivers/dma/stm32/stm32-dma3.c:1023:24: error: 'IRQ_NONE' undeclared (first use in this function)
    1023 |                 return IRQ_NONE;
         |                        ^~~~~~~~
   drivers/dma/stm32/stm32-dma3.c:1023:24: note: each undeclared identifier is reported only once for each function it appears in
   drivers/dma/stm32/stm32-dma3.c:1069:16: error: 'IRQ_HANDLED' undeclared (first use in this function)
    1069 |         return IRQ_HANDLED;
         |                ^~~~~~~~~~~
   drivers/dma/stm32/stm32-dma3.c: In function 'stm32_dma3_probe':
   drivers/dma/stm32/stm32-dma3.c:1894:23: error: implicit declaration of function 'devm_request_irq'; did you mean 'devm_request_region'? [-Wimplicit-function-declaration]
    1894 |                 ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
         |                       ^~~~~~~~~~~~~~~~
         |                       devm_request_region
   drivers/dma/stm32/stm32-dma3.c: In function 'stm32_dma3_chan_irq':
>> drivers/dma/stm32/stm32-dma3.c:1070:1: warning: control reaches end of non-void function [-Wreturn-type]
    1070 | }
         | ^


vim +657 drivers/dma/mediatek/mtk-hsdma.c

548c4597e984b7 Sean Wang 2018-03-15  643  
548c4597e984b7 Sean Wang 2018-03-15  644  static irqreturn_t mtk_hsdma_irq(int irq, void *devid)
548c4597e984b7 Sean Wang 2018-03-15  645  {
548c4597e984b7 Sean Wang 2018-03-15  646  	struct mtk_hsdma_device *hsdma = devid;
548c4597e984b7 Sean Wang 2018-03-15  647  
548c4597e984b7 Sean Wang 2018-03-15  648  	/*
548c4597e984b7 Sean Wang 2018-03-15  649  	 * Disable interrupt until all completed PDs are cleaned up in
548c4597e984b7 Sean Wang 2018-03-15  650  	 * mtk_hsdma_free_rooms call.
548c4597e984b7 Sean Wang 2018-03-15  651  	 */
548c4597e984b7 Sean Wang 2018-03-15  652  	mtk_dma_clr(hsdma, MTK_HSDMA_INT_ENABLE, MTK_HSDMA_INT_RXDONE);
548c4597e984b7 Sean Wang 2018-03-15  653  
548c4597e984b7 Sean Wang 2018-03-15  654  	mtk_hsdma_free_rooms_in_ring(hsdma);
548c4597e984b7 Sean Wang 2018-03-15  655  
548c4597e984b7 Sean Wang 2018-03-15  656  	return IRQ_HANDLED;
548c4597e984b7 Sean Wang 2018-03-15 @657  }
548c4597e984b7 Sean Wang 2018-03-15  658  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
