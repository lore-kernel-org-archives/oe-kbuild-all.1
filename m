Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DB23234
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 04:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735621010; cv=none; b=KBMkVgEs4G6/+TfnD7qk+83EATvO1+vpcEOLxx43vteuv/phT523Tcho04Nqr/NnxM+AYlgwuuZXlnFIXVHnodh8/BkjSihZ7kJxJIoJGoac8YvdqhyqpNF12BQLqWVQrRLS4PBSRojUL7rOipqIGL8LWVc2n1VuSf2bCsULTyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735621010; c=relaxed/simple;
	bh=3SN3C4r7UVvBkcUGqEMkXJZLt4SgdJ4SEvxBVJyYbIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJzczK/9/+ztv/1TJ1F8XWbyglL3+0MmeV9EQx8AJWvtckJzCy5wTrMqBMt6dnTtyPqrRk5DPKgz/TfSVml08p5CqEg2xGlyLewAQI7RRW8jPiT3R05+7iEYJf5fX8cFztzfZl6J6llx8ATAMoewQixcuWMertgkMwG6gNn+2IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bF5MfQQo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bF5MfQQo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735621008; x=1767157008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3SN3C4r7UVvBkcUGqEMkXJZLt4SgdJ4SEvxBVJyYbIY=;
  b=bF5MfQQoZ2Gnh+d3Nl9SoPx0aSUNwWoOURzNHs3ZPF+FUwS1eM10ap/E
   pOOUaJmiOdbctmpZEcaxa4jCa3ShDkQhtE68AcNGIV+fHETELwhcNegc3
   71D7PSbDfHhr0Mbd7f9TiKflTzMhHMp8MMnI47FtFMXS3EaJ9xFK8UAtw
   qYwPBYizcI3VNqTVCVCUAa4YYSLi9OnF/G/tsr7jmObr/OsHqW36o4xUK
   ZzRYX6i0aPJ6cMv9XoBe8FgZLDdaazRd+5oOQtCn9NP8zTcYjdFWz5/h2
   3ZMKsdny2EoSyAT3kSo0lmVmQ8qi1rM8QB3j4TFwXUCfB7i3tVH95UGjL
   Q==;
X-CSE-ConnectionGUID: jXFZ/IqHSAikCQGBk5fX/Q==
X-CSE-MsgGUID: y4R9RG/iSgmAAoDN8oObIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46896395"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="46896395"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 20:56:48 -0800
X-CSE-ConnectionGUID: OnG//JH7SlaBWvC2hHp/Lg==
X-CSE-MsgGUID: axZerrtNT6yO/hGUdrfQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105021465"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Dec 2024 20:56:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSUJA-0006kC-2B;
	Tue, 31 Dec 2024 04:56:44 +0000
Date: Tue, 31 Dec 2024 12:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Min Ma <min.ma@amd.com>
Subject: [linux-next:master 478/5236]
 drivers/accel/amdxdna/amdxdna_pci_drv.c:49:34: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202412311210.LfeHTzLw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: be462c97b7dfd24999babe39cce3de224ebe1f80 [478/5236] accel/amdxdna: Add hardware context
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311210.LfeHTzLw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311210.LfeHTzLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311210.LfeHTzLw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/amdxdna_pci_drv.c:49:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct pid *pid @@     got struct pid [noderef] __rcu *pid @@
   drivers/accel/amdxdna/amdxdna_pci_drv.c:49:34: sparse:     expected struct pid *pid
   drivers/accel/amdxdna/amdxdna_pci_drv.c:49:34: sparse:     got struct pid [noderef] __rcu *pid

vim +49 drivers/accel/amdxdna/amdxdna_pci_drv.c

    38	
    39	static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
    40	{
    41		struct amdxdna_dev *xdna = to_xdna_dev(ddev);
    42		struct amdxdna_client *client;
    43		int ret;
    44	
    45		client = kzalloc(sizeof(*client), GFP_KERNEL);
    46		if (!client)
    47			return -ENOMEM;
    48	
  > 49		client->pid = pid_nr(filp->pid);
    50		client->xdna = xdna;
    51	
    52		client->sva = iommu_sva_bind_device(xdna->ddev.dev, current->mm);
    53		if (IS_ERR(client->sva)) {
    54			ret = PTR_ERR(client->sva);
    55			XDNA_ERR(xdna, "SVA bind device failed, ret %d", ret);
    56			goto failed;
    57		}
    58		client->pasid = iommu_sva_get_pasid(client->sva);
    59		if (client->pasid == IOMMU_PASID_INVALID) {
    60			XDNA_ERR(xdna, "SVA get pasid failed");
    61			ret = -ENODEV;
    62			goto unbind_sva;
    63		}
    64		mutex_init(&client->hwctx_lock);
    65		idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1);
    66	
    67		mutex_lock(&xdna->dev_lock);
    68		list_add_tail(&client->node, &xdna->client_list);
    69		mutex_unlock(&xdna->dev_lock);
    70	
    71		filp->driver_priv = client;
    72		client->filp = filp;
    73	
    74		XDNA_DBG(xdna, "pid %d opened", client->pid);
    75		return 0;
    76	
    77	unbind_sva:
    78		iommu_sva_unbind_device(client->sva);
    79	failed:
    80		kfree(client);
    81	
    82		return ret;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
