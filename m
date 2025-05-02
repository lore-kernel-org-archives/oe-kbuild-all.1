Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D3D22A7F6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746174911; cv=none; b=dTTVaZFHQfMKOd7xMxmUbHoaR46iwauvu0nxssraMrFHCMeuqnM+l+J3ZmlqDH0xxLk1jfXbDinZB6frnWSWowt4u72eIpiu3r5mRP/9yTriUn0itaprRxZINKknGlSH89gJXBmY6cJYDaYsZSWbf7m5XUWxiGpupTcf3afj5Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746174911; c=relaxed/simple;
	bh=IECt4XWgqv83HDSWHeR1loP5zwUTWSGA1PYhP1l6VwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EQncVJJKtGxpbZ5Vasf6NL07+RvkqmSHzO5TuH55IvYTOkzqLhU2m9EPUDTg6owhMvkTkv2z+zNxOqGN2dRmtupH0oD3Ax1iKqqzYZVPeItvQyk7FGXFoHK2QI/WgHPAYH364Zn2dk1o2V2efKgIfwSYLp6HhmCy31P9vnfaiTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T7Q4fsAc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T7Q4fsAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746174909; x=1777710909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IECt4XWgqv83HDSWHeR1loP5zwUTWSGA1PYhP1l6VwU=;
  b=T7Q4fsAcVkiLUegfPfpP2v8B6GJNFSqwrS1+0+KcFZ62iUm+V/ERiHC7
   kP+5/G06PZRlGD66Snn8GKVNQWTdPUu6zpHjuZHHeA4LD1IB6qUU37H7L
   LKyHvhQazw8xG6cUCgkDe6yNBg/lvoKxQSSExLmAsORiD3ZS20Im7/rTG
   3yRxQMF76O7CcXfQiBeeayWncaPuO9IU4vx7t4lvVlF7s9R5yE7qUyP14
   vahJbM6v3vbFi93zR4wvJTz5WHCrb7yiN5vRpLRd6/ceIFIWdmZSYnu8e
   pWsjg3MuRX+8yAZQbrpPGEmX6McLUmftUodl9J7DwOVweeQcbinumYZ0p
   Q==;
X-CSE-ConnectionGUID: e6hD9QPXQFmMb+ZzwaPoRA==
X-CSE-MsgGUID: Lz7waR7nQxWGsI5A37jsWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58480219"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58480219"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 01:35:08 -0700
X-CSE-ConnectionGUID: HXqIrffHSmaesfqzd0EG7A==
X-CSE-MsgGUID: iGnJpq3QReSN9B/2DXEl3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="165511539"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 May 2025 01:34:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAlr7-0004cl-0Y;
	Fri, 02 May 2025 08:34:49 +0000
Date: Fri, 2 May 2025 16:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882]
 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_monitor.o: warning: objtool:
 sxevf_work_cb()+0x108b: can't find switch jump table
Message-ID: <202505021622.Vo53IuHc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liujie_answer,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   46abe407b020831448331eea487e07c883e95836
commit: 8cee206b5558245197158bd20895f95cc28d8468 [2882/2882] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-randconfig-101-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021622.Vo53IuHc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021622.Vo53IuHc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021622.Vo53IuHc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_monitor.o: warning: objtool: sxevf_work_cb()+0x108b: can't find switch jump table

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [m]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=m]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
