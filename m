Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1CE3932FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164923; cv=none; b=cNe8hCpf88ULg4t5QUmJzJljdxU56UnBYBff0tmiNb1T+HmLzs3BaAg5Vj6oIOkhILOdQ06cAvhydriByyC1r6b+dJ9VrUeaGH5ec1fvwRK3IdJ00vhoM6oMnYozOTVR3kxaYKue3QsHHEybI00SIp6JHuVH3T0XPNAd1nujNzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164923; c=relaxed/simple;
	bh=+0YOhJeQDPwdRHgA2il6vBLiyWIjIPRgips9Ndd2ICs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PCGcPOmW7YJA8vrU/9GTfhwdMTl2+elEMPztgmgy67O0qPbI6HQbLspKpRpKePVMCcfF/gaDeoWtWDv6FU2gj8gsOM9PASmXPsry/AfVejQXTbsgUeKo9+FnKjulsaD7vdhrBvk6Iex9zpZfRr7D115AiHn+NVp+rDL/Yw/Tjc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARutQN8X; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARutQN8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792164922; x=1823700922;
  h=date:from:to:cc:subject:message-id;
  bh=+0YOhJeQDPwdRHgA2il6vBLiyWIjIPRgips9Ndd2ICs=;
  b=ARutQN8Xta/sQ4mFbz5UxYDf/xVAAwbpj2g23fE4H0YL6uI3G7phSNN7
   1h+vFbVUUPhgkKjHztfe9ecK0YYUOMpe6hMpE70amxN8EuqCB5H/t4BUJ
   NS/HlatgBe7kymcLqjINTnfdwfWh3GZLoJKSaaJJo9ZKbkXhM6CupqQ0Z
   2aqy+KF8Oxl01vcfHKnK2llPNZ2+VyEYOXBSLmkM13fcWxPV5SXH1b23U
   2LfngbnLej66h3ZW5NcD67+4/ihtYFrs4WRjGi/kCp7RCHa5wbyFvQg7c
   jHnxtqbgCymI/X/vBLVN/GNUcy/23C/NlWrt18PwHBUuh45Gw11IcywhT
   A==;
X-CSE-ConnectionGUID: Bi4culZYSqyYiy3yTdluew==
X-CSE-MsgGUID: Qg2BP9M/TL26sEl1oEkNDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="940575"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="940575"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 08:35:21 -0700
X-CSE-ConnectionGUID: L/bUDYSLRke2hJzyP0AlCw==
X-CSE-MsgGUID: rc59oiGZSc6dMj8sR7Cpug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2327352"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 16 Oct 2026 08:35:20 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHjxl-00000000CHX-4AVe;
	Fri, 16 Oct 2026 15:35:18 +0000
Date: Fri, 16 Oct 2026 17:34:22 +0200
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 14/19]
 drivers/pmdomain/apple/pmp-report.c:110:15: error: implicit declaration of
 function 'readq'; did you mean 'readl'?
Message-ID: <202610161712.ezLorEGq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   d6636aea14e70b5b997df5681ff9d254d9e75209
commit: 96151d95c16448107904d1e4855e34c206167336 [14/19] pmdomain: apple: Add PMP reporting interface
config: xtensa-allmodconfig (https://download.01.org/0day-ci/archive/20261016/202610161712.ezLorEGq-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161712.ezLorEGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161712.ezLorEGq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/apple/pmp-report.c: In function 'apple_pmp_report_set_state':
>> drivers/pmdomain/apple/pmp-report.c:110:15: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Wimplicit-function-declaration]
     110 |         val = readq(rep->base + rep->offsets->tgt_read);
         |               ^~~~~
         |               readl
   drivers/pmdomain/apple/pmp-report.c:114:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Wimplicit-function-declaration]
     114 |         writeq(val, rep->base + rep->offsets->tgt_write);
         |         ^~~~~~
         |         writel


vim +110 drivers/pmdomain/apple/pmp-report.c

    97	
    98	#define genpd_to_apple_pmp_report_entry(_genpd) \
    99		container_of(_genpd, struct apple_pmp_report_entry, genpd)
   100	
   101	static int apple_pmp_report_set_state(struct generic_pm_domain *genpd, bool enable)
   102	{
   103		struct apple_pmp_report_entry *ent = genpd_to_apple_pmp_report_entry(genpd);
   104		struct apple_pmp_report *rep = dev_get_drvdata(ent->dev->parent);
   105		u64 bit_val = 1 << ent->id;
   106		u64 val;
   107		unsigned long flags;
   108	
   109		spin_lock_irqsave(&rep->lock, flags);
 > 110		val = readq(rep->base + rep->offsets->tgt_read);
   111		val &= ~bit_val;
   112		if (enable)
   113			val |= bit_val;
   114		writeq(val, rep->base + rep->offsets->tgt_write);
   115		spin_unlock_irqrestore(&rep->lock, flags);
   116		val = readq(rep->base + rep->offsets->status);
   117		if ((val & PMP_REPORT_READY) == 0)
   118			return 0;
   119		return readq_poll_timeout_atomic(
   120			rep->base + rep->offsets->actual,
   121			val,
   122			!!(val & bit_val) == !!enable,
   123			100,
   124			50000);
   125	}
   126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
