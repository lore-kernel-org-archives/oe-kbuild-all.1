Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B6B1871
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 10:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694170443; x=1725706443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ShG46zuBAYZTJAsd7MJdtcO7Wedu2Gc/j/eC/pPBMOI=;
  b=X0oncSv2v8AePlGsX4fC/A2aIpU18iI1bM9/q6AMXF8J+Zyh4fOiJQIf
   y+0JxCZ5jwJZ5FjWokKzA81kMkHGOcg9uH8oi5Sf89aDKsLOX+lHB1iLl
   co4vDJiZvls/YYwpEtPJsioJilS2otJCsEvxJgdpj4hTnfiwOJcHhqOH6
   937551MLL/EPXWbqCinEUHToKZ52GESpIZUsPpXYsrdPcO/Ltg0v2qHPp
   3/BxSEFoCe3FtEXCxbC7a1zTLYa3meNZHgqREnFzRH8r7cfLrlSGNCtI8
   1FqdHm3DRjKR0C+/y1t6dZmqMgEnNqykUuSKcupZW3BHLAve9NBFMV8E0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357081585"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="357081585"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 03:54:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="832625253"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="832625253"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2023 03:54:01 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeZ7f-0002Bz-1A;
	Fri, 08 Sep 2023 10:53:59 +0000
Date: Fri, 8 Sep 2023 18:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:pks-core-2023-09-04 17/34] include/linux/stddef.h:10: Error:
 no such instruction: `enum {'
Message-ID: <202309081814.W0FrfMX8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git pks-core-2023-09-04
head:   f3805d41ebb5e9da27bb5b1569757eaa542cb2d9
commit: 7d5b397b1f3533e8616d1d07994a87e7fe272224 [17/34] FIXME x86/entry: Add auxiliary pt_regs space
config: x86_64-rhel-8.3-ltp (https://download.01.org/0day-ci/archive/20230908/202309081814.W0FrfMX8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081814.W0FrfMX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081814.W0FrfMX8-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/stddef.h: Assembler messages:
>> include/linux/stddef.h:10: Error: no such instruction: `enum {'
>> include/linux/stddef.h:11: Error: junk at end of line, first unrecognized character is `,'
   include/linux/stddef.h:13: Error: junk at end of line, first unrecognized character is `}'


vim +10 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30   9  
6e218287432472 Richard Knutsson 2006-09-30 @10  enum {
6e218287432472 Richard Knutsson 2006-09-30 @11  	false	= 0,
6e218287432472 Richard Knutsson 2006-09-30  12  	true	= 1
6e218287432472 Richard Knutsson 2006-09-30  13  };
6e218287432472 Richard Knutsson 2006-09-30  14  

:::::: The code at line 10 was first introduced by commit
:::::: 6e21828743247270d09a86756a0c11702500dbfb [PATCH] Generic boolean

:::::: TO: Richard Knutsson <ricknu-0@student.ltu.se>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
