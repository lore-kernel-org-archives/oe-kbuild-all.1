Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25D13D255
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 04:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719377106; cv=none; b=Vm1nelp34jMBYcD1i6DBBI8SZePKzwDN/Y7QndD6csvTtyQ9EVjygiMdBttpkc2CLyz4OwLA7KaiKz/qXmH+PfJJTos6o+rA8LW+x9njB5v1GBOOS1TrzBFmQUVaCX1YlRTmYEdV+nMKniJXl1KohKvpGWbp4iF1dVb9i5cGC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719377106; c=relaxed/simple;
	bh=b4tjB3Gz4106Xs25MV5roiwYoTYKxMda4kHvApCkAxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K91Dn+lh5phkKKWNXWtrtiWbAxhmMnSvtd4jfXN2NhiAbXUSKttkh/xQo9b239Rkgvo6XdVmuqcAm1aQJhGNZzmk5IMPYuG+bsQV7DHlP+ywCykHBdndwutbZSdSfu4qM209L7jEYMcwFJY6AxduXsWpWtVVr5ZfBO7K7OxQbOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQnHv0ZQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQnHv0ZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719377104; x=1750913104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b4tjB3Gz4106Xs25MV5roiwYoTYKxMda4kHvApCkAxg=;
  b=kQnHv0ZQp7jKm7VmeQdKvpBQPXszfpXUqgwii88wwOVV6dkyy3eJ8PYc
   WP5Necr+H/tjjW2g0tAct6IVQo+UIc6sErU/7UTvlOqsbUgSDOrkq43Zv
   G0xXlcQ8Rw7ju/TfTLaXPq2qozGEPyroOXKibvzeneIhtXskJ27xwHFYF
   IXW+eeLRR4YyNpqV+S7pykrFGEL1Gx9k2ZdicklRzTN30RCRTqBU+CLW/
   EYOIJ4sSr5Jma12mCyC4wT7CrFQwyPz31PwDcevnEsIlKFr1FBrKZJKww
   Trzc4L8Xie00DhesSnElPpNtVcDnpKTMxPCC7Z8LOzdnyO/6Pc5J2HS1z
   Q==;
X-CSE-ConnectionGUID: 4G0UfDU6SZiMRLKS0DTpiw==
X-CSE-MsgGUID: IEUcvFd1SI6G6oddUr6eAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="33883201"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="33883201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 21:45:04 -0700
X-CSE-ConnectionGUID: Cp96gcJZR5i9gExEGaZ0NQ==
X-CSE-MsgGUID: j952p+kxQmOGT5gLSUN1yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="48456313"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jun 2024 21:45:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMKWf-000Ezu-2k;
	Wed, 26 Jun 2024 04:44:57 +0000
