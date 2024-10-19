Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8762772A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729359589; cv=none; b=W63ZLDhLOgMRvq1HZcwnm1P5Tq3t7bkrLwEHqS+KtcZoLqeJmz+nqG36K8mryLaxja3yLAgXH7auM8laioWVaboCF70rtWvBmQss2hgZys+RegHx3VJpD41rwGI0gIo3m7BlRO/PprVT24ND5f6N6PKOKVxQX92GVu6rWldCi4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729359589; c=relaxed/simple;
	bh=lLuvBLTpzlaWoctJhv8dhA4/dr13reCpf7iujkvAHfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGPD06kk14ntjejLgXzAozwdVTEWpy6No2ispAnJyDv8EZG1sLC2k/Hrp9GKZgN4qUtqEY+KTfEBtW5g+z/bXAcUCAgDByyZWuKSh2ha4NWQ6Dzk71qu+NxjIjTd4BoyQyW9CL6ZdhGg0sdiqKF1igb7BvUgTP8cFGS+g+q8oFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWjRRXJW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWjRRXJW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729359587; x=1760895587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lLuvBLTpzlaWoctJhv8dhA4/dr13reCpf7iujkvAHfE=;
  b=gWjRRXJWtWFyi+C+Qr8hv8jkp8FHCCodo2GQSiW7PWgQgit91uFYsB0j
   upW31w+MX1XjhaynrkDiCryajrNCqtPNlaKqi8bDQB31IUZ35oZbk8v3L
   uN9Q39Lud7Yi2ubQMW9IzVsw9NwBUTKnqpcNjxeNnfLhvezDWGmDf2MI8
   9pJmeT0lJUXwC5bOu9u9blOTNIh/lrpUqt5MsSkIbU/oB0qSj1Uo9/NpC
   a5NpWatEYz2dpXr0Quote6zU1YmCpp74ltZnBQTB0M1np69xxLffq8K5z
   C/3B1Rw+e4voEwjEq4z2xmk3msy+U7jKWSxl1gpc5V/hIM6sUEm+614W5
   A==;
X-CSE-ConnectionGUID: yqpm8LfdTX+qHbJ2G/xp0Q==
X-CSE-MsgGUID: L2mp4MxxT0+UcV1t4OK7HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="39503127"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="39503127"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 10:39:46 -0700
X-CSE-ConnectionGUID: dBrkrOD4QpuIwq9a09IQ8g==
X-CSE-MsgGUID: 7sh+YzEGRNSEqsBcf3C5wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="78802993"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Oct 2024 10:39:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2DQU-000PIL-2S;
	Sat, 19 Oct 2024 17:39:42 +0000
Date: Sun, 20 Oct 2024 01:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:v6.12-rc3-acpm-v2 2/2]
 drivers/firmware/samsung/exynos-acpm.c:537:49: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202410200147.nddwYd8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day v6.12-rc3-acpm-v2
head:   7ae3e681354fe887656fe3bc659c697b4e27006a
commit: 7ae3e681354fe887656fe3bc659c697b4e27006a [2/2] firmware: add exynos acpm driver
config: mips-randconfig-r122-20241019 (https://download.01.org/0day-ci/archive/20241020/202410200147.nddwYd8z-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce: (https://download.01.org/0day-ci/archive/20241020/202410200147.nddwYd8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200147.nddwYd8z-lkp@intel.com/

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
>> drivers/firmware/samsung/exynos-acpm.c:537:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:537:49: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/firmware/samsung/exynos-acpm.c:537:49: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:550:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:550:51: sparse:     expected void [noderef] __iomem *addr
   drivers/firmware/samsung/exynos-acpm.c:550:51: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:549:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct exynos_acpm_shmem_chan *shmem_chans @@     got void [noderef] __iomem * @@
   drivers/firmware/samsung/exynos-acpm.c:549:21: sparse:     expected struct exynos_acpm_shmem_chan *shmem_chans
   drivers/firmware/samsung/exynos-acpm.c:549:21: sparse:     got void [noderef] __iomem *
   drivers/firmware/samsung/exynos-acpm.c:562:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:562:45: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/firmware/samsung/exynos-acpm.c:562:45: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:568:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:568:48: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/firmware/samsung/exynos-acpm.c:568:48: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:569:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:569:43: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/firmware/samsung/exynos-acpm.c:569:43: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:570:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/firmware/samsung/exynos-acpm.c:570:45: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/firmware/samsung/exynos-acpm.c:570:45: sparse:     got unsigned int *
   drivers/firmware/samsung/exynos-acpm.c:658:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct exynos_acpm_shmem *shmem @@     got void [noderef] __iomem * @@
   drivers/firmware/samsung/exynos-acpm.c:658:28: sparse:     expected struct exynos_acpm_shmem *shmem
   drivers/firmware/samsung/exynos-acpm.c:658:28: sparse:     got void [noderef] __iomem *
   drivers/firmware/samsung/exynos-acpm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +537 drivers/firmware/samsung/exynos-acpm.c

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
