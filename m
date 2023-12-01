Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC8D2629C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Dec 2023 16:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oa9SxCiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701448830; x=1732984830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VPH0F/qlsrstyv5vnrXjsMvlmtkoyUlLZbzD0BLM+iw=;
  b=Oa9SxCiUzRQRMeb+zGlGeQfkyiPn3jtgxRIA0b5XAYl4G4Jf3e69YGv0
   z8O2T0DIYKL+SsrndAo6gtD9XrrNArQToKUtVrDQhYMVtiUT8F3c7Y8ua
   0rz4t+eXHQnhQ6Xc+sBA/cInE3WwifzSXL0d30lyKaaj8Hricd9UBt1mV
   U6VCfixtq5vKFNTnwuq7FAh11bLf4+x9ahz0v+ejAGBeH3Dx/G+dC0CM+
   GI/Epbw7U+AQV/C8+P/4xGSArivvd0f7NPf5sUBkzKzRxY+UYvAHKckqq
   Yf/+LlG0YraMrtkabc4b2GHTdyQA9TCdzU2bJrsZxoJDVT2yNbYxCi8Na
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="401915"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="401915"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 08:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="1017085921"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="1017085921"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2023 08:40:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r96Z0-0003yU-1Y;
	Fri, 01 Dec 2023 16:40:26 +0000
Date: Sat, 2 Dec 2023 00:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or
 directory
Message-ID: <202312020048.s8WRhwlF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: 47c4b0de080adc125526aa80221c4e3ffbf97b6d tools/lib/thermal: Add a thermal library
date:   1 year, 6 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312020048.s8WRhwlF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312020048.s8WRhwlF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from events.c:10:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
       6 | #include <netlink/netlink.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [tools/build/Makefile.build:97: tools/lib/thermal/events.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   In file included from thermal_nl.c:9:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
       6 | #include <netlink/netlink.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [tools/build/Makefile.build:97: tools/lib/thermal/thermal_nl.o] Error 1
   In file included from commands.c:10:
>> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
       6 | #include <netlink/netlink.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [tools/build/Makefile.build:97: tools/lib/thermal/commands.o] Error 1
   make[3]: *** [Makefile:105: tools/lib/thermal/libthermal-in.o] Error 2
   make[2]: *** [Makefile:120: all] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
