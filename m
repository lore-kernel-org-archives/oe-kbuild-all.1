Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A527FE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 05:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705900724; cv=none; b=HS1tqWprFrWb7ZwkhudVqzx5QsR5pM6FkDQrgdp5ijCipd+/9+SJ0K4FWGvsRm3NqK4UUtqTpL0z14l/ydwRNiYMbGUiFRFo+U5Nyl1WjIieG2gQNAVsF2bRJHg5hILRd1dtbezHTI7FI0H51wTXlulrpBT4ghBuVo1fh5o2j5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705900724; c=relaxed/simple;
	bh=Cbt304ebHcuzxE+cyVElI6q5ali4e3gBIea8ugHdNFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uGBAPv0cEMjlI+SEC5m2jPwG+36XKI83mbxJjR4xp/MVYJalZjrk1Km5PuNDxFQEz0KsynUB6S0k3PlqyriI78ARHu5QPdOslkBJRr2hKQuDIkxsaUSkb+QMztk+h/d3TAVr3Eh7NoPIuCmz6CUfveYuyS/XkTHjbtJUyUxvubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhK/5TIZ; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhK/5TIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705900721; x=1737436721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cbt304ebHcuzxE+cyVElI6q5ali4e3gBIea8ugHdNFU=;
  b=IhK/5TIZ3bEGdfNT+RJ9itjv+mRAnc2VWEWpi4vPVABQ7Jsh9//077iF
   MMSxjNlckPrgg2yHnCiM6o168odSBBvWn+MjaY9PdZ8soybUPxteQAmxc
   WN903qBgkiMGkkuY1ZuY7HTwIHY07aE9XTtcw0hp2rQ8DiV8cBCQ2608u
   Ph2xxwZLTsyxPptlLmJRfp82bKF/nVboHGhkfKbE9jmkDWyPljyyW0Dlg
   b7+owwT5LY2trPjmeGuQtEW2yNNWKZalfAbq2iZTMBopiFDO0P/Og20zo
   dFLpufJ+GXTaep2SyCsYhGXFnufOLYg3hj8HnRodxQuGugmo82T/A82q8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="399983632"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="399983632"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 21:18:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1104957"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2024 21:18:39 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRmhg-0006Qu-34;
	Mon, 22 Jan 2024 05:18:36 +0000
Date: Mon, 22 Jan 2024 13:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:mlx5_wc 9/9] arch/arm64/include/asm/io.h:53:42: sparse:
 sparse: cast removes address space '__iomem' of expression
Message-ID: <202401221326.IsUVTLyV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux mlx5_wc
head:   292695cd6323ee6a41dd51c84b03f6fcadac91ea
commit: 292695cd6323ee6a41dd51c84b03f6fcadac91ea [9/9] arm/io: Use "Qo" constraints for writeb/w/l/q()
config: arm64-randconfig-r132-20240122 (https://download.01.org/0day-ci/archive/20240122/202401221326.IsUVTLyV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240122/202401221326.IsUVTLyV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401221326.IsUVTLyV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/smp_spin_table.c: note: in included file (through include/linux/io.h, include/linux/irq.h, include/asm-generic/hardirq.h, ...):
>> arch/arm64/include/asm/io.h:53:42: sparse: sparse: cast removes address space '__iomem' of expression
--
   arch/arm64/kernel/io.c: note: in included file (through include/linux/io.h):
>> arch/arm64/include/asm/io.h:53:42: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/arm64/include/asm/io.h:53:42: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/arm64/include/asm/io.h:53:42: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/arm64/include/asm/io.h:53:42: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/include/asm/io.h:45:42: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/include/asm/io.h:45:42: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/include/asm/io.h:45:42: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/include/asm/io.h:45:42: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/include/asm/io.h:29:42: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/arm64/include/asm/io.h:53:42: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/include/asm/io.h:29:42: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/include/asm/io.h:29:42: sparse: sparse: cast removes address space '__iomem' of expression
>> arch/arm64/include/asm/io.h:53:42: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/include/asm/io.h:29:42: sparse: sparse: cast removes address space '__iomem' of expression
--
   arch/arm64/kernel/acpi_parking_protocol.c: note: in included file (through include/linux/io.h, include/acpi/acpi_io.h, include/linux/acpi.h):
>> arch/arm64/include/asm/io.h:53:42: sparse: sparse: cast removes address space '__iomem' of expression
   arch/arm64/include/asm/io.h:45:42: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +53 arch/arm64/include/asm/io.h

    47	
    48	#define __raw_writeq __raw_writeq
    49	static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
    50	{
    51		asm volatile("str %x0, %1"
    52			     :
  > 53			     : "rZ"(val), "Qo"(*(volatile u64 *)(addr)));
    54	}
    55	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
