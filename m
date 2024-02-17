Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD947F464
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 21:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708205571; cv=none; b=DlHAEOS8G0HUu9V+LihS81TDYM9pD+Bplql48FG0fVyrefndFM4US/mCq47J1iIku7lE2eOxfu947rI+IEbE/jgjuxcfuL1k36Y+b7Elh2dg+7tZPk0QIxMVEJ0rxk2lz8/eSFA2NPQJpTwe7QFV0JLj1DUlJIpavDzWo2qGe2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708205571; c=relaxed/simple;
	bh=k94nrrWCR7y7H4czB8oQVSDh0e4Kx3+XvmtfflkT8PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJ2LLkVZVj+N5bNBsP/3LJ3qMm5rheSp5tMQwLwG3knHUlW1Hf5Zg2nPm3+Lu0qCI0p9I+G3CRxk1/m7BUBW8Ofrwf8w+FlXGEY65iMaHDJNYIhK+OiU1vZWaJU44jNCdVHdErP74pGAryb1yyBRlra7oJT5mXyCB+1PardanEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6O+gGjY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6O+gGjY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708205569; x=1739741569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k94nrrWCR7y7H4czB8oQVSDh0e4Kx3+XvmtfflkT8PM=;
  b=U6O+gGjYJcAWtMJectQuQwICrUuK8d481+mwXizl+YaY4CYpiKB2Mhkp
   38C5WVRwe1vzgdV54Xhi+/ls9vjTlO4TeTvr0A4NjHDJOD9LLeGcAoBZu
   VOA4/ynGymU6CLGra5kIdRKBIiXy8JWnm+yXAzMw3bJWyR1ZGF66ygFgT
   vyk8I/hhbezUbY+wv99Wy+jsaxnJOKHYpjJNSrAc8HG49ItRM0y9AirkS
   Isnd5fKEfMmWeiNV7pZf0o7aOeA4Gm9Z6eLvZeX3LQlBA7N2q7GSIrK5l
   FU3RK4BIzBLtbRcowdhlSMCsNdLPEEt1xaT+jarpQ8hatMGlzlBGUyLc5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2221193"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2221193"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 13:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="8736132"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2024 13:32:47 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbSIe-0002W6-0U;
	Sat, 17 Feb 2024 21:32:44 +0000
Date: Sun, 18 Feb 2024 05:31:50 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Cheatham <Benjamin.Cheatham@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] pcie/cxl_timeout: Add CXL.mem Timeout &
 Isolation interrupt support
Message-ID: <202402180558.S6rTa5mq-lkp@intel.com>
References: <20240215194048.141411-7-Benjamin.Cheatham@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215194048.141411-7-Benjamin.Cheatham@amd.com>

Hi Ben,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus cxl/next cxl/pending linus/master v6.8-rc4 next-20240216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ben-Cheatham/cxl-core-Add-CXL-Timeout-Isolation-capability-parsing/20240216-034328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240215194048.141411-7-Benjamin.Cheatham%40amd.com
patch subject: [RFC PATCH 6/6] pcie/cxl_timeout: Add CXL.mem Timeout & Isolation interrupt support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240218/202402180558.S6rTa5mq-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402180558.S6rTa5mq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402180558.S6rTa5mq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pcie/cxl_timeout.c:231:13: warning: no previous prototype for 'cxl_timeout_thread' [-Wmissing-prototypes]
     231 | irqreturn_t cxl_timeout_thread(int irq, void *data)
         |             ^~~~~~~~~~~~~~~~~~


vim +/cxl_timeout_thread +231 drivers/pci/pcie/cxl_timeout.c

   230	
 > 231	irqreturn_t cxl_timeout_thread(int irq, void *data)
   232	{
   233		struct cxl_timeout_wq_data *wq_data;
   234		struct cxl_timeout *cxlt = data;
   235		struct pcie_device *pcie_dev = cxlt->dev;
   236		struct pcie_cxlt_data *pdata;
   237		struct cxl_dport *dport;
   238		u32 status;
   239	
   240		/*
   241		 * If the CXL core didn't register a cxl_dport with this PCIe device,
   242		 * then dport enumeration failed and there's nothing to do CXL-wise.
   243		 */
   244		pdata = get_service_data(pcie_dev);
   245		if (!pdata || !pdata->dport)
   246			return IRQ_HANDLED;
   247	
   248		dport = pdata->dport;
   249	
   250		status = readl(cxlt->regs + CXL_TIMEOUT_STATUS_OFFSET);
   251		if (!(status & CXL_TIMEOUT_STATUS_MEM_ISO
   252		      || status & CXL_TIMEOUT_STATUS_MEM_TIMEOUT))
   253			return IRQ_HANDLED;
   254	
   255		dport->isolated = true;
   256	
   257		wq_data = kzalloc(sizeof(struct cxl_timeout_wq_data), GFP_NOWAIT);
   258		if (!wq_data)
   259			return IRQ_NONE;
   260	
   261		wq_data->dport = dport;
   262	
   263		INIT_WORK(&wq_data->w, cxl_timeout_handler);
   264		queue_work(cxl_timeout_wq, &wq_data->w);
   265	
   266		return IRQ_HANDLED;
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
