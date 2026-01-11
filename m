Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A325783C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 20:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768165167; cv=none; b=I1lJ2OZxIDO5jTrEMKQn69jhML2QqRCDESVqu1kOfIAApkh39F/4RRE+LMwKIUpu60+RQy3hWVcqxQBFNoJQGQcWFyIFi3j63U9FjVcYHKxxAD62GpGkzDUpMwaVXoNC92QGBOvkD4DkoaJ/hOexJ9i+oy29BiNuQ6osEMorjBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768165167; c=relaxed/simple;
	bh=LKeeuSvvazSnarp6ihP/ED1ff4PKWVhfDbqkQJ3MY64=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rjkIwVKZ61+nSpa8AFLLjRbSrTBEaH41IPidcHDpLFNijBlk/DqhoNG2mEV/SbdQS6FBMnmax9iQLwXyG53tyXslWY8koXE3l3KvDqIwPKQio7RUpuUqHlybm6EIZfP7Lrj6yWRywWnc8s/lMRpEm8YQm17etNl6XzmU7CxZRbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9yxuzN5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9yxuzN5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768165162; x=1799701162;
  h=date:from:to:cc:subject:message-id;
  bh=LKeeuSvvazSnarp6ihP/ED1ff4PKWVhfDbqkQJ3MY64=;
  b=E9yxuzN5P/4PCTCPhMu+nkKIFZaXus9G0odJiFDav9wY+ROPxGDR2Su9
   9Pw3vbRgAPuH3ZgGb+OlaGA/+plbpjc4SrcO3YupRMTnIpmeQOAAsYPF+
   sUZ3QMPdDI3wKTv0CXiCMKLU/9c6ZJ5w+/x4cyuV9cKr88QT9cu4WyP5a
   Sru1fgWENjRd7p3lnW0NKgO7dvNix3HsfHm2Pt/e2A4vXP0lEXxjXdp/6
   w9Yx3OoVAV2v0Q8m5aNADV8442NnljwEZGJXX9W5+3OjQXY/vRA5DzmUB
   pNeVCWa4Sy9U5awjeGukrVXkzpMSuaXFOosXVipSgQjuY9GniZ2xrqlI0
   A==;
X-CSE-ConnectionGUID: D6z2w0T3SdWABbTBPjHpaw==
X-CSE-MsgGUID: gwkYF+B+TcOsyhdvg62k5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69378608"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69378608"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 12:59:21 -0800
X-CSE-ConnectionGUID: NthwiKtGTDGQgDiwK0i9zg==
X-CSE-MsgGUID: kHUCOvcBRfGx3Pdi2qPrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="241460237"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2026 12:59:18 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf2Wq-000000000UB-2Syj;
	Sun, 11 Jan 2026 20:59:16 +0000
Date: Sun, 11 Jan 2026 21:58:26 +0100
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 EARLY_PRINTK_8250 when selected by ECONET
Message-ID: <202601112157.eE3mZlrA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   8 months ago
config: mips-kismet-CONFIG_EARLY_PRINTK_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260111/202601112157.eE3mZlrA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260111/202601112157.eE3mZlrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601112157.eE3mZlrA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
     Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=y] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
