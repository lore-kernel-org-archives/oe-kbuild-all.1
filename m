Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C378F77
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 18:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722970253; cv=none; b=Nz3VY4/g+LTtNdTJEGW4bnb/xpKvzEsIigw1FwWwNbGSTTtVu/3M1q4sf8bAx8NEW1RVRBP5s7PulwwN94BsCXqduUxij0VXC/cR677XCLRYsf3XEWx88/lTaFQcQZFnss9WwQIGMf9eV5j9pf2niw544H8lnkiQHrfedpMD+LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722970253; c=relaxed/simple;
	bh=KTLpks+JI2wCDCF6y2tbdAlUfT/PDf6O66GM1NrvUCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXcLEtQuZy6Ey9o8QGt9/Cz7ngg1hTJhtFsLf8rgI7UynOk2V3Rkk52bUF7xff1Ui53AW/jKGm8IYfV4wVxRi0MNvB8a+Tu6subDlHGOcE53SAdASBP3knY1NSKl3/U9PklF1TvInkGoP9QCIc1Kkray2PXgw86/YotB8B91mQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KJGyL0KK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJGyL0KK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722970251; x=1754506251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTLpks+JI2wCDCF6y2tbdAlUfT/PDf6O66GM1NrvUCc=;
  b=KJGyL0KK66H4TS0qefx1R8iw6AXaZ+g9d73i/vWKaC1BYxDskr3GHTVn
   Ef5hwU1k8Jp7DwbkxwuMvQL9QkoxBcN6iA9m8kBuhLQifmghel6WncYdM
   MLKR0UTxuwU4GFi/0BkI9mbLQLTYMpY5+N3skir+8a7SudklEGCXSPXo/
   aldCCq6nbHvOGaN0XJ79GkQvShov8TYs+RayR79/vqw4RDX/DDJiS9XD+
   Gg5h4IA163chPMfQq2nkHSlS9xa+GWi/YWtE68t78lbsg2jW9ZwVQ3L5I
   LgjTi63HuAK6Fvt6rBQ83R0gfjoc75mBMsyn6uOVxBKugphe3GwbQaYgM
   w==;
X-CSE-ConnectionGUID: l3Tcx3LpSJG4GjE+hyexIQ==
X-CSE-MsgGUID: H9huwLQkRj6BV0mUfJfPTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32414261"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="32414261"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 11:50:50 -0700
X-CSE-ConnectionGUID: 0Fyzvqd9SVSaKfOPQjfMXA==
X-CSE-MsgGUID: axI4WYuNRim3GivUpUEcqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56250143"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Aug 2024 11:50:49 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbPGh-0004ky-0W;
	Tue, 06 Aug 2024 18:50:47 +0000
Date: Wed, 7 Aug 2024 02:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3152/3348] arm-linux-gnueabi-ld:
 drivers/char/mem.c:62:undefined reference to `devmem_is_allowed'
Message-ID: <202408070254.SOSxrJDB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1e391b34f6aa043c7afa40a2103163a0ef06d179
commit: b2d1f5c72c630f7ded52898f5b655f1abcb57aa5 [3152/3348] lib: Move KUnit tests into tests/ subdirectory
config: arm-aspeed_g4_defconfig (https://download.01.org/0day-ci/archive/20240807/202408070254.SOSxrJDB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070254.SOSxrJDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070254.SOSxrJDB-lkp@intel.com/

Note: the linux-next/master HEAD 1e391b34f6aa043c7afa40a2103163a0ef06d179 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/char/mem.o: in function `page_is_allowed':
   drivers/char/mem.c:62:(.text+0x53c): undefined reference to `devmem_is_allowed'
>> arm-linux-gnueabi-ld: drivers/char/mem.c:62:(.text+0x6f8): undefined reference to `devmem_is_allowed'
   arm-linux-gnueabi-ld: drivers/char/mem.o: in function `range_is_allowed':
   drivers/char/mem.c:71:(.text+0xa90): undefined reference to `devmem_is_allowed'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
