Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61253263C7F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763884151; cv=none; b=kvyKoIclqLliTIxDSK3Qj3d7e7Ndd6UYNCH5GSJLbIuCQaVeYfJNnMwRomcTEnumxpjOw7fvXt2kb5+4+/rB9XgBoqpCG7TpSRHznhs7hPSV3hkY2P9ZGf6Wb6uNvtNipSYK9MeaiO+/TtZRBqZh70Zjtp34keLQ4v3VhZCAYow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763884151; c=relaxed/simple;
	bh=7OKq6eD9qCYdodKKyM/oAH/5dIByDMEReb2cC+xzbtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JihGRqEqS8XAxizTcYkouzuWaOhM+VEU70XDmpCX1/6IDc19vzT5F2KzcTxvt4RIS6BV//xrDRzKfOlpOhiiWecR6ho1vQxssebA4DGXbrsCsFNERRRIX+6GSds3FAjgJmcaxgTqHG4M9LC8Qsghz31x9/xjov6n82Y7gomsHv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KoqzAXeI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KoqzAXeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763884149; x=1795420149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7OKq6eD9qCYdodKKyM/oAH/5dIByDMEReb2cC+xzbtI=;
  b=KoqzAXeIiopPaE8uHPSM8kRmYNMh6ehX6zPgzamhk1joezllLPwi/rcg
   1uFgoiyOqIRPxXJOsCPeAnwaJB15ZJen2uVKaq+e8TQurNw0YXB00+oxz
   RREGsbgDrQEoJCdQF+LMt+5xs64WCWhiLhqaCHVYk3wCvTprx8JTQlN7b
   FEWj04MUEJ5dpN7Q42C1/zTcMyBTnXVmGLBjsvEB5LeuYTJe7qQKxFnEq
   tEDOoPcbmYLQon4VyPkg/o506HZWL1xaitNr+evXg+pqmeLbW/i5Afdel
   TzNqBKz/g/h7h5osy3f0VRtcCb2qcrLt9DbqrDbqvHK9ShV8MlOAtul5Z
   w==;
X-CSE-ConnectionGUID: zi3vw8zwReOm5Kvk/oai8w==
X-CSE-MsgGUID: IJ8bvlgfRU2jkleUmSHWZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77027961"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="77027961"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 23:49:07 -0800
X-CSE-ConnectionGUID: B0L8kTjzTr2A7yB6AfGDTQ==
X-CSE-MsgGUID: x4GdReTPTAalsWJH/LebKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="196984750"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Nov 2025 23:49:06 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN4qF-00088O-1s;
	Sun, 23 Nov 2025 07:49:03 +0000
Date: Sun, 23 Nov 2025 15:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 17/49]
 drivers/net/wireless/mediatek/mt76/dma.c:201:12: warning: variable '_val' is
 used uninitialized whenever 'if' condition is false
