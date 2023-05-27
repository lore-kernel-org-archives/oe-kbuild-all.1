Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7996F7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 07:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685171037; x=1716707037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XfzNrlLKKG2G0oXKmWLAfoZsYAwJgNOqCbQKdgHzGnA=;
  b=gKsFCaK9wGNQvBCnZbSSJUpcmBbGBPoOOnzVddcXAcEzRPBEFxlaZ419
   KORux0Culzh/IhJSvvBIVXmQS/MJPgfrrw/JKx3M8rDGcRSrkYEaNO0kD
   OI79b2j8KxtYaKYl+tJ8V2vlCywZBPEEiAsome7UR0oG5Iwu4TfE11ELl
   Mj29w+dNr7kcM41KS0DXq021aMAGhBJanQOSh+RQHmDj1mL8g3hA+V1rb
   p14zDMujGRnAdOpDPwndsjG1BW4Jz4XIApnUmcrYaEUNFiUh08jrlbhOJ
   UstUJ69R3YvukhXgFiaygb6pTG5GTYG/j/LsWQrtQKiB7KHPJK7YtD+nv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440730169"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="440730169"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 00:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="775317035"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="775317035"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 May 2023 00:03:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2nxy-000JpI-34;
	Sat, 27 May 2023 07:03:54 +0000
Date: Sat, 27 May 2023 15:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 5610/26678]
 kernel/power/wakeup_reason.c:199:6: sparse: sparse: symbol
 '__log_abort_or_abnormal_wake' was not declared. Should it be static?
Message-ID: <202305271415.0OfZl1Es-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   004fc6b8240feb7fc470534b3d82ca01e0bc1f34
commit: 189ced91cd7b0e440b0be876406fd36313a11c3f [5610/26678] ANDROID: power: wakeup_reason: wake reason enhancements
config: arm64-randconfig-s032-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271415.0OfZl1Es-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-kiwi-5.4
        git checkout 189ced91cd7b0e440b0be876406fd36313a11c3f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271415.0OfZl1Es-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
