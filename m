Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95631AF0B8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 05:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740203147; cv=none; b=kCV+7zbSxVVHE9eR7DZ6uGO9BpeZkq9y/fvFWU+IoX+zWPcyWr8dSBeGBnPH5hsU1zHb25W+50X/kuvD6duvhFnHe4o357eEQDfvfXHqvF+y/mmJYJtLcAmeqSWmT5gd2b31oNaZpWJquVnzArvNwPXMkiIKL0/XhAcRzGgb/Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740203147; c=relaxed/simple;
	bh=jCJ/Ps9q7tIKnBa3VmtIrgjARPK0Q61a4HCoXGnTxuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWit1EaDCQNZmPMXDD6W2ZBe+qlZ3qF2eUjHtu3c4kHo/zqo9Kl6/1078fUgyJqAn2nwfmZIF/+lfRDH3nj0L0zSyguqwdkgjueei7Kd23L3s2EYJ8/NzY3JNhsezVzPHX1rBOahsnJEWCV9ew+NU6xJNIzq7WZTDFBU+sTqxik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPq3q08D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPq3q08D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740203146; x=1771739146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jCJ/Ps9q7tIKnBa3VmtIrgjARPK0Q61a4HCoXGnTxuk=;
  b=RPq3q08D7+nZkw1eYKuX41sq4JtdJnBi7AhLgv+c7eALCldFbXlp4lvQ
   1CfWPV7p9S1CQH16KXnfy+St15DV6a5bMKCqiEk38suDEju2oKnuBQ36c
   1MeL9Ppo5VKmy8zM9yb4DCJGu8+E4v8pn6VRy7mqP6BcwvRYAu5ICe1T8
   Y9AqEzOBHLkbV3/S2E0KHZw7rBgMkMKsDMriNPf6y8bRU3vFHcD5QSlNT
   LFs1cYIiXI3ORtRqsMWtyXlldZILL7JgNXi4sq6rD2OHQRjNAFQaSME16
   FY/MQ6c+FwKm4VIrrOwMKSo0VDdrgXBvPjT2HFksqaP+JQkqBMYW4iCYB
   A==;
X-CSE-ConnectionGUID: Pj/tECEnTeyEFZZLaaGJDw==
X-CSE-MsgGUID: J98qEhuYSXWh6P5vmjimDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51654873"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="51654873"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 21:45:45 -0800
X-CSE-ConnectionGUID: GLFnOl5gRHOQ6Eve3uw0yQ==
X-CSE-MsgGUID: 8SHzO4SIRWSdEqdEqBHSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="115271136"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Feb 2025 21:45:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tliKZ-0006Kl-0v;
	Sat, 22 Feb 2025 05:45:39 +0000
Date: Sat, 22 Feb 2025 13:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Srirangan Madhavan <smadhavan@nvidia.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Zhi Wang <zhiw@nvidia.com>,
	Vishal Aslot <vaslot@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	linux-cxl@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cxl: add support for cxl reset
Message-ID: <202502221354.Zmyi5Mgf-lkp@intel.com>
References: <20250221043906.1593189-3-smadhavan@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221043906.1593189-3-smadhavan@nvidia.com>

Hi Srirangan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250220]
[cannot apply to pci/next pci/for-linus linus/master v6.14-rc3 v6.14-rc2 v6.14-rc1 v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srirangan-Madhavan/cxl-de-duplicate-cxl-DVSEC-reg-defines/20250221-124043
base:   next-20250220
patch link:    https://lore.kernel.org/r/20250221043906.1593189-3-smadhavan%40nvidia.com
patch subject: [PATCH v2 2/2] cxl: add support for cxl reset
config: arc-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221354.Zmyi5Mgf-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221354.Zmyi5Mgf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221354.Zmyi5Mgf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/pci.c: In function 'cxl_reset':
>> drivers/pci/pci.c:5258:17: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
    5258 |         if (reg & CXL_DVSEC_CXL_RST_CAPABLE == 0)
         |                 ^


vim +5258 drivers/pci/pci.c

  5235	
  5236	/**
  5237	 * cxl_reset - initiate a cxl reset
  5238	 * @dev: device to reset
  5239	 * @probe: if true, return 0 if device can be reset this way
  5240	 *
  5241	 * Initiate a cxl reset on @dev.
  5242	 */
  5243	static int cxl_reset(struct pci_dev *dev, bool probe)
  5244	{
  5245		u16 dvsec, reg;
  5246		int rc;
  5247	
  5248		dvsec = pci_find_dvsec_capability(dev, PCI_VENDOR_ID_CXL,
  5249						  CXL_DVSEC_PCIE_DEVICE);
  5250		if (!dvsec)
  5251			return -ENOTTY;
  5252	
  5253		/* Check if CXL Reset is supported. */
  5254		rc = pci_read_config_word(dev, dvsec + CXL_DVSEC_CAP_OFFSET, &reg);
  5255		if (rc)
  5256			return -ENOTTY;
  5257	
> 5258		if (reg & CXL_DVSEC_CXL_RST_CAPABLE == 0)
  5259			return -ENOTTY;
  5260	
  5261		if (probe)
  5262			return 0;
  5263	
  5264		rc = cxl_reset_prepare(dev, dvsec);
  5265		if (rc)
  5266			return rc;
  5267	
  5268		return cxl_reset_init(dev, dvsec);
  5269	}
  5270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
