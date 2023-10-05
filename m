Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79523B7A7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 18:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cCDGhF/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696529941; x=1728065941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Q2U1Q1K9w3CpYObbCp/2TzthAKNy9VftNx+ibS5n2U=;
  b=cCDGhF/oiyfD81gSSmukNW7bzGQR8UsbwG/4/8pwvB23jrCId+gOpjsD
   ogY58B4tLpYMGounnfHWKrLIdLPcLPb4pa6dPhRiWaOYwVgvq7NM18wx2
   vp7FuE59K6DBAaGxhTZi1YEpT6TMIIF1jWuRmubUlNbhDKxNU+YuFVxpU
   g4miewUiwHEJL6PTM3kCSnjbYsZfS16rYh2UAE8e9Ws06fSM282TihEah
   bMPJs4Y828gj0dk0tj/hHpXgIHJWT17c8fb8RHX94COKIH33qBILiEMas
   FP9U7z+w44OFJIm+oxLH5Yrq4YWHcMi5xh9mhVkQlaX5E0NOnR8joBxRg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="382449454"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="382449454"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 11:19:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="751859033"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="751859033"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Oct 2023 11:18:59 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoSw5-000LmB-0H;
	Thu, 05 Oct 2023 18:18:57 +0000
Date: Fri, 6 Oct 2023 02:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mbroz:opal-test 5/7] usual-tables.c:(.text+0x0): multiple
 definition of `usb_stor_di2flags';
 drivers/usb/storage/uas.o:uas.c:(.text+0x210e): first defined here
Message-ID: <202310060240.8h6JpFxx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git opal-test
head:   8935a9b47f30e9af5eab5bc129f7b608da795ba9
commit: 369143dbdedc7e16ddbeecfe95ad6579d805e8a2 [5/7] usb-storage,uas: use host helper to generate driver info
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231006/202310060240.8h6JpFxx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060240.8h6JpFxx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060240.8h6JpFxx-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/usb/storage/usual-tables.o: in function `usb_stor_di2flags':
>> usual-tables.c:(.text+0x0): multiple definition of `usb_stor_di2flags'; drivers/usb/storage/uas.o:uas.c:(.text+0x210e): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
