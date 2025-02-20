Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7440E1F12E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 10:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740049007; cv=none; b=bdLCevQaRFSB7JLuNG7nKywyUgc35DJm/3o0zfRgHfvPVzx3Ctv1DKgGHBKeXyd6a7gqdoufoS4vSlcw4svEaReBAcD+3ZOmSgJQnnbAsAtnuuBtTC2ssyTsSlTku5APRCMJyuNYq/4H2qCwPazgwOKNhCTd01yyEuj6wXAFSUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740049007; c=relaxed/simple;
	bh=/h+Eto9qiPRGAD3iDvNKlHD5lo13dcgMRPdx1SyTIwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqpRcsv9OAcBLbTLjbNvh/L2Nmd5xxuRm5C2gRydv9Hn1UCGsSv4fxF99WXkX1WpjRf0Bw6qfHgXBZIgDWakpOy2fdNWmYysLJPqfiylnYC1922QPN1djhaJqOICerbot7KPsjHvHD7zxqLaeCBAtHuiONj148HB+IyT4U3BXzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOTUW37A; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOTUW37A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740049005; x=1771585005;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/h+Eto9qiPRGAD3iDvNKlHD5lo13dcgMRPdx1SyTIwg=;
  b=kOTUW37AtwQRtMVPYNKYEaOc/cES34FONWOlYcQ7WmcFnYVuvHJpFahT
   vR9adfV/v24fZdXBLGKUhxldnhE/ybc8aVR/QpB7cNoIpOXpXRUA5sIY0
   25Qz1iwLqFs4/ASj4U26CoWRdejMHla3r/4YAUhoKQME7iIpvX6svy/Tr
   AyEuXcD0kHkiGjWkgJkBHsi5aAENbIViXEKLtZuPMRRC79LUDrN22g4OU
   CDIrwWn5jdyouv3zRfa/JG8SoIpXpBepS9RJDRCyw9CVEzMPmUEUxlm3j
   Za3cMg3RJYzqrABp0dm/bn6PcXjOwndSdYGwkBfSMVDRqPCOowL/k265f
   Q==;
X-CSE-ConnectionGUID: 3hIDAnBMTlygzBY3BLIimw==
X-CSE-MsgGUID: g1FYNZpiTi2OhLQTz0UBBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41078235"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; 
   d="scan'208";a="41078235"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 02:56:44 -0800
X-CSE-ConnectionGUID: zcT2gFgfQWOLdF+gwj5U0A==
X-CSE-MsgGUID: 9NSJMgNLS3uILr2nOSRBLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115903316"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Feb 2025 02:56:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tl4ES-0004BL-2r;
	Thu, 20 Feb 2025 10:56:40 +0000
Date: Thu, 20 Feb 2025 18:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 11/12] mm: Remove callers of pfn_t functionality
Message-ID: <202502201834.0QzR9dEE-lkp@intel.com>
References: <138bd6e485b5e37280762820fc51e7a23bf2a3dd.1739941374.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <138bd6e485b5e37280762820fc51e7a23bf2a3dd.1739941374.git-series.apopple@nvidia.com>

