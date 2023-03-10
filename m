Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4272F32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 23:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678491336; x=1710027336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JFQUP96k7fLRiJ67cneEP+V9YvsICVaCTYJGMCZiM0Q=;
  b=f7R9g6UZq281s9ndd3o4cdStXM4thNJpjyuERl2yzIFR9qtZO4GCL6kc
   qRvRdHw205JoTjkFfdDekO8OrTajseqTH0jH8Z0eH5qfLOn6ZNxxUtBGe
   PBwL3+UvF3gkxFe5bdW3fUmPMEWrQ1U9OtmpKSiY/+p/Ye8ZC3u4PXhPl
   DBGrYD30v/n5scgrLLDLUDCaMTZZAXWJ/2ZK0scjxb70700VrWKTx5bUa
   Wogb85+pZXEjWfsc5iNAkCuT6iJVR+a7TGecWhA/f5tk7filxeORNDqaP
   O7i8OaqdsKn4zHf0db0NSzdjFy7nWj/1dFdqmVVnfOeBm1O0JmVV7pAh0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="399450391"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="399450391"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 15:35:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="678000909"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="678000909"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 15:35:34 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pamGr-0004AX-2B;
	Fri, 10 Mar 2023 23:35:33 +0000
Date: Sat, 11 Mar 2023 07:34:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:dhowells/linux-fs/pipe-list 29/30]
 splice.c:undefined reference to `sock_from_file'
Message-ID: <202303110735.qPFKUBCW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/pipe-list
head:   e76345d9b0b65f673fbee4ce5c3ef8450e89638e
commit: d90688969d42de17ae7edb2b32ddf8c9a821ff71 [29/30] splice, net: Use sendmsg(MSG_SPLICE_PAGES) rather than ->sendpage()
config: m68k-randconfig-r001-20230310 (https://download.01.org/0day-ci/archive/20230311/202303110735.qPFKUBCW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/d90688969d42de17ae7edb2b32ddf8c9a821ff71
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/pipe-list
        git checkout d90688969d42de17ae7edb2b32ddf8c9a821ff71
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110735.qPFKUBCW-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: m68k-linux-ld: DWARF error: could not find abbrev number 8917
   fs/splice.o: in function `pipe_to_sendmsg':
>> splice.c:(.text+0x33a): undefined reference to `sock_from_file'
>> m68k-linux-ld: splice.c:(.text+0x3ba): undefined reference to `sock_sendmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
