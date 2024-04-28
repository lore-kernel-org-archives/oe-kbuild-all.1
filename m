Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889FB19F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 04:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714279091; cv=none; b=NtFS//BGRBtDVgjE5qIMYY1xscYCyRNns5WPIhKw2CKy2bqzoOFkk+xyTw1ilfUtYTCuEaEmrUneHMkmdlvSvE1EvtVGvn3FnIm52eEzuby60VXa5E8QpL5uMqyYCRud8pV0gMyJUzuQ+DD0B7UZbxwIeuJGcZFTWlOO2Lejb98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714279091; c=relaxed/simple;
	bh=tpNHXQbQVqDHc0zXaVs/2kIMoRWvDWQOoW537pNf478=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sQ2wSiQG7IiLaJlRWVOpvRBirs2BoYvvtxzxI8kj4EmMZhyUeyntyNi4txUFbEPvVmDb6bxA/HirPBGE21H/lGSREmfkSMzHQ+ZJV5c7XxRvDHQ4OhhTZ3iYl/qf4zh5hCZfMEGQNlHoZQfmBEreLAMqjfDY5FiPItvyKPwvNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNlwjS4o; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNlwjS4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714279090; x=1745815090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpNHXQbQVqDHc0zXaVs/2kIMoRWvDWQOoW537pNf478=;
  b=RNlwjS4oLF5r2CozhiD47/P3NPmaTyagSKjl3i0cbyVipvqcItecyONw
   fHyZx0aBtoTh2QcneL8RNzAz62JDlG7L6YBpqhyKWPfRiir20hNIUNavn
   FqG4p/JBOoUrVxD8Ubw2x9fqX9nDsl3Lu4NLhgxevDHYN2Us4AuDR20J1
   vmwOwdRUe/s+lz/xuX/NjW6h+Gzpqhpq+2l/RfwukCw4M8kHx4oa8YAAd
   ELG+/Yyn5xm0/AExBK0Cmejq1XIcLrJxVZuNTkl+DZcumMc0/E3DnhWOI
   kyMueim4bvyffhPrpljMEMG0+hScNECZde1ISXTZMWP8P/Cl1dBdOoajn
   w==;
X-CSE-ConnectionGUID: M9c2myJ+Sumq1hVQVIF/kA==
X-CSE-MsgGUID: h6L4y3LcQ3Cu66Y+eB86AA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13800390"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="13800390"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 21:38:09 -0700
X-CSE-ConnectionGUID: 05KQox5iRdSnLtLoZgUD7g==
X-CSE-MsgGUID: TdZYuI9qTq+wGzP2XU9QKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="30462325"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2024 21:38:08 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0wIf-0005pe-1l;
	Sun, 28 Apr 2024 04:38:05 +0000
Date: Sun, 28 Apr 2024 12:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.8.y 91/104]
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:242:13: error: 'struct
 pmic_typec' has no member named 'port_stop'
Message-ID: <202404281210.2hbfHYuT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.8.y
head:   0bde7107456c88f5ccc83c66d7638f1bf02fa8a1
commit: 73754ea4756c40950cfbdfc032c41b547d13bafc [91/104] usb: typec: qcom-pmic: fix use-after-free on late probe errors
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240428/202404281210.2hbfHYuT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281210.2hbfHYuT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281210.2hbfHYuT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c: In function 'qcom_pmic_typec_probe':
>> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:242:13: error: 'struct pmic_typec' has no member named 'port_stop'
     242 |         tcpm->port_stop(tcpm);
         |             ^~


