Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D21437165
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Oct 2023 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2SwRoIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696539331; x=1728075331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eA4FYtwijChdhbKXDEcqUWsYatRcHe0XmkEBW0eO9Jk=;
  b=n2SwRoIap3mQ7CXZp4UypXFF9iSUZK2OT3uxspOQEbGfOo76Ifq63ZYQ
   IvEyyT+pw4XQj0tJwTztKfjhrrNQBqypaUwA3oBPOLGq/Zd7mujdv65Og
   MOA6r+zQh7gIiCzQocFauihPnaLQb+shd+RrXGY6AiRtTUQtMJx7EVqrw
   H0KWGUYV8mq5r31bmVSgJCIOYQQ0soRGtbCr+Inz/HNkAdB8EvTMPdYef
   vpTAXuXa0+V4OSPS7ORflgphXX1kPrNUD3BWIDX8M1tcqmb1JlFis8LuT
   eIqJsoD9sPJeLGKpTHC2yTFJeHVoz5S3h3zP2jMFgRCBi8d8ZB1yte8bJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="469889083"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="469889083"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 13:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868086054"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="868086054"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Oct 2023 13:54:54 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoVMy-000Ltc-0o;
	Thu, 05 Oct 2023 20:54:52 +0000
Date: Fri, 6 Oct 2023 04:54:49 +0800
From: kernel test robot <lkp@intel.com>
To: Milan Broz <gmazyland@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mbroz:opal-test 5/7] drivers/usb/storage/usual-tables.c:5: multiple
 definition of `usb_stor_di2flags';
 drivers/usb/storage/uas.o:./drivers/usb/storage/unusual-flags-uas.c:5: first
 defined here
Message-ID: <202310060407.cek7LGfR-lkp@intel.com>
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
config: i386-randconfig-001-20231005 (https://download.01.org/0day-ci/archive/20231006/202310060407.cek7LGfR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060407.cek7LGfR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060407.cek7LGfR-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/storage/usual-tables.o: in function `usb_stor_di2flags':
>> drivers/usb/storage/usual-tables.c:5: multiple definition of `usb_stor_di2flags'; drivers/usb/storage/uas.o:./drivers/usb/storage/unusual-flags-uas.c:5: first defined here


vim +5 drivers/usb/storage/usual-tables.c

e6e244b6cb1f70 Alan Stern 2009-02-12 @5   *
e6e244b6cb1f70 Alan Stern 2009-02-12  6   * Copyright (C) 2009 Alan Stern (stern@rowland.harvard.edu)
e6e244b6cb1f70 Alan Stern 2009-02-12  7   */
e6e244b6cb1f70 Alan Stern 2009-02-12  8  

:::::: The code at line 5 was first introduced by commit
:::::: e6e244b6cb1f70e7109381626293cd40a8334ed3 usb-storage: prepare for subdriver separation

:::::: TO: Alan Stern <stern@rowland.harvard.edu>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