Hi Alistair,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cf42737e247a159abe9b0dc065a3ea44808a83a0]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-Remove-PFN_MAP-PFN_SG_CHAIN-and-PFN_SG_LAST/20250219-131909
base:   cf42737e247a159abe9b0dc065a3ea44808a83a0
patch link:    https://lore.kernel.org/r/138bd6e485b5e37280762820fc51e7a23bf2a3dd.1739941374.git-series.apopple%40nvidia.com
patch subject: [PATCH RFC v2 11/12] mm: Remove callers of pfn_t functionality
config: x86_64-buildonly-randconfig-005-20250220 (https://download.01.org/0day-ci/archive/20250220/202502201834.0QzR9dEE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201834.0QzR9dEE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201834.0QzR9dEE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/nvdimm/../../tools/testing/nvdimm/test/iomap.c:14:
>> drivers/nvdimm/../../tools/testing/nvdimm/test/nfit_test.h:215:1: error: unknown type name 'pfn_t'
     215 | pfn_t __wrap_phys_to_pfn_t(phys_addr_t addr, unsigned long flags);
         | ^~~~~


vim +/pfn_t +215 drivers/nvdimm/../../tools/testing/nvdimm/test/nfit_test.h

674d8bdec770d4 Dave Jiang      2018-02-01  205  
6bc756193ff61b Dan Williams    2015-06-17  206  typedef struct nfit_test_resource *(*nfit_test_lookup_fn)(resource_size_t);
a7de92dac9f0db Dan Williams    2016-12-05  207  typedef union acpi_object *(*nfit_test_evaluate_dsm_fn)(acpi_handle handle,
94116f8126de97 Andy Shevchenko 2017-06-05  208  		 const guid_t *guid, u64 rev, u64 func,
94116f8126de97 Andy Shevchenko 2017-06-05  209  		 union acpi_object *argv4);
9e46e541cf19ff Arnd Bergmann   2023-05-16  210  void __iomem *__wrap_devm_ioremap(struct device *dev,
9e46e541cf19ff Arnd Bergmann   2023-05-16  211  		resource_size_t offset, unsigned long size);
9e46e541cf19ff Arnd Bergmann   2023-05-16  212  void *__wrap_devm_memremap(struct device *dev, resource_size_t offset,
9e46e541cf19ff Arnd Bergmann   2023-05-16  213  		size_t size, unsigned long flags);
9e46e541cf19ff Arnd Bergmann   2023-05-16  214  void *__wrap_devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
9e46e541cf19ff Arnd Bergmann   2023-05-16 @215  pfn_t __wrap_phys_to_pfn_t(phys_addr_t addr, unsigned long flags);
9e46e541cf19ff Arnd Bergmann   2023-05-16  216  void *__wrap_memremap(resource_size_t offset, size_t size,
9e46e541cf19ff Arnd Bergmann   2023-05-16  217  		unsigned long flags);
9e46e541cf19ff Arnd Bergmann   2023-05-16  218  void __wrap_devm_memunmap(struct device *dev, void *addr);
9e46e541cf19ff Arnd Bergmann   2023-05-16  219  void __iomem *__wrap_ioremap(resource_size_t offset, unsigned long size);
9e46e541cf19ff Arnd Bergmann   2023-05-16  220  void __iomem *__wrap_ioremap_wc(resource_size_t offset, unsigned long size);
6bc756193ff61b Dan Williams    2015-06-17  221  void __wrap_iounmap(volatile void __iomem *addr);
9e46e541cf19ff Arnd Bergmann   2023-05-16  222  void __wrap_memunmap(void *addr);
9e46e541cf19ff Arnd Bergmann   2023-05-16  223  struct resource *__wrap___request_region(struct resource *parent,
9e46e541cf19ff Arnd Bergmann   2023-05-16  224  		resource_size_t start, resource_size_t n, const char *name,
9e46e541cf19ff Arnd Bergmann   2023-05-16  225  		int flags);
9e46e541cf19ff Arnd Bergmann   2023-05-16  226  int __wrap_insert_resource(struct resource *parent, struct resource *res);
9e46e541cf19ff Arnd Bergmann   2023-05-16  227  int __wrap_remove_resource(struct resource *res);
9e46e541cf19ff Arnd Bergmann   2023-05-16  228  struct resource *__wrap___devm_request_region(struct device *dev,
9e46e541cf19ff Arnd Bergmann   2023-05-16  229  		struct resource *parent, resource_size_t start,
9e46e541cf19ff Arnd Bergmann   2023-05-16  230  		resource_size_t n, const char *name);
9e46e541cf19ff Arnd Bergmann   2023-05-16  231  void __wrap___release_region(struct resource *parent, resource_size_t start,
9e46e541cf19ff Arnd Bergmann   2023-05-16  232  		resource_size_t n);
9e46e541cf19ff Arnd Bergmann   2023-05-16  233  void __wrap___devm_release_region(struct device *dev, struct resource *parent,
9e46e541cf19ff Arnd Bergmann   2023-05-16  234  		resource_size_t start, resource_size_t n);
9e46e541cf19ff Arnd Bergmann   2023-05-16  235  acpi_status __wrap_acpi_evaluate_object(acpi_handle handle, acpi_string path,
9e46e541cf19ff Arnd Bergmann   2023-05-16  236  		struct acpi_object_list *p, struct acpi_buffer *buf);
9e46e541cf19ff Arnd Bergmann   2023-05-16  237  union acpi_object * __wrap_acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
9e46e541cf19ff Arnd Bergmann   2023-05-16  238  		u64 rev, u64 func, union acpi_object *argv4);
9e46e541cf19ff Arnd Bergmann   2023-05-16  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
