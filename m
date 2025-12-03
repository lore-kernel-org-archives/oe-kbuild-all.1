Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E072C0F63
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764797077; cv=none; b=hKIoxwboasOLpbydtAUwoyNBivrpWCbA20vVtAPdnHBR2I0r3bJkuxOXAf3yFFkKEgHX1aBKGP/7hhvGNOB6ON2b5q9QWltCECSsYDYxjnuEVMwD59OoZKL1uIlPiRJqX6xFks0VWWogVpKG/zVJcVzCe+ZEUjYWHUQ4FapMURs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764797077; c=relaxed/simple;
	bh=UV6UV41W9ADaBleizi7ZUWP/3HauxKikh4SAuBElttU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Clc2dddjtAwhc6J3GSwxXcNm2ZXN9+e10Pu87Yl4/6KBglv7fA1rzWnBlwphmpRVSNR4aeb3tSUhoUksqGz8GxeZDXwcel1wR5w0d13l3SwJvaz+VdI0yteL2za2OiiHJSaODjt5RWo8w1rc5fs2J9FaA1oTSPYS4k75zBV2Hr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5oKKisz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5oKKisz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764797075; x=1796333075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UV6UV41W9ADaBleizi7ZUWP/3HauxKikh4SAuBElttU=;
  b=U5oKKiszEMRVYN2qMlkZE/oIKgPD5wHCvsRpp6MVzv+KpNCwfdQOSzJf
   Sk3ISMFq+WMB1mYBBNs9MiICr0TWNoFfH1wTF50M9Jgk6Qq2pzo3FLVFy
   E6WZr2mEspQ+Rycf5Wdza9bR6hMLgMtazuZ7BkvznyvEhKUxlRPzQn20c
   kvryKZd2e3eCBlFqeH+14oHKvQjVeKBNcXtOZCVSSLVAagZirNxU/S+BB
   xBXhvksyr0GYYIjCfxrCWevCtg2p7ZQDVh3khHdD62i0M0YgZTYX6SDFI
   6SmFTn0112Q4zjs/dK+BTnCmmTIDP3JRyVxinorrET7JjfAXpoteqlx/s
   A==;
X-CSE-ConnectionGUID: L2QE9S7hSxGqlmOTPaULoA==
X-CSE-MsgGUID: R8OwEhrbTriBaVKRUyp0MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78274903"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78274903"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 13:24:35 -0800
X-CSE-ConnectionGUID: e2U2+B9mTgOlyqfCP3gcNw==
X-CSE-MsgGUID: 2ioy6r1fRGmxIYlCmCh5wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="225471632"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Dec 2025 13:24:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQuKt-00000000DAN-1i1o;
	Wed, 03 Dec 2025 21:24:31 +0000
