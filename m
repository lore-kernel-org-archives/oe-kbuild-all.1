Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4896B2E1722
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 12:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766666605; cv=none; b=NdW0813z0wtOD3k2I0suT2QoexOGYRaQbznPSgrwFEWSXcdt2n0w5ZTAZMWYWPSrlJMFX1ld+LcR5UB/X4PHUYKxKuNCS/4rVI0fWHoNxNvhVbuHXIaPYCdyv79zoU7LPNpsHuJ1FUOg5SOg2o7eWuvcD0Nzt0BGjZadrolFAnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766666605; c=relaxed/simple;
	bh=2qQPEg9A0vRlGiBZ3F8PnLJ7IE26QVHg6WWYK88bk5Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=noeT7DRktZ/q+MzisBfa764FphnaHI0pz2JaMv5PJBQinMIDMXIDCOQb0ave1Sx71kWXxyTO31LpqhicMkNLP+sY9SZzl1QsPTRth3Ez7HyL8srGbQzndW7XsxEitCOSQJyjM7Ni4QPhizw1baRlDmGopX7YU9hj9w7WMTCpJ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tqhki7vW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tqhki7vW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766666602; x=1798202602;
  h=date:from:to:cc:subject:message-id;
  bh=2qQPEg9A0vRlGiBZ3F8PnLJ7IE26QVHg6WWYK88bk5Y=;
  b=Tqhki7vWOKKPvdPsmaZKpHoV29K1DxX3CUGzQ1dtNXZf+tcuUitHt9CX
   cMl4AK0/cF08cwUwtjnTwskc+bKKZWf9tW5ZffzzZPMNBLXpknzcMfdIU
   QlAK5T7E55Wp2hI2uJkE0pvs4dNg9NX4BauRvCwbDFOkNPlmWmAzOPIdm
   58sFavBI2PDiv3vDNXQIPqVIAh9tFCjKgnEWWLHrZ9Bt3gtiT339rntd4
   DlMSUK4rD4nzSplNvEh3yanb2E6x0qAD/7aTZDRs0OajYcQKNc6+tBKM/
   ARaYjhzCcgLfSjde40VSF1biJ8fxSQhuconyqcooWPEe4OtUKmCBh7Gpl
   g==;
X-CSE-ConnectionGUID: vtr3aAUkREuutIoszebhFA==
X-CSE-MsgGUID: DvtNPggbQa2r1xbTlfunVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68361315"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68361315"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 04:43:22 -0800
X-CSE-ConnectionGUID: v15xHlzqTzSBgc7AmaetHQ==
X-CSE-MsgGUID: alNxHYnMRUm52oQhPb+klg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="205119013"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Dec 2025 04:43:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYkgY-0000000045r-1788;
	Thu, 25 Dec 2025 12:43:18 +0000
Date: Thu, 25 Dec 2025 20:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942]
 drivers/pci/pcie/.tmp_dpc.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202512252031.yxPB7t3Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4e9c55920995d70b3e88b60c69753df54b03fdf4
commit: 58d584102f06f870f118644f1022c751e015e7bb [1942/1942] PCI: portdrv: Initialize service drivers directly
config: x86_64-buildonly-randconfig-004-20251213 (https://download.01.org/0day-ci/archive/20251225/202512252031.yxPB7t3Y-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252031.yxPB7t3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512252031.yxPB7t3Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pcie/.tmp_dpc.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
