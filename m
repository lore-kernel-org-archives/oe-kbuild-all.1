Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E542DE6F9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jan 2026 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358989; cv=none; b=WJz3FDcXBrF/huJsnkPtd8qDAib0Ser0m3yvMyKjvT/fwwFTzPZjy2IOi65FEOp92uOsiPzLHierlnQqa/JrKOHA7qTasaDK+Ya0YuHiZUEh7VL8iiHypZ8x8UZZfQu+qk1ktV4iJ58d13kKXvGt0RBwwCbEu6Nn17xR8bZrsaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358989; c=relaxed/simple;
	bh=8Z6KWgka50MhdtAYd1chREQcMQ9M944BBr4jXd4GXd0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S8zFpxLjANFJnCVRNeMPoFzCyZJ+NtrFQSBp32vlpVhXo1/cI2ne/coHDsy01BsM/6zMYn7YD1BsK23VqwGrivcen7Axxc7PKYQiCMX1isvfatEph27oRo+z+89Y5Q3thvRIcpiu3UdwXicPcDK6NAmLEeeMYWV8Fo0MOF8jT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XgXgtE38; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XgXgtE38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767358986; x=1798894986;
  h=date:from:to:cc:subject:message-id;
  bh=8Z6KWgka50MhdtAYd1chREQcMQ9M944BBr4jXd4GXd0=;
  b=XgXgtE38AyrjLAtpnv6tr7rdw0eAXNnlEQReLdSriVurNMTosmBT5Q3c
   LjuGE6szCZJ1yZjCXhBqrRMQ2zTrk/xZ934D6/u52VVVs0WWJWvDM2uAQ
   6wnK1X/PEtDv7AXNJw6lJP/S1d8OFCvDStmiDyyzFCd1CDUcqGkLzRxP3
   QC9nbBuJVdhS7axbwyM8MPXZyX8XgyDEKJCYyXddvy8O3VuEdOef355CT
   DaYFv7N4GAF/5TdMV8xfTohzHnoabv6fEfFeY6y8Q04/xsouyHP5GHHbL
   x/g6uxZ6uSp58zr2Of0nCNAR/IwiqZ5RDztRzoz05Ma8V8AAl5DreUP6d
   A==;
X-CSE-ConnectionGUID: 9s/MxEG8TJK761ptxc/HOQ==
X-CSE-MsgGUID: Y+E/dQGdTN+XxJEmjq+nQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="67863407"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="67863407"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 05:03:05 -0800
X-CSE-ConnectionGUID: fI9e+F2XSPucupFCj9DETg==
X-CSE-MsgGUID: ZZID2kQ/QDObJNzcg6956Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="205960556"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jan 2026 05:03:03 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbeo0-000000002GR-2VLe;
	Fri, 02 Jan 2026 13:03:00 +0000
Date: Fri, 02 Jan 2026 21:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Elder <elder@riscstar.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Kishon <kishon@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: [phy:next 13/98] phy-spacemit-k1-pcie.c:undefined reference
 to `devm_clk_hw_register'
Message-ID: <202601022046.OKfcBo0x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   add66a6673bc4aacd0ef0f3c4a51271501770b17
commit: 57e920b92724dd568526990c04e79ed54241c5fc [13/98] phy: spacemit: Introduce PCIe/combo PHY
config: s390-randconfig-r112-20260102 (https://download.01.org/0day-ci/archive/20260102/202601022046.OKfcBo0x-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601022046.OKfcBo0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601022046.OKfcBo0x-lkp@intel.com/

Note: the phy/next HEAD add66a6673bc4aacd0ef0f3c4a51271501770b17 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/phy/phy-spacemit-k1-pcie.o: in function `k1_pcie_phy_probe':
>> phy-spacemit-k1-pcie.c:(.text+0x19ec): undefined reference to `devm_clk_hw_register'
>> s390-linux-ld: phy-spacemit-k1-pcie.c:(.text+0x1a7a): undefined reference to `devm_clk_hw_get_clk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
