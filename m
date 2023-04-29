Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC75A20FC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 05:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682745183; x=1714281183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZy1MHFi07tWS6xhjFvaSirIgvnPFqrKKLpZ5aGhJ5A=;
  b=NPM60N0WOPOQeLmx5nmhUd/QNcwf9B3Vj6PlLhqwU399gxu3fA8PRDOX
   pMWtG1lKcKvPgXcirlmJhbx9GShh8VIQWp+Nwg9fQM3pj/Tznc5IqnQac
   0nQBw7PboFjZNAdUvw1KE7IymdDXpH2IqKplQmdAvR4Uvz+tpsdRW8JSK
   hS7M8cvzPE/eN7gdlLr4BD8i+25hxJuLh0CbSs2g7fmmGZAKCoUqRDHpa
   vL1XAYpAOhzD4CPKSNM7IFSf7gaP4mRIR+anNDhb3h5UMeXQ60EM67uP5
   W54WzAIQXCAB6MLC6qbr+COZpcVdLTERn0ED2i7aMlXI+O6cn0rkfBUiQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346687389"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="346687389"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 22:13:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="839132606"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="839132606"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 28 Apr 2023 22:12:59 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psctB-0000uV-1g;
	Sat, 29 Apr 2023 05:12:53 +0000
Date: Sat, 29 Apr 2023 13:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 14283/14376] trace.c:undefined reference to
 `ftrace_stub_direct_tramp'
Message-ID: <202304291308.YpmrjzVV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   92e815cf07ed24ee1c51b122f24ffcf2964b4b13
commit: e287501e00c6e935a6e182f6992f97ee181788d3 [14283/14376] Merge branch 'loongarch-next' of git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230429/202304291308.YpmrjzVV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e287501e00c6e935a6e182f6992f97ee181788d3
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e287501e00c6e935a6e182f6992f97ee181788d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291308.YpmrjzVV-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/trace/trace.o: in function `.L3177':
>> trace.c:(.init.text+0x16e4): undefined reference to `ftrace_stub_direct_tramp'
>> loongarch64-linux-ld: trace.c:(.init.text+0x16e8): undefined reference to `ftrace_stub_direct_tramp'
>> loongarch64-linux-ld: trace.c:(.init.text+0x16e8): undefined reference to `ftrace_stub_direct_tramp'
   loongarch64-linux-ld: kernel/trace/trace.o: in function `.L3180':
   trace.c:(.init.text+0x17bc): undefined reference to `ftrace_stub_direct_tramp'
   loongarch64-linux-ld: trace.c:(.init.text+0x17c0): undefined reference to `ftrace_stub_direct_tramp'
   loongarch64-linux-ld: kernel/trace/trace.o:trace.c:(.init.text+0x17c0): more undefined references to `ftrace_stub_direct_tramp' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
