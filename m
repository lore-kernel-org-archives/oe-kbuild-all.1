Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1E98F43
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 17:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675359942; x=1706895942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oMaiW1+xAGoIUH+DXJK6IH0dTiWuwh4ByoO5qrRKN/8=;
  b=NJRtR/wNpjPX6LhPw3t9E1utVXwDtjfE/eHRQfx62mQwYuSspKAvN4k3
   tYgY7hxAholtta+W9WjZ+wC78CfqUvuYpt2KDwyCPFQxXpQXgUsBQkFsD
   QZyXvBTLA489me4UxGsVMTLrGb6vqt8A7jxpBDKo+167ulbQdDIyGNXYC
   ypSjqj9aUt1xDl3y+bHjCMqSnMmJo/unvCuSd9KnoahSlW7xODXqCKALp
   srocQNZYVFILdiHAkY8TaZeLDoAq8UUFX3nWbFLzocj0V2mCOsiT+vzUW
   4I2JQBwJpiXkWWSes5Lwx/6LARsmKJtKCQlBOiyudYEPyNH5AAPSqb8ke
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="316510562"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="316510562"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 09:45:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="773993099"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="773993099"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2023 09:45:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNdeW-0006gu-1D;
	Thu, 02 Feb 2023 17:45:40 +0000
Date: Fri, 3 Feb 2023 01:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Vasily Gorbik <gor@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: [linux-next:master 5982/10104] arch/s390/kernel/rethook.c:26:15:
 warning: no previous prototype for 'arch_rethook_trampoline_callback'
Message-ID: <202302030102.69dZIuJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea4dabbb4ad7eb52632a2ca0b8f89f0ea7c55dcf
commit: 1a280f48c0e403903cf0b4231c95b948e664f25a [5982/10104] s390/kprobes: replace kretprobe with rethook
config: s390-randconfig-r011-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030102.69dZIuJk-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=1a280f48c0e403903cf0b4231c95b948e664f25a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 1a280f48c0e403903cf0b4231c95b948e664f25a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/s390/kernel/rethook.c:26:15: warning: no previous prototype for 'arch_rethook_trampoline_callback' [-Wmissing-prototypes]
      26 | unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/arch_rethook_trampoline_callback +26 arch/s390/kernel/rethook.c

    22	
    23	/*
    24	 * Called from arch_rethook_trampoline
    25	 */
  > 26	unsigned long arch_rethook_trampoline_callback(struct pt_regs *regs)
    27	{
    28		return rethook_trampoline_handler(regs, regs->gprs[15]);
    29	}
    30	NOKPROBE_SYMBOL(arch_rethook_trampoline_callback);
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
