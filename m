Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C755232
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 07:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pgp+ofgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702193436; x=1733729436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WZxNHo0q9w8LSdw4MKCFgG4PHcSHXnttu6d7mHWuMpE=;
  b=Pgp+ofghSPGxCbq+L5Wboy4P0i065apFRFkT1dgCRYjHC2bJUuEnrY9k
   cxiqQwDzsbDclGsibsvLZr2xm5wHay0tbYhU+SGAwmTsntz+Pargs9aHy
   ivUcY9kNKf8AfPh0bDO8fotmO5YNi2Q4DIv+9MfkPOuuK/8PGKujYx0Gc
   3mlfkY/FjI35/l7juUVe9UtiW5V9Bh3jim5KHhNime1Tpbj+SfzQxQEA+
   +oHJyYs7C2nXpAEGUu27kJ1HtzjelIIceh5/VCPQFHEj6UtALEbYB/Dkq
   T8u7yZs1xacLRZQw5leAonwuZzQEc+BVoQ9bhaUZk7LZry5ydjk3t/n0U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="374701646"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="374701646"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 23:30:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="772599094"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="772599094"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 09 Dec 2023 23:30:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCEGm-000GXh-0j;
	Sun, 10 Dec 2023 07:30:32 +0000
Date: Sun, 10 Dec 2023 15:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [srini-nvmem:for-next 7/13] drivers/nvmem/core.c:1470:2: error:
 implicit declaration of function 'nvmem_layout_module_put'; did you mean
 'nvmem_layout_bus_register'?
Message-ID: <202312101544.y9ozr9Ge-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   d58acb1e2be2e29f5e4add7d48ae35e23d69b7c3
commit: ed7778e43271c55d78ff458b826f4e989da72444 [7/13] nvmem: core: Rework layouts to become regular devices
config: i386-buildonly-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231210/202312101544.y9ozr9Ge-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312101544.y9ozr9Ge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312101544.y9ozr9Ge-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_cell_put':
>> drivers/nvmem/core.c:1470:2: error: implicit declaration of function 'nvmem_layout_module_put'; did you mean 'nvmem_layout_bus_register'? [-Werror=implicit-function-declaration]
     nvmem_layout_module_put(nvmem);
     ^~~~~~~~~~~~~~~~~~~~~~~
     nvmem_layout_bus_register
   cc1: some warnings being treated as errors


vim +1470 drivers/nvmem/core.c

  1455	
  1456	/**
  1457	 * nvmem_cell_put() - Release previously allocated nvmem cell.
  1458	 *
  1459	 * @cell: Previously allocated nvmem cell by nvmem_cell_get().
  1460	 */
  1461	void nvmem_cell_put(struct nvmem_cell *cell)
  1462	{
  1463		struct nvmem_device *nvmem = cell->entry->nvmem;
  1464	
  1465		if (cell->id)
  1466			kfree_const(cell->id);
  1467	
  1468		kfree(cell);
  1469		__nvmem_device_put(nvmem);
> 1470		nvmem_layout_module_put(nvmem);
  1471	}
  1472	EXPORT_SYMBOL_GPL(nvmem_cell_put);
  1473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
