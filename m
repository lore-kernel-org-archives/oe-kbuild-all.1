Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529707E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 02:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683080569; x=1714616569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=et/eZH8+P9Aj86pPI64didOB1ex3xLNeKbfY9i1EuHM=;
  b=KLVcgYWZm7E5ciW3xczLbdHOoWIUM2KZ5x+HbehCOKyp12CUrMY6e0J1
   aVGyNRUacLvkH/PKEfveW/mzdVYt01z0ZqJKfswzcXJtrtE4puyjuL6uM
   S+xu8NxX/Mz2HIDBSUuDhsZlZHz1CQRMRWNVj9TzTXGACexI3mZmb1dov
   4dLm5QVI/F/BCDuXNM472X3MARQkI2Q2yW1fI+zXmZaQVHjOPUaMgP/AI
   nacc+FzV3QQGMeCTG+2606HnnlmHqWBpP0POZ/UNeeLGNKINeredl+1CJ
   eIJzXrZrIBYsjiw99JXVmlKFSi94xI+MxJcTsOAqtVMi+dAL5DYDazYIT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="346029821"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="346029821"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 19:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="729168001"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="729168001"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 May 2023 19:22:47 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pu28k-0001QO-1B;
	Wed, 03 May 2023 02:22:46 +0000
Date: Wed, 3 May 2023 10:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5610/25674]
 kernel/power/wakeup_reason.c:199:6: warning: no previous prototype for
 function '__log_abort_or_abnormal_wake'
Message-ID: <202305031049.Aib4RNR2-lkp@intel.com>
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
config: x86_64-randconfig-a013-20230501 (https://download.01.org/0day-ci/archive/20230503/202305031049.Aib4RNR2-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/extcon/ drivers/gpu/drm/mxsfb/ drivers/hid/ drivers/hwtracing/intel_th/ drivers/infiniband/core/ drivers/nvdimm/ drivers/scsi/fcoe/ drivers/scsi/libfc/ fs/afs/ kernel/power/ net/mac802154/ net/openvswitch/ net/tls/ net/unix/ net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305031049.Aib4RNR2-lkp@intel.com/

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
