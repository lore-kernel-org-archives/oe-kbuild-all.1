Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC031CA6BB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725369731; cv=none; b=hT1HiI+VvI4N0rqvtOXVWrE1S6QubKlLLsm+9W0jqB24FZN7tKC4NnQ9qU5feTdrHFURJUMIWgufQEgJtRLa+S8KhcF3XeqL4OJad2GBdjbEU+iaD6C5aUKwmaBBNnF/acFAnsMsowjZWwYw+ofy0iwZP6wyq83PZqKe4fwxS8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725369731; c=relaxed/simple;
	bh=XrvkYw+XAD3M+dUfiwFTxwodyabp8CHo8Jtj6r34uA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IBY4QngaEs5Hch7cXSl2Izo90oXhK6W6wH2SIKHZKGmyCp7vbs5yd0T5MzJvZNZcyeu7DzLbyOKN47w6/hR9hXe/63lX/zI5mCOW/q6CaKrA5vwZ9qUK/Y3GDxYpImKDRcc8lebBWr7mjKY0syXzuySENH36FsOxRT20XeoVwqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yletz0yn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yletz0yn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725369730; x=1756905730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XrvkYw+XAD3M+dUfiwFTxwodyabp8CHo8Jtj6r34uA0=;
  b=Yletz0ynP6GEycPi44o4MoXFu9garC22ndtvTWRLVKOfbRFKFL1nGUHH
   NKPE0fIZ9pxFubDCB/3Q00sTlKCreWIjCv1xgSV38rw2QGHRlMGhMB0AG
   V6U26m9fsBs49QqmIOrOObxF760Js7unMqPpmH7AywdR0Y1c6WcOc5MXp
   Ag6YpZz9o28pm/YgTfoaLMWv0NIeFYgcwMnFufnyUb+C0fY0Px/RyJdb8
   EOINdC+bKuhY7eBFin4vjNdJAAuIWY604lN+FdafjYsTASh6sbL89Owtr
   5LoJp8nkW6PWwfHrZvMg/9n4sphFFCdOkpKbKvdK9XbbnOL/ACDs5vpQ3
   Q==;
X-CSE-ConnectionGUID: 0Atlnhs2QkybX0qRomjQcg==
X-CSE-MsgGUID: J3XkJ/6iSQmECYzdAiY5sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24106653"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="24106653"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 06:22:09 -0700
X-CSE-ConnectionGUID: JkBViRWASzWBckwsz4z8ag==
X-CSE-MsgGUID: IUeFywWiSV2apEAbXZHNiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="65116920"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2024 06:22:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slTTw-0006i2-1p;
	Tue, 03 Sep 2024 13:22:04 +0000
Date: Tue, 3 Sep 2024 21:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yehuda Yitschak <yehuday@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Yonatan Nachum <ynachum@amazon.com>,
	Michael Margolin <mrgolin@amazon.com>
Subject: [linux-next:master 5282/8795]
 drivers/infiniband/hw/efa/efa_main.c:444:30: sparse: sparse: incorrect type
 in assignment (different base types)
Message-ID: <202409032113.bvyVfsNp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6804f0edbe7747774e6ae60f20cec4ee3ad7c187
commit: 04e36fd27a2aebb03ef019debc4df247f2a427c6 [5282/8795] RDMA/efa: Add support for node guid
config: loongarch-randconfig-r132-20240903 (https://download.01.org/0day-ci/archive/20240903/202409032113.bvyVfsNp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240903/202409032113.bvyVfsNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032113.bvyVfsNp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/efa/efa_main.c:444:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be64 [usertype] node_guid @@     got unsigned long long [usertype] guid @@
   drivers/infiniband/hw/efa/efa_main.c:444:30: sparse:     expected restricted __be64 [usertype] node_guid
   drivers/infiniband/hw/efa/efa_main.c:444:30: sparse:     got unsigned long long [usertype] guid

vim +444 drivers/infiniband/hw/efa/efa_main.c

   408	
   409	static int efa_ib_device_add(struct efa_dev *dev)
   410	{
   411		struct efa_com_get_hw_hints_result hw_hints;
   412		struct pci_dev *pdev = dev->pdev;
   413		int err;
   414	
   415		efa_stats_init(dev);
   416	
   417		err = efa_com_get_device_attr(&dev->edev, &dev->dev_attr);
   418		if (err)
   419			return err;
   420	
   421		dev_dbg(&dev->pdev->dev, "Doorbells bar (%d)\n", dev->dev_attr.db_bar);
   422		err = efa_request_doorbell_bar(dev);
   423		if (err)
   424			return err;
   425	
   426		err = efa_com_get_hw_hints(&dev->edev, &hw_hints);
   427		if (err)
   428			goto err_release_doorbell_bar;
   429	
   430		efa_update_hw_hints(dev, &hw_hints);
   431	
   432		/* Try to enable all the available aenq groups */
   433		err = efa_com_set_aenq_config(&dev->edev, EFA_AENQ_ENABLED_GROUPS);
   434		if (err)
   435			goto err_release_doorbell_bar;
   436	
   437		err = efa_create_eqs(dev);
   438		if (err)
   439			goto err_release_doorbell_bar;
   440	
   441		efa_set_host_info(dev);
   442	
   443		dev->ibdev.node_type = RDMA_NODE_UNSPECIFIED;
 > 444		dev->ibdev.node_guid = dev->dev_attr.guid;
   445		dev->ibdev.phys_port_cnt = 1;
   446		dev->ibdev.num_comp_vectors = dev->neqs ?: 1;
   447		dev->ibdev.dev.parent = &pdev->dev;
   448	
   449		ib_set_device_ops(&dev->ibdev, &efa_dev_ops);
   450	
   451		dev->ibdev.driver_def = efa_uapi_defs;
   452	
   453		err = ib_register_device(&dev->ibdev, "efa_%d", &pdev->dev);
   454		if (err)
   455			goto err_destroy_eqs;
   456	
   457		ibdev_info(&dev->ibdev, "IB device registered\n");
   458	
   459		return 0;
   460	
   461	err_destroy_eqs:
   462		efa_destroy_eqs(dev);
   463	err_release_doorbell_bar:
   464		efa_release_doorbell_bar(dev);
   465		return err;
   466	}
   467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
