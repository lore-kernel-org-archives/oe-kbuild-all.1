Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9D23A6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBxnE4Uj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697357734; x=1728893734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qCG+Lbo3MEeETKhXYl/afIVu5g2+sxRTFwzv3VbdIos=;
  b=XBxnE4Uj8BLuUSFStocEm0ImXpkkpvf6nU+kwgMQ7QTBZYKJQewTUKqD
   bx0Nfd4C+tRTqzuaXsA495q2FhEBiBo18UlIxKDBZIDFJiTEhqJrqNXvL
   JyrFSJ2WfKw7bkIFIjyft7wNZDGk/znH9boTictycHOZH2Fq8pgfH+ypT
   CSVtp0qBjP2g5c0bIewMfqyrlrVhMBuPGG0ejm0aZbVpwcdTs+FIaYa6n
   l7+S+FyMCcqHKxOPHuLdoJx9CdjdkonmGEyv4kINw1XMquyBohDY4/gG7
   2HsV3g9Pswj/K1bp0gReHydKU3yZ1xYp0DPV+Pmq2s6wSbxBw3h2r920V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365637663"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="365637663"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="759016795"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="759016795"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Oct 2023 01:15:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrwHa-0007Cv-0r;
	Sun, 15 Oct 2023 08:15:30 +0000
Date: Sun, 15 Oct 2023 16:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 551/30000]
 drivers/video/fbdev/mxc/mxsfb_sii902x.c:42:10: fatal error:
 asm/mach-types.h: No such file or directory
Message-ID: <202310151658.RSVj6EHb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 1907d4da81900dd1b86cbf4e657fafc02d9360ac [551/30000] video: fbdev: add sii902x hdmi driver code
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151658.RSVj6EHb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151658.RSVj6EHb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151658.RSVj6EHb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/mxc/mxsfb_sii902x.c:42:10: fatal error: asm/mach-types.h: No such file or directory
      42 | #include <asm/mach-types.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +42 drivers/video/fbdev/mxc/mxsfb_sii902x.c

  > 42	#include <asm/mach-types.h>
    43	#include <video/mxc_edid.h>
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
