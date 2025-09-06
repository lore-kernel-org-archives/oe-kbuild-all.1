Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E9D2046BA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757147599; cv=none; b=NbsP5WAT/7DE1lG7pWbwyfMXlWqqVHwoWm20tTKlXL5yGDGVVg0itZjb8ciQyU1WJxlKjxToKZb/xEQhGSfEjeOPqgtFZl0keONzwDQZcS/y1tlIQpvjQlHEKo+ZRTleDZF5pT1n50dlMy14bMW2X2rAHytIm7RmweQl4D0S1sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757147599; c=relaxed/simple;
	bh=fBCgQ9+Esjb03hqSkMbtVgmbhJSrvSN5rMOZIFLecCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWfWUJkAmz1EoOC9VmZ2bvb41dMYuFIl5Lwpz77Xr2Kywk52g8WqRWFOh9tvoV0kJ72gDWqy+srEJH8C4yzykRrAVik+S1ocr14cgZjDzr1Xehk23vQLgNtWVqV8U5JvxFMaHDuP+aLgyzanErxo5RZAzw7D7Ife76I0Pu0W3pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QprIcFVe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QprIcFVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757147598; x=1788683598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fBCgQ9+Esjb03hqSkMbtVgmbhJSrvSN5rMOZIFLecCA=;
  b=QprIcFVevj/RZebcDvDNoBkhZdZw8Fia5PQ6xpDNTz34+oCjtw5xtl8l
   wpU5ycfO2GURBRtvCfkGbJdps7jmTsQvMOLnyhY7rPiFgr/fMyfmg4QDM
   Q/nKw5bnBFfwk9Gt37wGxa9KqjfrHX+RQQOMx2SinewX4/Tgl8T+K4RXp
   6h2IzJ+ubDAomw+u47fYRori72JcDyLkvs8Aa2zM1js5ClfA0NFQGFLG/
   c1e9AgwKdMGJMMfFYovgSE/3KcTBbn1R/VIBzIxc7baKtMf8gKYhgC227
   suGTfJqdNTajp2YNE/Ky/MvoDz1QNQSs4nnp4q7TqtUE0gLaLyjF+29wB
   A==;
X-CSE-ConnectionGUID: wWlCEDHhQGqkZnwp6lXDlA==
X-CSE-MsgGUID: uPDBhMDsShG5oGAhhVODSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59407643"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59407643"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 01:33:16 -0700
X-CSE-ConnectionGUID: LvB4lU6ZTZKfSy0ULtCbiA==
X-CSE-MsgGUID: 9RDaaRPjR9ejrPX6d4ISyw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 06 Sep 2025 01:33:15 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuoMC-00049P-2U;
	Sat, 06 Sep 2025 08:33:12 +0000
Date: Sat, 6 Sep 2025 10:32:59 +0200
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [jgunthorpe:pcie_switch_groups 5/12] htmldocs:
 Documentation/driver-api/pci/pci:19: ./drivers/pci/search.c:611: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
Message-ID: <202509061043.HTW4fby7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   b07d062a257fab9b08dc1b6708ada05aa90d4cf8
commit: c99c2800fa7ff067b894e473bf60473ca4b7ee4c [5/12] PCI: Add pci_reachable_set()
reproduce: (https://download.01.org/0day-ci/archive/20250906/202509061043.HTW4fby7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061043.HTW4fby7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/pwm.h
   ERROR: Cannot find file ./include/linux/mtd/rawnand.h
   ERROR: Cannot find file ./include/linux/mtd/rawnand.h
   WARNING: No kernel-doc for file ./include/linux/mtd/rawnand.h
   Documentation/driver-api/pci/pci:19: ./drivers/pci/search.c:610: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/pci/pci:19: ./drivers/pci/search.c:611: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/pm.h
   WARNING: No kernel-doc for file ./include/linux/pm.h
   ERROR: Cannot find file ./include/linux/pwrseq/provider.h
   ERROR: Cannot find file ./include/linux/pwrseq/provider.h
   WARNING: No kernel-doc for file ./include/linux/pwrseq/provider.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
