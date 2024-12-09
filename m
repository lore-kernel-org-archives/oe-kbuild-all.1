Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7457021571D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733735546; cv=none; b=L5EMTzvgj9ZWav5Au7yo7Il3obpRmTyuIO2e7QVq6SB61y8Y0wyPSIaK6qNtSt3ZVfHUlmH6VLQkx1vT/mD/UEWDqbK+SOTi1QnvhHKCXRPEy8+w7EGyW3qYY56YfbYXpJZxndNjMxJo0HasAqa3RlOJctzVjLz4Fnskjl/j2Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733735546; c=relaxed/simple;
	bh=VteMjDQ0yt3nfI/UjEWZnfVYIifu/A00pv9wCItusRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FH7326HH3XW40tC34k3OexrsZrLnFhuCE55L0Pl5QJEnozb5lafNtZ/PN0pFe3WlZ0eDgwZGFWEH4qEqDHa9ZwKDjoLV0aWYrI6mbXrJMSt8hgvbfnMkGQV2OdILQdfz5CJMwYoPNpusHx/6bUG8KZG3qNxuHGUzuerBux4eH7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d8KtLDOu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d8KtLDOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733735544; x=1765271544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VteMjDQ0yt3nfI/UjEWZnfVYIifu/A00pv9wCItusRc=;
  b=d8KtLDOuKD71OYMxDOMJk/GOtz+XkeF11cWVLbzI8idEk0zlPG/xMPez
   D8f32L6CzMAABpHZX/72+1tEcaCuA4ZFtEY0JHabkhFMHHspYOhtrgKyY
   Pg0DhWT5VWcYBnJIuj7lawTYVpbtzfQs4UxnFAEU7SVSwoh4BpSyyAFPi
   zQ4QTTSAC/tyv6XTcCdW4GUT6Mn5yUNvIc2zBSRJ/eKaKmSqx5sioD2fH
   e5xonCe+vKHaPP3cNmCC7vjBl7NtwDYHQyeH8Jtz47AUP1rwIkfFfW/2K
   IKk8NOav+my5IWBseubX+IDSwTHj+xzbS1V7tWJ5VuJzEqytalb2z7Uec
   A==;
X-CSE-ConnectionGUID: kX7o7yaZTD2gJYy4rlzK7A==
X-CSE-MsgGUID: 8G4GSoWlTayChynQfjnWqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34081248"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34081248"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 01:12:23 -0800
X-CSE-ConnectionGUID: 56Ba2d2FTkabE+Y5k+Micg==
X-CSE-MsgGUID: In+rYV5UTH2csz1ypcKMZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95212097"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Dec 2024 01:12:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKZoM-00049d-0D;
	Mon, 09 Dec 2024 09:12:14 +0000
Date: Mon, 9 Dec 2024 17:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 09/11] iommu/intel: Convert to
 msi_create_parent_irq_domain() helper
Message-ID: <202412091649.0tJFbTad-lkp@intel.com>
References: <20241204124549.607054-10-maz@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204124549.607054-10-maz@kernel.org>

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
patch link:    https://lore.kernel.org/r/20241204124549.607054-10-maz%40kernel.org
patch subject: [PATCH 09/11] iommu/intel: Convert to msi_create_parent_irq_domain() helper
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20241209/202412091649.0tJFbTad-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091649.0tJFbTad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091649.0tJFbTad-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/irq_remapping.c:1520:10: error: 'const struct msi_parent_ops' has no member named 'bus_token'
    1520 |         .bus_token              = DOMAIN_BUS_DMAR,
         |          ^~~~~~~~~


vim +1520 drivers/iommu/intel/irq_remapping.c

  1517	
  1518	static const struct msi_parent_ops dmar_msi_parent_ops = {
  1519		.supported_flags	= X86_VECTOR_MSI_FLAGS_SUPPORTED | MSI_FLAG_MULTI_PCI_MSI,
> 1520		.bus_token		= DOMAIN_BUS_DMAR,
  1521		.prefix			= "IR-",
  1522		.init_dev_msi_info	= msi_parent_init_dev_msi_info,
  1523	};
  1524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
