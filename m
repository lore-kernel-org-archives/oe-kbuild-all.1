Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FF42EB10
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747011306; cv=none; b=lvpohwWZvXzq3uT7pLi5qM/dr7ADxR2LRtVb35VwH5i9oTjUiJAfqS4D4MCUBBbbQqvjtzYbUy15eZopd5j4SOoeYbum8SyBRWfC1zpU8ZTp+iobi7ZPSdLQLbYf20GMwBGLIaENkLnDtbilua2YXz7ArfPYadBFpFqlh4xVUes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747011306; c=relaxed/simple;
	bh=yQ0oCgOE3Dm5ka7Kx2Ns7S7D+qbr/clFtJ5iA71kvi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZgMIU8eEDpx9p1MpSFIatXm76LO9GHef2PR1P/CgVaT7SUoLR87N8TRoWAnX97m0BsjfZ/Jyo7zJzqL11knv6cGbnauGh+6S0P+q26tPvZPdaJzxn2y9q9WNSYug2Svv/uf2rqzUuPTvGk3cbynj5DsmDblJpjQaGpV4py/KEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZP0i36P; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZP0i36P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747011305; x=1778547305;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yQ0oCgOE3Dm5ka7Kx2Ns7S7D+qbr/clFtJ5iA71kvi4=;
  b=TZP0i36PCRYFOCVm9VSPIdeixZRUKbLtUsfy5wigF25gDoQNC7U1Vh5G
   kmoaPK60wkkst4gbGoiculQB+Ma7Qz4tLmThGT+t6Xvticb7tUzqCBJcZ
   M3MntcT3yM7o1Z4kHCja7eAYlpr3/aJRCneDoD+wJ/A6Y1b93emrG1BXn
   0vxwz+VwyuNLCtTYr0u/zv49xFtk/5168qswqFmTGsxvwLbadqQCHu9k/
   kBD0oRnqgre8ToS6pCI7EqH34CAmQQ4ZmYBtKwiq/Dw/a7oF+LX0Y99lb
   oH55LgBlrFu2zs+RofkMUgeCHrqRtprc821AXH0LNoSaZNBrh4+b2KQy1
   w==;
X-CSE-ConnectionGUID: ciU8NNa7RYiHjtqiFZR8Pg==
X-CSE-MsgGUID: p2tNFCIzSealxTm5diIASg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="47907969"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="47907969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 17:55:04 -0700
X-CSE-ConnectionGUID: 4KbfH5tsTvSPdsqUzf7mdA==
X-CSE-MsgGUID: 84sLgkYaSXOUqPaaABKqwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="160470582"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 May 2025 17:55:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEHRa-000E5f-1e;
	Mon, 12 May 2025 00:54:58 +0000
Date: Mon, 12 May 2025 08:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/msi-parent-arm64 5/11]
 drivers/irqchip/irq-bcm2712-mip.c:14:10: fatal error: irq-msi-lib.h: No such
 file or directory
Message-ID: <202505120801.EulKUbgx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Marc,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/msi-parent-arm64
head:   ad9406b84a59ce51931ed2a57adca122498a1aff
commit: 10ecc3941341b39efc3ce403206045d873c3f978 [5/11] irqchip: Make irq-msi-lib.h globally available
config: arm-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505120801.EulKUbgx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505120801.EulKUbgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505120801.EulKUbgx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-bcm2712-mip.c:14:10: fatal error: irq-msi-lib.h: No such file or directory
    #include "irq-msi-lib.h"
             ^~~~~~~~~~~~~~~
   compilation terminated.


vim +14 drivers/irqchip/irq-bcm2712-mip.c

32c6c054661a9b Stanimir Varbanov 2025-02-24  13  
32c6c054661a9b Stanimir Varbanov 2025-02-24 @14  #include "irq-msi-lib.h"
32c6c054661a9b Stanimir Varbanov 2025-02-24  15  

:::::: The code at line 14 was first introduced by commit
:::::: 32c6c054661a9b454837e3df409e9bd8fe9ba5f9 irqchip: Add Broadcom BCM2712 MSI-X interrupt controller

:::::: TO: Stanimir Varbanov <svarbanov@suse.de>
:::::: CC: Krzysztof Wilczyński <kwilczynski@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
