Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F52267B07
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 15:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755271336; cv=none; b=jE/UdFcbLaiVsdVnDNuoKOH3teFNX2mWedPY9UuNCavERyFqXAbZ/YWCHZAURp1kvmY6qJrsUiX5XsaV2XkndHTLL4joXYGc1CPFHEOmAsqU4mMQKdQ5KZCvw6lwKoxXnZrmYxh2V1X/jAWpVTz8AHRRawV3yIGp2K63bWRKn/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755271336; c=relaxed/simple;
	bh=Ja3tA4Esaji8JG2gAtTp1sTRlHup51DzDwZBspZnn7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtdZ1ZxopoL9bMBJclIJbxM9UpKW9+jxTYJ/EaqngC+yMqZigjjSdR+pkbkVatX/QMTencXIvJfUo8GZVf3AajBQIQfv9FujC8l+/yuLYu09euR4OthLSq281BdVMg9rAvCnj8D56v8S2P+nt3m2WR5T69D2qobd/boJaBX0cdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9CNzKuE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9CNzKuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755271334; x=1786807334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ja3tA4Esaji8JG2gAtTp1sTRlHup51DzDwZBspZnn7U=;
  b=Z9CNzKuExObGYgfnvNGt56sS/XfuTRg+P51To+ESA9JvFDbn4xqSg0vM
   9lE7mBhoJGLU7smRQGFdHCn1ypOQJUcBfb53+nSUmAgj7+y7rIij8avjK
   XFzKVbukucDkUOgKkr54GXczDDQW3wyCqyNyD7PQX2i3R3Btz6AB4luF0
   mrA2OHMfpy0ik/74OioYjWv5Fk+H5xnbngqzQeOyKrgxYc/hACnSxyose
   sMJIKlwzaStJcjO07oKO5tugu8r/SMtsbXZ1InVX/0vBa0Nt57vqeBNUe
   XHEzRVmkS28Np9+3cG6oC1ZvF0jDICnr+ZVqkxIDc5DktCJF+ktPo5ePo
   g==;
X-CSE-ConnectionGUID: jMI2mMLPTTevTZ/oLnr+Jw==
X-CSE-MsgGUID: cOVL8ckITD+S5pSG3eCKmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="75160351"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="75160351"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 08:22:13 -0700
X-CSE-ConnectionGUID: 85Eku46DSlim2kwyC8QT1A==
X-CSE-MsgGUID: SnAsHdi8R6GxfUrKtcMhwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166525278"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 15 Aug 2025 08:22:13 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umwFu-0000XX-2P;
	Fri, 15 Aug 2025 15:22:10 +0000
Date: Fri, 15 Aug 2025 17:21:48 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2667/2667]
 arch/arm64/kernel/cpufeature.c:2129:13: warning: 'enable_pseudo_nmi' defined
 but not used
Message-ID: <202508151728.CMPxXZsv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   54d96ebb93c9ff0573fe16586a47778ebe26de32
commit: c6ce2becb89528f83c1ad3c0607ad05baecebc0a [2667/2667] arm64/cpufeature: Fix pseudo nmi identifier undeclaration complilation error
config: arm64-randconfig-2004-20250811 (https://download.01.org/0day-ci/archive/20250815/202508151728.CMPxXZsv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151728.CMPxXZsv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151728.CMPxXZsv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/cpufeature.c:2129:13: warning: 'enable_pseudo_nmi' defined but not used [-Wunused-variable]
    2129 | static bool enable_pseudo_nmi;
         |             ^~~~~~~~~~~~~~~~~


vim +/enable_pseudo_nmi +2129 arch/arm64/kernel/cpufeature.c

3e6c69a058deaa5 Mark Brown     2019-12-09  2127  
f72387e1f8bc992 Mark Brown     2022-11-03  2128  #if IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) || IS_ENABLED(CONFIG_ARM64_NMI)
bc3c03ccb4641fb Julien Thierry 2019-01-31 @2129  static bool enable_pseudo_nmi;
f72387e1f8bc992 Mark Brown     2022-11-03  2130  #endif
bc3c03ccb4641fb Julien Thierry 2019-01-31  2131  

:::::: The code at line 2129 was first introduced by commit
:::::: bc3c03ccb4641fb940b27a0d369431876923a8fe arm64: Enable the support of pseudo-NMIs

:::::: TO: Julien Thierry <julien.thierry@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
