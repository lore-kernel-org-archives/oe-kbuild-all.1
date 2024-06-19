Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6171AACA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820277; cv=none; b=mhdlJPL5SM0Zlbp7G918Ae4YwcPzcQL9KREyhQA01Tv6D6fv3AAT+yDdtl+me7bk7vxPKki+XKc+bYeFuCDfRg81yG1WdJnWcqvGJ4EcGsHMEQRm8iH3uUf8p6Zc1fLN1ZL1UZsCJiLOHAVuioudUHwEhCJIOVu6AxEtHlr4J4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820277; c=relaxed/simple;
	bh=rB4U3mGvmHSUVNp8f7+Y/HgYSk4x93acLCmCIAq2EEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guz3uDrOqD6/YZlvvyw9An7XoDtmMLnGmFRSFMsJM0w5u0gPbhTzdz0cr0KZOrIqNslGKwDyeCAJcBgqGVr/pzAsxH9GnidiZxNykp9mhF7MXmEUobuz26RdRQ+1xC9CPNUJFwaKoqz8NiNsiEM53TeB0boMWXZtgAfajF7Dx20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MaL1L8gG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MaL1L8gG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718820275; x=1750356275;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rB4U3mGvmHSUVNp8f7+Y/HgYSk4x93acLCmCIAq2EEo=;
  b=MaL1L8gGB3szVLkhnYQL00CwqlnIlqOD5LnkvME7lmn9zh2VQM6g9n6A
   cXtM5WbUb55Zt4Jxj2STSELi4yONEnIIxsxOVPNMz9YKphzQTOy/9FM1N
   xnYyjgv9AcvglIp9Vg42qv7IHplm3MViqE0bxUM0s0qeXV1S7BnsDMSgy
   q/pfNWmGZtOitEsNayN9TpXzgEAT7rC29ocSkvHBUSgQ3eIyPx810DsIz
   AJQkmlRxi/+YLkyO+SBxgF0Bs9uLapCHZOFyXzic29kh3nSjDw9hAu8z2
   jSZrYJLaU3nLQMVYRLSa5d+A4jqt7snqGs3/wiPBEMUS7sIwsyzEkPfNv
   g==;
X-CSE-ConnectionGUID: 0ttGaTSVSBa8RrEjxZzRfA==
X-CSE-MsgGUID: VljT+7gBSquMB8Xa2dycYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19590491"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="19590491"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 11:04:34 -0700
X-CSE-ConnectionGUID: E04KzoD3QL6yhnFgqdHtXA==
X-CSE-MsgGUID: ng18f++URGuGiT1V3/khJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="46943577"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jun 2024 11:04:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJzfb-0006qY-2Q;
	Wed, 19 Jun 2024 18:04:31 +0000
Date: Thu, 20 Jun 2024 02:04:31 +0800
From: kernel test robot <lkp@intel.com>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] cxl: avoid duplicating report from MCE & device
Message-ID: <202406200104.23DAmKcD-lkp@intel.com>
References: <20240618165310.877974-1-ruansy.fnst@fujitsu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618165310.877974-1-ruansy.fnst@fujitsu.com>

Hi Shiyang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on linus/master v6.10-rc4 next-20240619]
[cannot apply to tip/x86/core cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shiyang-Ruan/cxl-avoid-duplicating-report-from-MCE-device/20240619-011058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20240618165310.877974-1-ruansy.fnst%40fujitsu.com
patch subject: [RFC PATCH] cxl: avoid duplicating report from MCE & device
config: x86_64-randconfig-006-20240619 (https://download.01.org/0day-ci/archive/20240620/202406200104.23DAmKcD-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200104.23DAmKcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200104.23DAmKcD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/cxl/core/mbox.o: in function `cxl_memdev_state_create':
>> drivers/cxl/core/mbox.c:1558:(.text+0xb23): undefined reference to `mce_register_decode_chain'
   ld: drivers/cxl/core/mbox.o: in function `cxl_handle_mce':
>> drivers/cxl/core/mbox.c:1516:(.text+0x25e2): undefined reference to `mce_usable_address'


vim +1558 drivers/cxl/core/mbox.c

  1507	
  1508	static int cxl_handle_mce(struct notifier_block *nb, unsigned long val,
  1509				  void *data)
  1510	{
  1511		struct mce *mce = (struct mce *)data;
  1512		struct cxl_memdev_state *mds = container_of(nb, struct cxl_memdev_state,
  1513							    mce_notifier);
  1514		u64 hpa;
  1515	
> 1516		if (!mce || !mce_usable_address(mce))
  1517			return NOTIFY_DONE;
  1518	
  1519		hpa = mce->addr & MCI_ADDR_PHYSADDR;
  1520	
  1521		/* Check if the PFN is located on this CXL device */
  1522		if (!pfn_valid(hpa >> PAGE_SHIFT) &&
  1523		    !cxl_contains_hpa(mds->cxlds.cxlmd, hpa))
  1524			return NOTIFY_DONE;
  1525	
  1526		/*
  1527		 * Search PFN in the cxl_mce_records, if already exists, don't continue
  1528		 * to do memory_failure() to avoid a poison address being reported
  1529		 * more than once.
  1530		 */
  1531		if (cxl_mce_recorded(hpa))
  1532			return NOTIFY_STOP;
  1533		else
  1534			return NOTIFY_OK;
  1535	}
  1536	
  1537	struct cxl_memdev_state *cxl_memdev_state_create(struct device *dev)
  1538	{
  1539		struct cxl_memdev_state *mds;
  1540	
  1541		mds = devm_kzalloc(dev, sizeof(*mds), GFP_KERNEL);
  1542		if (!mds) {
  1543			dev_err(dev, "No memory available\n");
  1544			return ERR_PTR(-ENOMEM);
  1545		}
  1546	
  1547		mutex_init(&mds->mbox_mutex);
  1548		mutex_init(&mds->event.log_lock);
  1549		mds->cxlds.dev = dev;
  1550		mds->cxlds.reg_map.host = dev;
  1551		mds->cxlds.reg_map.resource = CXL_RESOURCE_NONE;
  1552		mds->cxlds.type = CXL_DEVTYPE_CLASSMEM;
  1553		mds->ram_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1554		mds->pmem_perf.qos_class = CXL_QOS_CLASS_INVALID;
  1555	
  1556		mds->mce_notifier.notifier_call = cxl_handle_mce;
  1557		mds->mce_notifier.priority = MCE_PRIO_CXL;
> 1558		mce_register_decode_chain(&mds->mce_notifier);
  1559	
  1560		return mds;
  1561	}
  1562	EXPORT_SYMBOL_NS_GPL(cxl_memdev_state_create, CXL);
  1563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
