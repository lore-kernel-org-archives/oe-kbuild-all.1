Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8B83715D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C9QKDlzK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696524118; x=1728060118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YUEWy2BvmxXmHk/lQ3xQial9GNjAPQKgkUsR21XMg98=;
  b=C9QKDlzKMb9La3prV/bwp6KLrXZCAvkKwDCr5WHDdbCJ2tEe/LO23bAh
   0fsvwElDEPeU01UXj8o8jyWvgE8oV9a/VTlMa+5dgbdnoJLguKCDrKMfK
   gbDM5aGSgfeni1kc9fHB46BlKbhAe59VVe0mLppAasPLBQsMef9X1lg3q
   sxnJ1M220AU5YDX3bNjfpDrhjL/eKGVseCXby6yQ+s5JCcn//vbapq2Qv
   XiVji4eGdPLGy3fTN97GXz2sC/YxReefSxtmLK/SjpY+8wWgG9IoJMbV8
   56tyvaqGSk7bQOuslzZBEKkj+rfxI0OlN7cRmr7ptIE36uJHbgTQJxl8R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2155924"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="2155924"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 09:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="999014324"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="999014324"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Oct 2023 09:41:41 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoRPv-000LfO-08;
	Thu, 05 Oct 2023 16:41:39 +0000
Date: Fri, 6 Oct 2023 00:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mbroz:opal-test 5/7] ./drivers/usb/storage/unusual-flags.c:4:5:
 warning: no previous prototype for 'usb_stor_di2flags'
Message-ID: <202310060001.nSpE8ihK-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20231006/202310060001.nSpE8ihK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060001.nSpE8ihK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060001.nSpE8ihK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/storage/usual-tables.c:18:
>> ./drivers/usb/storage/unusual-flags.c:4:5: warning: no previous prototype for 'usb_stor_di2flags' [-Wmissing-prototypes]
       4 | u64 usb_stor_di2flags(unsigned long idx)
         |     ^~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
