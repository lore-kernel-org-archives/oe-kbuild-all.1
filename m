Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E822AF10
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 19:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250228; cv=none; b=ChBOP3fvDfQiMNzRR9tCAprmff52mgdnDgRwwkBYmHVb933JMj9AxDxiPqf6Qwsjabm4Qc6IRAnbMawuolDXjTrKJCIIhn/t9T98ni5zwMpxQXp3/gWC9Qiaya+h3U5ieoMGQsJ8WAPX2KG4oT98cVDQ6k2gx9SeAirUltxFyk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250228; c=relaxed/simple;
	bh=F/h27kq45p6njTQbG9tZrwtiwWFjic5XsS6r9obphu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WNdMTyrIlOth0W6TEsvzPs96HyMGV6tuN4QeU0hcHJ3bjkWUMuMnSQ1vlkwfnzijW4cBu7wHdT3NpcH1exTfNcyADJyT8rQbz1/KA2I5xuFxfVRqIBrAvrmR+nSf5aSWz9JXP9IrJV0uMJTLSoy5ppRLZKGEVaIYysgkMHeEO9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1wsydrG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1wsydrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747250226; x=1778786226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/h27kq45p6njTQbG9tZrwtiwWFjic5XsS6r9obphu8=;
  b=L1wsydrGg7D7Vt1ccG+TbUIukMTdLheSG+NPLMCQotFbAWHlh7FTVjFX
   rpif9EFXq1TDKDtoweFzLc67f6WiWPnNCY0A3j/ZW2rtP4Du1Os2zoLo9
   vIACDnUiSZXUOx06DFUGwiYQbVbZAlpPFgErRxi1MyDjmSmdwI/ZG6ToW
   wekFlBonhWSH2sFN0q5FIWLNXY5x7rMeoWa2QVqMB6wqPxtlPzqnx4b3H
   kioMjUsxYS60W0dz/fZvAJ2W2fFbPrbMQ9eO1OBS2PSo22VSTbxQ3t9rh
   Jqbz69hw4Ue/9iCMpzbbtHcx5aVcL6K5rcSMG1QUvzk2slRRGGToQoi0B
   A==;
X-CSE-ConnectionGUID: bj6j6QlyRueM0ngi5yGWww==
X-CSE-MsgGUID: eB9opp7jTAOF/Sel2dpKuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52835546"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="52835546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 12:17:05 -0700
X-CSE-ConnectionGUID: lY0ASrdxSRiAbTy0Ge40oQ==
X-CSE-MsgGUID: 2UW0hPg5REGPHjZyeAYLlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138660001"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2025 12:17:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFHbC-000HU5-1C;
	Wed, 14 May 2025 19:17:02 +0000
Date: Thu, 15 May 2025 03:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 6950/11093] ERROR: modpost:
 "__regmap_init_mmio_clk" [drivers/mux/mux-mmio.ko] undefined!
Message-ID: <202505150312.dYbBqUhG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdd609656ff5573db9ba1d26496a528bdd297cf2
commit: 61de83fd8256e185588670d3cf0bccc3e913819c [6950/11093] mux: mmio: Do not use syscon helper to build regmap
config: s390-randconfig-r121-20250514 (https://download.01.org/0day-ci/archive/20250515/202505150312.dYbBqUhG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250515/202505150312.dYbBqUhG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150312.dYbBqUhG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__regmap_init_mmio_clk" [drivers/mux/mux-mmio.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
