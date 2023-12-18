Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B631097B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ds3tktOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702888962; x=1734424962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sBxg0UKCVeuSqHeGwHH7h6rWM3HFa0ZKtMmH8h79/C4=;
  b=Ds3tktOFWcdc033CcB4jd9zZ3og+b7cbRHNu8qCB1MdR5VeCMHuwk57W
   jt73kujR1l6saAwRsFFZjiB0m+wmEOgSiRASq86WBsxLUYssyhs8zgCbk
   eUfKFzUO4CEsjmZz4UgfZ+iZNuHd5vUmxTgRm4aBqIyTU1yiuLlJlvOWV
   lw/gaiRAA9Gx2be+sWh4g7Vv4fc8ClJXQmXl63s7v4IfgJPZTzZDvFP88
   urTKI7xQim1/ylpohFMJ3bXfW8XOsfl1MidZ8FfOmDtB9fSMzd+Hbu7hr
   8Mk+ZtsutG57sxwjH/lG/tjw5UfcjbDQ9SqlWZD1MlttULtWgTBn16JWP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2679726"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2679726"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 00:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="919181507"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="919181507"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2023 00:42:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF9Cw-0003vY-1s;
	Mon, 18 Dec 2023 08:42:38 +0000
Date: Mon, 18 Dec 2023 16:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/m68k/sun3/sun3ints.c:33:13: sparse: sparse: cast truncates bits
 from constant value (ffffff7f becomes 7f)
Message-ID: <202312181649.u6k6hLIm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ceb6a6f023fd3e8b07761ed900352ef574010bcb
commit: 72e70a0e7ac7c422843eb8bbf192e820e9ccd24d m68k: sun3: Change led_pattern[] to unsigned char
date:   2 months ago
config: m68k-randconfig-r133-20231117 (https://download.01.org/0day-ci/archive/20231218/202312181649.u6k6hLIm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231218/202312181649.u6k6hLIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181649.u6k6hLIm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/m68k/sun3/sun3ints.c: note: in included file (through include/linux/mmzone.h, include/linux/topology.h, include/linux/irq.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
>> arch/m68k/sun3/sun3ints.c:33:13: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)

vim +33 arch/m68k/sun3/sun3ints.c

    31	
    32	static unsigned char led_pattern[8] = {
  > 33		(u8)~(0x80), (u8)~(0x01),
    34		(u8)~(0x40), (u8)~(0x02),
    35		(u8)~(0x20), (u8)~(0x04),
    36		(u8)~(0x10), (u8)~(0x08)
    37	};
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
