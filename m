Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B2DDB6
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 21:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693947936; x=1725483936;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1m6LCziNEkfLys4SsW7XfZNOyyn4Cv9vK/7MBtinrWA=;
  b=E5wb1LaUgw/Pf/yT/449wjY9av+PH4tqmlOSnXWq0bsqfh/n3fKxSiNc
   +MjE9CvqYJ5rOOnC1PoAnAw4/9PFtCO9HF6aZAI3QdDwrL8J+enVBJIgH
   QrtnVrSjWTxUZlTSChJTZ7rNCDo6r1ih1JRJz8+ChMvrTR5TU5aHY+BDP
   l9J5b3mjqwOG3ATCTxlI1UU4In7WsQFbxbt6E8Ng1C5mmXJYrUlAQEWrB
   1/OF/VIFcgg/T+6MCsl9Md/fDZLLQ47dAdI0YY6wWbqmyhI2fsZcgfZlg
   kNhAPaeSXtyBTZSZ7+6AyroRhSbrQ7LK61RNd8vyc0r0WKwltbhQVU6c4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407900194"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="407900194"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 14:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="884453107"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="884453107"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2023 14:05:25 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qddEq-00024v-03;
	Tue, 05 Sep 2023 21:05:32 +0000
Date: Wed, 6 Sep 2023 05:05:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Andrew Davis <afd@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 4/382] /usr/bin/ld: warning:
 drivers/of/unittest-data/testcases.dtbo.o: missing .note.GNU-stack section
 implies executable stack
Message-ID: <202309060430.7XUoz5TA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   6c7b09058d06625c8386decb5573da65e3c4ccfc
commit: 5e8b385db99e58a03bab30a80567e67967c764fb [4/382] of: overlay: rename overlay source files from .dts to .dtso
config: um-randconfig-r034-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060430.7XUoz5TA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060430.7XUoz5TA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060430.7XUoz5TA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> /usr/bin/ld: warning: drivers/of/unittest-data/testcases.dtbo.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2 has a LOAD segment with RWX permissions
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms2.o: missing .note.GNU-stack section implies executable stack
   /usr/bin/ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   /usr/bin/ld: warning: vmlinux has a LOAD segment with RWX permissions

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
