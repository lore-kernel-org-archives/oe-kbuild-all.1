Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9131667D8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717623202; cv=none; b=sspb+nAteMWEXfd+cQlBG+VPY0GG+mwGyEkzAMAFk15ccu8yLlGNDafpEvR9HdmxTSLFICWcjxcDyYd8C61mS6Qs6x3q2tiNOjJAj5gXZ8s8efsp9IF8o0plyE7hoUn+h9vLGlUWEC7R7uKqpbHs3nMuDOPZnj255nwSsI2R02s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717623202; c=relaxed/simple;
	bh=aJdXo0eF9RbXYZ7pLnemDZX+OFNV/FzTHOGwF9Y11AA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m2X9IHkeIT95sv+zmtKkTZs/HR5+b5u3IIUnG8tcY/xt3gHZTeCkhR5y8Uy/eM6PbMCK5NYqDBdAbf+LI4h29OX5Zlt2iaxMGqPiTtPqLTpKRJ8Dg2KPLlFy7ZwqiY+6rrYYswzuD3AJ9TaPIdswdPJ80lEXhji/+U5Y9RX76EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYTdQQb+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYTdQQb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717623200; x=1749159200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aJdXo0eF9RbXYZ7pLnemDZX+OFNV/FzTHOGwF9Y11AA=;
  b=cYTdQQb+wdT5I59/4ccG7x5yN0ZuXr72+GVmZFcuz+MiriW47IEHgvs3
   YhR2skmmzindX7RH3n2F+e9AuCaB+8URaJGHY27A1b1qJhRwXKrIkegl7
   tT6DWNgSjA9AgnUYL10K1WQ8XFKfAvQnsjjfsPAIdeocrRlJoXXosHxVL
   GCL9zkR4yTq8w55wGC226a+6tIKc8eUx5LGXoYJ1/LkzSxgyRgtNFLVQg
   7W7y8nou2lNaTtux5vA19hMuKLJtdX1JCDgwnQg8kKJe8yaxeWSxkwUBK
   v3A7WKrNaTq8jW6lYQEfa/EGxLP9/8wllBlBsdgAHwI4YakFlwDub1g9u
   A==;
X-CSE-ConnectionGUID: GW4cZIBrR7ik4+H2UeFuTg==
X-CSE-MsgGUID: 0E2h/ggsQVuHtykO2d8/Ng==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="18082585"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="18082585"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 14:33:20 -0700
X-CSE-ConnectionGUID: je+Rs4WRQWSkLCi+lWWWOg==
X-CSE-MsgGUID: i8uitXinQ2CHw1uUGqFm2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="75204967"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Jun 2024 14:33:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEyFv-0002HI-2k;
	Wed, 05 Jun 2024 21:33:15 +0000
Date: Thu, 6 Jun 2024 05:32:26 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Subject: [linux-nvme:nvme-6.11 6/10] drivers/nvme/host/apple.c:1534:9: error:
 'result' undeclared
Message-ID: <202406060540.s0O7hkb5-lkp@intel.com>
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
commit: ff5ff45d19d8b13ceef35948204b08a51000f15f [6/10] nvme: split device add from initialization
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406060540.s0O7hkb5-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406060540.s0O7hkb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406060540.s0O7hkb5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/apple.c: In function 'apple_nvme_probe':
>> drivers/nvme/host/apple.c:1534:9: error: 'result' undeclared (first use in this function)
    1534 |         result = nvme_add_ctrl(&anv->ctrl);
         |         ^~~~~~
   drivers/nvme/host/apple.c:1534:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/nvme/host/apple.c:1551:27: error: 'dev' undeclared (first use in this function); did you mean 'pdev'?
    1551 |         nvme_uninit_ctrl(&dev->ctrl);
         |                           ^~~
         |                           pdev


vim +/result +1534 drivers/nvme/host/apple.c

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
> 1534		result = nvme_add_ctrl(&anv->ctrl);
  1535		if (result)
  1536			goto out_put_ctrl;
  1537	
  1538		anv->ctrl.admin_q = blk_mq_alloc_queue(&anv->admin_tagset, NULL, NULL);
  1539		if (IS_ERR(anv->ctrl.admin_q)) {
  1540			ret = -ENOMEM;
  1541			anv->ctrl.admin_q = NULL;
  1542			goto out_uninit_ctrl;
  1543		}
  1544	
  1545		nvme_reset_ctrl(&anv->ctrl);
  1546		async_schedule(apple_nvme_async_probe, anv);
  1547	
  1548		return 0;
  1549	
  1550	out_uninit_ctrl:
  1551		nvme_uninit_ctrl(&dev->ctrl);
  1552	out_put_ctrl:
  1553		nvme_put_ctrl(&dev->ctrl);
  1554		return ret;
  1555	}
  1556	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
