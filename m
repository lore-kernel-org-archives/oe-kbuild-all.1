Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E566023DC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 21:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675545898; x=1707081898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SIjIwo4tqoLTzpkfNCyUc5nrfGSnl+IuJK3oWsAZ2FE=;
  b=PQzxdylUDY/K1N5Vjxx2Jyue1I31TLyTACVuMTAkDfIfPQbRCAqfPzzY
   /OlpSb+jYlpN+Df1NHQq/G+LoNM+4QV1KNsMeqrZs8/AjdLXzLKxL95uz
   6viz6QLnPCnmusqbTzBwlvyAHe5SgHfZ6mPi+8woBUQQBmJwSaMd+oKoH
   VETBKlTUCPfRoldm8u8Bm0PUAwj7xvGNM6u62eDFJo6zzM0yP+X2WfX0i
   /8h6XxLqIMUr/HfQpslKrYmo4LcRrQpTZLFTfRLVKHshSzGOJ0y6Mx+iO
   vATUJjpu1OITPyVuCB43ZRYY98VEToMImxMvckLEHY/JYSer1kclAaIx8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="330282819"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="330282819"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 13:24:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="994872326"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="994872326"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 Feb 2023 13:24:57 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOQ1o-0001XA-1S;
	Sat, 04 Feb 2023 21:24:56 +0000
Date: Sun, 5 Feb 2023 05:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/rv/monitors/wip/wip.c:20:1: sparse: sparse: symbol
 'da_mon_wip' was not declared. Should it be static?
Message-ID: <202302050517.4xtGBe0d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   db27c22251e7c8f3a9d5bfb55c9c8c701a70bbb3
commit: 10bde81c74863472047f31304064018c40f488ee rv/monitor: Add the wip monitor
date:   6 months ago
config: csky-randconfig-s052-20230205 (https://download.01.org/0day-ci/archive/20230205/202302050517.4xtGBe0d-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10bde81c74863472047f31304064018c40f488ee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 10bde81c74863472047f31304064018c40f488ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash kernel/trace/rv/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   kernel/trace/rv/monitors/wip/wip.c: note: in included file:
   kernel/trace/rv/monitors/wip/wip.h:30:22: sparse: sparse: symbol 'automaton_wip' was not declared. Should it be static?

vim +/da_mon_wip +20 kernel/trace/rv/monitors/wip/wip.c

8812d21219b9c6 Daniel Bristot de Oliveira 2022-07-29  18  
8812d21219b9c6 Daniel Bristot de Oliveira 2022-07-29 @19  struct rv_monitor rv_wip;
8812d21219b9c6 Daniel Bristot de Oliveira 2022-07-29 @20  DECLARE_DA_MON_PER_CPU(wip, unsigned char);
8812d21219b9c6 Daniel Bristot de Oliveira 2022-07-29  21  

:::::: The code at line 20 was first introduced by commit
:::::: 8812d21219b9c649dd25eb93915e00939944aeb7 rv/monitor: Add the wip monitor skeleton created by dot2k

:::::: TO: Daniel Bristot de Oliveira <bristot@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
