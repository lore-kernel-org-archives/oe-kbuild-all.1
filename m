Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DAA1EA95
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 12:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695387204; x=1726923204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FpMNmid5vJBRuoipv6sZTZSriJ88OpJcsOk/pEnk+ME=;
  b=Ozs8TZUJ3JiQHLaB3lKO7jAkL2O09dEXrpI05SIZqcrAxRUrnpvWHNOO
   vS3qcdvGvpKx333aqW5YwTq7fA3T2Kkg01dQkNSQbLdXSRir4hDEQKcus
   BDQISWyCXVsgOqwA4gvyc5cE8BCY1mCYMz7g391n3LEkVngXp+eOY+4v/
   deG9f3BUExcD7o9/FjTUHkp2PrZjbwtIu+p4hjzma7zlhcyWTESML9B7P
   Rjagmbgq0rn+A+QcJ5L2wS1cosbfHHE7pmuHLQQ6jkiiNEC2Rmk+MdHJW
   I9xNTzwK3/lE5usCRDPCjjK8VSr7LDJEibiWFvn7Ga3iUSQk4QQf9qGEf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="444915575"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="444915575"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 05:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="750830048"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="750830048"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 22 Sep 2023 05:53:20 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjfeo-0000jF-19;
	Fri, 22 Sep 2023 12:53:18 +0000
Date: Fri, 22 Sep 2023 20:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Shenghao Ding <13916275206@139.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: {standard input}:992: Error: value -148 out of range
Message-ID: <202309222048.RnSqEIK5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shenghao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27bbf45eae9ca98877a2d52a92a188147cd61b07
commit: ef3bcde75d06d65f78ba38a30d5a87fb83a5cdae ASoC: tas2781: Add tas2781 driver
date:   3 months ago
config: m68k-randconfig-r025-20230123 (https://download.01.org/0day-ci/archive/20230922/202309222048.RnSqEIK5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309222048.RnSqEIK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309222048.RnSqEIK5-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:992: Error: value -148 out of range
   {standard input}:992: Error: value of ffffff6c too large for field of 1 byte at 0000045f

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
