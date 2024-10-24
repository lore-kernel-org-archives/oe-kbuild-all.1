Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA9F209F58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729778922; cv=none; b=Y9kc2cNfAvTSZrklb3B/FkWKylQUp/Jl8Kl7Eo/penKpZQvIW+sNJeOk7Mm1na3M1kfyvCv7scO8N+W3xnl3R4bwCYZL61MGJgPvdvaySChXFHQnn8s7pvogkMebjmyKT0kzWMp80qw8V3q/OanxwI6k7+Sde+czYdpXXtKCFhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729778922; c=relaxed/simple;
	bh=wNitABm0rkoGvdt7+ODAdHF3fgFjA3IYwt+cRyIbPCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=deatUpA6PubW38C5G4vucwz7ibgQ0riFKw3EKX+Atq6lphigxR+W3eKo1IFiuDWgFB6xJEg8qDKV3Lv/75yu8ncXVVul9lfv7LyfqoAbvfkewUTjVfK/id5EtjfYmzjZ483fLCbSbRC2eMP2UPQoVIMpuWteqBpOiWc6jlXKh3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CmvKwOjo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CmvKwOjo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729778920; x=1761314920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wNitABm0rkoGvdt7+ODAdHF3fgFjA3IYwt+cRyIbPCo=;
  b=CmvKwOjoIRdWAt+bAkOm1lCWcGgc40DTo8E4vIklWxkmytrNk4FnCxqG
   tJ21rzrQ1qWYJeM38uiGt00dE4Ttf6zdzG4u4jgQcdUdwFOmnMY2kboZE
   sLNvbYhibmwmfkuIxviGOXNR3pWAEhQC5Azok6Jfz2UcNldV40ffPrc59
   VNHvYl7Thv5D6ShMVn4ySZITIH7HscckU8LLy0yRr9cw/Rt7KiCE1CHCL
   0/eSdnsxjsPYVH+DVOtD2BSH6tTBB3Qe2zFkmRzuZ/a9kDQzBsqz5RqpP
   nIgE5j/pDvxrWW7mh70pmlR5waIl4Ol3I6dA4XVw2r+LEYk9Swk4cMjoI
   Q==;
X-CSE-ConnectionGUID: wiZB13cMSWmIHm/DSt58pA==
X-CSE-MsgGUID: aIQsZp6XTVKGvsYwn6bQjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28846048"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="28846048"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 07:07:58 -0700
X-CSE-ConnectionGUID: vKOMVEZiS56TJaMrvLY/Ig==
X-CSE-MsgGUID: 1gcLUuAwRPWUXzwl1x30/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85389472"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Oct 2024 07:07:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3yVG-000WVL-19;
	Thu, 24 Oct 2024 14:07:54 +0000
Date: Thu, 24 Oct 2024 22:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:pci-dma-mapping.h 1/1] drivers/edac/synopsys_edac.c:781:9:
 error: implicit declaration of function 'si_meminfo'
Message-ID: <202410242207.lBNgPEUG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git pci-dma-mapping.h
head:   c92fb06444ccb3624f7cd99ada7e2302d083091f
commit: c92fb06444ccb3624f7cd99ada7e2302d083091f [1/1] pci.h: don't include dma-mapping.h
config: arm-randconfig-001-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242207.lBNgPEUG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242207.lBNgPEUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242207.lBNgPEUG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/edac/synopsys_edac.c: In function 'get_memsize':
>> drivers/edac/synopsys_edac.c:781:9: error: implicit declaration of function 'si_meminfo' [-Wimplicit-function-declaration]
     781 |         si_meminfo(&inf);
         |         ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/si_meminfo +781 drivers/edac/synopsys_edac.c

ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  771  
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  772  /**
225af74d6312b2 Manish Narani             2018-10-04  773   * get_memsize - Read the size of the attached memory device.
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  774   *
225af74d6312b2 Manish Narani             2018-10-04  775   * Return: the memory size in bytes.
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  776   */
bb894bc46ed03b Manish Narani             2018-10-04  777  static u32 get_memsize(void)
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  778  {
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  779  	struct sysinfo inf;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  780  
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06 @781  	si_meminfo(&inf);
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  782  
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  783  	return inf.totalram * inf.mem_unit;
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  784  }
ae9b56e3996dad Punnaiah Choudary Kalluri 2015-01-06  785  

:::::: The code at line 781 was first introduced by commit
:::::: ae9b56e3996dadbb59c727018f45486c06844261 EDAC, synps: Add EDAC support for zynq ddr ecc controller

:::::: TO: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
