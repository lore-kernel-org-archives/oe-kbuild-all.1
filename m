Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA9BCA6F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145764; cv=none; b=u047uFc0rDjZvHTEy+vKRv2nlLYV5k0ByYTR9S7fRNkJ7d3NgjR4hKQC6GjGt986YmjvPz+HAnhcEd4tLHS07zgThvXa4woO0fY3d/8fKSZZo+381ptGca+KQJ1kaCvpsIkuq1aW54fwBdbudvGQUo/XWkESDz3jzyg+70e0JeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145764; c=relaxed/simple;
	bh=Mqkt5CmFTcJHKhcXxsGJvciVc6jghZKyPLw/h4q/RZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCa/OdNL0/rvpdPdNDh4G0eaeks7Q25Q4PL+dnpY7jQ/6F1kf4gNVmQNOUNt5QYALQy8xCmiZXXDLrZVD9670eooK5HdfMx+uYPVPivIs3BFI3r8KhbIj0w+psezpFzLf+l2UcB4lkGQ70IDKQaSsAeu247BEHSTp5NiJwk6ptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwellpUr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwellpUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750145761; x=1781681761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mqkt5CmFTcJHKhcXxsGJvciVc6jghZKyPLw/h4q/RZ8=;
  b=kwellpUrv9NbR3CwFLAFB7flR/r9dq9OD+sHTr7gBNvM/GHCo7M2ZIzh
   kKLtUOqdMIxrwuyhHyl5Y3f9tFJi+FAs3ohI+w5uDLWf2qJGJG40bFxWb
   xdN+tp0fEHij8eb6IvkWEP0NqmoTFPNVRLGNYz5f6VhSlHtD3J2EjwLso
   IrlOumO/zwEgrNQbPufoM3bD9xYbwK9DmFctjvqQSWyxTvCZnecEFCeNF
   hx0uH36YMDHBEWYd4hsGmX31J9kCJzG+gPGC+ehykjrGF792JpNNnCd8O
   8qqxmFLH2skh0Yc5qktUSV8ShGah2UTTwWl3NCq26VdFUo/Zd7ZLs8T/X
   w==;
X-CSE-ConnectionGUID: srZ+P9wLQemlq1T2czqMcQ==
X-CSE-MsgGUID: a+bCNvCpRkaQiv/DH+sq7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52392898"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="52392898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 00:36:00 -0700
X-CSE-ConnectionGUID: xs3R5rVJTNSLNeWU5XW5zw==
X-CSE-MsgGUID: tl4Y7DQyQaOHMcONCLZDWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148597259"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jun 2025 00:36:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRQrN-000FjE-2I;
	Tue, 17 Jun 2025 07:35:57 +0000
Date: Tue, 17 Jun 2025 15:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 102/102] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by
 SPI_PHYTIUM_PCI
Message-ID: <202506171541.qTK2MWRo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8cbb260f5584b8ea3d3941593c23a2ddc27fe701
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [102/102] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PCI-0-0 (https://download.01.org/0day-ci/archive/20250617/202506171541.qTK2MWRo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171541.qTK2MWRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171541.qTK2MWRo-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PCI [=y] && SPI [=y] && SPI_MASTER [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
