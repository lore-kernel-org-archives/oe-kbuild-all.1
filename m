Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928DC1876
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 05:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683264118; x=1714800118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cNmzjAe8fLJ9nsv1V4UTxn9a2Zszlkc5d55l1tu1tXc=;
  b=Zl0aG056AAM2MC09+VZDMXFuXFs/l4pVwsCoTde3/cpQis7tdqqqDrCS
   SDlW3Z4yfx2RNnR15h1F81xVaQPjNLXIxFtLV6LYcazmHfregcELc1IwJ
   vRTED113L8JHxeH9NDClkNdBrtxllif+JfMIJmrXJIeuz+gXXu39LH7qr
   Q/9+4V8dk72PZT71V/bAdHBVoptjbQcBHcSsrJ3Q6kHsLK74KuQi/oj7F
   Kr69J89avewBEahnnEXLG/RqcusieGqfTsO/HkTmZ2BeR9WGsFEGRCXTj
   EBBqGOF6Bj5opivUFJAVoZBNa5adDnAU3lLRrWalCesIlqbAtUitQQLmZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="435452901"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="435452901"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 22:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="674874835"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="674874835"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 May 2023 22:21:56 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puntE-0000Br-0L;
	Fri, 05 May 2023 05:21:56 +0000
Date: Fri, 5 May 2023 13:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5610/25679]
 kernel/power/wakeup_reason.c:199:6: sparse: sparse: symbol
 '__log_abort_or_abnormal_wake' was not declared. Should it be static?
Message-ID: <202305051321.ZfrYCPAe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   0779e2b555622658d357b54d96c427bfd8ba8600
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [5610/25679] ANDROID: power: wakeup_reason: wake reason enhancements
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230505/202305051321.ZfrYCPAe-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout 189ced91cd7b0e440b0be876406fd36313a11c3f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051321.ZfrYCPAe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/power/wakeup_reason.c:199:6: sparse: sparse: symbol '__log_abort_or_abnormal_wake' was not declared. Should it be static?
   kernel/power/wakeup_reason.c:378:12: sparse: sparse: symbol 'wakeup_reason_init' was not declared. Should it be static?

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
