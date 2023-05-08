Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07805320A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 03:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683515090; x=1715051090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nGdV6aorr2LAHrOHo3ZQSUJJVKjR7L472OvcRhCPwic=;
  b=CskE7x3xZgsGBGlKDbUJv8XNl7BXbxsD3BTe6TTQTADMrXGo4yE+y25i
   uY47dRdrnQ/hHACOgLKdADJGSFeTJ39EdZPvaZ5xi/+hMncUujcalOhvF
   d9coWb6xYxZTuSf8iY5wqFZ8R8kd47AKuPyDrUI9sHYhkYZ5p9eB7N4J8
   mtsK9/HwSnyin6j8tRVBfGQv4+YGSjCxekz8CVCBOubO1SvHPcRHPA+VG
   7JkodnlFy9e8lItkgIIyu5+zrSXPePDhw/a4BN3ZnyRbr4fQG44XY1r11
   Py0Nbw+wETepG4lAtV0sWhT9NyzbPb8VwtkmdWwTC3QABy6o113xBwFBh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="329903091"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="329903091"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 20:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="692446583"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="692446583"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 May 2023 20:04:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvrB9-0000yT-0w;
	Mon, 08 May 2023 03:04:47 +0000
Date: Mon, 8 May 2023 11:03:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/module-space-rework 6/7]
 arch/arm64/kernel/ftrace.c:200:36: error: invalid use of undefined type
 'struct module'
Message-ID: <202305081035.i0vMAOOz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/module-space-rework
head:   a96e2e587515d06f8caeb9a27c144f7d33b93d20
commit: cc163cbb102f4856e1e1b3a87b530f223cd509ff [6/7] arm64: module: mandate MODULE_PLTS
config: arm64-randconfig-c041-20230507 (https://download.01.org/0day-ci/archive/20230508/202305081035.i0vMAOOz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=cc163cbb102f4856e1e1b3a87b530f223cd509ff
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/module-space-rework
        git checkout cc163cbb102f4856e1e1b3a87b530f223cd509ff
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081035.i0vMAOOz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/ftrace.c: In function 'get_ftrace_plt':
>> arch/arm64/kernel/ftrace.c:200:36: error: invalid use of undefined type 'struct module'
     200 |         struct plt_entry *plt = mod->arch.ftrace_trampolines;
         |                                    ^~


vim +200 arch/arm64/kernel/ftrace.c

bd7d38dbdf356e AKASHI Takahiro 2014-04-30  197  
3b23e4991fb66f Torsten Duwe    2019-02-08  198  static struct plt_entry *get_ftrace_plt(struct module *mod, unsigned long addr)
3b23e4991fb66f Torsten Duwe    2019-02-08  199  {
3b23e4991fb66f Torsten Duwe    2019-02-08 @200  	struct plt_entry *plt = mod->arch.ftrace_trampolines;
3b23e4991fb66f Torsten Duwe    2019-02-08  201  
3b23e4991fb66f Torsten Duwe    2019-02-08  202  	if (addr == FTRACE_ADDR)
3b23e4991fb66f Torsten Duwe    2019-02-08  203  		return &plt[FTRACE_PLT_IDX];
cc163cbb102f48 Mark Rutland    2023-04-19  204  
3b23e4991fb66f Torsten Duwe    2019-02-08  205  	return NULL;
3b23e4991fb66f Torsten Duwe    2019-02-08  206  }
3b23e4991fb66f Torsten Duwe    2019-02-08  207  

:::::: The code at line 200 was first introduced by commit
:::::: 3b23e4991fb66f6d152f9055ede271a726ef9f21 arm64: implement ftrace with regs

:::::: TO: Torsten Duwe <duwe@lst.de>
:::::: CC: Mark Rutland <mark.rutland@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
