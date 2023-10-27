Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D63FE5C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TB5cCNNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698444421; x=1729980421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M3TKMmesEsHXhFf0rPsbz+ry91Zer0RoBEvG/eMU538=;
  b=TB5cCNNPYDNPwauZrfePIHHzIQo1o6Iyqhz6FtGmjQStCze1msdSkyGN
   e5ZkC85mg0mwHhrcyd9VHWITYi9vBsmiaXiys02AfMtozk9X30qNoxv3V
   z+h8TlM9JMhSVJk7JysxTj9lD+sUyKqCuIwZtCMSYj8Joc8VOGuEpxO+s
   QB4LmCshN/W6dgW3p28jtip1C58hNyypBf1JdMfVCz8hKDd7y8mWAcc0G
   CL9uCqW078PLxKx7opnsZ4DGkGTh6NFnQxJ4yjdDkZEnH4ZMXh9LEqfRl
   b0mptPzrfvSf34QtTHXNHRuhHqm47eszXgR9Xy+tfSzN+M/DsVeArPrPJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="418965485"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="418965485"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 15:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="7345254"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Oct 2023 15:05:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwUym-000BEB-14;
	Fri, 27 Oct 2023 22:06:56 +0000
Date: Sat, 28 Oct 2023 06:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: pmem.c:undefined reference to `noncoherent_cache_ops'
Message-ID: <202310280552.Yiukmvy2-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   888cf78c29e223fd808682f477c18cf8f61ad995
commit: fd962781270e6452dd5b30c8aa0b3b0fbee06244 riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
date:   2 days ago
config: riscv-randconfig-001-20231028 (https://download.01.org/0day-ci/archive/20231028/202310280552.Yiukmvy2-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280552.Yiukmvy2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280552.Yiukmvy2-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/mm/pmem.o: in function `arch_wb_cache_pmem':
>> pmem.c:(.text+0x0): undefined reference to `noncoherent_cache_ops'
   riscv64-linux-ld: arch/riscv/mm/pmem.o: in function `arch_invalidate_pmem':
   pmem.c:(.text+0x9c): undefined reference to `noncoherent_cache_ops'
   riscv64-linux-ld: drivers/cache/ax45mp_cache.o: in function `.L8':
>> ax45mp_cache.c:(.init.text+0x104): undefined reference to `riscv_noncoherent_register_cache_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
