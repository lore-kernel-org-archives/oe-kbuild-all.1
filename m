Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE6A19CD0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 21:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785359778; cv=none; b=VtuUE7MtTPes1nrEw62N+wxTFqQRJlDRHaoIsaNCbAH4nzzZW9qNRqCO6LZnSIX3HDEHXJxUmlV8iZ+qDZeB1BP0DxT4evs78v3NitU8X1h8e7rl76eY+/zYbaiPRtmZfbr180ntpBlzU6g+lINuegSCWz42lgHn5cAu3QiUZ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785359778; c=relaxed/simple;
	bh=IXGEQkH3X7nV1owpI9lkjb9UOr5tn9N+H1YlbynMQGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U57PLlxhQjYcn2Rld9NCIPEsAeJvHwYR2vG+ZHoLbJvgGA9+FMcWwMYViDQ37SO2SMS7eBSJbuOVsv8w4il96St9VWT8hFB1DfaVo1pwdp/3upOYXkm38pQh18WUK5haYE4jmx9dPAsxTpSnj0sSSYJycn7osC/AIQ1Vg1SM4Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nej1GpLP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nej1GpLP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785359777; x=1816895777;
  h=date:from:to:cc:subject:message-id;
  bh=IXGEQkH3X7nV1owpI9lkjb9UOr5tn9N+H1YlbynMQGo=;
  b=nej1GpLPGKmdoXgxWKCyQj/XzOtyu+wMauZ8r+9mJv+guMjpVA482uqN
   /j91qNYxcVquG9MWzoGKO2UH9y6LJnH3smNcPdWFoD3NeW8VuvQBsZ3LL
   /lbvPsuprQOF1p+9yWUSgfJB5i5tcpNnW5fovHwwp8euFofe2+pod/LIt
   uf/q5KsQkc6IqKccb3ojFWtYdAaD7NZt5mvOOv8MW+IykySBFFf8faiPe
   zpUExs/Bmx91XYT16Rlazy0c7Y2ZLhH2tFI0Otn0y+ktBXSa9yYd1Ps3s
   J6/fLepnskEXhR89bYov7XBTx01dQyAuRbo0AJGXyebLDwC3K/ex7RIIx
   w==;
X-CSE-ConnectionGUID: w+qk/80oRKuCIeLY9NMH5w==
X-CSE-MsgGUID: ceu71XzsSLSmQ50mfEELpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86166032"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="86166032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 14:16:16 -0700
X-CSE-ConnectionGUID: av2QXHXMT6yrNZ5hDbaLLA==
X-CSE-MsgGUID: gTKQaua5R3m+WnMwjZwNCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="264386223"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Jul 2026 14:16:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpBdM-00000000fgY-2xEo;
	Wed, 29 Jul 2026 21:16:12 +0000
Date: Thu, 30 Jul 2026 05:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 363/700]
 drivers/dma/mstar/mstar-msc313-bdma.c:514:23: warning: format '%x' expects
 argument of type 'unsigned int', but argument 12 has type 'size_t' {aka 'long
 unsigned int'}
Message-ID: <202607300412.ygc63J7O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 26178975043b0a83d96b42a14c44bb70fdb84d4b [363/700] dma: mstar: msc313 bdma driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260730/202607300412.ygc63J7O-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300412.ygc63J7O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300412.ygc63J7O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from include/linux/of_dma.h:14,
                    from drivers/dma/mstar/mstar-msc313-bdma.c:9:
   drivers/dma/mstar/mstar-msc313-bdma.c: In function 'msc313_bdma_watchdog':
>> drivers/dma/mstar/mstar-msc313-bdma.c:514:23: warning: format '%x' expects argument of type 'unsigned int', but argument 12 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     514 |         dev_warn(dev, "timeout waiting for completion irq, queued: %d, busy %d, irq: %d, done: %d\n"
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:30: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   include/linux/dev_printk.h:146:61: note: in expansion of macro 'dev_fmt'
     146 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                             ^~~~~~~
   drivers/dma/mstar/mstar-msc313-bdma.c:514:9: note: in expansion of macro 'dev_warn'
     514 |         dev_warn(dev, "timeout waiting for completion irq, queued: %d, busy %d, irq: %d, done: %d\n"
         |         ^~~~~~~~


vim +514 drivers/dma/mstar/mstar-msc313-bdma.c

   488	
   489	static void msc313_bdma_watchdog(struct timer_list *t)
   490	{
   491		struct msc313_bdma_chan *chan = from_timer(chan, t, watchdog);
   492		struct msc313_bdma_desc *desc = chan->inflight;
   493		unsigned int queued, busy, irq, done;
   494		unsigned int srcid, dstid, residue, src, dst;
   495		struct device *dev = chan->chan.device->dev;
   496		unsigned long flags;
   497	
   498		spin_lock_irqsave(&chan->lock, flags);
   499	
   500		regmap_field_read(chan->queued, &queued);
   501		regmap_field_read(chan->busy, &busy);
   502		regmap_field_read(chan->irq, &irq);
   503		regmap_field_read(chan->done, &done);
   504		regmap_field_read(chan->src, &srcid);
   505		regmap_field_read(chan->dst, &dstid);
   506		src = msc313_bdma_read_low_high_pair(chan->src_addr_l, chan->src_addr_h);
   507		dst = msc313_bdma_read_low_high_pair(chan->dst_addr_l, chan->dst_addr_h);
   508		residue = msc313_bdma_read_low_high_pair(chan->size_l, chan->size_h);
   509	
   510		/* stop the channel, unused in the vendor code :/ */
   511		regmap_field_force_write(chan->stop, 1);
   512		regmap_field_force_write(chan->stop, 0);
   513	
 > 514		dev_warn(dev, "timeout waiting for completion irq, queued: %d, busy %d, irq: %d, done: %d\n"
   515				"src 0x%x (id 0x%x), dst 0x%x (id 0x%x), residue 0x%x (from 0x%x)\n",
   516				queued, busy, irq, done,
   517				src, srcid, dst, dstid,
   518				residue, desc->len);
   519	
   520		msc313_bdma_moveinflighttocomplete(chan, false, residue);
   521	
   522		spin_unlock_irqrestore(&chan->lock, flags);
   523	
   524		tasklet_schedule(&chan->tasklet);
   525	}
   526	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
