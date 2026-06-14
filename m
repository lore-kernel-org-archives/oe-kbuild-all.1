Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3531E28E0F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 04:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781411553; cv=none; b=Z2ZlImt2sD7zjUJBO6uRyiyrRkPH5wsWZqKxVQpylVRw2y2tOH3O57RaFDFlXz5QvP+iM58R46S0wd718GBcn6Ki1YedQpae378tbECGloHHNoqks1R0GOvCnT7e4GopXMlHw+C/6/TRByv1VmNMbICMBUew5XzHkzsuCf2Y77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781411553; c=relaxed/simple;
	bh=mcAUpQPzV89gY8Em0RjRj9LGRVt4Uu77gUkO07OzNcA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AUsGAb0T24rHN7ejcXxlob3+Y9bbKnTfM81zUXe9HZqdIAmPpu+ysbrc0AB+OzNuq0EK6XsvLOLNZz+CHr30Zpflhin04usTUSPgvPwNy609kY9I6usUuS7TW1ztu8BTvhwFgWCloYyj9rP+Y+whMZ2dtAON5qwbMEwwea5jsYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N9mLjom6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N9mLjom6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781411551; x=1812947551;
  h=date:from:to:cc:subject:message-id;
  bh=mcAUpQPzV89gY8Em0RjRj9LGRVt4Uu77gUkO07OzNcA=;
  b=N9mLjom63r1Yl7lnSVsqKE1mZzl7A/FShRTKiGTHQFPgwK14k6E1rd/g
   CJiLIpQi3e1hNfH+i2V1xWPtn+NK0W/8zhO5QADWgNKjqDn7zT8rqY61y
   QabiTFrv2nQZx5Zg2k9UE9jhTmJbDhYoamGIO8woh/yYjIQ+5va/2m8L5
   Y6xhLzbdqueieysDn1YEVPJ4qG+CkD5O922l0qPOpynGCxJWi9rRCRula
   iLuSVZ4fSplma4n+oMBuLK18Wxaz6ye+xbErKBUwk1WRRp3tAnUum8Y0t
   6xHdxKruNhZ1tKnNwIbicOY8CIo9JMDo5R+lWbk/gLGfq60b6hiUppkdh
   A==;
X-CSE-ConnectionGUID: 1hoY9yodSIi9uFn6Ib5OOA==
X-CSE-MsgGUID: SzbnyBqJTdWmr75Kqsu6Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="93681837"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="93681837"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 21:32:31 -0700
X-CSE-ConnectionGUID: j79822ffSSmGUnXYNkUdXw==
X-CSE-MsgGUID: 2ap/MrKtSseyjQGSUCASqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="246061958"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2026 21:32:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYcWI-00000000QYI-1yWM;
	Sun, 14 Jun 2026 04:32:26 +0000
Date: Sun, 14 Jun 2026 12:31:43 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Law <objecting@objecting.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: include/linux/decompress/mm.h:(.text.get_bits+0x5c):
 undefined reference to `__ashldi3'
Message-ID: <202606141256.AcV2LO0U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b07ea76fd28989bde5993532d7a943a6f90e246
commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib: decompress_bunzip2: fix 32-bit shift undefined behavior
date:   3 months ago
config: mips-randconfig-r052-20260614 (https://download.01.org/0day-ci/archive/20260614/202606141256.AcV2LO0U-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141256.AcV2LO0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift undefined behavior")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606141256.AcV2LO0U-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `get_bits':
>> include/linux/decompress/mm.h:(.text.get_bits+0x5c): undefined reference to `__ashldi3'
>> mips-linux-ld: include/linux/decompress/mm.h:(.text.get_bits+0xf0): undefined reference to `__ashldi3'
>> mips-linux-ld: arch/mips/boot/compressed/decompress.o:(.debug_addr+0x3a0): undefined reference to `__ashldi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
