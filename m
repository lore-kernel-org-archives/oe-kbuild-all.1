Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51523134AB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 01:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727485739; cv=none; b=Yq5a4RiUeZ2Unfi2ah9peA+2Q2J6pvVD0QKdnwxOXU9hwTR4GLVh4410Fs7GAVwyAuhT9znapE5DVuYXejnN9E8pAFkvVP6NGTPv4XjkcszmDMtQw2aFm5dnMB7CV7uOCliyEEJ9cspwfdUWYEmocfXO5KyKlekiQcQ6Ui/XFU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727485739; c=relaxed/simple;
	bh=YtlliOz+9NoIc3CjtNUEwgpI8ZFVZAqkQRV2ZSAMU0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYpstWXtF/xYkQRaHJgA4ZMOqzouTADjSPovbM1i9U5M4giCWVM76i6R47pzXozCsBIFjswgJeT042KfM534bqkMqdY36+6xj46EVEIcbNtZiSgwGcRdlFOImHuKR4wLTYFp2PUSQCy59K8UVgOL6ZbcyUEaY5mnsIXiybazeLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ta+wKJLL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ta+wKJLL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727485738; x=1759021738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YtlliOz+9NoIc3CjtNUEwgpI8ZFVZAqkQRV2ZSAMU0s=;
  b=Ta+wKJLLUItJdpEsO8CdLTVTeO0jwHeFNGhO4LxdTGSrSksudhCSuCmh
   9qwcSWm6S3OSZx2AWGQSuMIixXfo09g/YRGI0/6BSwWtKKtajr3RYShO6
   kaIxc+3V/4uZoJ5SQAGf+I7gO1MCwSU+vxtG6pTEQvSbjRx0PNHp1aT4y
   SxRLxUSeL/IaWx1vKqeJEdDbNezJhNVKPHAzpyoynD/c7YrbWLbr6SmmK
   Lo6iXfNJShwQm2Z67CWFOFmQwq7oyHhqgEV5tGZKZfvV7283WSHj5sOaU
   xZ60AvBUYPQ8kMvR0Y9iT9uvUplD5kzbj4okcB0IkooEhHpJGH1L8OEIj
   Q==;
X-CSE-ConnectionGUID: gSxmYTzgT6eKKCeDSqIdjw==
X-CSE-MsgGUID: fqNGaDFJQi6M07XrJodpJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44111045"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="44111045"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 18:08:55 -0700
X-CSE-ConnectionGUID: gG0kV978RgKNkCA1VgnalQ==
X-CSE-MsgGUID: zjYZ+K0yTcSMclwrsBcs8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="76786267"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2024 18:08:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suLx5-000Mno-1k;
	Sat, 28 Sep 2024 01:08:51 +0000
Date: Sat, 28 Sep 2024 09:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] cxl: Add mce notifier to emit aliased address
 for extended linear cache
Message-ID: <202409280847.7Ipiz9dk-lkp@intel.com>
References: <20240927142108.1156362-7-dave.jiang@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927142108.1156362-7-dave.jiang@intel.com>

Hi Dave,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus tip/x86/core tip/x86/mm v6.11]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge cxl/next linus/master cxl/pending next-20240927]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Jiang/ACPICA-actbl1-h-Add-extended-linear-address-mode-to-MSCIS/20240927-222421
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20240927142108.1156362-7-dave.jiang%40intel.com
patch subject: [RFC PATCH 6/6] cxl: Add mce notifier to emit aliased address for extended linear cache
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409280847.7Ipiz9dk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280847.7Ipiz9dk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280847.7Ipiz9dk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/mbox.c: In function 'cxl_handle_mce':
>> drivers/cxl/core/mbox.c:1461:22: error: implicit declaration of function 'mce_usable_address' [-Werror=implicit-function-declaration]
    1461 |         if (!mce || !mce_usable_address(mce))
         |                      ^~~~~~~~~~~~~~~~~~
>> drivers/cxl/core/mbox.c:1464:18: error: invalid use of undefined type 'struct mce'
    1464 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |                  ^~
