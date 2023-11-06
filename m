Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5945B29410
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 16:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8lxYveZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699287990; x=1730823990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VnLUr2ELFffFPUSWPC7vxjhEJmwWLdvN09D3uZsgyys=;
  b=S8lxYveZK/5amQ/i5lRlAOQqd3xEEswdJ86SfWVI0YLMiGRugCfDQEDh
   KFmagf/g17Hc5alPPbW6AAk1irD6sjAytwfkx8ZHnIM0kDH6jFAQeX+LG
   Y9htmwJQ0H4vW3C8qgT/SsGMeJv504VByC8DzmhwpoYV73egV/rSB30sz
   dYo8rxUSzuWLl/tNaplL9LCORWQxTQSnbhzugtoe5fclCMSdjaIfcvEJU
   pUPUBrnxAc/S96fcGyrWMWMmnGgdos67giISLy8KRv5KMVkiubJMnYTDA
   OrtHACRqdv8NpQRW89PsfRs+M9+rTKzEIoUZuRADp7smZ92A+lpXTI4MA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="2229555"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="2229555"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 08:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791501059"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="791501059"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Nov 2023 08:26:26 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r02Qh-0006YD-2i;
	Mon, 06 Nov 2023 16:26:23 +0000
Date: Tue, 7 Nov 2023 00:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Greg Ungerer <gerg@linux-m68k.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 DMA_GLOBAL_POOL when selected by ARCH_R9A07G043
Message-ID: <202311070002.6ydT46IS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: da323d4640704001f2287f729124e1cd9d5684d0 dma-direct: add dependencies to CONFIG_DMA_GLOBAL_POOL
date:   2 weeks ago
config: riscv-kismet-CONFIG_DMA_GLOBAL_POOL-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20231107/202311070002.6ydT46IS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070002.6ydT46IS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070002.6ydT46IS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL when selected by ARCH_R9A07G043
   .config:5065:warning: symbol value 'ONFIG_ARCH_MMAP_RND_BITS_MI' invalid for ARCH_MMAP_RND_BITS
   .config:6176:warning: symbol value 'ONFIG_ARCH_MMAP_RND_COMPAT_BITS_MI' invalid for ARCH_MMAP_RND_COMPAT_BITS
   
   WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
     Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