Date: Wed, 26 Jun 2024 12:44:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, linux-block@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 7/7] block: move dma_pad_mask into queue_limits
Message-ID: <202406261229.rnOxqhqJ-lkp@intel.com>
References: <20240625110603.50885-8-hch@lst.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625110603.50885-8-hch@lst.de>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on next-20240625]
[cannot apply to linus/master v6.10-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/block-correctly-report-cache-type/20240626-012117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20240625110603.50885-8-hch%40lst.de
patch subject: [PATCH 7/7] block: move dma_pad_mask into queue_limits
config: i386-buildonly-randconfig-002-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261229.rnOxqhqJ-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261229.rnOxqhqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261229.rnOxqhqJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/core/ufshcd.c:5203: warning: Function parameter or struct member 'lim' not described in 'ufshcd_device_configure'


vim +5203 drivers/ufs/core/ufshcd.c

4264fd613a6a4b drivers/scsi/ufs/ufshcd.c Sujit Reddy Thumma 2014-06-29  5194  
eeda47499f0187 drivers/scsi/ufs/ufshcd.c Akinobu Mita       2014-07-01  5195  /**
95ea953ed86260 drivers/ufs/core/ufshcd.c Christoph Hellwig  2024-06-25  5196   * ufshcd_device_configure - adjust SCSI device configurations
eeda47499f0187 drivers/scsi/ufs/ufshcd.c Akinobu Mita       2014-07-01  5197   * @sdev: pointer to SCSI device
fd4bffb54dc0f6 drivers/ufs/core/ufshcd.c Bart Van Assche    2023-07-27  5198   *
fd4bffb54dc0f6 drivers/ufs/core/ufshcd.c Bart Van Assche    2023-07-27  5199   * Return: 0 (success).
eeda47499f0187 drivers/scsi/ufs/ufshcd.c Akinobu Mita       2014-07-01  5200   */
95ea953ed86260 drivers/ufs/core/ufshcd.c Christoph Hellwig  2024-06-25  5201  static int ufshcd_device_configure(struct scsi_device *sdev,
95ea953ed86260 drivers/ufs/core/ufshcd.c Christoph Hellwig  2024-06-25  5202  		struct queue_limits *lim)
eeda47499f0187 drivers/scsi/ufs/ufshcd.c Akinobu Mita       2014-07-01 @5203  {
49615ba144a092 drivers/scsi/ufs/ufshcd.c Stanley Chu        2019-09-16  5204  	struct ufs_hba *hba = shost_priv(sdev->host);
eeda47499f0187 drivers/scsi/ufs/ufshcd.c Akinobu Mita       2014-07-01  5205  	struct request_queue *q = sdev->request_queue;
eeda47499f0187 drivers/scsi/ufs/ufshcd.c Akinobu Mita       2014-07-01  5206  
95ea953ed86260 drivers/ufs/core/ufshcd.c Christoph Hellwig  2024-06-25  5207  	lim->dma_pad_mask = PRDT_DATA_BYTE_COUNT_PAD - 1;
858231bdb22391 drivers/ufs/core/ufshcd.c Bart Van Assche    2023-09-21  5208  
b294ff3e34490f drivers/scsi/ufs/ufshcd.c Asutosh Das        2021-04-23  5209  	/*
b294ff3e34490f drivers/scsi/ufs/ufshcd.c Asutosh Das        2021-04-23  5210  	 * Block runtime-pm until all consumers are added.
b294ff3e34490f drivers/scsi/ufs/ufshcd.c Asutosh Das        2021-04-23  5211  	 * Refer ufshcd_setup_links().
b294ff3e34490f drivers/scsi/ufs/ufshcd.c Asutosh Das        2021-04-23  5212  	 */
b294ff3e34490f drivers/scsi/ufs/ufshcd.c Asutosh Das        2021-04-23  5213  	if (is_device_wlun(sdev))
b294ff3e34490f drivers/scsi/ufs/ufshcd.c Asutosh Das        2021-04-23  5214  		pm_runtime_get_noresume(&sdev->sdev_gendev);
b294ff3e34490f drivers/scsi/ufs/ufshcd.c Asutosh Das        2021-04-23  5215  	else if (ufshcd_is_rpm_autosuspend_allowed(hba))
49615ba144a092 drivers/scsi/ufs/ufshcd.c Stanley Chu        2019-09-16  5216  		sdev->rpm_autosuspend = 1;
71bb9ab6e3511b drivers/scsi/ufs/ufshcd.c Adrian Hunter      2022-02-28  5217  	/*
71bb9ab6e3511b drivers/scsi/ufs/ufshcd.c Adrian Hunter      2022-02-28  5218  	 * Do not print messages during runtime PM to avoid never-ending cycles
71bb9ab6e3511b drivers/scsi/ufs/ufshcd.c Adrian Hunter      2022-02-28  5219  	 * of messages written back to storage by user space causing runtime
71bb9ab6e3511b drivers/scsi/ufs/ufshcd.c Adrian Hunter      2022-02-28  5220  	 * resume, causing more messages and so on.
71bb9ab6e3511b drivers/scsi/ufs/ufshcd.c Adrian Hunter      2022-02-28  5221  	 */
71bb9ab6e3511b drivers/scsi/ufs/ufshcd.c Adrian Hunter      2022-02-28  5222  	sdev->silence_suspend = 1;
49615ba144a092 drivers/scsi/ufs/ufshcd.c Stanley Chu        2019-09-16  5223  
cb77cb5abe1f4f drivers/scsi/ufs/ufshcd.c Eric Biggers       2021-10-18  5224  	ufshcd_crypto_register(hba, q);
df043c745ea149 drivers/scsi/ufs/ufshcd.c Satya Tangirala    2020-07-06  5225  
eeda47499f0187 drivers/scsi/ufs/ufshcd.c Akinobu Mita       2014-07-01  5226  	return 0;
eeda47499f0187 drivers/scsi/ufs/ufshcd.c Akinobu Mita       2014-07-01  5227  }
eeda47499f0187 drivers/scsi/ufs/ufshcd.c Akinobu Mita       2014-07-01  5228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
