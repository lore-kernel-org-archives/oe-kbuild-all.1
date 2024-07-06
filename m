Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD09228F0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720257401; cv=none; b=BPEr6WQfAahauL2qafQn4Yvdw2MErIiexCbgZ5ex3/KU7n6Unei+ANYjxYce9/BVUF22NwthRwO7C4uWCoPbrZ/8k1xsTpti50PC8smq8s+KZtofuTGQvawQxuMKGZG9/g+luKPobJ7FNjjEol1HtHTPnN5gf83wGgn3mo5HF/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720257401; c=relaxed/simple;
	bh=2xY8k7s12lWOyITz/Jw7wseVSS3zPHn9wtNuZCwP+5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXkrBeaVVhoodDhxwpxzhoHvdiSbetyAKcIAPpoMPtXucmvlnnvzxmG6xFCJ/lskjYlf3I4xwX1f39U2IAdcklhdOr1YWGZeeDMQ5FyDWrTxGMQOeSYLb6oq7NTI0DnCdxFT8dDCbuktent5+eah6npwj2p91Wd4t8dB4nRfc9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8ogsXbZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8ogsXbZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720257399; x=1751793399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xY8k7s12lWOyITz/Jw7wseVSS3zPHn9wtNuZCwP+5Q=;
  b=n8ogsXbZcI+Vnep0CASxwi4DyGqAqviawjGFxnpH3SzMhDRWiRZnV7wD
   NcsRn74BYJxHr0eI5roanW+BYMdXq2An5Mycl0YOIH9jI+RJOruydoR7h
   ShqjM2tRc4fgYy+Nh+rOgVRK33NAKags1RiZ5OBdWz2piP9VvVAWqBQKr
   FQ6d1s4vO69afGoiC1Be7T3a+Z0XyORkZlwoZRDNVRshwLZcwO9EZiQan
   Bcc8buD91MhKCspdzZYWIbHJ/o8Y/sF4acfwnFE+U3HjfDR+Roo4kDss2
   CokYev/J71c8mfNQMZL3o2t47hvGkv4yaMJbxXiC/2bxAgsDk6i/B5VkX
   A==;
X-CSE-ConnectionGUID: 8gL79R7MQsmZZmpIlb5XLw==
X-CSE-MsgGUID: KL17pK+ISbeBcYsKyAJvOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="20430082"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="20430082"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 02:16:38 -0700
X-CSE-ConnectionGUID: Id7H+ENjTLO4z53DSAmITA==
X-CSE-MsgGUID: fdQT+3LyRxq/DtKBbVQB8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="46992362"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jul 2024 02:16:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ1X0-000TXm-0D;
	Sat, 06 Jul 2024 09:16:34 +0000
Date: Sat, 6 Jul 2024 17:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Wang <peter.wang@mediatek.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [bvanassche:ufs-for-next 8/16]
 drivers/ufs/host/ufs-mediatek.c:696:14: error: implicit declaration of
 function 'is_mcq_enabled'; did you mean 'is_zswap_enabled'?
Message-ID: <202407061733.eetmpf3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux ufs-for-next
head:   af7795f671d9d49b9178c6112e63793c0d456861
commit: 89779c1d84437f088bc72ddcca19ec6c36db3ab6 [8/16] scsi: ufs: Inline is_mcq_enabled()
config: arm64-randconfig-001-20240706 (https://download.01.org/0day-ci/archive/20240706/202407061733.eetmpf3b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061733.eetmpf3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061733.eetmpf3b-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/ufs/host/ufs-mediatek.c: In function 'ufs_mtk_mcq_disable_irq':
>> drivers/ufs/host/ufs-mediatek.c:696:14: error: implicit declaration of function 'is_mcq_enabled'; did you mean 'is_zswap_enabled'? [-Werror=implicit-function-declaration]
     696 |         if (!is_mcq_enabled(hba))
         |              ^~~~~~~~~~~~~~
         |              is_zswap_enabled
   cc1: some warnings being treated as errors


vim +696 drivers/ufs/host/ufs-mediatek.c

54770cbebe2caa drivers/scsi/ufs/ufs-mediatek.c Stanley Chu 2020-11-16  690  
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  691  static void ufs_mtk_mcq_disable_irq(struct ufs_hba *hba)
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  692  {
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  693  	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  694  	u32 irq, i;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  695  
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21 @696  	if (!is_mcq_enabled(hba))
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  697  		return;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  698  
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  699  	if (host->mcq_nr_intr == 0)
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  700  		return;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  701  
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  702  	for (i = 0; i < host->mcq_nr_intr; i++) {
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  703  		irq = host->mcq_intr_info[i].irq;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  704  		disable_irq(irq);
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  705  	}
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  706  	host->is_mcq_intr_enabled = false;
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  707  }
e0dc13e5a3cb9d drivers/ufs/host/ufs-mediatek.c Peter Wang  2023-12-21  708  

:::::: The code at line 696 was first introduced by commit
:::::: e0dc13e5a3cb9de98fd00b7718738f9eef4bd0ce scsi: ufs: ufs-mediatek: Disable MCQ IRQ when clock off

:::::: TO: Peter Wang <peter.wang@mediatek.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
