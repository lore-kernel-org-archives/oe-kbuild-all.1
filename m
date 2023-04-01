Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7322915
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 10:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680346405; x=1711882405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d3q/M1aW9NNZmjM/fU6rvDWwmvq1CTejBNAlB0BK3bk=;
  b=dEXSUAMuT0IzT+OTxB5TgwITu1wW4myPhP1RH7e4RWrAnSOQMYOZAoMz
   1h+pOfNc/TpdZt68+6TodcmGnKiyPGJSwFJ0Z46KK3O2FA1/DV4hVNnhx
   jggr12tkf1HbG5TttMMkeOy2BPELBHuIWof4lwfjhG2K9gEu6TS8UN0Lp
   UByM52NnIW4aOvgTnDi42Qim7lGZzoyxwIOYQkkj0/nJ5WUVVFdRPAVIW
   xGjo2IaX2oKW8rIDk1MEBIhhoOxwbuKKlTsqNznJSc37LyJsbRoeX+Wi5
   QGTZufyYDsdktG72FAi5lksRelV5u13l/urU8mcdDAX6btrt/7zaGDegR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321291476"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="321291476"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 03:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="809315558"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="809315558"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Apr 2023 03:53:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piYrK-000MhV-2x;
	Sat, 01 Apr 2023 10:53:22 +0000
Date: Sat, 1 Apr 2023 18:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 30/32] htmldocs:
 ./include/uapi/linux/gunyah.h:262: warning: expecting prototype for
 ANDROID(). Prototype was for GH_ANDROID_IOCTL_TYPE() instead
Message-ID: <202304011833.HtKcAyDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   3a7f9f00f0500643853288cac4034d33d20a167f
commit: 657af3fa64ff383e317895978f865822dd000a41 [30/32] ANDROID: gunyah: vm_mgr: Add lent memory
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 657af3fa64ff383e317895978f865822dd000a41
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011833.HtKcAyDh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/uapi/linux/gunyah.h:262: warning: expecting prototype for ANDROID(). Prototype was for GH_ANDROID_IOCTL_TYPE() instead

vim +262 ./include/uapi/linux/gunyah.h

   256	
   257	/**
   258	 * ANDROID: android14-6.1 unfortunately contains UAPI that won't be carried
   259	 * in kernel.org. Expose orthogonal ioctls that will never conflict with
   260	 * kernel.org for these UAPIs. See b/268234781.
   261	 */
 > 262	#define GH_ANDROID_IOCTL_TYPE		'A'
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
