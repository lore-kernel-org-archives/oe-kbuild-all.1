Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4676722F745
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 21:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863922; cv=none; b=N7WS4mSMmtP7KAeEiPVK97QBcHTgzmP0IvoABfOVIXO50CTYAPCryhxfh0K+DTHUmFb4huWOQX7/tlztfbqPaG9lTVw6iJSxFATioCLKDI3ihvUvYt6n/dCc5kOCh/UHq4+0Gp6rqbNaira9Pt9Vc9wR3CbTuujEarqEEGWHFTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863922; c=relaxed/simple;
	bh=fZb+x1iAUoZBXhX5SUDB4yt4C8uaLPObnxkRzh8K1Dg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XtRSfoglrPHFd4fiWrHGbp/C8gUPGA0Num7Gt6zsG1nS/ErTCEjYCX59nWKjJWQkqzFc3zMmc1/9tzjBnhaanRy4znaSCK39O04wLbrsHWH5dfjdeSyj4QBBWxawqa8cmoDNduPmDDimFeuEie0/fGVzH4GkEXi4BmryvOqbRJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFRP3EjB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFRP3EjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747863920; x=1779399920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZb+x1iAUoZBXhX5SUDB4yt4C8uaLPObnxkRzh8K1Dg=;
  b=LFRP3EjBw2pmIFC6W8eo/udUH7HBz1o55Vqj2o/Hz10mn7Kv654EPrfc
   SdpwcI2POMuKjL4MgchJXmEwxcRE0mIaGKm1JaUVh7kFWMb09p9RFMv58
   opwVbIeq6Z7QZk9K9gghWEQntKBtsi0WOq/SFoBrg0vjVS2l0dg7LJnd4
   P+f0m4Q/UtWEQh54Uc9ojpx3gocBese9ICUCDbNrEJdNw2FXJe8qamAUU
   R6tlMSQ9y5qf2BwGTnLuVagnRjFyIQvtAoL3jyFzF6bSLcmETB9HjmECx
   1guQX1e4bIsiZb+FJ0CfzTaMIWeRszm3QtcgARYTYAzprFtXFOW75LabR
   w==;
X-CSE-ConnectionGUID: hRsuygvEQeOxWye9ZIQlAQ==
X-CSE-MsgGUID: GtAcoLyvSrSvLaevQsIFkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49852226"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="49852226"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:45:19 -0700
X-CSE-ConnectionGUID: k2niODRfT9uWL1bnA+Lv3g==
X-CSE-MsgGUID: QrL6iswBSiab5B4wJvke1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="144991342"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2025 14:45:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHrFU-000Oey-1d;
	Wed, 21 May 2025 21:45:16 +0000
Date: Thu, 22 May 2025 05:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11]
 drivers/acpi/apei/apei-base.c:779:13: warning: no previous prototype for
 function 'arch_apei_report_pcie_error'
Message-ID: <202505220516.sZjuczii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   ace7789354948892feb8f07d384af6d4af715703
commit: 3fe177a5aef6fc4e15eb93dbe8d9f6a5c424daf8 [11/11] anolis: x86/mce/zhaoxin: Enable mcelog to decode PCIE, ZDI/ZPI, and DRAM errors
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505220516.sZjuczii-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220516.sZjuczii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220516.sZjuczii-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/apei/apei-base.c:766:12: warning: no previous prototype for function 'arch_apei_enable_cmcff' [-Wmissing-prototypes]
     766 | int __weak arch_apei_enable_cmcff(struct acpi_hest_header *hest_hdr,
         |            ^
   drivers/acpi/apei/apei-base.c:766:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     766 | int __weak arch_apei_enable_cmcff(struct acpi_hest_header *hest_hdr,
         | ^
         | static 
   drivers/acpi/apei/apei-base.c:773:13: warning: no previous prototype for function 'arch_apei_report_mem_error' [-Wmissing-prototypes]
     773 | void __weak arch_apei_report_mem_error(int sev,
         |             ^
   drivers/acpi/apei/apei-base.c:773:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     773 | void __weak arch_apei_report_mem_error(int sev,
         | ^
         | static 
>> drivers/acpi/apei/apei-base.c:779:13: warning: no previous prototype for function 'arch_apei_report_pcie_error' [-Wmissing-prototypes]
     779 | void __weak arch_apei_report_pcie_error(int sev, struct cper_sec_pcie *pcie_err)
         |             ^
   drivers/acpi/apei/apei-base.c:779:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     779 | void __weak arch_apei_report_pcie_error(int sev, struct cper_sec_pcie *pcie_err)
         | ^
         | static 
>> drivers/acpi/apei/apei-base.c:784:13: warning: no previous prototype for function 'arch_apei_report_zdi_error' [-Wmissing-prototypes]
     784 | bool __weak arch_apei_report_zdi_error(guid_t *sec_type, struct cper_sec_proc_generic *zdi_err)
         |             ^
   drivers/acpi/apei/apei-base.c:784:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     784 | bool __weak arch_apei_report_zdi_error(guid_t *sec_type, struct cper_sec_proc_generic *zdi_err)
         | ^
         | static 
   4 warnings generated.


vim +/arch_apei_report_pcie_error +779 drivers/acpi/apei/apei-base.c

   778	
 > 779	void __weak arch_apei_report_pcie_error(int sev, struct cper_sec_pcie *pcie_err)
   780	{
   781	}
   782	EXPORT_SYMBOL_GPL(arch_apei_report_pcie_error);
   783	
 > 784	bool __weak arch_apei_report_zdi_error(guid_t *sec_type, struct cper_sec_proc_generic *zdi_err)
   785	{
   786		return false;
   787	}
   788	EXPORT_SYMBOL_GPL(arch_apei_report_zdi_error);
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