>> drivers/cxl/core/mbox.c:1464:27: error: 'MCI_ADDR_PHYSADDR' undeclared (first use in this function)
    1464 |         spa = mce->addr & MCI_ADDR_PHYSADDR;
         |                           ^~~~~~~~~~~~~~~~~
   drivers/cxl/core/mbox.c:1464:27: note: each undeclared identifier is reported only once for each function it appears in
   drivers/cxl/core/mbox.c: In function 'cxl_memdev_state_create':
>> drivers/cxl/core/mbox.c:1508:38: error: 'MCE_PRIO_CXL' undeclared (first use in this function)
    1508 |         mds->mce_notifier.priority = MCE_PRIO_CXL;
         |                                      ^~~~~~~~~~~~
>> drivers/cxl/core/mbox.c:1509:9: error: implicit declaration of function 'mce_register_decode_chain' [-Werror=implicit-function-declaration]
    1509 |         mce_register_decode_chain(&mds->mce_notifier);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/mce_usable_address +1461 drivers/cxl/core/mbox.c

  1449	
  1450	static int cxl_handle_mce(struct notifier_block *nb, unsigned long val,
  1451				  void *data)
  1452	{
  1453		struct cxl_memdev_state *mds = container_of(nb, struct cxl_memdev_state,
  1454							    mce_notifier);
  1455		struct cxl_memdev *cxlmd = mds->cxlds.cxlmd;
  1456		struct cxl_port *endpoint = cxlmd->endpoint;
  1457		struct mce *mce = (struct mce *)data;
  1458		u64 spa, spa_alias;
  1459		unsigned long pfn;
  1460	
> 1461		if (!mce || !mce_usable_address(mce))
  1462			return NOTIFY_DONE;
  1463	
> 1464		spa = mce->addr & MCI_ADDR_PHYSADDR;
  1465	
  1466		pfn = spa >> PAGE_SHIFT;
  1467		if (!pfn_valid(pfn))
  1468			return NOTIFY_DONE;
  1469	
  1470		spa_alias = cxl_port_get_spa_cache_alias(endpoint, spa);
  1471		if (!spa_alias)
  1472			return NOTIFY_DONE;
  1473	
  1474		pfn = spa_alias >> PAGE_SHIFT;
  1475	
  1476		/*
  1477		 * Take down the aliased memory page. The original memory page flagged
  1478		 * by the MCE will be taken cared of by the standard MCE handler.
  1479		 */
  1480		dev_emerg(mds->cxlds.dev, "Offlining aliased SPA address: %#llx\n",
  1481			  spa_alias);
  1482		if (!memory_failure(pfn, 0))
  1483			set_mce_nospec(pfn);
  1484	
  1485		return NOTIFY_OK;
  1486	}
  1487	
  1488	struct cxl_memdev_state *cxl_memdev_state_create(struct device *dev)
  1489	{
  1490		struct cxl_memdev_state *mds;
  1491	
  1492		mds = devm_kzalloc(dev, sizeof(*mds), GFP_KERNEL);
  1493		if (!mds) {
  1494			dev_err(dev, "No memory available\n");
  1495			return ERR_PTR(-ENOMEM);
  1496		}
  1497	
  1498		mutex_init(&mds->mbox_mutex);
  1499		mutex_init(&mds->event.log_lock);
  1500		mds->cxlds.dev = dev;
  1501		mds->cxlds.reg_map.host = dev;
  1502		mds->cxlds.reg_map.resource = CXL_RESOURCE_NONE;
  1503		mds->cxlds.type = CXL_DEVTYPE_CLASSMEM;
  1504		mds->ram_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1505		mds->pmem_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1506	
  1507		mds->mce_notifier.notifier_call = cxl_handle_mce;
> 1508		mds->mce_notifier.priority = MCE_PRIO_CXL;
> 1509		mce_register_decode_chain(&mds->mce_notifier);
  1510	
  1511		return mds;
  1512	}
  1513	EXPORT_SYMBOL_NS_GPL(cxl_memdev_state_create, CXL);
  1514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
