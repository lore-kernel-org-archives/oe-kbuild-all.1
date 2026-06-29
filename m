Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9157F42E013
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748144; cv=none; b=dekUalaHCu/pY8puoTsUg9I9JlQE6bjYmN0qC79+0sT1NvN1UsjHHCvkUqhYZs1/+XWr2NPzrslnqgR8mL8Sfx8C/dA0J9P7S7xCkcS6Of3lyxk6O8+Rth8dfDebMfkwu5kpDdywLzXJp9YWEP7Mizhu4aPqva4mU/hcrFFdHD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748144; c=relaxed/simple;
	bh=ylOS8kSUdhC9o9EuZi1bZfSDDlzyO5+VvCmKJQoOuiM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gU2YJDdlVfY6cLfg6EYKfyQDY4gXYs26fPFpv0O+iITQDK0qWQu0hnnUnJNrJqfZ2fuhMRETdtmKEVs6RfhDgZ4OCkRZ8Xas84j8N6K6wcenhHzK2zv/8W+B90lST760c8eIEaeWnvFa6+uPXsxBZit9542uXuTrP3Lmst8tO1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzrB66K+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzrB66K+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782748144; x=1814284144;
  h=date:from:to:cc:subject:message-id;
  bh=ylOS8kSUdhC9o9EuZi1bZfSDDlzyO5+VvCmKJQoOuiM=;
  b=LzrB66K+pMHu61DY1j07ktfFoJudP+vp1P0nSUiafRyWfh/bwwHmW8Br
   LsOmSMA6hOyIX+X2TJYZ+5NqwrewzaymBhuiHkheqhGzzNtB9Uua67R+e
   g5J33Uc/2P3SLGs1fkJzrTzzf5wNbTJqVZTUbD2Snk4CwyUFdFztWE3dQ
   bgVXMBJ7jePIsG4MO3Hjbz58Kg949PxTsSrjWrlbp0JxkabX4Off9TNYW
   g4XoTDkBnirM8KtV5hQX54dW2C504mbMVxeZYrs0xMnnoXQNm73qngcsO
   eiFfgOJpKeC7EYjt8H0O79UTpMrNC7yf45XXs9F1OIGfPAKwok7BGUKzt
   w==;
X-CSE-ConnectionGUID: 1v4bfh9JSW2gCzLvcDx1xg==
X-CSE-MsgGUID: e5/C+46pShm1PBYZigToRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="85989750"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="85989750"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 08:49:03 -0700
X-CSE-ConnectionGUID: W2O3UBmETUaHIhfv5q4FuQ==
X-CSE-MsgGUID: QGoCcBUyS/2HPtcEH7ml4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="276264775"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jun 2026 08:49:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weEEE-000000007Vs-3PDU;
	Mon, 29 Jun 2026 15:48:58 +0000
Date: Mon, 29 Jun 2026 23:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: Manikandan K Pillai <mpillai@cadence.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: powerpc64-linux-ld: warning: discarding dynamic section
 .glink
Message-ID: <202606292337.XdJEfchV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 611627a4e5e4af7b96aab4f10d130f6a8a615020 PCI: cadence: Add module support for platform controller driver
date:   8 months ago
config: powerpc64-randconfig-r064-20260629 (https://download.01.org/0day-ci/archive/20260629/202606292337.XdJEfchV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606292337.XdJEfchV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 611627a4e5e4 ("PCI: cadence: Add module support for platform controller driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606292337.XdJEfchV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: discarding dynamic section .glink
>> powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `cdns_pcie_ep_setup'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/pci/controller/cadence/pcie-cadence-plat.o: in function `cdns_plat_pcie_probe':
   drivers/pci/controller/cadence/pcie-cadence-plat.c:117:(.text+0x314): undefined reference to `cdns_pcie_ep_setup'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
