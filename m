Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22515ECF1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 20:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717620010; cv=none; b=iVwZNDq49dWnhmKdIGsUO4+kWmwpc1+cLlWlW5Hs4LJP3oRw9R/v4a8WjUZAUguwhCU6ZzsCcAD7Wi+PJuk7UAtm82goWLoK8SbkfHOh3sTwWx6ngEAa7pex46dqurmW0D5lfr3W/I45sU+gn4nmHaB1+Oqx++NhzgsoSGNCowM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717620010; c=relaxed/simple;
	bh=DZKCfW/N/v1MY6ehNNqCGkaYfE3qQdeGAYwy/tGjUTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D5v9ywOFzDfWhQ5m21FZmHkmws7q4uXuetfBZ8Zwrxd3y6WiGWf1o0wge/S+InDPcb4fdMlMJoME3ByjApg1L57y/Ac5wb/3xiaZFg3Q1f+Zs159QptPrmwfPO++IynIhT9UTC+ZhdqjdvSmQhW90H0KPShR8DV9ku7Ps1qJ7OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlYGAAmf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlYGAAmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717620009; x=1749156009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZKCfW/N/v1MY6ehNNqCGkaYfE3qQdeGAYwy/tGjUTk=;
  b=NlYGAAmf8Lk4lJ2kGKzD5vvHAfXuEXoQ+JaliFEDGuoVn/+WjpC+P5Yi
   I1IZ0d+CYWeE6hhvn3EQS/HXSIVVFsByiZX6oeR+VOatZsQmZlPWOgv4F
   +EB7t3w2zUrgivRH25Fhing6BGs1NMbKUBHFYjJPPKWlf/mDQeiVMC6ZQ
   NRhV7uBQ53JrH42p93JE1r10iH9eNw1cck8tkR4RArFTQTdhHb+WvH8dp
   WlTBYmOySSUZ0sTUvzZ9mLQwusLkwah0oSD70gYJ2iioEc/xFD0sgGzOo
   eJ4tLKw9Bydq48WbW7Pzj6/K/FKEdKu5lTMPLMzF8L5OC9d+EjuJpkEU2
   g==;
X-CSE-ConnectionGUID: vcA22ETrR0+U7Vv3AI6sUA==
X-CSE-MsgGUID: U2jD6RKlRFmPQmu4h3wwGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24887163"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="24887163"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 13:40:07 -0700
X-CSE-ConnectionGUID: GqqQ3gOkSzC/TDc3nSFSZg==
X-CSE-MsgGUID: K3LEcDf6QLOQZRFiBi/dkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="42286660"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2024 13:40:06 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sExQR-0002E0-2V;
	Wed, 05 Jun 2024 20:40:03 +0000
Date: Thu, 6 Jun 2024 04:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Subject: [linux-nvme:nvme-6.11 2/10] drivers/nvme/host/apple.c:1547:27:
 error: 'dev' undeclared; did you mean 'pdev'?
Message-ID: <202406060424.PAp4EYR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/nvme.git nvme-6.11
head:   fd83bacbbc06c5f3e38d8d79784ca1f7bd9cba68
commit: cfafcbf5792d9d7e5120c3acb78a8afad8878459 [2/10] nvme: apple: fix device reference counting
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406060424.PAp4EYR8-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060424.PAp4EYR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060424.PAp4EYR8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/apple.c: In function 'apple_nvme_probe':
>> drivers/nvme/host/apple.c:1547:27: error: 'dev' undeclared (first use in this function); did you mean 'pdev'?
    1547 |         nvme_uninit_ctrl(&dev->ctrl);
         |                           ^~~
         |                           pdev
   drivers/nvme/host/apple.c:1547:27: note: each undeclared identifier is reported only once for each function it appears in


vim +1547 drivers/nvme/host/apple.c

  1524	
  1525	static int apple_nvme_probe(struct platform_device *pdev)
  1526	{
  1527		struct apple_nvme *anv;
  1528		int ret;
  1529	
  1530		anv = apple_nvme_alloc(pdev);
  1531		if (IS_ERR(anv))
  1532			return PTR_ERR(anv);
  1533	
  1534		anv->ctrl.admin_q = blk_mq_alloc_queue(&anv->admin_tagset, NULL, NULL);
  1535		if (IS_ERR(anv->ctrl.admin_q)) {
  1536			ret = -ENOMEM;
  1537			anv->ctrl.admin_q = NULL;
  1538			goto out_uninit_ctrl;
  1539		}
  1540	
  1541		nvme_reset_ctrl(&anv->ctrl);
  1542		async_schedule(apple_nvme_async_probe, anv);
  1543	
  1544		return 0;
  1545	
  1546	out_uninit_ctrl:
> 1547		nvme_uninit_ctrl(&dev->ctrl);
  1548		nvme_put_ctrl(&dev->ctrl);
  1549		return ret;
  1550	}
  1551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
