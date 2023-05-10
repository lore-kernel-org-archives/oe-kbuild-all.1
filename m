Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB64373
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 03:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683687729; x=1715223729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Oqv+XlnmVvvV7uds14EplZmKg0cLsARcm7y61cNfBBA=;
  b=j2UMvXt7d6602IVdNU60sMbQfUckYn7w9ATL17r26QAjIq050LHzdD/G
   50qveJy1RR2vi9c7MtqSVCd4BP+MWZL9tT40fWuG4R+h9nZwPcJxwSWvC
   dKDW2UmsldAtJvmjDjGnXwJz1daX9OJ5vtcI23cpGM7n1Y98cnmTamhtk
   3G751wtGzWzivxzuElSylVuu80/jUioeAKk6bbJiMy7TM4A3Q21DN5bBk
   eSspjPQyrWLxDYXoMVlUPMvBq+UPrDfUxWZshmQLzibreLDJx8Ne2EtuJ
   kEV/Gi/NSPL3wjbe6cgAEpra2u3ldHTOFPQXaedVBOw5K++YbMyR1MW5B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="334578281"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="334578281"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 20:02:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="702094686"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="702094686"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 May 2023 20:02:08 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwa5f-0002ow-2H;
	Wed, 10 May 2023 03:02:07 +0000
Date: Wed, 10 May 2023 11:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5610/25680]
 kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for
 function '__log_abort_or_abnormal_wake'
Message-ID: <202305101002.IRi8ebcX-lkp@intel.com>
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
head:   6d5e0c7837af8f05f7da31f9204e36185069c6af
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [5610/25680] ANDROID: power: wakeup_reason: wake reason enhancements
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20230510/202305101002.IRi8ebcX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout 189ced91cd7b0e440b0be876406fd36313a11c3f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/purgatory/ kernel/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101002.IRi8ebcX-lkp@intel.com/

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
https://github.com/intel/lkp-tests
