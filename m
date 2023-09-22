Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B2F171AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 15:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695395620; x=1726931620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6as250FBlZwcBEVHGkKBKuBwXCf/x9I0ugw7kYM2uU4=;
  b=ZJc0zjB+K/PEfqXqPWI19y89aihT84fUDrtOCLvT274+KDcvbzp5TeNo
   c0C1Fkcd+CXU/aWdm7V/3xI0U0muGzuBWbn6IUph85thXcsRinfxX4KnY
   KRFNNHlk3CAqLZbUi361Ex+rbQNjfhRS7ArMNdcAttkH05mq52ysIp2Ie
   7n3xKz0quy3iqZab+jRMzCX8l8e3mOJDYSZTooU9ZZGOWrs79mLlIYzuV
   8tZawvcf/FDW3xjOHkxkMCXec2njuNCR2crN4NrdnWRX6kHHnBpCKW5mF
   EBudxScweZqfutoo9tUjzj8775rYV5Iu4d2SRHdr6aA7umC1YwkTvYnHD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="444948738"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="444948738"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 08:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="741130120"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="741130120"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 22 Sep 2023 08:13:31 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjhqT-0000sb-0o;
	Fri, 22 Sep 2023 15:13:29 +0000
Date: Fri, 22 Sep 2023 23:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: {standard input}:1198: Error: value of ffffff6c too large for field
 of 1 byte at 00000533
Message-ID: <202309222350.hCUFrIQ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27bbf45eae9ca98877a2d52a92a188147cd61b07
commit: 481461f5109919babbb393d6f68002936b8e2493 linux/export.h: make <linux/export.h> independent of CONFIG_MODULES
date:   9 weeks ago
config: m68k-randconfig-r025-20230123 (https://download.01.org/0day-ci/archive/20230922/202309222350.hCUFrIQ1-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309222350.hCUFrIQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309222350.hCUFrIQ1-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
   {standard input}:1198: Error: value -148 out of range
>> {standard input}:1198: Error: value of ffffff6c too large for field of 1 byte at 00000533

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
