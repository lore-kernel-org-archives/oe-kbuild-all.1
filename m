Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90F01B86E6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 20:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727813683; cv=none; b=njbPk3yxLvQM1Yot2NprSAULnJGXVEBsH8WzoK3VBXhIF8nxvuduJzgOqmPUV0z4XQvkKJmcKWNpENo9N0wuHuivo9U5vrHHhFmCEQK14Oou7o7JQcZTKMS8JAmAR7QjCjtlKAKbgV0BV4rQLUYjRCm7bqgnqrJars0t+rr4X2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727813683; c=relaxed/simple;
	bh=j73fCpJe7jzx5YfaJchqa2vWGdz+Kt1W7/KF26P1ryc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VOU5zciieJ5lu2+k30deQuPxkiEzkeUITE7J7j7MmSWoTYq1nud8qBdaF1QyeRVf4lF7Y879SUd8U78iR/9db2atjeDTNa615ZchSwItLD1eo7S848EwLJii+Qw1yIwpNq1RafWEAhoU/hdckJIzb5nxh9INC8rmVoD5I4VHudQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTtKIJAP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTtKIJAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727813682; x=1759349682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j73fCpJe7jzx5YfaJchqa2vWGdz+Kt1W7/KF26P1ryc=;
  b=TTtKIJAPIgpRj5O45gGXdbiCHsPuoHxyPsWTOMFQfMpJG46jK9PJ0w21
   CJ09LKspwU+bFUtKZtIz+A4Hj4zpxjtxrfDPcHpEh5Ae+701xdG61faml
   neU0PfN0xfkR2yui/0yPH046aoF3EdhNfvvzQ7gOioue3D4lEwWPx2m80
   T8Cack9oJYDvu5xA//nooyaL3+xDqPkik7P04W1zVS9uJ2UnjoLAjbnNy
   gATUpg4djQPAr5UPdZ7YIfrDZc8FGJeTsxb6pGTUpv02S9ie0t4JWiHv2
   UdQb+Aeq1OAA9OJ68+/WbkMe4P9Y41BTfGSQP/hGrm1LeDNrdL6Phd72F
   A==;
X-CSE-ConnectionGUID: 101JHzqJT4qRs42KkW6z/w==
X-CSE-MsgGUID: XcgvwvX8Qqm99EZN9kTwoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="14592749"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="14592749"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 13:14:41 -0700
X-CSE-ConnectionGUID: K9OhYfB9Tda66xdgCbkIRQ==
X-CSE-MsgGUID: dCCTcLD/S72bCi8RoXvTGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; 
   d="scan'208";a="104601149"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Oct 2024 13:14:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svjGX-000R8j-2J;
	Tue, 01 Oct 2024 20:14:37 +0000
Date: Wed, 2 Oct 2024 04:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:renesas/genmai-upstreaming 29/29]
 drivers/mmc/host/renesas_sdhi_sys_dmac.c:132:30: warning: unused variable
 'priv'
Message-ID: <202410020433.H5o1dt8b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/genmai-upstreaming
head:   f3f653854e47ac9e3d8dfda95636f80d2bf3d5fd
commit: f3f653854e47ac9e3d8dfda95636f80d2bf3d5fd [29/29] SDHI DMA WIP
config: i386-buildonly-randconfig-004-20241002 (https://download.01.org/0day-ci/archive/20241002/202410020433.H5o1dt8b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020433.H5o1dt8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020433.H5o1dt8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mmc/host/renesas_sdhi_sys_dmac.c: In function 'renesas_sdhi_sys_dmac_dma_callback':
>> drivers/mmc/host/renesas_sdhi_sys_dmac.c:132:30: warning: unused variable 'priv' [-Wunused-variable]
     132 |         struct renesas_sdhi *priv = host_to_priv(host);
         |                              ^~~~


vim +/priv +132 drivers/mmc/host/renesas_sdhi_sys_dmac.c

92d0f925e6344a drivers/mmc/host/renesas_sdhi_sys_dmac.c Simon Horman    2017-06-21  128  
c2a96987c76f09 drivers/mmc/host/renesas_sdhi_sys_dmac.c Simon Horman    2017-05-10  129  static void renesas_sdhi_sys_dmac_dma_callback(void *arg)
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  130  {
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  131  	struct tmio_mmc_host *host = arg;
90d95106457654 drivers/mmc/host/renesas_sdhi_sys_dmac.c Masahiro Yamada 2017-11-25 @132  	struct renesas_sdhi *priv = host_to_priv(host);
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  133  
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  134  	spin_lock_irq(&host->lock);
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  135  
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  136  	if (!host->data)
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  137  		goto out;
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  138  
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  139  	if (host->data->flags & MMC_DATA_READ)
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  140  		dma_unmap_sg(host->chan_rx->device->dev,
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  141  			     host->sg_ptr, host->sg_len,
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  142  			     DMA_FROM_DEVICE);
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  143  	else
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  144  		dma_unmap_sg(host->chan_tx->device->dev,
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  145  			     host->sg_ptr, host->sg_len,
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  146  			     DMA_TO_DEVICE);
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  147  
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  148  	tmio_mmc_do_data_irq(host);
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  149  out:
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  150  	spin_unlock_irq(&host->lock);
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  151  }
52ad9a8e854ca1 drivers/mmc/host/tmio_mmc_dma.c          Wolfram Sang    2017-02-17  152  

:::::: The code at line 132 was first introduced by commit
:::::: 90d9510645765401c56d75f6003d6cb6c1f7ca2a mmc: tmio, renesas_sdhi: move Renesas-specific DMA data to renesas_sdhi.h

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
