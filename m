Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7855E12CDAE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 06:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728023894; cv=none; b=d130tKXjg+k9nJgAXFwVoaaPgKAGk81ahKcVbxgmfM1vLccLH3M3IJkSmZpOEF8eKrEQO6oQI9YLxUhBjEDZvQwlIpy4sQen9nsaXPvRw2vRatx9zZ/cF0rL0Pi15gDtQtoDULwKXzJOxJIvHXLgEXmBbX8OMYnaXQN1nf2fiZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728023894; c=relaxed/simple;
	bh=j+rT16qzaQQJjY6JFU6euGJ20DmmCcOZD43IaG0B7ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C+MhVKvZ5oTGsdgwHYLvitpVXUxU5VoJeR+fNgVemqXd2W9EONhptuuZAGkpEtON9kiw+mMqJSqLVWk7MP0LwUQPZaGUvz1vDWbgUJayV9iqaRY848J/paDjfLwfo15H56J9lE55qybe8ZsMi3SRdlzyRb2PcXVyCwKYQcSHhfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xs1bqF+Q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xs1bqF+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728023892; x=1759559892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j+rT16qzaQQJjY6JFU6euGJ20DmmCcOZD43IaG0B7ys=;
  b=Xs1bqF+Qx3wCDRn+ungmHASU097VH4GEQnif/EehhqWMUQbQsgFpTK2e
   aKaRTPfZ/pnixRc4yZLfGhbCTWcuH2Mp7Aux0TnHV/kcq/248bIr1M8uh
   euFdKOPK0TZJDGC932r/tmGbIVeq+whuLYetZhFseQ41JCriaNrraK0GF
   G61bI5WGiQEeq1MtZOOY9dlJiD/MBlLKCwl/Y2OjxlhWn6oaJjj8b3K2Q
   /uqLUioKiKn3yE2Cq9zPVEX/SB9nOj0vWkw1KPaYq7nEyKG32u3g7AVDL
   q6JlCd05YDwM8CrC0nfsoB1nRg5mFs+3lyR+8k5aRv80BFTGUJ1iRaiMA
   g==;
X-CSE-ConnectionGUID: MD8569wPRc2PvxKRtcpFeg==
X-CSE-MsgGUID: pNuJrJc/SLO2nz+VRCL6MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27408716"
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="27408716"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 23:38:10 -0700
X-CSE-ConnectionGUID: kOVhEliYRRe/jV2w9qEwBg==
X-CSE-MsgGUID: /DgPIzNuTNW43mL4iGCOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,176,1725346800"; 
   d="scan'208";a="74920524"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Oct 2024 23:38:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swbwz-0001JE-1N;
	Fri, 04 Oct 2024 06:38:05 +0000
Date: Fri, 4 Oct 2024 14:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:1242: undefined reference to
 `ntb_register_device'
Message-ID: <202410041405.6wFHxRZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   3a5928702e7120f83f703fd566082bfb59f1a57e
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: x86_64-randconfig-161-20241004 (https://download.01.org/0day-ci/archive/20241004/202410041405.6wFHxRZc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410041405.6wFHxRZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410041405.6wFHxRZc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `pci_vntb_probe':
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:1242: undefined reference to `ntb_register_device'
   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `epf_ntb_cmd_handler':
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:261: undefined reference to `ntb_db_event'
   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `epf_ntb_link_up':
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:173: undefined reference to `ntb_link_event'
>> ld: drivers/pci/endpoint/functions/pci-epf-vntb.c:173: undefined reference to `ntb_link_event'


vim +1242 drivers/pci/endpoint/functions/pci-epf-vntb.c

  1225	
  1226	static int pci_vntb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  1227	{
  1228		int ret;
  1229		struct epf_ntb *ndev = (struct epf_ntb *)pdev->sysdata;
  1230		struct device *dev = &pdev->dev;
  1231	
  1232		ndev->ntb.pdev = pdev;
  1233		ndev->ntb.topo = NTB_TOPO_NONE;
  1234		ndev->ntb.ops =  &vntb_epf_ops;
  1235	
  1236		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
  1237		if (ret) {
  1238			dev_err(dev, "Cannot set DMA mask\n");
  1239			return -EINVAL;
  1240		}
  1241	
> 1242		ret = ntb_register_device(&ndev->ntb);
  1243		if (ret) {
  1244			dev_err(dev, "Failed to register NTB device\n");
  1245			goto err_register_dev;
  1246		}
  1247	
  1248		dev_dbg(dev, "PCI Virtual NTB driver loaded\n");
  1249		return 0;
  1250	
  1251	err_register_dev:
  1252		return -EINVAL;
  1253	}
  1254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
