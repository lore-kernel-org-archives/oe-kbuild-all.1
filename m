Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7CD16BE3A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Oct 2024 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728510867; cv=none; b=ZG2XLHdvz7pYPg0BLJOzdSVlbjB92OLGJ7vvSzpqpJPk16OIwWKy9VQ8mTJAz3bd5R4FI/cyeO9IdC8QGBGl18TZVx9BGhHdXMvJzoR9Sf0ap+HCaemFsdqDUjsN+YqVeC7CqpMdplGKGGg7WcWfVgHJtafiAROegCWbH0/DOl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728510867; c=relaxed/simple;
	bh=tbcNQsWOcxzQ1VjvulPuranYgXQG11ZsObSNf8Esdg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSWPiq2oRG8EgY4qGmSc7DGlFrJhnbmJxAYo9ogc0oLjlNiVj8zTfflnp9hjgag2nFLPFJ0B8fGgWyq1xx1prp9bUYjpad4rLSs3RgZeajjaGwJivKHLwB4k2cN5uV4UD6g10LddvCZK9SGRWR4ZAUZg7qzv+YR5+IZ8qvvdbKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR0rgfUS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR0rgfUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728510866; x=1760046866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tbcNQsWOcxzQ1VjvulPuranYgXQG11ZsObSNf8Esdg4=;
  b=lR0rgfUSOb5NpXi2xYRdATN+STjgcwxRtAVCtxco0QjgjBt0ib7HXWyB
   2a9wd7sR1iSE+ed6cmDRKEBVnmD4PcDEAKwvpwfn1uijqK00P+SnEEni5
   r1GrYYi3pCTfBXpq4Lnl3YtRD+HQkY2wEmsYK/IL2UoOFdptKFgbbHIES
   9We76HNxZYN0fUtAAvU2SFIDQ3+0dfXNO9bkbrusmQ59cATldXLl8e0VF
   3hUThAgPYP97dEmij4aLmQre5n7qrZkcY/iiwD+kKfiSehzLtFRInhYT8
   480rLVGipLqSrzD9oSbieBNUxtG+Ew4Y19qzfJCZDNuDGXilR9ib5eh1r
   g==;
X-CSE-ConnectionGUID: 0J12T88hSUKbtRkpPN5QWw==
X-CSE-MsgGUID: maHmfhK4TE6GWNGWAn57gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27322221"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="27322221"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:54:25 -0700
X-CSE-ConnectionGUID: a+Ru/nSiTBSmgWA4pxJRAw==
X-CSE-MsgGUID: iCAvY9WhSAWiD8cUG9iSsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="76859541"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2024 14:54:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syedQ-0009qg-2N;
	Wed, 09 Oct 2024 21:54:20 +0000
Date: Thu, 10 Oct 2024 05:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: Re: [PATCH 2/3] perf/dwc_pcie: Load DesignWare PCIe PMU driver
 automatically on Ampere SoCs
Message-ID: <202410100508.l5fTQewL-lkp@intel.com>
References: <20241008231824.5102-3-ilkka@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008231824.5102-3-ilkka@os.amperecomputing.com>

Hi Ilkka,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.12-rc2 next-20241009]
[cannot apply to arm-perf/for-next/perf]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilkka-Koskinen/perf-dwc_pcie-Add-support-for-Ampere-SoCs/20241009-072027
base:   linus/master
patch link:    https://lore.kernel.org/r/20241008231824.5102-3-ilkka%40os.amperecomputing.com
patch subject: [PATCH 2/3] perf/dwc_pcie: Load DesignWare PCIe PMU driver automatically on Ampere SoCs
config: arc-randconfig-001-20241010 (https://download.01.org/0day-ci/archive/20241010/202410100508.l5fTQewL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410100508.l5fTQewL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410100508.l5fTQewL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/dwc_pcie_pmu.c:785:35: warning: 'dwc_pcie_pmu_table' defined but not used [-Wunused-const-variable=]
     785 | static const struct pci_device_id dwc_pcie_pmu_table[] = {
         |                                   ^~~~~~~~~~~~~~~~~~


vim +/dwc_pcie_pmu_table +785 drivers/perf/dwc_pcie_pmu.c

   784	
 > 785	static const struct pci_device_id dwc_pcie_pmu_table[] = {
   786		{
   787			PCI_DEVICE(PCI_VENDOR_ID_AMPERE, PCI_ANY_ID),
   788			.class		= PCI_CLASS_BRIDGE_PCI_NORMAL,
   789			.class_mask	= ~0,
   790		},
   791		{ }
   792	};
   793	MODULE_DEVICE_TABLE(pci, dwc_pcie_pmu_table);
   794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
