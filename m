Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB3415E92
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAvzXw2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699830931; x=1731366931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6286pnzRznLh2ZXKxORDkZ7ishxP+HvV2UOp/MwG2qE=;
  b=SAvzXw2OgSn9T23L6LzAJZMBcGjVhKMsXXEdCTe9BJz1yf35S2rbb034
   sS+RUGVxu2KKt2orKF0T4yoqTbP1nVaJuxfM+B4JiMdvLYFyDN8iAgoP0
   Qb6TEDgZt/WdQN7KQfoubC7NPYdwcxnklSIhGICAlUiEqanUyhBph9Uhy
   iJ7RT0080jtId73ZWYRYbQ3H8YCm+b5q0XBjk7ICHM3iy6x56CfARak6y
   0AOF1IynpkgZWNY2LLKhCur18HwrB9qZ15IdYabtHAPks0ESXu855m7cR
   E2vjrKAnkw0FQ8BC2U41/D3ECsfu4dEhi5VpiUrTQivvshtYdoAEXEB/f
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="454656678"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="454656678"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 15:15:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="881501159"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="881501159"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2023 15:15:29 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2Jfr-000Bba-2r;
	Sun, 12 Nov 2023 23:15:27 +0000
Date: Mon, 13 Nov 2023 07:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r3mini 30/30]
 utils/firmware/EthMD32.DSP.bin: warning: ignored by one of the .gitignore
 files
Message-ID: <202311130717.KxUl3FUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r3mini
head:   19da6a09f1b5117fc96f50212b4a376fbbe13d5a
commit: 19da6a09f1b5117fc96f50212b4a376fbbe13d5a [30/30] util: firmware: add EN8811H 2.5G PHY FW v1.2.1
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231113/202311130717.KxUl3FUQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311130717.KxUl3FUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311130717.KxUl3FUQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   tools/perf/util/bpf_skel/vmlinux/vmlinux.h: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/run_tags_test.sh: warning: ignored by one of the .gitignore files
   tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/.gitignore: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/Makefile: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/config: warning: ignored by one of the .gitignore files
   tools/testing/selftests/kvm/settings: warning: ignored by one of the .gitignore files
>> utils/firmware/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
