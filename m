Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B983321D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678201031; x=1709737031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fVRQ1eFNlRKRiDlvSnjMax0XxJSp4HLK/czkXahu87w=;
  b=eWv28VcNJpNPMNuawHJGD+id/grGPH4JU1J6R95B0vC6Pc+/b0adzlhc
   Ig4gIXWia1nmi52+6IVSikW5HXEmU3DQ/ZzpicwFp69XbMDYCB4bGZr0/
   TcDo4PQpnyHnyyiF5oNVEJwPBRyGizBpcxg/TdWVRHF8YsMwz6YdHLKHD
   Y0ufG1OfBxNUJJDrjKyQ9tN71jDHhDQSIogxfQD7lTVnqfJx5VRa3E+x/
   pU4F3VfsiMaX8NlfpJRyGI1g9Q6pY8mnNajezvU0e86na39sc4q4AligZ
   moeSWh3iu+jFpfHKMaSTvNoyboG6iFjXVfqKD9Lc+TaWz7CSWY67NOSRD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398447288"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="398447288"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 06:57:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="740750387"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="740750387"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2023 06:57:09 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZYkX-0001PR-0D;
	Tue, 07 Mar 2023 14:57:09 +0000
Date: Tue, 7 Mar 2023 22:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:viro/vfs/work.csum 5/5]
 arch/x86/lib/csum-partial_64.c:119:9: warning: no previous prototype for
 'ip_compute_csum'
Message-ID: <202303072229.Fwu3mYav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block viro/vfs/work.csum
head:   8b3fb774b1eee6ee4f8c896e3d2f25bb82d2f467
commit: 8b3fb774b1eee6ee4f8c896e3d2f25bb82d2f467 [5/5] consolidate default ip_compute_csum()
config: x86_64-buildonly-randconfig-r004-20230306 (https://download.01.org/0day-ci/archive/20230307/202303072229.Fwu3mYav-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/8b3fb774b1eee6ee4f8c896e3d2f25bb82d2f467
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block viro/vfs/work.csum
        git checkout 8b3fb774b1eee6ee4f8c896e3d2f25bb82d2f467
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303072229.Fwu3mYav-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/csum-partial_64.c:119:9: warning: no previous prototype for 'ip_compute_csum' [-Wmissing-prototypes]
     119 | __sum16 ip_compute_csum(const void *buff, int len)
         |         ^~~~~~~~~~~~~~~


vim +/ip_compute_csum +119 arch/x86/lib/csum-partial_64.c

^1da177e4c3f41 arch/x86_64/lib/csum-partial.c Linus Torvalds 2005-04-16  114  
^1da177e4c3f41 arch/x86_64/lib/csum-partial.c Linus Torvalds 2005-04-16  115  /*
^1da177e4c3f41 arch/x86_64/lib/csum-partial.c Linus Torvalds 2005-04-16  116   * this routine is used for miscellaneous IP-like checksums, mainly
^1da177e4c3f41 arch/x86_64/lib/csum-partial.c Linus Torvalds 2005-04-16  117   * in icmp.c
^1da177e4c3f41 arch/x86_64/lib/csum-partial.c Linus Torvalds 2005-04-16  118   */
a4f89fb7c072b8 arch/x86_64/lib/csum-partial.c Al Viro        2006-11-14 @119  __sum16 ip_compute_csum(const void *buff, int len)

:::::: The code at line 119 was first introduced by commit
:::::: a4f89fb7c072b8592b296c2ba216269c0c96db43 [NET]: X86_64 checksum annotations and cleanups.

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
