Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539FC13AD3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686832139; x=1718368139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PSrskKZlWmBYo3xhpR4fwlF8ORJQIJHlRyLeM9j3t38=;
  b=WccgpZ1C+rjikIBdA6Il9xOIQCwNpcHHHavaS+zW9m6IcU4No4llwMPm
   keuym44SuHZymlW7MhWXq7FbNh7mTjP5i0ZEMp/aipDOxsax7o1dbIFim
   Z0O4wYXn3MLDcGpUmNXDyJaY/gNt7MP0dqILHcgL5CZnShX1ZE0PEfmrk
   wfmOID8m+QYEZuxSYPTosdLdhTvVfpj7twOJE9/Jk2EpTtMXtgaKLJbBO
   zVr2/2QxNK7PzdDr2euwerH3PhW0Om89dYOy2ttYDanahwktBm2WJtjVW
   9kgyjCgIRUanfFrz4EQ1JCLZ9mp8q29YGKqsEndX9+K/UExHyitppq4Wj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="343598051"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="343598051"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 05:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="777645970"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="777645970"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jun 2023 05:28:57 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9m5w-0001sR-2K;
	Thu, 15 Jun 2023 12:28:56 +0000
Date: Thu, 15 Jun 2023 20:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5610/26444]
 kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for
 function '__log_abort_or_abnormal_wake'
Message-ID: <202306152055.1wFcVsQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kelly,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   e699d543bbc9d7614db3e01323c9321437304286
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [5610/26444] ANDROID: power: wakeup_reason: wake reason enhancements
config: x86_64-randconfig-r022-20230615 (https://download.01.org/0day-ci/archive/20230615/202306152055.1wFcVsQY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout 189ced91cd7b0e440b0be876406fd36313a11c3f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/power/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152055.1wFcVsQY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for function '__log_abort_or_abnormal_wake' [-Wmissing-prototypes]
   void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
        ^
   kernel/power/wakeup_reason.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
   ^
   static 
   kernel/power/wakeup_reason.c:378:12: warning: no previous prototype for function 'wakeup_reason_init' [-Wmissing-prototypes]
   int __init wakeup_reason_init(void)
              ^
   kernel/power/wakeup_reason.c:378:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init wakeup_reason_init(void)
   ^
   static 
   2 warnings generated.


vim +/__log_abort_or_abnormal_wake +199 kernel/power/wakeup_reason.c

   198	
 > 199	void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
   200	{
   201		unsigned long flags;
   202	
   203		spin_lock_irqsave(&wakeup_reason_lock, flags);
   204	
   205		/* Suspend abort or abnormal wake reason has already been logged. */
   206		if (suspend_abort || abnormal_wake) {
   207			spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   208			return;
   209		}
   210	
   211		suspend_abort = abort;
   212		abnormal_wake = !abort;
   213		vsnprintf(non_irq_wake_reason, MAX_SUSPEND_ABORT_LEN, fmt, args);
   214	
   215		spin_unlock_irqrestore(&wakeup_reason_lock, flags);
   216	}
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
