Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B095722A813
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 23:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768172724; cv=none; b=AndFeVoMmF9aXFKAS4UZwVOAfYPUGRbC3CtA4ddZVa3xdkxie2CAX7uYkOcVsaeyoDMD46KBVLWoVrBtwgEDD1t2nz8rH7LlRXbMSaTEbyfNGzKaoEJsZ5N3DTF3hAwHtmy4ujDMywoRrRQTG0k0oaQ8KzRo/1vExatycGteH3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768172724; c=relaxed/simple;
	bh=OegGzVz9ot02A84CavvNrASa+Kmg0ljhh9/rWBCA3xA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PXszZEqrXgj9YfWYEhy8w1eJeheA1aUL9nqS9cm1iXVo2L7IjlW/kKt2N+GlyiBTnxWKBduW+AkPt6vA8T9dmvY0gq2Hnr3kS46tCtEk4n/WhqIQcJ6pd7exAA9dNbFsj2DgLEVgzDsbdd2eSYfuGsgPvWBKTAb2ZeaQTFVxEDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9mJv10F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9mJv10F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768172723; x=1799708723;
  h=date:from:to:cc:subject:message-id;
  bh=OegGzVz9ot02A84CavvNrASa+Kmg0ljhh9/rWBCA3xA=;
  b=f9mJv10FtjFjx66rP5b+Qk1bOQdrAaxW7moZOb9JgCNO+JN27COilKAf
   sO0g0Jem1HRL7uKBL4ySxngPkUDY0VVaDK0twSPJmdkV6edzeD3kKQESO
   YhRzLv0nA8OkLbioUGYcbecFD0NANIeNHlMxY1YgkRpGJid2CRgFlDu9B
   UHPULYfsOQ1ZfhCkMK1gLHpr3tgBtamTSOVISqXB4S14anQ4LTJt4wz8p
   ts0bp02+PTTgK4kC7J+AU5jzJJSl05Ec9qQBRYXvaLZkZXqf9bnKdAhBP
   0u29R8iQYat2eIFMilSGurfRBJQ8ylB2EDxI3Nk0acHbP0jdw/kyyeDZ+
   Q==;
X-CSE-ConnectionGUID: QqtLA0+ITb6YEesV4IYxiw==
X-CSE-MsgGUID: gyYhj9TATWKHVa8gX3TN0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69381374"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69381374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 15:05:23 -0800
X-CSE-ConnectionGUID: R6RbaGGQQv2Anre9tmYrJg==
X-CSE-MsgGUID: 4j7WOn2KQbC/hWXLsQc69g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="227230715"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2026 15:05:20 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf4Uo-000000000Wf-0wwh;
	Sun, 11 Jan 2026 23:05:18 +0000
Date: Mon, 12 Jan 2026 00:04:27 +0100
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SERIAL_OF_PLATFORM when selected by ECONET
Message-ID: <202601120000.Jy4MoG5G-lkp@intel.com>
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
config: mips-kismet-CONFIG_SERIAL_OF_PLATFORM-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260112/202601120000.Jy4MoG5G-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120000.Jy4MoG5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120000.Jy4MoG5G-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
