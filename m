Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6EC2E3367
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741134055; cv=none; b=WK0ZcMawiRV6CKekSrPzGzYOno8TlaS2biqNyPtYnuOqzz8mQkP6/7WA05WVirJ4TKL6cB+/yRiBFgS3Q7PMPmrdXulmKrYXNubLcYgXdeiyxElWhfs+ddNFXd15l276Hqi9JBzSIfvAFxYmH/ZB6OYXJ0FxRILiJ/XDRvkfLoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741134055; c=relaxed/simple;
	bh=sT6FDIeV241JcTpOMWT49zgS15LgILChYVg2LlCMGxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BAUQCi4FhbgawQ0AH4G+1X5hFKob8sYWzcUDpS0dopaAbHxyICd+iKHhjAeCJc0JgXpJPLY360pJlkuQQKyBNv3OhPRlr2ADSviy2WyKu/DuRlkh0FJ7KqIQ19ZajYlhaAHq9FwQAD7hWWaNCKTtSsueP2eVVT1RcSYBjhubmPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0YURAEy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0YURAEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741134054; x=1772670054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sT6FDIeV241JcTpOMWT49zgS15LgILChYVg2LlCMGxE=;
  b=c0YURAEy6qG/WLerwgKZdsGo6q7MeCTerARb7U/M0Ei9y8WQpy44ltX4
   hpBwff3q6h1GIFRnXZ5dzHfrxpoNV9oRpojOkDKy27+wnaZaxdRzBebd8
   d5wP4fI1GzR43Vnr4C+p9PfgyfRYxm3XSc0KLckToiSGOJGvbAH+hL1WY
   t5z4GVNjbM7gtU7i2m24lwiKIdiiXEoqT8obbjJYj0tyL5lwlOVi3aSBZ
   6fm8aP7Xi0X6UzzC7kFYkp1iQftSyMeh3qbZ/NZK583bVZRpjysutBoA/
   PO2k2Al41sqvDRhmrhYxulYPlT5XYjdpolJ389rle4nGSR9KrQeuMTqNT
   Q==;
X-CSE-ConnectionGUID: zv05ltiPRJGs5YVPwSJHXA==
X-CSE-MsgGUID: Fu031SpcS3GSZQAn1qkGjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41792273"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="41792273"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 16:20:54 -0800
X-CSE-ConnectionGUID: W2n9pq0ITDqqi316SHiJFg==
X-CSE-MsgGUID: 2DKFc0wvRRqczYfV6EDU7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="123537950"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Mar 2025 16:20:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpcVG-000KPO-0x;
	Wed, 05 Mar 2025 00:20:50 +0000
Date: Wed, 5 Mar 2025 08:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mem_init/v1 9/13] ERROR: modpost: "high_memory"
 [drivers/mtd/nand/raw/nand.ko] undefined!
Message-ID: <202503050809.7YhuKgSd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mem_init/v1
head:   af1481aba4b337d7a9cab9c826c42360853b715f
commit: f7f68ae7847684c3b445546a4aa57be44ed564c1 [9/13] dev: arch, mm: set max_mapnr when allocating memory map
config: arm-randconfig-003-20250305 (https://download.01.org/0day-ci/archive/20250305/202503050809.7YhuKgSd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050809.7YhuKgSd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050809.7YhuKgSd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: 'mem_map' exported twice. Previous export was in vmlinux
>> ERROR: modpost: "high_memory" [drivers/mtd/nand/raw/nand.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
