Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B36A7E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 03:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693885805; x=1725421805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZSr4DAN+hFsfUkxibuwPr6KiHDOBxGaUAPGdWBCSXQ=;
  b=kxbwGm99VQJPdF93X+xySKKsotktHMQF1CQRnFzQwgyeie/5FZUIhnEW
   j5kvprQgiwRnRKBp9aQK4T/j8Yg0jb+yEs24FeRGzyVJ2h00DnNW1cgXU
   foIH7bc0ZOluNL8iDHXZfxCM4XD88x0tX8BrX16LdcsNhD7XbenktVqyg
   8AyzhH8Nexesx8c4oGby/ZvUQspfzjhLPEjSPVzDuDak9kyWBixtSAUlY
   uscWz2kWvX09wg6QYjlxxXFvHF6emm8J9R8R1nDY9Ty0m/oW4XXGi60G3
   9qwiK5ig8KZC84BYia6+FEHBV6Z8DU4xantIz8TUK1XMV2lq15gEBMDhD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="366922787"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="366922787"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 20:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="864549088"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="864549088"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Sep 2023 20:50:02 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdN4i-0001Cj-21;
	Tue, 05 Sep 2023 03:50:00 +0000
Date: Tue, 5 Sep 2023 11:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:v6.5-pks-core 17/34] include/linux/stddef.h:10: Error: no
 such instruction: `enum {'
Message-ID: <202309051144.kN8lzaTL-lkp@intel.com>
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
config: x86_64-randconfig-004-20230905 (https://download.01.org/0day-ci/archive/20230905/202309051144.kN8lzaTL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051144.kN8lzaTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051144.kN8lzaTL-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/stddef.h: Assembler messages:
>> include/linux/stddef.h:10: Error: no such instruction: `enum {'
>> include/linux/stddef.h:11: Error: junk at end of line, first unrecognized character is `,'
   include/linux/stddef.h:13: Error: junk at end of line, first unrecognized character is `}'


vim +10 include/linux/stddef.h

6e2182874324727 Richard Knutsson 2006-09-30   9  
6e2182874324727 Richard Knutsson 2006-09-30 @10  enum {
6e2182874324727 Richard Knutsson 2006-09-30 @11  	false	= 0,
6e2182874324727 Richard Knutsson 2006-09-30  12  	true	= 1
6e2182874324727 Richard Knutsson 2006-09-30  13  };
6e2182874324727 Richard Knutsson 2006-09-30  14  

:::::: The code at line 10 was first introduced by commit
:::::: 6e21828743247270d09a86756a0c11702500dbfb [PATCH] Generic boolean

:::::: TO: Richard Knutsson <ricknu-0@student.ltu.se>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
