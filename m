Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2007BB1D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 05:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720987; cv=none; b=ZgvCklLwpmOBt4IbW862wqkiURcxCu26via/QI43xg3KN917SjrLuVcdqJNiMF7ijvoP0QmTnrnlYs6Z9nPy4SCuaB6nXVexuygh5sGG64xgVRe1VI4dNba5sqPq+Zh6niZ16GVYKz0NfzdA9gdVp9HLZO+NwPqg31LE6JBYjCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720987; c=relaxed/simple;
	bh=xagkNeytQjNwr7ojtMGFy6mC+UETPhtCI2FO90x/T/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeDaCbB6u8yuiwR90rk1Lw/sfiS+5dxtTc279PXrAfwtXy4DONPnZ5qlB3EOQYsmh9W6dqYoMfVsTqsz852qLrgDVp3ZYFGTPu8quy6RIfHm+wCYrpIl3PooGZpHxrHvuun2nWQxK8cXeeY1pY+f62fE7AnLdz13D3InvaShq9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2Fp7rlp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2Fp7rlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720985; x=1765256985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xagkNeytQjNwr7ojtMGFy6mC+UETPhtCI2FO90x/T/8=;
  b=L2Fp7rlp9QuxVN26x6PQ11qantOzqOZV7Je7z3xL/P9APnN9npIfuO7f
   0xmA8wF+pJkjvV1PssYMNDt+QVSg3v45VP3vL03sjQ7eJLJDhiygzdPBa
   j0P7tCiWDROT2Ro+evAzYweYrrkprKZ2aIwX17ivSFIt2Aa5PBmYly0Br
   z7CbMzo0WaSYEO1ZG0cRug92VmCShik0ayOdmwQROBolgur16kOXcgDVh
   w4WMrvy8ta1+uHiQpaCHxkBm1M2TQ5gl+LlLyeu7UP5rgFWG4EDoFsynb
   2iNkFV8UcLLFHQxcCb6F6aD4mhBHw2bqG8mZ9cWy+stDi6MvZho5H5wZF
   Q==;
X-CSE-ConnectionGUID: 3nzuYCiwQyCxf0dJj0u5DQ==
X-CSE-MsgGUID: bqbHwvywTLmblOA1qjzy+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37683976"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37683976"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:09:45 -0800
X-CSE-ConnectionGUID: OmwCrjxrSDudjpTYSnWE2g==
X-CSE-MsgGUID: h7H93UPGRQuBcIMJ7GuxIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125806851"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 21:09:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKW1e-0003y9-0M;
	Mon, 09 Dec 2024 05:09:42 +0000
Date: Mon, 9 Dec 2024 13:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 08/11] iommu/amd: Convert to
 msi_create_parent_irq_domain() helper
Message-ID: <202412091120.w1LLA3Hx-lkp@intel.com>
References: <20241204124549.607054-9-maz@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204124549.607054-9-maz@kernel.org>

Hi Marc,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on pci/next pci/for-linus linus/master v6.13-rc2 next-20241206]
[cannot apply to joro-iommu/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marc-Zyngier/irqchip-Make-irq-msi-lib-h-globally-available/20241204-204904
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20241204124549.607054-9-maz%40kernel.org
patch subject: [PATCH 08/11] iommu/amd: Convert to msi_create_parent_irq_domain() helper
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241209/202412091120.w1LLA3Hx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091120.w1LLA3Hx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091120.w1LLA3Hx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/amd/iommu.c:3810:10: error: 'const struct msi_parent_ops' has no member named 'bus_token'
    3810 |         .bus_token              = DOMAIN_BUS_AMDVI,
         |          ^~~~~~~~~


vim +3810 drivers/iommu/amd/iommu.c

  3807	
  3808	static const struct msi_parent_ops amdvi_msi_parent_ops = {
  3809		.supported_flags	= X86_VECTOR_MSI_FLAGS_SUPPORTED | MSI_FLAG_MULTI_PCI_MSI,
> 3810		.bus_token		= DOMAIN_BUS_AMDVI,
  3811		.prefix			= "IR-",
  3812		.init_dev_msi_info	= msi_parent_init_dev_msi_info,
  3813	};
  3814	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
