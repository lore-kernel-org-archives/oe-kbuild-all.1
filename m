Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797E0BE5C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpckrihP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702210810; x=1733746810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E2Cz8W3+wq+iLQx7epUCLvSaKQ8HHOGIRGq5VV4rhuU=;
  b=EpckrihPfy6iWorzOz9j6i6q2P8Qi/iQDzX884UBHf0Az7eem6IJxDu3
   yWnLA7sqjB4MDsyglQqsw1RT06oiZ9TFQvn/AotX8rgD7vU0ss6cRuraE
   +Vz45UOT2T0dfKDjjc7sbzEac3w3l/nkGohbJQCeNO89xv3B9040KFJ1r
   js92RAzZLhFQhETa8EtoodoZFRVfKBrHO5ZZYPNiYQz1hWzX1MJ6G3kTm
   NpZCyJL8M7NOnq/HBeQn3mCxdWqcfHs7+2MObiJ8fiJEf+HztmWjv/H4h
   noaLKqhxVY7MwfDtQ0u7WO0gScOsZDq7R5OTR1KkNC5Mo7bWlG1M8PKDb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="374058126"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="374058126"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 04:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="801654373"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="801654373"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2023 04:20:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCImw-000GoW-2q;
	Sun, 10 Dec 2023 12:20:02 +0000
Date: Sun, 10 Dec 2023 20:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jkosina@suse.cz>
Subject: powerpc-linux-ld: warning: orphan section `.init.plt' from
 `drivers/hid/hid-uclogic-params.o' being placed in section `.init.plt'
Message-ID: <202312102059.jy7TxyjJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: a64cbf3ce63122168e1edb3eb1eb1cf7781ae230 HID: uclogic: Refactor UGEE v2 string descriptor parsing
date:   1 year, 4 months ago
config: powerpc-randconfig-r052-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102059.jy7TxyjJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102059.jy7TxyjJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312102059.jy7TxyjJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/hid/hid-uclogic-rdesc.o' being placed in section `.init.plt'
>> powerpc-linux-ld: warning: orphan section `.init.plt' from `drivers/hid/hid-uclogic-params.o' being placed in section `.init.plt'
   powerpc-linux-ld: warning: drivers/of/unittest-data/overlay_gpio_04b.dtb.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: block/blk-iocost.o: in function `ioc_refresh_params.isra.0':
   blk-iocost.c:(.text+0x1b5c): undefined reference to `__udivdi3'
   powerpc-linux-ld: block/blk-iocost.o: in function `transfer_surpluses':
   blk-iocost.c:(.text+0x3cd4): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
