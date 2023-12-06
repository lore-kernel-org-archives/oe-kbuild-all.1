Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EAE107A6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEe+GWpx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701842370; x=1733378370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+MQs59+JQdwKtPdcd2S/Jn9gZj4hRL1B+32HGc5WVY=;
  b=CEe+GWpxtsOF07wxyybBjJo5cIH+ea62ylDPTce4oxFtrBg7OAzOgsMj
   irU0ZjA/7P8Ele9AmZD1RaOP+SeNXIgN+1Ohz2oZGVmqXGzwQjKIIw9fo
   RS5WqNvAZtNO5q0UVaTlA1DO87aNbWrExXzQZlKHVZrFareNUeCw/EVLk
   oftfMo0XgDI+TGake5l7KQEwVE8akQNjo1wlcLY75elnI8A0SdA8XET5n
   4ihyE4MlmwtzpPSewoQRfDykG78WLO8g3R54w+zDcUQdDfYYhJhgiQvDr
   gro3/K1AEVAy8crpQVvGSE06J5AA8bKYLh7CazB+JXikTcgxwvOdJuskm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="384413927"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="384413927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 21:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="19221093"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 21:59:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAkwQ-000ALh-18;
	Wed, 06 Dec 2023 05:59:26 +0000
Date: Wed, 6 Dec 2023 13:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 3672/4419] /tmp/cco4BMDv.s:387: Error: selected
 processor does not support requested special purpose register -- `mrs
 r1,cpsr'
Message-ID: <202312061337.WNVSk0AL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   577a4ee0b96fb043c9cf4a533c550ff587e526cf
commit: 16ebda3b629b084cc40b09ad5fa36d99966a1e9a [3672/4419] kexec: drop dependency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
config: arm-randconfig-r016-20220626 (https://download.01.org/0day-ci/archive/20231206/202312061337.WNVSk0AL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061337.WNVSk0AL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061337.WNVSk0AL-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/cco4BMDv.s: Assembler messages:
>> /tmp/cco4BMDv.s:387: Error: selected processor does not support requested special purpose register -- `mrs r1,cpsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
