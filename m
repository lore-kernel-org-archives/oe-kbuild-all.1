Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776D81531C8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 15:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736350418; cv=none; b=oQUfnAjXSCP5KsRg6TzC0KunVzdzk9weFuAgdmhulBtf6pdFh4hrETEvLcd78jFz3AT61lytnEXoQUx9ybpA+Xead0ui/41afVLcTGvJb3Zk5VCgZoSvTCyE/WNJEQX5pZ0KwNXkxYGk+rY75kv/jFhlGrTek8GwL7PWFgFYIgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736350418; c=relaxed/simple;
	bh=RSNC7j7JV3w+mUk1E2uu10q1G4GB4QWtSm2QCQGNQJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFTlTH6DadcadL5LF1N8pxcoFN0l1oX1hhLb1MkWvZug+HeEz/OtnGlywU+5fcMEocF3n9zQs3zBg5JPp+QQbwuBWN7XCgN9LKFEtSk+dQUR8WcR9lKHbTfQSs/sSlv2xqji7ukmFyaPjCnQmWwSFoOVv+OPpqoCg/VVi9GWJIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HuPTAp+L; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HuPTAp+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736350416; x=1767886416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RSNC7j7JV3w+mUk1E2uu10q1G4GB4QWtSm2QCQGNQJI=;
  b=HuPTAp+LSSujO8HjjGy2pD/PvvOjKhCcgwY4TIkPlo8/OTkXBvbAe2Ap
   m6nO+QHw+iMUQI1a2shlK8fZIC4CNECY5B120GGho7tJOWiOPCYJ1/bEI
   C+i4z2jBdvf9s1v+e3c7R+Gu9R7wgV6VZnVFjfyNvuAk8IAP1iWbQB7f+
   Fd7bwz3EoEXqiBaM+P3w943+pjPh+TJzmQBAGLCVnEun018xUDTRmlaRP
   C0ovD8UbpOSvXyRVwI5Nr3y5DrFhJImx+a/CAFTkrcLZDL9ib6ZhTnvL8
   Qly00M3YC5Lfal5w6PWD2P5ZZBfQLTo9DD01yxmJ8dLHM8bMyRvEmOGqQ
   g==;
X-CSE-ConnectionGUID: L1ayEO7bSiO+4V3ZRlIhkg==
X-CSE-MsgGUID: ULl15lC9TIusNlBl7Bt2mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47995658"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="47995658"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 07:33:36 -0800
X-CSE-ConnectionGUID: +Am13HQjQ3WbpAUVpagzAQ==
X-CSE-MsgGUID: pKdkAGEARKKxhkbLc7yR3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103343850"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jan 2025 07:33:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVY3o-000GI5-0u;
	Wed, 08 Jan 2025 15:33:32 +0000
Date: Wed, 8 Jan 2025 23:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [leon-rdma:rdma-next 57/94] drivers/fwctl/fwctl.mod.c:19:45: error:
 expected ')' before 'FWCTL'
Message-ID: <202501082329.2BTEPFMS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   c2d45bfd2380e40a4079c162471203c1be90e85c
commit: 7bd476f2facaf3ddc828dc0f331cd0feeceaa7c0 [57/94] fwctl/mlx5: Support for communicating with mlx5 fw
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250108/202501082329.2BTEPFMS-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501082329.2BTEPFMS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501082329.2BTEPFMS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/fwctl/fwctl.mod.c:2:
>> drivers/fwctl/fwctl.mod.c:19:45: error: expected ')' before 'FWCTL'
      19 | KSYMTAB_FUNC(_fwctl_alloc_device, "_gpl", ""FWCTL"");
         |                                             ^~~~~
   include/linux/export-internal.h:45:28: note: in definition of macro '__KSYMTAB'
      45 |             "   .asciz \"" ns "\""                                      "\n"    \
         |                            ^~
   drivers/fwctl/fwctl.mod.c:19:1: note: in expansion of macro 'KSYMTAB_FUNC'
      19 | KSYMTAB_FUNC(_fwctl_alloc_device, "_gpl", ""FWCTL"");
         | ^~~~~~~~~~~~
   include/linux/export-internal.h:41:12: note: to match this '('
      41 |         asm("   .section \"__ksymtab_strings\",\"aMS\",%progbits,1"     "\n"    \
         |            ^
   include/linux/export-internal.h:62:41: note: in expansion of macro '__KSYMTAB'
      62 | #define KSYMTAB_FUNC(name, sec, ns)     __KSYMTAB(name, KSYM_FUNC(name), sec, ns)
         |                                         ^~~~~~~~~
   drivers/fwctl/fwctl.mod.c:19:1: note: in expansion of macro 'KSYMTAB_FUNC'
      19 | KSYMTAB_FUNC(_fwctl_alloc_device, "_gpl", ""FWCTL"");
         | ^~~~~~~~~~~~
   drivers/fwctl/fwctl.mod.c:20:40: error: expected ')' before 'FWCTL'
      20 | KSYMTAB_FUNC(fwctl_register, "_gpl", ""FWCTL"");
         |                                        ^~~~~
   include/linux/export-internal.h:45:28: note: in definition of macro '__KSYMTAB'
      45 |             "   .asciz \"" ns "\""                                      "\n"    \
         |                            ^~
   drivers/fwctl/fwctl.mod.c:20:1: note: in expansion of macro 'KSYMTAB_FUNC'
      20 | KSYMTAB_FUNC(fwctl_register, "_gpl", ""FWCTL"");
         | ^~~~~~~~~~~~
   include/linux/export-internal.h:41:12: note: to match this '('
      41 |         asm("   .section \"__ksymtab_strings\",\"aMS\",%progbits,1"     "\n"    \
         |            ^
   include/linux/export-internal.h:62:41: note: in expansion of macro '__KSYMTAB'
      62 | #define KSYMTAB_FUNC(name, sec, ns)     __KSYMTAB(name, KSYM_FUNC(name), sec, ns)
         |                                         ^~~~~~~~~
   drivers/fwctl/fwctl.mod.c:20:1: note: in expansion of macro 'KSYMTAB_FUNC'
      20 | KSYMTAB_FUNC(fwctl_register, "_gpl", ""FWCTL"");
         | ^~~~~~~~~~~~
   drivers/fwctl/fwctl.mod.c:21:42: error: expected ')' before 'FWCTL'
      21 | KSYMTAB_FUNC(fwctl_unregister, "_gpl", ""FWCTL"");
         |                                          ^~~~~
   include/linux/export-internal.h:45:28: note: in definition of macro '__KSYMTAB'
      45 |             "   .asciz \"" ns "\""                                      "\n"    \
         |                            ^~
   drivers/fwctl/fwctl.mod.c:21:1: note: in expansion of macro 'KSYMTAB_FUNC'
      21 | KSYMTAB_FUNC(fwctl_unregister, "_gpl", ""FWCTL"");
         | ^~~~~~~~~~~~
   include/linux/export-internal.h:41:12: note: to match this '('
      41 |         asm("   .section \"__ksymtab_strings\",\"aMS\",%progbits,1"     "\n"    \
         |            ^
   include/linux/export-internal.h:62:41: note: in expansion of macro '__KSYMTAB'
      62 | #define KSYMTAB_FUNC(name, sec, ns)     __KSYMTAB(name, KSYM_FUNC(name), sec, ns)
         |                                         ^~~~~~~~~
   drivers/fwctl/fwctl.mod.c:21:1: note: in expansion of macro 'KSYMTAB_FUNC'
      21 | KSYMTAB_FUNC(fwctl_unregister, "_gpl", ""FWCTL"");
         | ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