Date: Thu, 4 Dec 2025 05:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: Manikandan K Pillai <mpillai@cadence.com>
Cc: oe-kbuild-all@lists.linux.dev, Manivannan Sadhasivam <mani@kernel.org>
Subject: [linux-next:master 7783/13147]
 drivers/pci/controller/cadence/pcie-cadence-plat.c:89: undefined reference
 to `cdns_pcie_host_setup'
Message-ID: <202512040538.7EtGUq0z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b2c27842ba853508b0da00187a7508eb3a96c8f7
commit: 611627a4e5e4af7b96aab4f10d130f6a8a615020 [7783/13147] PCI: cadence: Add module support for platform controller driver
config: microblaze-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251204/202512040538.7EtGUq0z-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040538.7EtGUq0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512040538.7EtGUq0z-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/pci/controller/cadence/pcie-cadence-plat.o: in function `cdns_plat_pcie_probe':
>> drivers/pci/controller/cadence/pcie-cadence-plat.c:89: undefined reference to `cdns_pcie_host_setup'


vim +89 drivers/pci/controller/cadence/pcie-cadence-plat.c

d07701a17aec3e drivers/pci/controller/cadence/pcie-cadence-plat.c Kishon Vijay Abraham I 2020-07-22   39  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   40  static int cdns_plat_pcie_probe(struct platform_device *pdev)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   41  {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   42  	const struct cdns_plat_pcie_of_data *data;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   43  	struct cdns_plat_pcie *cdns_plat_pcie;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   44  	struct device *dev = &pdev->dev;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   45  	struct pci_host_bridge *bridge;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   46  	struct cdns_pcie_ep *ep;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   47  	struct cdns_pcie_rc *rc;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   48  	int phy_count;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   49  	bool is_rc;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   50  	int ret;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   51  
131748ad2939df drivers/pci/controller/cadence/pcie-cadence-plat.c Fan Fei                2021-12-22   52  	data = of_device_get_match_data(dev);
131748ad2939df drivers/pci/controller/cadence/pcie-cadence-plat.c Fan Fei                2021-12-22   53  	if (!data)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   54  		return -EINVAL;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   55  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   56  	is_rc = data->is_rc;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   57  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   58  	pr_debug(" Started %s with is_rc: %d\n", __func__, is_rc);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   59  	cdns_plat_pcie = devm_kzalloc(dev, sizeof(*cdns_plat_pcie), GFP_KERNEL);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   60  	if (!cdns_plat_pcie)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   61  		return -ENOMEM;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   62  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   63  	platform_set_drvdata(pdev, cdns_plat_pcie);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   64  	if (is_rc) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   65  		if (!IS_ENABLED(CONFIG_PCIE_CADENCE_PLAT_HOST))
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   66  			return -ENODEV;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   67  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   68  		bridge = devm_pci_alloc_host_bridge(dev, sizeof(*rc));
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   69  		if (!bridge)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   70  			return -ENOMEM;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   71  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   72  		rc = pci_host_bridge_priv(bridge);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   73  		rc->pcie.dev = dev;
d07701a17aec3e drivers/pci/controller/cadence/pcie-cadence-plat.c Kishon Vijay Abraham I 2020-07-22   74  		rc->pcie.ops = &cdns_plat_ops;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   75  		cdns_plat_pcie->pcie = &rc->pcie;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   76  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   77  		ret = cdns_pcie_init_phy(dev, cdns_plat_pcie->pcie);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   78  		if (ret) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   79  			dev_err(dev, "failed to init phy\n");
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   80  			return ret;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   81  		}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   82  		pm_runtime_enable(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   83  		ret = pm_runtime_get_sync(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   84  		if (ret < 0) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   85  			dev_err(dev, "pm_runtime_get_sync() failed\n");
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   86  			goto err_get_sync;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   87  		}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   88  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  @89  		ret = cdns_pcie_host_setup(rc);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   90  		if (ret)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   91  			goto err_init;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   92  	} else {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   93  		if (!IS_ENABLED(CONFIG_PCIE_CADENCE_PLAT_EP))
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   94  			return -ENODEV;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   95  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   96  		ep = devm_kzalloc(dev, sizeof(*ep), GFP_KERNEL);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   97  		if (!ep)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   98  			return -ENOMEM;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11   99  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  100  		ep->pcie.dev = dev;
d07701a17aec3e drivers/pci/controller/cadence/pcie-cadence-plat.c Kishon Vijay Abraham I 2020-07-22  101  		ep->pcie.ops = &cdns_plat_ops;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  102  		cdns_plat_pcie->pcie = &ep->pcie;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  103  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  104  		ret = cdns_pcie_init_phy(dev, cdns_plat_pcie->pcie);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  105  		if (ret) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  106  			dev_err(dev, "failed to init phy\n");
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  107  			return ret;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  108  		}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  109  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  110  		pm_runtime_enable(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  111  		ret = pm_runtime_get_sync(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  112  		if (ret < 0) {
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  113  			dev_err(dev, "pm_runtime_get_sync() failed\n");
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  114  			goto err_get_sync;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  115  		}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  116  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  117  		ret = cdns_pcie_ep_setup(ep);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  118  		if (ret)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  119  			goto err_init;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  120  	}
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  121  
27cd7e3c9bb1ae drivers/pci/controller/cadence/pcie-cadence-plat.c Li Chen                2021-10-21  122  	return 0;
27cd7e3c9bb1ae drivers/pci/controller/cadence/pcie-cadence-plat.c Li Chen                2021-10-21  123  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  124   err_init:
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  125   err_get_sync:
7a790087c1ad11 drivers/pci/controller/cadence/pcie-cadence-plat.c Dinghao Liu            2020-05-20  126  	pm_runtime_put_sync(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  127  	pm_runtime_disable(dev);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  128  	cdns_pcie_disable_phy(cdns_plat_pcie->pcie);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  129  	phy_count = cdns_plat_pcie->pcie->phy_count;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  130  	while (phy_count--)
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  131  		device_link_del(cdns_plat_pcie->pcie->link[phy_count]);
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  132  
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  133  	return 0;
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  134  }
bd22885aa188f1 drivers/pci/controller/pcie-cadence-plat.c         Tom Joseph             2019-11-11  135  

:::::: The code at line 89 was first introduced by commit
:::::: bd22885aa188f135fd98382febfec650601ec998 PCI: cadence: Refactor driver to use as a core library

:::::: TO: Tom Joseph <tjoseph@cadence.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
