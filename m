Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02045944A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 May 2023 20:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683060821; x=1714596821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OV9jVkUjJYrbUIAW7vBLmyDgj2xpso4osx+Q09Z6P8s=;
  b=Sl0GxloPwUgSJM/faNdapuWG5y7C6fG9sT4CHr7mHXkZuUw+Q8t0wnTD
   BjiEDqjWf/FUYYkFXcdM2QdUYHmfNldb62WBXcNL1iH/uZiJh+j5DQjN6
   Ib46AAXBiTVqClERxQyEzdfTvA3X4BFHD6RhP4xe1miL9QhvmHJnHdYjx
   X/X7EFtuhJpwL/1LsRoqYdH8Yxu4K/sTXs0xG5xvlio72JbzGutZExuXk
   FcABydrlBynRRVWxEvS6mkslZj/AEsCI+nPyARtqXiMTcI2N++tCTDoKc
   oHGZ7NO3rL02L5b8MQxUTHDQRksM9FPB9g4khdvw2A4dqfrquVWiRb9Td
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="337637713"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="337637713"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 13:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="690433110"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="690433110"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 May 2023 13:53:38 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptx0E-0001Hc-03;
	Tue, 02 May 2023 20:53:38 +0000
Date: Wed, 3 May 2023 04:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5610/25674]
 kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for
 '__log_abort_or_abnormal_wake'
Message-ID: <202305030422.PU31fMGx-lkp@intel.com>
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
head:   edbf3d0e067c6c4acf19d8ede1aa69ef4b552fdc
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [5610/25674] ANDROID: power: wakeup_reason: wake reason enhancements
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230503/202305030422.PU31fMGx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout 189ced91cd7b0e440b0be876406fd36313a11c3f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305030422.PU31fMGx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for '__log_abort_or_abnormal_wake' [-Wmissing-prototypes]
     199 | void __log_abort_or_abnormal_wake(bool abort, const char *fmt, va_list args)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/power/wakeup_reason.c: In function '__log_abort_or_abnormal_wake':
   kernel/power/wakeup_reason.c:213:9: warning: function '__log_abort_or_abnormal_wake' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     213 |         vsnprintf(non_irq_wake_reason, MAX_SUSPEND_ABORT_LEN, fmt, args);
         |         ^~~~~~~~~
   kernel/power/wakeup_reason.c: At top level:
   kernel/power/wakeup_reason.c:378:12: warning: no previous prototype for 'wakeup_reason_init' [-Wmissing-prototypes]
     378 | int __init wakeup_reason_init(void)
         |            ^~~~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
