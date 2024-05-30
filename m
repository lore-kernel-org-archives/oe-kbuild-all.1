Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD5917C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 00:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717027423; cv=none; b=KCS5OOtroJ7NXD3ngg8UYxbOyOLZ1/GHnuBS7mkoK3wiKu0ONBrRYAbFNfIxNd0yFC/hV472MEXYFlx2taUcAsKPdelNNUYo3C+wF7E2JK7GclEhuOuRBnY8ZShgeP1+HXlB/I62Rz2GoIqb6NhQFk6FAGmNZWGo9xKfouJLYQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717027423; c=relaxed/simple;
	bh=WDaWwkxVkJFFZCEXC6Riump9GVlVC44AtCfTkoSmEJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+EwOJOFs83+Skud9OEc25MVWUzvIyUaB+b37zbxkOiKEXf9HAsJyadrTmsG0Q0B8Yo60Pj2NphDFetttWP4e2zdXuC9mQ0P0SuGibO2DHt0OX3LcjCYEZKnfcakhoNjpMKpG12mGK2acDvE1kdeQqRMLBN2y7gCv6vp/KSacGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCc85gUG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCc85gUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717027421; x=1748563421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WDaWwkxVkJFFZCEXC6Riump9GVlVC44AtCfTkoSmEJM=;
  b=OCc85gUG3ntFEb5iLeHIAeS8araraazIcba0oqUcw6hEYeka4bLq3MHY
   MXwLaQIXgO/0yO6NUn/cuM4xlvgYCp0dxU4NgyP0F6C95NDYb+BxS7r4Z
   wT3h17BwjI+IurGJKogI7SdlTt5Vm06lsHebYG7U/ZB4F7WjBpGzemQ9M
   ppjr5vosxXA6JR8icRss4CTBmNlz1PuoCuJM5gJKkmwhg8Q88Tl7T3Imn
   cDM6YCd+eMD9uI0Gg0xxS89bC1Zw336ZYxrtc/AfAtkEeCz2T/B+UHe8N
   JDCwp5oWiEHcUARtNMx7S1gryusdr5njkvk8wKwh1B6XIIrFnDGagj6z4
   w==;
X-CSE-ConnectionGUID: Fmdng9pDSSeQyOGnVHWauQ==
X-CSE-MsgGUID: +ckAA8zaQyGG2u9egqWNVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24600141"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24600141"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 17:03:35 -0700
X-CSE-ConnectionGUID: LTMCJwm0QNK4sLqhVSgDMw==
X-CSE-MsgGUID: itu3BJ3mTdyWNRbMgCSIAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36162449"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2024 17:03:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCTGW-000ELj-1i;
	Thu, 30 May 2024 00:03:32 +0000
Date: Thu, 30 May 2024 08:03:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/9] pci: pcie: portdrv: Add a auxiliary_bus
Message-ID: <202405300703.CtHIGmPK-lkp@intel.com>
References: <20240529164103.31671-6-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529164103.31671-6-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus cxl/next linus/master v6.10-rc1 next-20240529]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/pci-pcie-Drop-priv_data-from-struct-pcie_device-and-use-dev_get-set_drvdata-instead/20240530-004705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240529164103.31671-6-Jonathan.Cameron%40huawei.com
patch subject: [RFC PATCH 5/9] pci: pcie: portdrv: Add a auxiliary_bus
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240530/202405300703.CtHIGmPK-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300703.CtHIGmPK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300703.CtHIGmPK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/auxiliary.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
