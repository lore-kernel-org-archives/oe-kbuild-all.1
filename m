Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF43370E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761663309; cv=none; b=Rtp8y5SzGJYGpb0+H9aj/BSKgIOXL5doTtJk///n1IeA5LWZXZ69SYR+cSeJGmR95LYHbI4zUl93dNwDfvchvosMhtgq/hrpeUm7MHPkrj4ySq5dKQayWoHriTa7HqVWIH2Gbk/VSE4f1w7a/WFFJ7Q//PgNvSFwPwZEOaCA5is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761663309; c=relaxed/simple;
	bh=aSCx7oMqOTIBOjPni02cNqOFaYgt6H/Iu0ndjjB2AXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NagSeDFXRYfpxAHy6gMEUdbVY2yNQ4jQOQQaIqu1rhTFBHf4QYu1cXuHXY6UZxGpkboDxgOhTGKHE2ihFNapZQWwf/zvOs+7KOQ8LiFbBehpSMktd7zymLWUwyD5SAPx4rCNSsogVE7YU6nIKopltY//BriormaccofD4z6RtXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1yLPska; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1yLPska"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761663308; x=1793199308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aSCx7oMqOTIBOjPni02cNqOFaYgt6H/Iu0ndjjB2AXA=;
  b=F1yLPskaaH65bSo7QQzLnShLIoF4uhnKSFptrmSGJ4RknAlcefIvVrhb
   4URYvgOaKN1bQNccFnKx9r2lwPlTl789jilUtTgZvOQnY2d9f3WrO0Mdm
   BuQNm094m/QVVe3xF5czRBJh9DmjHz8sJZvyKgUEm4c6FZ662J3EMkXz9
   ptnwqrIx0Ks5HNOzm48ZyekgzL6uG3DLB7rGUTEBcuwVy0IIETUgGAvWn
   j65Me0zETBBfNuzRNMvjeG3PUM/SVdGrKYiVlnWlxLoQE+WUCM0jgg2ca
   joqzd5hylLwszoQ5M+VwJC6Gx6bD09clsCwgEa26yBw0jNgZndh3GvrUd
   g==;
X-CSE-ConnectionGUID: jUm1U4xPSJGVuQtaM1xdaA==
X-CSE-MsgGUID: SRLQdxugTYGy81oTODVm9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63652617"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63652617"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:55:06 -0700
X-CSE-ConnectionGUID: Zur1L68PSy+AuIkbuce1Eg==
X-CSE-MsgGUID: 1estg4wZTs6vTlKS+gwy7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189421109"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 Oct 2025 07:55:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDl6E-000JGd-27;
	Tue, 28 Oct 2025 14:55:02 +0000
Date: Tue, 28 Oct 2025 22:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Thierry Reding <treding@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thierryreding:pmc 11/27] Warning: drivers/soc/tegra/pmc.c:474
 struct member 'reboot_notifier' not described in 'tegra_pmc'
Message-ID: <202510282202.ilWV9dyF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thierryreding/linux pmc
head:   595a9703442efc488422dd3bf1209e3f1e5d49d2
commit: 2660903452dd755346e7a074b939e0be22b3f0c1 [11/27] soc/tegra: pmc: Embed reboot notifier in PMC context
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20251028/202510282202.ilWV9dyF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282202.ilWV9dyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282202.ilWV9dyF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/soc/tegra/pmc.c:474 struct member 'reboot_notifier' not described in 'tegra_pmc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
