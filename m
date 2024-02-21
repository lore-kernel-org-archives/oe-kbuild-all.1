Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D051129A68
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 23:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558617; cv=none; b=cDABYo79itfpoYVtwxkQQdH+HBowzROoCmkZgvGHR+hcCHKP7Gs8f2V0cKgG+VZYCBa+8J5Evu7pqAUYC5tdWnUhRW2ryHlXTox2+SU/Xpy5tvc5Bo+L+HfFrqPMSWHD41TxoXt/f4v+8nzGg4Kz0g923aDgbSKylYNYDht3OAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558617; c=relaxed/simple;
	bh=vcyEylEjwRzBq2OYeASehwwqdXho/QYA/U/+6wizZIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UklmZ8UN4vwpTPubudBYBsnRAaI2Gmi/7LDyPZ+At8TAE3JSfGEIg20b0L25Anzwt1LDeE9lZ1hwiCI+VrjQ5l6L29kzt3oLB7PSUdVziaPpsSedppy/00yWEmVo3xL5hmmL0MYJgQxxKywGMVW3qq52zmbUGWlYwtjcdZdcxi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oj7iboNK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj7iboNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708558615; x=1740094615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vcyEylEjwRzBq2OYeASehwwqdXho/QYA/U/+6wizZIk=;
  b=Oj7iboNKSGqseK/+Mqr8abn6fMW7PFovmR1ZSJtxecib9axeEwQQfONG
   MtdKXHPa0blLlgGZBOIyqiSD/SNJ7edGb0iVG7j0dNuCdNRCCHanS/UOw
   EJor/Ek9zL7J/0W66dBQIvC670wH9Y/57bbHjFv8aC1JD4yKX9WUimi81
   qGpiuWSHeL4EFUA2EdvXGf6E+eccphD8RNXyolkj+IhTdb7Wgda7NlUrA
   SHAR9kkmc0Fcg76+9+CT2Kcc8Dn3hVAnL8KUxosL1OIYM9mmVKP4nUc5l
   NywARogFvDTKXCFYJF5nR25POWF/lI2MUKhd9rDWu/m+JvkWPLS2Q6x7t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="28195827"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="28195827"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 15:36:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5650135"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 21 Feb 2024 15:36:51 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcw8t-0005nY-2j;
	Wed, 21 Feb 2024 23:36:47 +0000
Date: Thu, 22 Feb 2024 07:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/acpi/apei/hest.c:146:14: error: 'boot_cpu_data' undeclared;
 did you mean 'bootmem_data'?
Message-ID: <202402220705.bGWxhATi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 9ca4cfb16fe5ac76d394e663e87c1e2d6d250519 acpi: disable AMD ghes timer
date:   2 years, 11 months ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240222/202402220705.bGWxhATi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220705.bGWxhATi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220705.bGWxhATi-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/apei/hest.c: In function 'hest_parse_ghes_count':
>> drivers/acpi/apei/hest.c:146:14: error: 'boot_cpu_data' undeclared (first use in this function); did you mean 'bootmem_data'?
     146 |             (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
         |              ^~~~~~~~~~~~~
         |              bootmem_data
   drivers/acpi/apei/hest.c:146:14: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/acpi/apei/hest.c:146:42: error: 'X86_VENDOR_AMD' undeclared (first use in this function); did you mean 'X86_VENDOR_ANY'?
     146 |             (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
         |                                          ^~~~~~~~~~~~~~
         |                                          X86_VENDOR_ANY
   drivers/acpi/apei/hest.c: In function 'hest_parse_ghes':
   drivers/acpi/apei/hest.c:161:14: error: 'boot_cpu_data' undeclared (first use in this function); did you mean 'bootmem_data'?
     161 |              boot_cpu_data.x86_vendor == X86_VENDOR_AMD))
         |              ^~~~~~~~~~~~~
         |              bootmem_data
   drivers/acpi/apei/hest.c:161:42: error: 'X86_VENDOR_AMD' undeclared (first use in this function); did you mean 'X86_VENDOR_ANY'?
     161 |              boot_cpu_data.x86_vendor == X86_VENDOR_AMD))
         |                                          ^~~~~~~~~~~~~~
         |                                          X86_VENDOR_ANY


vim +146 drivers/acpi/apei/hest.c

   139	
   140	static int __init hest_parse_ghes_count(struct acpi_hest_header *hest_hdr, void *data)
   141	{
   142		int *count = data;
   143	
   144		if ((hest_hdr->type == ACPI_HEST_TYPE_GENERIC_ERROR ||
   145		     hest_hdr->type == ACPI_HEST_TYPE_GENERIC_ERROR_V2) &&
 > 146		    (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
   147		     !(hest_hdr->source_id &0xF000)))
   148			(*count)++;
   149		return 0;
   150	}
   151	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
