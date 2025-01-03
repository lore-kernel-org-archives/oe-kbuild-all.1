Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A63E17FE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735908429; cv=none; b=jV33ZjswtfnqWooro5TXNzWT5U1k3QuWHKgiw6QHxUuCmVXmKCX/hedBZ5yhlctFyexqP3/dP+ifLd8/OJph70rIL1rL+gcAzeLDrh171AmS6IhbjEpKjnXoKdZ4gJxnLuOqEE1idABV2eSZij/Fv6F0AxPla5G08e/1YhXx4XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735908429; c=relaxed/simple;
	bh=tGuha5DJA7j94uOe/0Kehd0NwblRp+Y1MQ32rW/caaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FZsd4+rNXOpYBURMuxGp8FyKosfFX9MDiz+cAods0KWfXzIR8QfllbkEl6At7rlL+8QzTwOX+hH8RkMV88lvM1+leyNN3H5DrIF4123BWKsj+Ebd5MHlvDbNTT/4/gqJYt55UIi6APPC4n6LEiRqhXk+0rb1mB60D3TUHkUAdAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqlP6yIK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqlP6yIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735908427; x=1767444427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGuha5DJA7j94uOe/0Kehd0NwblRp+Y1MQ32rW/caaA=;
  b=LqlP6yIKD+QhjC5X/yWyje2b3vgyQ6hjZVsl2UFurxZyqS+Xo4FDr1qB
   P6/UeU6TDcgLUsffN9AV9l0PAXRz64inO9fGPu42OgiFLdcr5e5sBYnqy
   CXpR+ime7TKcyKR7ra1yXL8OcAhMhs8Nskx/4jzj/8PAUah4B0XQtKMkw
   04vFrmVw7XBrWRVAS1W2anQ7As+rClytsomd3P8tfCKPqWiTNTIM+UJJ9
   CqXX95SoAvsjP+aKP9glD3wwQ+WlkbZJVQq6LLP1U/Pibs33z+5m5tUnl
   XKQICKUr3y8YIt2uv5ULGx9KpC1ZCYeEPK3qvfR8PhMlDGj/4MZiqofzH
   w==;
X-CSE-ConnectionGUID: vBDFDl4ETJuDQE8524BLDA==
X-CSE-MsgGUID: njbw0UU9S8+QaMD8uiXb2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="53700324"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="53700324"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 04:47:06 -0800
X-CSE-ConnectionGUID: ASG0/ceRSme/qhBek70xsQ==
X-CSE-MsgGUID: BgGAdpyYR8aO0syVqCQScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102657629"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Jan 2025 04:47:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTh4x-0009k5-0Q;
	Fri, 03 Jan 2025 12:47:03 +0000
Date: Fri, 3 Jan 2025 20:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Min Ma <min.ma@amd.com>
Subject: [linux-next:master 478/5236]
 drivers/accel/amdxdna/amdxdna_pci_drv.c:49:34: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202501032039.mkcV1HGd-lkp@intel.com>
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
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20250103/202501032039.mkcV1HGd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501032039.mkcV1HGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501032039.mkcV1HGd-lkp@intel.com/

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
