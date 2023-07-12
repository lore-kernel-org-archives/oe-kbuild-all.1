Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0514F95
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 16:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689180790; x=1720716790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eEj6DDSZX2YfNcARYHoU0IfdgLSnrq1NLrpkZp6oKU=;
  b=E/KhOD3RJ00njqUdCZSi1+ntW7jA/9OcPfSdnESIxY2gYCn8jESqTFcq
   kFl+TS+sdRWrah6vlV7O6Zrn1kxh8aTgp+DqKEciBAAIGnhQ7Y8fNHVUF
   8WGoOYBLj1NcXjq3tOTOxoXKoxPGmC4MkIz7/0NTxvmHDCUaLwqfGAA85
   P9Hjkmo0drfBQHZcG+8i61lfi9e492vkpTJfQeysVQK30/5aE/qRJfTzU
   80p2nn2EEIZkgglahFhrRGjgrf+81rH90ZUHdFPB/tObjV3k1BdUOp/JV
   cbe0u+7hXOGEtYLC0nx0yF89QYsjBkUHQpIRo3mtpSMbJzQePt3DP+BiL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="364975910"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="364975910"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 09:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="671940212"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="671940212"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Jul 2023 09:53:02 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJd5J-0005rN-31;
	Wed, 12 Jul 2023 16:53:01 +0000
Date: Thu, 13 Jul 2023 00:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/27] kernel/time/hrtimer.c:990:6: sparse:
 sparse: symbol 'hrtimer_switch_to_lres' was not declared. Should it be
 static?
Message-ID: <202307130047.Yb9iuu9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   b2dc8e4c888801835618a1cefb5530358116c53b
commit: b9937f09c9e0ab857c06ec9360be17f860be5d42 [8/27] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: i386-randconfig-i062-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130047.Yb9iuu9r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130047.Yb9iuu9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130047.Yb9iuu9r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/hrtimer.c:990:6: sparse: sparse: symbol 'hrtimer_switch_to_lres' was not declared. Should it be static?
   kernel/time/hrtimer.c:176:33: sparse: sparse: context imbalance in 'lock_hrtimer_base' - wrong count at exit
   kernel/time/hrtimer.c:1320:28: sparse: sparse: context imbalance in 'hrtimer_start_range_ns' - unexpected unlock
   kernel/time/hrtimer.c:1355:28: sparse: sparse: context imbalance in 'hrtimer_try_to_cancel' - unexpected unlock
   kernel/time/hrtimer.c:1476:9: sparse: sparse: context imbalance in '__hrtimer_get_remaining' - unexpected unlock

vim +/hrtimer_switch_to_lres +990 kernel/time/hrtimer.c

   986	
   987	/*
   988	 * Switch to low resolution mode
   989	 */
 > 990	void hrtimer_switch_to_lres(void)
   991	{
   992		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
   993	
   994		if (!__hrtimer_hres_active(base))
   995			return;
   996	
   997		tick_nohz_hres_to_lres();
   998		base->hres_active = 0;
   999		hrtimer_resolution = LOW_RES_NSEC;
  1000	}
  1001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
