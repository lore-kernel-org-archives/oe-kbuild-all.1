Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0C1FAC4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602185; cv=none; b=IEFpbn0As5oG2pax1QO+Jgt9cntXvY7czDA4nrPdDsOdHVqOIUxFULNUoQGRhTkhElrAIqcdLpNYvPQO91z9gORPNM/flFrXwlclXUNkQJUDoiVGxNRx1olsQyjSTF0A3tmjDhPjPMUuyLrQo0COQeJincJNUo1pDcSiUPMwhJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602185; c=relaxed/simple;
	bh=rIUIE776wCGre/V+cMF7M4GdfRE2LRV4+lSyBGHQX+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlKNBHUJHE1eF4252AVZX2cx3uFhIueRtOfFHumV7IH+szdBLFIVoHjiBEfGfpAZXiEyXAoV43ZEnk7NQQgO8qRnrnkIdozUMVRkIncF4WWS+DRI3IWPqvyndJOrgeTYZjkBRRilFnMOsXBAYjJbvvSO9QuANDjjrg07zYTXB5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwUlbSFq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwUlbSFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745602183; x=1777138183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rIUIE776wCGre/V+cMF7M4GdfRE2LRV4+lSyBGHQX+c=;
  b=XwUlbSFqY9yYvaZss3oKBpiq1mato94akD3JeI+3Z2ku+NcGDHz/ozGj
   k/4OOX27FK+teRD86K/GLygAjblpcc5tkuHkYBPyjgEBCqImbGWn6AFLY
   Zt83TlhnUbl4QSCu/GYOgkFofTD/0wdS4VwY0LD/vrkwHpnjUmBm1D06+
   vJEeNEGvCie71Op82kcKAQK+uQ8+mvOhsv6JFCYZ3micmJAy7pdL65pq7
   ZbjrK2+9zNaxmLD/BemerGeaH8A+tyjPU8nOWSzBpo3p6KDYv7D6V+Ccs
   8AXaWR7kSNi51niVxKhauRpeljXG4B0fhbR8SuOD/r7LdX3TlDuR+oTKu
   g==;
X-CSE-ConnectionGUID: uPe55LJDTA6I7DIEZG7vdw==
X-CSE-MsgGUID: Q4JwpLFSQQC66faPCpd9cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57917783"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="57917783"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 10:29:41 -0700
X-CSE-ConnectionGUID: OysVDFxzRcmRFl4PfL9zBw==
X-CSE-MsgGUID: x0YhZtSzSKO6ext38AbRwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133934294"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Apr 2025 10:29:39 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Mro-0005Oh-1A;
	Fri, 25 Apr 2025 17:29:36 +0000
Date: Sat, 26 Apr 2025 01:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 1/4] PCI: Add debugfs support for exposing PTM context
Message-ID: <202504260126.wxQ1Dp0M-lkp@intel.com>
References: <20250424-pcie-ptm-v3-1-c929ebd2821c@linaro.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-pcie-ptm-v3-1-c929ebd2821c@linaro.org>

Hi Manivannan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam/PCI-Add-debugfs-support-for-exposing-PTM-context/20250425-001237
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250424-pcie-ptm-v3-1-c929ebd2821c%40linaro.org
patch subject: [PATCH v3 1/4] PCI: Add debugfs support for exposing PTM context
config: riscv-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250426/202504260126.wxQ1Dp0M-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504260126.wxQ1Dp0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504260126.wxQ1Dp0M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/pci-pf-stub.c:10:
   include/linux/pci.h: In function 'pcie_ptm_create_debugfs':
>> include/linux/pci.h:1911:39: warning: no return statement in function returning non-void [-Wreturn-type]
    1911 |                          const struct pcie_ptm_ops *ops) { }
         |                                       ^~~~~~~~~~~~


vim +1911 include/linux/pci.h

  1903	
  1904	#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_PCIE_PTM)
  1905	struct pci_ptm_debugfs *pcie_ptm_create_debugfs(struct device *dev, void *pdata,
  1906							const struct pcie_ptm_ops *ops);
  1907	void pcie_ptm_destroy_debugfs(struct pci_ptm_debugfs *ptm_debugfs);
  1908	#else
  1909	static inline struct pci_ptm_debugfs
  1910	*pcie_ptm_create_debugfs(struct device *dev, void *pdata,
> 1911				 const struct pcie_ptm_ops *ops) { }
  1912	static inline void
  1913	pcie_ptm_destroy_debugfs(struct pci_ptm_debugfs *ptm_debugfs) { }
  1914	#endif
  1915	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
