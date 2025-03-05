Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EBF155A2F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 05:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741152484; cv=none; b=Y798vtPJGG91b9P0nogkZbHFyX+Q9RwBsmrztVGCMzUdy1yDSGpVvDynX6kXKgF3NNjcNYEQv+ofTJ7eHff/Kmwd10DRj9bAhSgTIoH/YSgqIsyk0QH+NyiCfIjRDaJq3DmUewktBWEiN3s/fB0IZ4mkgvwEkK0fY5yrnTGL0DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741152484; c=relaxed/simple;
	bh=PpvCukMr/R5cj6etLsS/IgughDTMXTwU3ttpqXOI0u8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NuvkXyqZVInL2H8Gf97ZCR3A+vxTJJgJdBDXl1TiMjkOZDeCNRztQZHoUU7jyoHg7iVrWurwyF2aWI25q060YQS9M7u4Et9Tsacr4FuJdtYkNz30LiV9X99cCDSFuGKcpuWS86cZ9ND7gTKnI89GTGGS5Fhp5K7wJ2LMNp5KHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjyoBUDp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjyoBUDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741152482; x=1772688482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PpvCukMr/R5cj6etLsS/IgughDTMXTwU3ttpqXOI0u8=;
  b=VjyoBUDpvQCC9Hn/2UNdllO21RDlFosBxK4OfIX/jUi7ZNlJZo7bdoDT
   RvYcQgZC5gwAkwQOkSa+i5s9w6veuLO9vjpYsLTHTMuGtAZzBotx0Qit3
   UbF+a/TgfkRaouzl130QkkfCt/E6gQg6NLHXKoandT8oyVCXMzhi60gzt
   ByK3wOL34rpvKtOVGIynb/aQvnZRJv4IzAXvSRztKz4wPgqXKJV3tzB9P
   SGsbP5k/5S94uzZRCeTucJt01uM/BsTwD8WFMEumHYiKmbxfXAWByxuwP
   2pwqoM/5nH/t8Y//0GXQuGjrro0+TatjEgJJTGeC7Udog+A89RixG3NeK
   g==;
X-CSE-ConnectionGUID: 4BVnm2YdRbGbl4UC4UKwhQ==
X-CSE-MsgGUID: KBvTNnazTomeV63RyHRR3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41348616"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="41348616"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 21:28:01 -0800
X-CSE-ConnectionGUID: 1gYi110jS/O2d3t2GRRg9Q==
X-CSE-MsgGUID: 6L5XiPvxR3itLn226o7QRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122722770"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2025 21:28:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tphIU-000KdK-0M;
	Wed, 05 Mar 2025 05:27:58 +0000
Date: Wed, 5 Mar 2025 13:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [linux-next:master 7355/7930]
 arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtb: /epf-bus: failed to match
 any schema with compatible: ['pci-epf-bus']
Message-ID: <202503051518.o9Ed6Wgm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   20d5c66e1810e6e8805ec0d01373afb2dba9f51a
commit: d92a0ab61ed2137d174c2afef3475234ab2924b6 [7355/7930] arm64: dts: ti: k3-j721e-evm: Add overlay for PCIe NTB functionality
config: arm64-randconfig-051-20250304 (https://download.01.org/0day-ci/archive/20250305/202503051518.o9Ed6Wgm-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051518.o9Ed6Wgm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051518.o9Ed6Wgm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtb: /epf-bus: failed to match any schema with compatible: ['pci-epf-bus']
>> arch/arm64/boot/dts/ti/k3-j721e-evm-pcie-ntb.dtb: /epf-bus/ntb: failed to match any schema with compatible: ['pci-epf-ntb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
