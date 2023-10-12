Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743A405E3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHcgpj4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697149834; x=1728685834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=64fPfIBHHZe01c5/xq2nBP251D2kcsLLAxbsbVRSFBM=;
  b=BHcgpj4breTbX5WCXDNxkrEO08AHsGxhLMKvKMyvlR13UxQrfzXtPWgX
   Ny95RfJaVH8amu/EPrDk7z1/AAWNc6Hyv+e8kjZ1foATkSyM+DWiQaCt7
   f48LRCuKy1Kxfi8RAH0EbAzryVoMH0x/AG/bmmhNImjx9MY7KpW9snq4o
   1jSnzO50EgqIhGn1ge3N7Aw41T9nT6/Mhl6XwyxRo+8oCav/xVW6lW9KQ
   JY4Qo0JFZnaNU6cnk0LfGqjuUu3jMXPMhGQxN9OIlVCbzG8TVFo6SYA3E
   crkoP+zueWLf24SkHVMa2ETaDkLz4F9DoKqTN+tz7gsfpequsaxXwh9AL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="387906473"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="387906473"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 15:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="789595079"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="789595079"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Oct 2023 15:30:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr4CL-0003xU-35;
	Thu, 12 Oct 2023 22:30:29 +0000
Date: Fri, 13 Oct 2023 06:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-coherent-deps 2/13]
 drivers/cache/ax45mp_cache.c:14:10: fatal error: asm/dma-noncoherent.h: No
 such file or directory
Message-ID: <202310130639.Ys1gH7dV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.infradead.org/users/hch/misc.git dma-coherent-deps
head:   7f9c22ed4dd0f13a1a4e66779cf5affb54a8119f
commit: c11dff3cdd0baa0c7801106b0ec477ccea3b16a4 [2/13] riscv: RISCV_NONSTANDARD_CACHE_OPS must not depend on RISCV_DMA_NONCOHERENT
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231013/202310130639.Ys1gH7dV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130639.Ys1gH7dV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130639.Ys1gH7dV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cache/ax45mp_cache.c:14:10: fatal error: asm/dma-noncoherent.h: No such file or directory
      14 | #include <asm/dma-noncoherent.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 drivers/cache/ax45mp_cache.c

d34599bcd2e4e9 Lad Prabhakar 2023-08-18  13  
d34599bcd2e4e9 Lad Prabhakar 2023-08-18 @14  #include <asm/dma-noncoherent.h>
d34599bcd2e4e9 Lad Prabhakar 2023-08-18  15  

:::::: The code at line 14 was first introduced by commit
:::::: d34599bcd2e4e93a28d5904bf94bc7dafc511f04 cache: Add L2 cache management for Andes AX45MP RISC-V core

:::::: TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
