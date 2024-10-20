Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5879F6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729439156; cv=none; b=KmjOPfRRPPQeMaWoOM2tRW7pkUKkSArk7GCxhxJo8+RaenSIFAVAfbb9E7Ku3WZ6sz1pEyuzLjXzhaVnRuAmZRpHoQQaRFa1OOx1r/78vdEFojUkfMxTqLZWQkK+50qDKrUHmlSQKeYpN0HycsHwWwBE60AlJE6QFNrXlE2BcVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729439156; c=relaxed/simple;
	bh=yaVq6xTU4huT9wJgnHhdkPZhfSVkLsnVcDs/c4S2FzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvtlFSHyPwbTYazzIWTUwfIPwWQ1UN3ssda84H3joHxhVJJWStx/wuGlc7/D4SUC1vG0bythGOgZLg3LrciM+7etVOSflEh6jTRCKzd5dCN2BvXRESqD6Z0fxzvdtRLZfVLVQh20aw91uS+YEzR3FCPes/fvt9D2l1sHhuhalkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xpg8DIP6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xpg8DIP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729439154; x=1760975154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yaVq6xTU4huT9wJgnHhdkPZhfSVkLsnVcDs/c4S2FzQ=;
  b=Xpg8DIP6oTFxr20VdtZhmnJuckV/OBzdM2VUfcjRXxwW5fcJ4c422rCM
   wY8GctUyVV+t+asqk7mr5dsATkdXOQtrHL0fzW7smCfN4NoDft2Sdt801
   426ngIEZ16bPtixVlVaOip+ZcOPyOR39LNS+5/8esKU63s9FO9s3IrNmd
   Ww50Eclwm/piVoKgGoyirOub56sZaIp0fbphzdtwoUgJEELpVYqEP8b9o
   YNOtQb5irfeICmj12nw09Lod52yfQZFAZlhWH93qVBOf2Q7S+vrjzJfIn
   LV3HpH/7CAziVBQ5cFItTzdXVQLO8/sRWdAYgniLSxHXYmyfhGiKzDNc5
   A==;
X-CSE-ConnectionGUID: N4U8FF1QR8G6n8I3j/Wrgw==
X-CSE-MsgGUID: 5PuE551QTHynw4GU8Yghjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="46385031"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="46385031"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 08:45:50 -0700
X-CSE-ConnectionGUID: XXluMuDDQ6W+/BjggdpIoA==
X-CSE-MsgGUID: eDG+ImkMSyCw9guwKIUSVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="110061711"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2024 08:45:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2Y7n-000QQD-0n;
	Sun, 20 Oct 2024 15:45:47 +0000
Date: Sun, 20 Oct 2024 23:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] firmware: add exynos acpm driver
Message-ID: <202410202301.xKHxo94L-lkp@intel.com>
References: <20241017163649.3007062-3-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017163649.3007062-3-tudor.ambarus@linaro.org>

