Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783E838396
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727771105; cv=none; b=MD6blHRhgz5kaDY7aVvlYQ9cIAcXiO8ytNjQssuapS6kVCWtttR6uM2FMO09F8QrC+HXXXunlrnl5aDDAeIC8iNcgntytXyntCnvewmfCQAG+D5CT9gQyeCDZiczrPiHgQOwCIcdXKLPigzLLlTjSnqAN8slp/nSxyZee5oZDd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727771105; c=relaxed/simple;
	bh=jovCENfiAHiFpIZV3BU9iJCEAFC1fLcrTP6A5KMPmkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GvOFtITHm8qJrx4gz4ulBcsxCtEG7MWz80gm+DmRy6UVgFMNrsEO45m4vMzs1eoIaruz6G8e6vndbVLl+5g6AaaCRJVXwYHbUtdnSxqmSDoypXAr8Naa1zsBTmljS0kS/NbUOoSsRgF71YUj5gt/zpCFTmnXHZ/JUsEV/HZbqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nCakffqj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nCakffqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727771104; x=1759307104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jovCENfiAHiFpIZV3BU9iJCEAFC1fLcrTP6A5KMPmkA=;
  b=nCakffqjoNYPWCWazlyTHqY1SVNrr9XHCxulckBkkq187PKH4qq6tj6z
   GctthJsi4VqNnvUm4gUsytE7wb+q9lXYOoM79j1HER5dywSgpO8XkCvYr
   O8oDoGuU28A64XMXEtKVFYAUWokF8OrIhwEntQR9k9sbm53nBaOEMb5jp
   TPy425ZWQq4rBQQqfvZ3VzKiNVDhETXyQHgMs4wJe5ptezESCBWcHu7vd
   9FRBNXdJQ7HtkiGytaCOhSNA/nd4glrIc7cM/zmZ++jpBV+VTd8U1pHZb
   hYNSuz7Zm0NO4iEJp/ArbMytGxmI1a4BzkWF4HzGywgCgxe9IJbsdybRw
   g==;
X-CSE-ConnectionGUID: Q7awvOf6SVSJe3kYXIBf7w==
X-CSE-MsgGUID: QvUAVNC2SduX26ov3+n2Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26770810"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="26770810"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 01:25:03 -0700
X-CSE-ConnectionGUID: IVqVWzFsSYurjU7/rlRKfA==
X-CSE-MsgGUID: 5iwXoFTZSmiCfWpipqzRfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78315335"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Oct 2024 01:25:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svYBn-000QQb-1W;
	Tue, 01 Oct 2024 08:24:59 +0000
Date: Tue, 1 Oct 2024 16:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1032/16788]
 drivers/mfd/maxim_serdes.c:63:5: warning: no previous prototype for
 'maxim_serdes_chain_register_remote'
Message-ID: <202410011623.4FcsrjOb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 56ce69ebbbda4ee59d85f91435eba92cc671e6f3 [1032/16788] LF-10269-5: mfd: add Maxim SerDes link manager layer
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241001/202410011623.4FcsrjOb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011623.4FcsrjOb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011623.4FcsrjOb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/maxim_serdes.c:63:5: warning: no previous prototype for 'maxim_serdes_chain_register_remote' [-Wmissing-prototypes]
      63 | int maxim_serdes_chain_register_remote(struct device *dev, int link, void (*cb)(void *), void *data)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mfd/maxim_serdes.c:109:5: warning: no previous prototype for 'maxim_serdes_chain_register_local' [-Wmissing-prototypes]
     109 | int maxim_serdes_chain_register_local(struct device *dev, int remote_links_used,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/mfd/max96752-core.c:145:5: warning: no previous prototype for 'max96752_set_link_params' [-Wmissing-prototypes]
     145 | int max96752_set_link_params(struct max96752 *max96752)
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