Message-ID: <202511231550.NHSRTxxd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   e1ed98b1836e2bf0aba98f9790be4f3c6bca9d0d
commit: 215f7c4258e1cfb4019573f70aaf1dbb15e3d6d2 [17/49] wifi: mt76: mt7996: Add NPU offload support to MT7996 driver
config: arm-randconfig-r131-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231550.NHSRTxxd-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231550.NHSRTxxd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231550.NHSRTxxd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/dma.c:201:12: warning: variable '_val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     201 |         q->head = Q_READ(q, dma_idx);
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:83:7: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                     ^~~
   drivers/net/wireless/mediatek/mt76/dma.c:201:12: note: uninitialized use occurs here
     201 |         q->head = Q_READ(q, dma_idx);
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:90:2: note: expanded from macro 'Q_READ'
      90 |         _val;                                                           \
         |         ^~~~
   drivers/net/wireless/mediatek/mt76/dma.c:201:12: note: remove the 'if' if its condition is always true
   drivers/net/wireless/mediatek/mt76/dma.h:83:3: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                 ^
   drivers/net/wireless/mediatek/mt76/dma.c:201:12: note: variable '_val' is declared here
   drivers/net/wireless/mediatek/mt76/dma.h:77:2: note: expanded from macro 'Q_READ'
      77 |         u32 _val;                                                       \
         |         ^
   drivers/net/wireless/mediatek/mt76/dma.c:432:11: warning: variable '_val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     432 |                         last = Q_READ(q, dma_idx);
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:83:7: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                     ^~~
   drivers/net/wireless/mediatek/mt76/dma.c:432:11: note: uninitialized use occurs here
     432 |                         last = Q_READ(q, dma_idx);
         |                                ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:90:2: note: expanded from macro 'Q_READ'
      90 |         _val;                                                           \
         |         ^~~~
   drivers/net/wireless/mediatek/mt76/dma.c:432:11: note: remove the 'if' if its condition is always true
   drivers/net/wireless/mediatek/mt76/dma.h:83:3: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                 ^
   drivers/net/wireless/mediatek/mt76/dma.c:432:11: note: variable '_val' is declared here
   drivers/net/wireless/mediatek/mt76/dma.h:77:2: note: expanded from macro 'Q_READ'
      77 |         u32 _val;                                                       \
         |         ^
   drivers/net/wireless/mediatek/mt76/dma.c:419:10: warning: variable '_val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     419 |                 last = Q_READ(q, dma_idx);
         |                        ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:83:7: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                     ^~~
   drivers/net/wireless/mediatek/mt76/dma.c:419:10: note: uninitialized use occurs here
     419 |                 last = Q_READ(q, dma_idx);
         |                        ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:90:2: note: expanded from macro 'Q_READ'
      90 |         _val;                                                           \
         |         ^~~~
   drivers/net/wireless/mediatek/mt76/dma.c:419:10: note: remove the 'if' if its condition is always true
   drivers/net/wireless/mediatek/mt76/dma.h:83:3: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                 ^
   drivers/net/wireless/mediatek/mt76/dma.c:419:10: note: variable '_val' is declared here
   drivers/net/wireless/mediatek/mt76/dma.h:77:2: note: expanded from macro 'Q_READ'
      77 |         u32 _val;                                                       \
         |         ^
   drivers/net/wireless/mediatek/mt76/dma.c:975:15: warning: variable '_val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     975 |                                 dma_idx = Q_READ(q, dma_idx);
         |                                           ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:83:7: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                     ^~~
   drivers/net/wireless/mediatek/mt76/dma.c:975:15: note: uninitialized use occurs here
     975 |                                 dma_idx = Q_READ(q, dma_idx);
         |                                           ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:90:2: note: expanded from macro 'Q_READ'
      90 |         _val;                                                           \
         |         ^~~~
   drivers/net/wireless/mediatek/mt76/dma.c:975:15: note: remove the 'if' if its condition is always true
   drivers/net/wireless/mediatek/mt76/dma.h:83:3: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                 ^
   drivers/net/wireless/mediatek/mt76/dma.c:975:15: note: variable '_val' is declared here
   drivers/net/wireless/mediatek/mt76/dma.h:77:2: note: expanded from macro 'Q_READ'
      77 |         u32 _val;                                                       \
         |         ^
   drivers/net/wireless/mediatek/mt76/dma.c:965:13: warning: variable '_val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     965 |                 dma_idx = Q_READ(q, dma_idx);
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:83:7: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                     ^~~
   drivers/net/wireless/mediatek/mt76/dma.c:965:13: note: uninitialized use occurs here
     965 |                 dma_idx = Q_READ(q, dma_idx);
         |                           ^~~~~~~~~~~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.h:90:2: note: expanded from macro 'Q_READ'
      90 |         _val;                                                           \
         |         ^~~~
   drivers/net/wireless/mediatek/mt76/dma.c:965:13: note: remove the 'if' if its condition is always true
   drivers/net/wireless/mediatek/mt76/dma.h:83:3: note: expanded from macro 'Q_READ'
      83 |                 if (npu)                                                \
         |                 ^
   drivers/net/wireless/mediatek/mt76/dma.c:965:13: note: variable '_val' is declared here
   drivers/net/wireless/mediatek/mt76/dma.h:77:2: note: expanded from macro 'Q_READ'
      77 |         u32 _val;                                                       \
         |         ^
   5 warnings generated.

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/mediatek/mt76/npu.c:314:63: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct airoha_ppe_dev *dev @@     got struct airoha_ppe_dev [noderef] __rcu *ppe_dev @@
   drivers/net/wireless/mediatek/mt76/npu.c:314:63: sparse:     expected struct airoha_ppe_dev *dev
   drivers/net/wireless/mediatek/mt76/npu.c:314:63: sparse:     got struct airoha_ppe_dev [noderef] __rcu *ppe_dev

vim +201 drivers/net/wireless/mediatek/mt76/dma.c

3a29164425e927 Rex Lu           2025-09-09  187  
3990465db6829c Lorenzo Bianconi 2021-03-07  188  static void
3990465db6829c Lorenzo Bianconi 2021-03-07  189  mt76_dma_sync_idx(struct mt76_dev *dev, struct mt76_queue *q)
3990465db6829c Lorenzo Bianconi 2021-03-07  190  {
2e420b88ca86e3 Lorenzo Bianconi 2023-10-20  191  	Q_WRITE(q, desc_base, q->desc_dma);
62f1347fa5bf6e Lorenzo Bianconi 2025-10-17  192  	if ((q->flags & MT_QFLAG_WED_RRO_EN) && !mt76_npu_device_active(dev))
950d0abb5cd94f Bo Jiao          2023-10-20  193  		Q_WRITE(q, ring_size, MT_DMA_RRO_EN | q->ndesc);
950d0abb5cd94f Bo Jiao          2023-10-20  194  	else
2e420b88ca86e3 Lorenzo Bianconi 2023-10-20  195  		Q_WRITE(q, ring_size, q->ndesc);
62f1347fa5bf6e Lorenzo Bianconi 2025-10-17  196  
62f1347fa5bf6e Lorenzo Bianconi 2025-10-17  197  	if (mt76_queue_is_npu_tx(q)) {
62f1347fa5bf6e Lorenzo Bianconi 2025-10-17  198  		writel(q->desc_dma, &q->regs->desc_base);
62f1347fa5bf6e Lorenzo Bianconi 2025-10-17  199  		writel(q->ndesc, &q->regs->ring_size);
62f1347fa5bf6e Lorenzo Bianconi 2025-10-17  200  	}
2e420b88ca86e3 Lorenzo Bianconi 2023-10-20 @201  	q->head = Q_READ(q, dma_idx);
3990465db6829c Lorenzo Bianconi 2021-03-07  202  	q->tail = q->head;
3990465db6829c Lorenzo Bianconi 2021-03-07  203  }
3990465db6829c Lorenzo Bianconi 2021-03-07  204  

:::::: The code at line 201 was first introduced by commit
:::::: 2e420b88ca86e3322b36793f12d8fd2bff5ed57d wifi: mt76: introduce wed pointer in mt76_queue

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
