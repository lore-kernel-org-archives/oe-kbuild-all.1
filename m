Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003DA13AD11
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 13:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730899453; cv=none; b=NT0Kodyt1UnIVRcCEnziFLEBVEEcxzP2b0EfDf5vRx9jIt05dbKmFqhXB3fhloK7k2Rtq4Bz6jenVScC+HL8tDDFGrZDJdIWTT0MffScDKL/b5dIRkjASZY5fpg1vPYooLJ6lXUn/16XlXdW6/1K3zjDWYralYoDNdPk7TvkNyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730899453; c=relaxed/simple;
	bh=0y210huG3BVWa8mN+H5kHBlQ1+JRmnJ9yWUuiZORSV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CC/YMx1WKuxT6oCVoMiaJh2Z8tBjBiSKTXrXUOSZCmkviUNqkmrYYmRUDy9LCLSP8jY5w4pIbsDd6E0lThrQJKNGUGLQ1TI7J67m5pyz4skccPeUbq086stR1AxcAgzFMWm7O+8dtu6d3EQRsl4rE/sjNwK5bet1+MwU/vlQj6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lp8vuD7J; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lp8vuD7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730899452; x=1762435452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0y210huG3BVWa8mN+H5kHBlQ1+JRmnJ9yWUuiZORSV8=;
  b=Lp8vuD7JjWZ7u34BoomgeAmPkRD44me2XW1E9T6CxkvoDBpNpfmlnH0x
   GtTDrJQOpTz2DHIK3Xeq/g+/j5/++0r8u1+5LYB/r/AP9ssGq9jPFEGWQ
   IDIoqswIzHJaMvonAsuImF8RExhpuyvlVNNthn9qOoTPrsBJO696h+MLx
   AoIfPL50g7mx4gOqTMaComou1kk83F29mz56NFQ3ZplbbTsMEKIyEvm30
   WFsyxNv0ZVjZZSVSMaaOUWw4GBc8CjNa+TxWKRrmHC+e92oTNzcTQt523
   pZOQHQ93hZ5JRxSCmpvCCqX8NOD6u4Jb1UabZFFcGbS2LGRb1LJC2Xi9E
   Q==;
X-CSE-ConnectionGUID: Am/ChXgFTpi23G/UA7rKfQ==
X-CSE-MsgGUID: la1Yph1sQGa3p46fAnAb/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="56090877"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="56090877"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:24:11 -0800
X-CSE-ConnectionGUID: GVhlw07iQ2i87mj4p38aAw==
X-CSE-MsgGUID: ZKM6B7rgTHCRiKmnwr4KlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84455239"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2024 05:24:10 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8g11-000ooC-1h;
	Wed, 06 Nov 2024 13:24:07 +0000
Date: Wed, 6 Nov 2024 21:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1225/1225] mm/cma.o: warning: objtool:
 cma_activate_area()+0x1a9: unreachable instruction
Message-ID: <202411062106.mPTnywkZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e33ed48bc600febcdca9e71e43cf224934dadc4f
commit: 5f0e34d2aceec67c169be7599d82f0e8519c37f7 [1225/1225] mm/sparsemem: fix 'mem_section' will never be NULL gcc 12 warning
config: x86_64-buildonly-randconfig-002-20241028 (https://download.01.org/0day-ci/archive/20241106/202411062106.mPTnywkZ-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411062106.mPTnywkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411062106.mPTnywkZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/cma.o: warning: objtool: cma_activate_area()+0x1a9: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