Hi Tudor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on drm-misc/drm-misc-next linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tudor-Ambarus/mailbox-add-async-request-mechanism-to-empower-controllers-w-hw-queues/20241018-003840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241017163649.3007062-3-tudor.ambarus%40linaro.org
patch subject: [PATCH v2 2/2] firmware: add exynos acpm driver
config: sh-randconfig-r111-20241020 (https://download.01.org/0day-ci/archive/20241020/202410202301.xKHxo94L-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241020/202410202301.xKHxo94L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410202301.xKHxo94L-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/samsung/exynos-acpm.c:493:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:493:54: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:493:54: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:494:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:494:55: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:494:55: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:495:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:495:54: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:495:54: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:504:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:504:54: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:504:54: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:505:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:505:55: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:505:55: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:506:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:506:54: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:506:54: sparse:     got unsigned int *
>> drivers/firmware/samsung/exynos-acpm.c:537:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:537:34: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/firmware/samsung/exynos-acpm.c:537:34: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:550:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:550:51: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:550:51: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:549:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct exynos_acpm_shmem_chan *shmem_chans @@     got void [noderef] __iomem * @@
   drivers/firmware/samsung/exynos-acpm.c:549:21: sparse:     expected struct exynos_acpm_shmem_chan *shmem_chans
   drivers/firmware/samsung/exynos-acpm.c:549:21: sparse:     got void [noderef] __iomem *
   drivers/firmware/samsung/exynos-acpm.c:562:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:562:30: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/firmware/samsung/exynos-acpm.c:562:30: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:568:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:568:33: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/firmware/samsung/exynos-acpm.c:568:33: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:569:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:569:28: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/firmware/samsung/exynos-acpm.c:569:28: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:570:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *ptr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:570:30: sparse:     expected void const volatile [noderef] __iomem *ptr
   drivers/firmware/samsung/exynos-acpm.c:570:30: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:658:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct exynos_acpm_shmem *shmem @@     got void [noderef] __iomem * @@
   drivers/firmware/samsung/exynos-acpm.c:658:28: sparse:     expected struct exynos_acpm_shmem *shmem
   drivers/firmware/samsung/exynos-acpm.c:658:28: sparse:     got void [noderef] __iomem *

vim +537 drivers/firmware/samsung/exynos-acpm.c

   497	
   498	static void exynos_acpm_tx_queue_init(struct exynos_acpm *exynos_acpm,
   499					      struct exynos_acpm_shmem_chan *shmem_chan,
   500					      struct exynos_acpm_queue *tx)
   501	{
   502		void __iomem *base = exynos_acpm->sram_base;
   503	
 > 504		tx->base = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_base);
   505		tx->front = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_front);
   506		tx->rear = exynos_acpm_get_iomem_addr(base, &shmem_chan->rx_rear);
   507	}
   508	
   509	static int exynos_acpm_alloc_cmds(struct exynos_acpm *exynos_acpm,
   510					  struct exynos_acpm_chan *chan)
   511	{
   512		struct device *dev = exynos_acpm->dev;
   513		struct exynos_acpm_rx_data *rx_data;
   514		unsigned int mlen = chan->mlen;
   515		int i;
   516	
   517		for (i = 0; i < EXYNOS_ACPM_SEQNUM_MAX; i++) {
   518			rx_data = &chan->rx_data[i];
   519			rx_data->cmd = devm_kcalloc(dev, mlen, sizeof(*(rx_data->cmd)),
   520						    GFP_KERNEL);
   521			if (!rx_data->cmd)
   522				return -ENOMEM;
   523		}
   524	
   525		return 0;
   526	}
   527	
   528	static int exynos_acpm_chans_init(struct exynos_acpm *exynos_acpm)
   529	{
   530		struct exynos_acpm_shmem_chan *shmem_chans, *shmem_chan;
   531		struct exynos_acpm_shmem *shmem = exynos_acpm->shmem;
   532		struct mbox_chan *mbox_chan, *mbox_chans;
   533		struct exynos_acpm_chan *chan, *chans;
   534		struct device *dev = exynos_acpm->dev;
   535		int i, ret;
   536	
 > 537		exynos_acpm->num_chans = readl_relaxed(&shmem->num_chans);
   538	
   539		mbox_chans = devm_kcalloc(dev, exynos_acpm->num_chans,
   540					  sizeof(*mbox_chans), GFP_KERNEL);
   541		if (!mbox_chans)
   542			return -ENOMEM;
   543	
   544		chans = devm_kcalloc(dev, exynos_acpm->num_chans, sizeof(*chans),
   545				     GFP_KERNEL);
   546		if (!chans)
   547			return -ENOMEM;
   548	
   549		shmem_chans = exynos_acpm_get_iomem_addr(exynos_acpm->sram_base,
   550							 &shmem->chans);
   551	
   552		for (i = 0; i < exynos_acpm->num_chans; i++) {
   553			shmem_chan = &shmem_chans[i];
   554			mbox_chan = &mbox_chans[i];
   555			chan = &chans[i];
   556	
   557			/* Set parameters for the mailbox channel. */
   558			mbox_chan->con_priv = chan;
   559			mbox_chan->mbox = exynos_acpm->mbox;
   560	
   561			/* Set parameters for the ACPM channel. */
   562			chan->mlen = readl_relaxed(&shmem_chan->mlen);
   563	
   564			ret = exynos_acpm_alloc_cmds(exynos_acpm, chan);
   565			if (ret)
   566				return ret;
   567	
   568			chan->polling = readl_relaxed(&shmem_chan->polling);
   569			chan->id = readl_relaxed(&shmem_chan->id);
   570			chan->qlen = readl_relaxed(&shmem_chan->qlen);
   571	
   572			exynos_acpm_rx_queue_init(exynos_acpm, shmem_chan, &chan->rx);
   573			exynos_acpm_tx_queue_init(exynos_acpm, shmem_chan, &chan->tx);
   574	
   575			mutex_init(&chan->rx_lock);
   576			spin_lock_init(&chan->tx_lock);
   577	
   578			dev_vdbg(dev, "ID = %d poll = %d, mlen = %d, qlen = %d\n",
   579				 chan->id, chan->polling, chan->mlen, chan->qlen);
   580		}
   581	
   582		/* Save pointers to the ACPM and mailbox channels. */
   583		exynos_acpm->mbox->chans = mbox_chans;
   584		exynos_acpm->chans = chans;
   585	
   586		return 0;
   587	}
   588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
