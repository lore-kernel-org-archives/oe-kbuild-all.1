Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69DB7EC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 01:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694050770; x=1725586770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEeoM7Ik1Do2UO9OyQghmiCNOA9qlk1KClXvPS+SZeA=;
  b=jc68CX7J6IgCwE2G2kVJ9gJiYBmg9PfHq4y7qLHAjcgY6q2VHgJ8z0yz
   RlZmrSvW05RnfhzBC7m6gpJ6UcVgtMsNP+a+eeZr/og0WK9xsxHbaoRvZ
   /o8ssKjEv8pQx/H5zhezUmb1GdvASqa5w8PQTeRJXxkxUBox3e8U8XmYs
   xJSfDdDYypMfCBM4khxmwkbchjUSKO3bfGsOQ1VfiJvayrdKQks9sXSbL
   MLzx9j7qt7hrzNnBuCfjpHMN6N6s1GFi01ts3D9CM6Lrao2yKlQkog6g1
   ZcEf7Mnesp9q4A/saGHRh8MwBSjStz3LVi5YziO80ZndhmwoCFN0hUwVK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408235690"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="408235690"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 18:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="691556081"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; 
   d="scan'208";a="691556081"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Sep 2023 18:39:27 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qe3zQ-0000mF-3A;
	Thu, 07 Sep 2023 01:39:24 +0000
Date: Thu, 7 Sep 2023 09:38:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:v6.5-pks-core 17/34] include/linux/stddef.h:10: Error: no
 such instruction: `enum {'
Message-ID: <202309070945.dHLndPRo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git v6.5-pks-core
head:   1333a49c014b15a2cf7584b4a3641f03e0602a40
commit: 3ee964a4772cd93458d8dbf48f2fd97b8b65551d [17/34] FIXME x86/entry: Add auxiliary pt_regs space
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230907/202309070945.dHLndPRo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070945.dHLndPRo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070945.dHLndPRo-lkp@intel.com/

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
