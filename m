Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAAF16F8ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Apr 2024 16:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713456345; cv=none; b=PU4UaR3QI6oOPwvFEQCrHhc6+qHhK+UNCvQmjGdafnlXscp4ZHNUEA9ji8Rm6EKRKyiQTb1xqwhvGQgIC2b1sB/oT+UCzdw7ao8OltkoueG7IEKKls7C58mNyX61XVejRV1/yUKc9VbdkBGwETKux7CJ6hSh7ay17mL0BcyoJUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713456345; c=relaxed/simple;
	bh=hDevJGI/CphcvnNhm+xQvq6z4yPy1PNBsVAviAQTQPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAs7HjoS1Lj9StDGsnCInyvrX5kaClP6HeGlZj27ah/GL1vZn364E2Tq3fO8AzHLZ8VoTpOxNGN0JSVFfhhkkEVfGhx7cIVl+2LIwMFWzKWU81FuKHsEtJa4YOJdYRkn3GBKKoDGHKMq9vykVtHQe60a9Hnw+atAAqM9K/niIGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzA1bNfA; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzA1bNfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713456342; x=1744992342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hDevJGI/CphcvnNhm+xQvq6z4yPy1PNBsVAviAQTQPo=;
  b=nzA1bNfAoIOSpOc5c1sUEvK0hHvQ9zj6XZKMVd+jraTL9zJP2mFbHMm8
   6xYB2QucU5FufNRrr6xE2oqLaseOFWGl7v5HS2VzFTcm9hV4NRxWDEjBr
   Ck4Hr3b6Zamgx+7gG2a3XiE3IUiUKboCx/YkJkBR0bwmVfAs17a3MqRmF
   yPJCdfjsgv7b5H5MamRTxVUN/6etzclyjd2kgZ0cbq1bsUXNOmAy+MG/6
   ZyEYFbr9SB/KKt4YuEJmB/HEjHSoOhP/k6bHyTAS0fv0abjTFF73BrDLb
   z9ao2jm/IUpVMWkF5bLvaGZ89eL+7GrG3OH065dgIHQCo5O/tYrxYM5cc
   w==;
X-CSE-ConnectionGUID: MkTdbnCNQiSwsr4c0ZwlcA==
X-CSE-MsgGUID: yYkdsimqQ2CWSJJI56LqbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20160290"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="20160290"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 09:05:41 -0700
X-CSE-ConnectionGUID: M+aIHnlCQxyhjK8Wqnx+zA==
X-CSE-MsgGUID: wroUWproTMuBKpMX7VbBLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="60452205"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 18 Apr 2024 09:05:41 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxUGY-0008v2-0K;
	Thu, 18 Apr 2024 16:05:38 +0000
Date: Fri, 19 Apr 2024 00:05:23 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 15894/18115]
 drivers/mfd/maxim_serdes.c:63:5: warning: no previous prototype for
 'maxim_serdes_chain_register_remote'
Message-ID: <202404182358.z0QHNyfH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 4679c4f90240fab234b9faa70db8ed791ef6e570 [15894/18115] LF-10269-5: mfd: add Maxim SerDes link manager layer
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240418/202404182358.z0QHNyfH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240418/202404182358.z0QHNyfH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404182358.z0QHNyfH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/maxim_serdes.c:63:5: warning: no previous prototype for 'maxim_serdes_chain_register_remote' [-Wmissing-prototypes]
      63 | int maxim_serdes_chain_register_remote(struct device *dev, int link, void (*cb)(void *), void *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/maxim_serdes.c:109:5: warning: no previous prototype for 'maxim_serdes_chain_register_local' [-Wmissing-prototypes]
     109 | int maxim_serdes_chain_register_local(struct device *dev, int remote_links_used,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/mfd/max96752-core.c:146:5: warning: no previous prototype for 'max96752_set_link_params' [-Wmissing-prototypes]
     146 | int max96752_set_link_params(struct max96752 *max96752)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/maxim_serdes_chain_register_remote +63 drivers/mfd/maxim_serdes.c

    62	
  > 63	int maxim_serdes_chain_register_remote(struct device *dev, int link, void (*cb)(void *), void *data)
    64	{
    65		struct maxim_serdes_chain *serdes_chain;
    66		struct device_node *dn;
    67		int i;
    68	
    69		dn = of_node_get(dev->of_node);
    70	
    71		while (dn) {
    72			serdes_chain = maxim_serdes_get_chain(dn);
    73			if (serdes_chain) {
    74				of_node_put(dn);
    75				break;
    76			}
    77	
    78			dn = of_get_next_parent(dn);
    79		}
    80	
    81		if (!dn) {
    82			dev_err(dev, "could not find the local device of_node in the chains list\n");
    83			return -ENODEV;
    84		}
    85	
    86		if (link > serdes_chain->remotes_no - 1) {
    87			dev_err(dev, "invalid remote link id provided\n");
    88			return -EINVAL;
    89		}
    90	
    91		serdes_chain->remote_late_setup[link].cb = cb;
    92		serdes_chain->remote_late_setup[link].data = data;
    93	
    94		/* let's find out if all remotes registered their late setup routines */
    95		for (i = 0; i < serdes_chain->remotes_no; i++) {
    96			if (!serdes_chain->remote_late_setup[i].cb)
    97				return 0;
    98		}
    99	
   100		/* we're good to go, let's queue the late setup work */
   101		INIT_WORK(&serdes_chain->late_setup_work, maxim_serdes_worker);
   102	
   103		queue_work(system_unbound_wq, &serdes_chain->late_setup_work);
   104	
   105		return 0;
   106	};
   107	EXPORT_SYMBOL(maxim_serdes_chain_register_remote);
   108	
 > 109	int maxim_serdes_chain_register_local(struct device *dev, int remote_links_used,
   110					      void (*cb)(void *), void *data)
   111	{
   112		struct maxim_serdes_chain *chain;
   113		int extra_space;
   114	
   115		extra_space = remote_links_used * sizeof(struct maxim_serdes_late_setup);
   116		chain = devm_kzalloc(dev, sizeof(*chain) + extra_space, GFP_KERNEL);
   117		if (!chain)
   118			return -ENOMEM;
   119	
   120		chain->local_dev_node = dev->of_node;
   121		chain->local_late_setup.cb = cb;
   122		chain->local_late_setup.data = data;
   123		chain->remotes_no = remote_links_used;
   124	
   125		list_add_tail(&chain->entry, &maxim_serdes_chains_list);
   126	
   127		return 0;
   128	}
   129	EXPORT_SYMBOL(maxim_serdes_chain_register_local);
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
