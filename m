Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1217361
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 00:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696034302; x=1727570302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Q38Wimlu+91x4JNFLj39+P7AkbvCTGYjMjaW83FZb0=;
  b=SFJrdTNMH4tO+kukkAe6ejvwcZkc/GDzMlC9O6VH810F4Zqx5pgUlM3k
   nn7vBSYwbWh2fyDtNBFpmnssnMoJ3rZCdYhx26HKaEwJHBSIucfMdO3N6
   P7Vzp5YXKsQWd4G0tg4YFmq2SaCabS1c0UcQ6jjU7SKTjYWkAgWkgqBII
   0R3Bvh+gLyRctagfZYB922R804Kgeg5zJg55QACKr7JmpPrlgaIOIGqRk
   BdmOQvoi/nwiuemZjyadypJMbdbz+iGZPmWGG45nX+KmtjvnP6B+WDrLZ
   iDT6x2Mm6or3h84/q+n0YfLuiI7IeoKh0NSKi689PXmpZWw64HPyYsAvI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="385230902"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="385230902"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 17:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="873841641"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; 
   d="scan'208";a="873841641"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Sep 2023 17:38:20 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmNzu-0003Td-1M;
	Sat, 30 Sep 2023 00:38:18 +0000
Date: Sat, 30 Sep 2023 08:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 14383/28554] htmldocs:
 ./include/kunit/test.h:174: warning: Function parameter or member 'debugfs'
 not described in 'kunit_suite'
Message-ID: <202309300823.pRigHnIW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   a1b9dbe5628adf6bc61b5bb150dd2fb2b286fda0
commit: f6651bd242ce4de8287e499e74e9f08e52faf0a8 [14383/28554] UPSTREAM: kunit: add debugfs /sys/kernel/debug/kunit/<suite>/results display
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309300823.pRigHnIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309300823.pRigHnIW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/kunit/test.h:174: warning: Function parameter or member 'debugfs' not described in 'kunit_suite'
>> ./include/kunit/test.h:174: warning: Function parameter or member 'log' not described in 'kunit_suite'

vim +174 ./include/kunit/test.h

ff82dbcb3e2cc5 Brendan Higgins 2019-09-23 @174  

:::::: The code at line 174 was first introduced by commit
:::::: ff82dbcb3e2cc596f464302579fdf331f7422384 UPSTREAM: kunit: test: add KUnit test runner core

:::::: TO: Brendan Higgins <brendanhiggins@google.com>
:::::: CC: Alexander Potapenko <glider@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
