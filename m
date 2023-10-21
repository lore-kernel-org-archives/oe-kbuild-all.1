Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61BFEC4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 19:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q61E17Vj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697917823; x=1729453823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hd31nxD9+EsMGs6nEbEJSqckMLCmNAolZYwadFJWUZs=;
  b=Q61E17Vje+pk5J4+mGFJii0A5TKA3oNEIjujHu2hc9b4L0YurFSJrYgw
   uXKElhaZMs/UaIstYvVmdvB1XD1/EBbrv0Q3EQkpDr8Ew/eDvpsc+gqxE
   t6kCmP1ksGLJ1UVfdma9Ds9GzcqUXDEMjGpWm6oxA1jELIjRkWGGUbBtH
   JOpNA4WCIYh3C2ksJyoopAt86ndJGR78UL3aVV80dVBp8xSdUXuDVe9r7
   52cgyqI0A35ezG7ne5IUjJNNfyB1XIB7CSze26O5+6Qb0KVdcTAih+GMA
   KbPymuYurdvxUG3xTWaXgsT+WOI1ClGyP2XaWn37B3A0IOXrWcSISQVch
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="385543085"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="385543085"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 12:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="5412209"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Oct 2023 12:49:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quHzH-0005Bq-29;
	Sat, 21 Oct 2023 19:50:19 +0000
Date: Sun, 22 Oct 2023 03:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-coherent-deps 10/11] direct.c:undefined reference to
 `arch_dma_alloc'
Message-ID: <202310220319.Kp7IGeTy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-coherent-deps
head:   ed3e0ff59152919cc61ce10c880eaa5b0ec240da
commit: f4f33d29215eed62055b00705eeb83250f9d273a [10/11] m68k: don't provide arch_dma_alloc for nommu/coldfire
config: m68k-stmark2_defconfig (https://download.01.org/0day-ci/archive/20231022/202310220319.Kp7IGeTy-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220319.Kp7IGeTy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220319.Kp7IGeTy-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: kernel/dma/direct.o: in function `dma_direct_alloc':
>> direct.c:(.text+0x52c): undefined reference to `arch_dma_alloc'
   m68k-linux-ld: kernel/dma/direct.o: in function `dma_direct_free':
>> direct.c:(.text+0x5d4): undefined reference to `arch_dma_free'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
