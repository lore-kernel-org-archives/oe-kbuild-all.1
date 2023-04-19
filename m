Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B317197
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 04:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681878992; x=1713414992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixVCyxgc8691TyUbjsRO/AICCiradGynzO9eP0UldKg=;
  b=CNDT75xrvz49TkNHJtukGWfdFWl4PrtteT7fLgAMuHJf5AwH4Ni/PnkS
   DjFtPUTQucbRjjcyp45g/dbNorP9rzgwOCKLDrU9VPabieNC4lGOmWTFu
   2A6rCq4TPTUwaA8FW+YyOe+e6KqY1rGdleZp0n2XpYS/ObVXZXpyNPTbV
   pNzfu8C3V1flt0n8GBu/yshxShmxZ4IzVed5Mgq8nKbS+Ox3P2blHIGJF
   O6ZV+oiBn+XGUMA4k32r7ZEQ3/MdyVZ2sEFukQP/v4c9tw9dD6IYAaqT0
   Wi051e6wJguJwJFo2dermnFQXglPIDWVzlzshtWGqLDv9FBFkR+Db5NGU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="344101379"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="344101379"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 21:36:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="835133753"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="835133753"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2023 21:36:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pozYU-000eVt-01;
	Wed, 19 Apr 2023 04:36:30 +0000
Date: Wed, 19 Apr 2023 12:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-prefix-orc 27/29] check.c:4161:13: error: unused
 variable 'ret'
Message-ID: <202304191201.1EQZvHSS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-prefix-orc
head:   05bd387b160799b8834bd69d0d3482e9ec2a7eb2
commit: d7f31ac2de462d0cd7b1db01b7ecb525c057c8f6 [27/29] objtool: Separate prefix code from stack validation code
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230419/202304191201.1EQZvHSS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=d7f31ac2de462d0cd7b1db01b7ecb525c057c8f6
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-prefix-orc
        git checkout d7f31ac2de462d0cd7b1db01b7ecb525c057c8f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304191201.1EQZvHSS-lkp@intel.com/

Note: the jpoimboe/objtool-prefix-orc HEAD 05bd387b160799b8834bd69d0d3482e9ec2a7eb2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   check.c: In function 'add_prefix_symbols':
>> check.c:4161:13: error: unused variable 'ret' [-Werror=unused-variable]
    4161 |         int ret, warnings = 0;
         |             ^~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/check.o] Error 1
   make[3]: *** [Makefile:66: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1440: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
