Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BD780BFE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 16:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707410276; cv=none; b=eomn/1DT6COsHgRk/cHLk1uvkYb9Uf1uNXV+bMlYlnjCTHFOv3YAUlN1yj0R5gmd8aBqLuYqNkp9wTw1JJLI1UA5jj/SQ5QocLabLCbFYZ537k+DKi0NJtetJW2bK4D02dWL/wVcTxZlxmBPBU/tv0ZcvNBuvjpsoxNwxwHEKvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707410276; c=relaxed/simple;
	bh=9AhBcoK1JVAWZUeiN9B5A52ztsi+Qag9lJngEhXPSUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0AEw/+2+5s991TPdeqtaFi6ty1l3FOU2rMe+XvG6rzWzmeFlNznB26kVU+jID/ctbBJszJKGKzXs3VgUYvUOmMrhF8PfB3+fjn/pW3baIxp8H040GX1eL8J24LUjFpLkPrIlX949/ahqIiAF7QQaCjn/INBMOOAt0+Mehnaq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTMJCP/Z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTMJCP/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707410273; x=1738946273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9AhBcoK1JVAWZUeiN9B5A52ztsi+Qag9lJngEhXPSUI=;
  b=QTMJCP/ZiITlLWOVkI6iSCJXPwiNM4Lpy4UEqmIUlmRzymJCQuagkeS4
   MkOCmUQVaaNnXBgIiM9FXasJs6sKV5tsqyC30pJ4KlfRmRhKbTtUWEZAb
   4/U6DHK3lr8C+63mB5DDrlHE+0W5y3puzrliQcz3rlBHrh156OR+M/sPu
   fz8Cfgy7zq+XS+am32B/QuA9Pc16rK9JcHBY1wFsQyEQfQJMYd5eOKsqt
   kC5Vw3nIqQSRNCQ4OXzlUi0s4trhwnh77zZ97Crn3sk4gxuPx0WN6QGzG
   BHO2csyKwmAg+XWtjNZabu4UqQWnsQsgQUwLMkvhAQKVh6tBZecpBeMH9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1163352"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1163352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 08:37:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1733129"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2024 08:37:50 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY7PH-0003w2-2T;
	Thu, 08 Feb 2024 16:37:47 +0000
Date: Fri, 9 Feb 2024 00:37:32 +0800
From: kernel test robot <lkp@intel.com>
To: Gaurav Batra <gbatra@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-next:pending-fixes 171/335]
 pci_dlpar.c:(.text.init_phb_dynamic+0xb8): undefined reference to
 `ppc_iommu_register_device'
Message-ID: <202402090048.C5SCPaWB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   cdf641895851e4edf648a3d063e90f8f5a07e77f
commit: ed8b94f6e0acd652ce69bd69d678a0c769172df8 [171/335] powerpc/pseries/iommu: Fix iommu initialisation during DLPAR add
config: powerpc64-randconfig-003-20231123 (https://download.01.org/0day-ci/archive/20240209/202402090048.C5SCPaWB-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402090048.C5SCPaWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402090048.C5SCPaWB-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `ppc_iommu_register_device'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: arch/powerpc/platforms/pseries/pci_dlpar.o: in function `init_phb_dynamic':
>> pci_dlpar.c:(.text.init_phb_dynamic+0xb8): undefined reference to `ppc_iommu_register_device'
   powerpc64-linux-ld: arch/powerpc/platforms/pseries/pci_dlpar.o: in function `remove_phb_dynamic':
>> pci_dlpar.c:(.text.remove_phb_dynamic+0xac): undefined reference to `ppc_iommu_unregister_device'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
