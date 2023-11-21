Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAAB51C39
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PU8PHR4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700583912; x=1732119912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L9snDENl6Ku35vVsrKoshsx/cygBW4RDkKP7KeUhH8g=;
  b=PU8PHR4MkoeidXUab9W7Qvrl41wBvGRbP/0fe0WqbaMGIaKBqS4Rh5Wn
   WM9VFuZy3XneDAobu4sznhuw8W6vfyMe4B32z2NUueDUt90g55TMimKaU
   ShgZOCksX24NXjXQhpFAS/DtLK0RGLVHhZzMY10ajHA22Jj6vhAps83Fo
   UjxkleI1IfYxJfc8qVGiReWsHeHlNwNPIQhHohbiPJb1t0P4247YbI6nu
   c5vG6jBGdycgEOHFNLwqjSFLgHybtTsEfauzJGwUjuIeF5ZmGbVBX/YXk
   P1eRriyh7KYauy55yLtmYBlfWoeMA10sl/rNTgla9x3xs/DcwTZ830BwC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="389023643"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="389023643"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 08:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="14951671"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 21 Nov 2023 08:25:07 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5TYf-00081Q-1q;
	Tue, 21 Nov 2023 16:25:05 +0000
Date: Wed, 22 Nov 2023 00:24:26 +0800
From: kernel test robot <lkp@intel.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Bart Van Assche <bart.vanassche@sandisk.com>
Subject: drivers/md/dm-zoned-reclaim.c:1: warning: no structured comments
 found
Message-ID: <202311220042.vAKxDlUW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: 3b1a94c88b798d4f3bd1a5b61f5c8fb9d987c242 dm zoned: drive-managed zoned block device target
date:   6 years ago
config: i386-randconfig-011-20231120 (https://download.01.org/0day-ci/archive/20231122/202311220042.vAKxDlUW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220042.vAKxDlUW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220042.vAKxDlUW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-zoned-reclaim.c:1: warning: no structured comments found
--
   arch/x86/include/asm/bitops.h: Assembler messages:
   arch/x86/include/asm/bitops.h:224: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   arch/x86/include/asm/bitops.h:224: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   arch/x86/include/asm/bitops.h:224: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   arch/x86/include/asm/bitops.h:224: Warning: no instruction mnemonic suffix given and no register operands; using default for `bts'
   arch/x86/include/asm/bitops.h:270: Warning: no instruction mnemonic suffix given and no register operands; using default for `btr'
>> drivers/md/dm-zoned-metadata.c:1: warning: no structured comments found
--
>> drivers/md/dm-zoned-target.c:1: warning: no structured comments found


vim +1 drivers/md/dm-zoned-reclaim.c

   > 1	/*
     2	 * Copyright (C) 2017 Western Digital Corporation or its affiliates.
     3	 *
     4	 * This file is released under the GPL.
     5	 */
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
