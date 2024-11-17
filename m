Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5FF41C6E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 23:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731884749; cv=none; b=dhebfQQT1CbsP38WyJzrBZ3BvfhM6rukcb4fCVZH7MOopxt48544KDy0FzIeAqBuf7QffCg6tTg4boarvJUgvgevtjVqja100ypEPV23dHLAk9cLaZfL0peGo6V+10KEej6QtDw6Z7oykg3pngBSfXjTB9zdYmBlkEwwnj8SWXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731884749; c=relaxed/simple;
	bh=vwqCpILvVf9fabOk0lFfynNlQjZm+YBzKPv98TNvLQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQxHJj0FKb+2UO3v35pu4xPq+LbYa+G9/2bd0LXrd1GhU9XxDAcx4ytEiCyJ21T3Ixqs5rJrItEfSR6JIFvSFqvCXmd6HUeowTP1mDuwcZpLZyOZwqPA9iMr95n/UEZmBDucckRiJjZh5Wsf9qbJ75if07RBUzg/rtkoi2Gnwt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9fGjQSE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9fGjQSE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731884747; x=1763420747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vwqCpILvVf9fabOk0lFfynNlQjZm+YBzKPv98TNvLQs=;
  b=I9fGjQSEoXC2SBlv9QUL2npFs5bk+u1c4DEhH9+T1sjMfJFDljVg2VNP
   UmgXxvVphdiS82v38MzrkijsTgH8UT0RgvYC2Ha8fAD8a4QaqQ1iMoIaI
   yw1K6t6IwVOtzLLqkone/XWtQa/yAImkqPKI3uMU5Td+4/WLRUTaGi4oH
   wPik/o5Jo/j5brqf9SR3VBnP3EvYtKyCdZ0kGSxPZVuL3lSknYunfq/9v
   tlBq3mlAXnaoRe9bZg6amXxP/R2OoOMM3dVs62SJFxf5vf1tPQ6M7PkdF
   RMk039twcv3OpAxnD4RlHOBYTWfzMeQyxRpnDfyOBT1Y0oF5+5OtvHVpl
   Q==;
X-CSE-ConnectionGUID: 4uUhFxlzQLqMZ3H1+nPK3w==
X-CSE-MsgGUID: 3v7kb6NgS/qfe748TdP77g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35502242"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="35502242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 15:05:47 -0800
X-CSE-ConnectionGUID: 1LlsnQ9yReu1RfQx9lVZGA==
X-CSE-MsgGUID: SJ99Ou3GSUi9BBqDB5A4ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="126598117"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2024 15:05:46 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCoKt-00024v-1l;
	Sun, 17 Nov 2024 23:05:43 +0000
Date: Mon, 18 Nov 2024 07:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 11237/11989] ERROR: modpost:
 "snd_soc_acpi_amd_acp63_sdw_machines" [sound/soc/amd/ps/snd-pci-ps.ko]
 undefined!
Message-ID: <202411180658.mIeWje2V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   744cf71b8bdfcdd77aaf58395e068b7457634b2c
commit: 56d540befd5940dc34b4e22cc9b8ce9bb45946f7 [11237/11989] ASoC: amd: ps: add soundwire machines for acp6.3 platform
config: x86_64-randconfig-121-20241116 (https://download.01.org/0day-ci/archive/20241118/202411180658.mIeWje2V-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180658.mIeWje2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180658.mIeWje2V-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "snd_soc_acpi_amd_acp63_sdw_machines" [sound/soc/amd/ps/snd-pci-ps.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
