Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC1A7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 04:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682137716; x=1713673716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z42JyQCXnkbrUikB0ZuRdB46989hup3Aq1IGTITZvQQ=;
  b=GZE/tKs4ILgrKVglYjGuY+L21mLm8HYT+aQQ7QT11v7iy9wrmMDv02p7
   ZE+RVo4cZsqYr2jgcUkMcvWWKmD5+oz4b317Pm1r0h1BnAAaV+KluDrzv
   Anu4kioJfoHb9K5TsuZuhNKPCP/wj0mmxmhUgkSYobN7DOpKcuu9lu0me
   Upn17tEK2ndiDF+pgPjg5RcUpm5DT+8wRcR72VbjpgCCE4dnHlP0usAXX
   nswTJH4hcdSEXOSf7QLOwCyxRItIb/rTo7muALzKbp2wyOT3zWxgY645t
   HljNkTK9Vx7ZgultvLHQkEYZMZs+Y9KJFvIMOTkA0XENu5AVzDlr1vgRY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325722441"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="325722441"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 21:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="692465940"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="692465940"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Apr 2023 21:28:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq4rS-000h48-12;
	Sat, 22 Apr 2023 04:28:34 +0000
Date: Sat, 22 Apr 2023 12:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:ctime 1/5] stat.c:undefined reference to
 `__sync_or_and_fetch_4'
Message-ID: <202304221207.j7Kya2vC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git ctime
head:   54dd444fe05963240ab071845d5de2b1da6d7688
commit: ef2430ea5bbddbce887a45fce3dcc6d2034e6d7b [1/5] fs: add infrastructure for multigrain inode i_m/ctime
config: m68k-randconfig-s032-20230421 (https://download.01.org/0day-ci/archive/20230422/202304221207.j7Kya2vC-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=ef2430ea5bbddbce887a45fce3dcc6d2034e6d7b
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton ctime
        git checkout ef2430ea5bbddbce887a45fce3dcc6d2034e6d7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221207.j7Kya2vC-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: fs/stat.o: in function `generic_fill_multigrain_cmtime':
>> stat.c:(.text+0x5c0): undefined reference to `__sync_or_and_fetch_4'
   m68k-linux-ld: fs/inode.o: in function `current_ctime':
>> inode.c:(.text+0x24f4): undefined reference to `__sync_fetch_and_and_4'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
