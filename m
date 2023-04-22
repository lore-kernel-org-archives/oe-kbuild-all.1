Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3B7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 01:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682127271; x=1713663271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZLFwCIX7/un3CJZ/Zubhkfd29ENxfh1F7uICPUi0sBE=;
  b=evNU3cxrBow4Z+BFjJcMuu7PnDa/xoRXL/LM0tOpb5a4xd7xQ/c2Gxh/
   /+xKI2ynRZpsu0HTqqy3iwce5FLIMhgWM4rQg8xxbO2yppAqJoUfvSB2g
   MH8KyIz2ndMEgZF8D5+b/vxUKRg7H2WiefbKFghG2rtrGQpNf/cD2dfnW
   1ajf67FsTFih0O9QGFZuJ1A3WULurwKY4W+oIPpIwMs4Q7BSSq2RQ+9wX
   pzjwDGocgiurZeyPfqY2e+AgNrxG+Can5+rsI+2b/uJPeVeJ9U+Oe4J9Q
   KtaFHucqP6dzgxh3E+5rWMhnuDAExyU9iQNPdu+i0fN2BVggOo+JcyJCg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="330321007"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="330321007"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 18:34:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="669887647"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="669887647"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Apr 2023 18:34:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq28z-000gzC-1D;
	Sat, 22 Apr 2023 01:34:29 +0000
Date: Sat, 22 Apr 2023 09:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/module-space-rework 6/7]
 arch/arm64/kernel/ftrace.c:200:36: error: invalid use of undefined type
 'struct module'
Message-ID: <202304220932.iSUZ5Tex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/module-space-rework
head:   1ac179f2c4d6f8091e8332a1f1cfa7a8be901a75
commit: c4418e1c18cfe1261d69bf1313263475dd16b2a3 [6/7] arm64: mandate MODULE_PLTS for MODULES
config: arm64-buildonly-randconfig-r003-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220932.iSUZ5Tex-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=c4418e1c18cfe1261d69bf1313263475dd16b2a3
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/module-space-rework
        git checkout c4418e1c18cfe1261d69bf1313263475dd16b2a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220932.iSUZ5Tex-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/ftrace.c: In function 'get_ftrace_plt':
>> arch/arm64/kernel/ftrace.c:200:36: error: invalid use of undefined type 'struct module'
     200 |         struct plt_entry *plt = mod->arch.ftrace_trampolines;
         |                                    ^~
   arch/arm64/kernel/ftrace.c: At top level:
   arch/arm64/kernel/ftrace.c:427:6: warning: no previous prototype for 'prepare_ftrace_return' [-Wmissing-prototypes]
     427 | void prepare_ftrace_return(unsigned long self_addr, unsigned long *parent,
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +200 arch/arm64/kernel/ftrace.c

bd7d38dbdf356e AKASHI Takahiro 2014-04-30  197  
3b23e4991fb66f Torsten Duwe    2019-02-08  198  static struct plt_entry *get_ftrace_plt(struct module *mod, unsigned long addr)
3b23e4991fb66f Torsten Duwe    2019-02-08  199  {
3b23e4991fb66f Torsten Duwe    2019-02-08 @200  	struct plt_entry *plt = mod->arch.ftrace_trampolines;
3b23e4991fb66f Torsten Duwe    2019-02-08  201  
3b23e4991fb66f Torsten Duwe    2019-02-08  202  	if (addr == FTRACE_ADDR)
3b23e4991fb66f Torsten Duwe    2019-02-08  203  		return &plt[FTRACE_PLT_IDX];
c4418e1c18cfe1 Mark Rutland    2023-04-19  204  
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