vim +242 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c

   151	
   152	static int qcom_pmic_typec_probe(struct platform_device *pdev)
   153	{
   154		struct pmic_typec *tcpm;
   155		struct device *dev = &pdev->dev;
   156		struct device_node *np = dev->of_node;
   157		const struct pmic_typec_resources *res;
   158		struct regmap *regmap;
   159		struct device *bridge_dev;
   160		u32 base[2];
   161		int ret;
   162	
   163		res = of_device_get_match_data(dev);
   164		if (!res)
   165			return -ENODEV;
   166	
   167		tcpm = devm_kzalloc(dev, sizeof(*tcpm), GFP_KERNEL);
   168		if (!tcpm)
   169			return -ENOMEM;
   170	
   171		tcpm->dev = dev;
   172		tcpm->tcpc.init = qcom_pmic_typec_init;
   173		tcpm->tcpc.get_vbus = qcom_pmic_typec_get_vbus;
   174		tcpm->tcpc.set_vbus = qcom_pmic_typec_set_vbus;
   175		tcpm->tcpc.set_cc = qcom_pmic_typec_set_cc;
   176		tcpm->tcpc.get_cc = qcom_pmic_typec_get_cc;
   177		tcpm->tcpc.set_polarity = qcom_pmic_typec_set_polarity;
   178		tcpm->tcpc.set_vconn = qcom_pmic_typec_set_vconn;
   179		tcpm->tcpc.start_toggling = qcom_pmic_typec_start_toggling;
   180		tcpm->tcpc.set_pd_rx = qcom_pmic_typec_set_pd_rx;
   181		tcpm->tcpc.set_roles = qcom_pmic_typec_set_roles;
   182		tcpm->tcpc.pd_transmit = qcom_pmic_typec_pd_transmit;
   183	
   184		regmap = dev_get_regmap(dev->parent, NULL);
   185		if (!regmap) {
   186			dev_err(dev, "Failed to get regmap\n");
   187			return -ENODEV;
   188		}
   189	
   190		ret = of_property_read_u32_array(np, "reg", base, 2);
   191		if (ret)
   192			return ret;
   193	
   194		tcpm->pmic_typec_port = qcom_pmic_typec_port_alloc(dev);
   195		if (IS_ERR(tcpm->pmic_typec_port))
   196			return PTR_ERR(tcpm->pmic_typec_port);
   197	
   198		tcpm->pmic_typec_pdphy = qcom_pmic_typec_pdphy_alloc(dev);
   199		if (IS_ERR(tcpm->pmic_typec_pdphy))
   200			return PTR_ERR(tcpm->pmic_typec_pdphy);
   201	
   202		ret = qcom_pmic_typec_port_probe(pdev, tcpm->pmic_typec_port,
   203						 res->port_res, regmap, base[0]);
   204		if (ret)
   205			return ret;
   206	
   207		ret = qcom_pmic_typec_pdphy_probe(pdev, tcpm->pmic_typec_pdphy,
   208						  res->pdphy_res, regmap, base[1]);
   209		if (ret)
   210			return ret;
   211	
   212		mutex_init(&tcpm->lock);
   213		platform_set_drvdata(pdev, tcpm);
   214	
   215		tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
   216		if (!tcpm->tcpc.fwnode)
   217			return -EINVAL;
   218	
   219		bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
   220		if (IS_ERR(bridge_dev))
   221			return PTR_ERR(bridge_dev);
   222	
   223		tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
   224		if (IS_ERR(tcpm->tcpm_port)) {
   225			ret = PTR_ERR(tcpm->tcpm_port);
   226			goto fwnode_remove;
   227		}
   228	
   229		ret = qcom_pmic_typec_port_start(tcpm->pmic_typec_port,
   230						 tcpm->tcpm_port);
   231		if (ret)
   232			goto port_unregister;
   233	
   234		ret = qcom_pmic_typec_pdphy_start(tcpm->pmic_typec_pdphy,
   235						  tcpm->tcpm_port);
   236		if (ret)
   237			goto port_stop;
   238	
   239		return 0;
   240	
   241	port_stop:
 > 242		tcpm->port_stop(tcpm);
   243	port_unregister:
   244		tcpm_unregister_port(tcpm->tcpm_port);
   245	fwnode_remove:
   246		fwnode_remove_software_node(tcpm->tcpc.fwnode);
   247	
   248		return ret;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
