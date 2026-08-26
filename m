Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8D3B7760
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787777252; cv=none; b=XMfeY0vaY9L81UuPD5x4j+v/pG56A7d2G8MSX/zYSxz3Yf0YwkLdkcNBt1dKMeOOkY3PBvjioI1ro6JYOxDyQBcyR64TFGXiDgz3bPmGC/h8A4JyTxuPB1fQEvnh2KxFHs0234ZR/BkeuTqQvBkWOBuJD2MmWPLq7ssbd4mRJPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787777252; c=relaxed/simple;
	bh=GfFOyiEaSCPadUpdXhKvCE69WqklgSFIZtplxHdc/Q8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a4Ood5jj33EZYDDiT59KO4cWyRo1do5tGSm3efZ/GL58tFuaxMSbzJhMXGrdTGq5zBTjvFGkEoF6VK5R+V6A9r136lxeP1AF+1jQ5CuDWxaqYwHqNI5AaJ8ncnKVY/CfELfS1GtbbS44XTge8ITUbrGtugM64kCyoqZUFxGJ4fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQS6c4eD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQS6c4eD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787777251; x=1819313251;
  h=date:from:to:cc:subject:message-id;
  bh=GfFOyiEaSCPadUpdXhKvCE69WqklgSFIZtplxHdc/Q8=;
  b=bQS6c4eDL+6IPpnSWSjFgE3sJ9nBfMcwGe5L+OatwTq/LPlQbetxbD+Y
   jKcU6GH/UYwWUZm3SoNqg+NspN+12I32NP6yfsANZQ+AWRn19F3yNMSGM
   icCV0ha3XL8U3kfzf2Z3QUIscRZNfYNVooYx9m1maVH+U5uBuuM+zcnOn
   6CSmZiFmgPKdbu41PnTHA/okAYqMKuN/cBmWAjtcFgAYp2PaQVwq8GMs4
   d7LrLF0dBZeSdxWyfTlYV4ko3uoGWJr3Y2hHaBHfYmywPXP7VrBDBVmEo
   18yeNF8vv3SrI880MIZNTOOxechEm/eowAVuCOGOpm3qPWBg42pBdE9WO
   A==;
X-CSE-ConnectionGUID: 90TN31ieRzSglf2Z1MyYhw==
X-CSE-MsgGUID: 6niHdBN/S3ago+kMBp9WXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="91950799"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="91950799"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 13:47:30 -0700
X-CSE-ConnectionGUID: X9cC6tknRd+ALO6HRxqeVA==
X-CSE-MsgGUID: LVl1vp2RSB6dRMDN1y7Ciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="272916415"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Aug 2026 13:47:28 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzKWr-000000000Zt-45Zh;
	Wed, 26 Aug 2026 20:47:25 +0000
Date: Wed, 26 Aug 2026 22:47:13 +0200
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SERIAL_OF_PLATFORM when selected by ECONET
Message-ID: <202608262221.CZIny8DH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   502d45774af09f1c681c754c4b7cdfb5d7f72fd9
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   1 year, 3 months ago
config: mips-kismet-CONFIG_SERIAL_OF_PLATFORM-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20260826/202608262221.CZIny8DH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608262221.CZIny8DH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35fb26f94dfa ("mips: Add EcoNet MIPS platform support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608262221.CZIny8DH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
