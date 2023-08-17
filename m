Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A63C379
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 01:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692234803; x=1723770803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N2EUcxM5gJ2qAx4ZLCPpIBjxdxcCaLW08cZrJoLlfI8=;
  b=gl8xizZakwtNV8BIGcKuedRBbkzsvOWM7VxdiT2PQy2lj9KrHiVPlfyn
   C7Y4QUilydJoAh1hjwnC99oKcC/xmdcN6ASdEhN9yA+gUIAXny0D8EE9c
   eaFcwd+P85FqTXNdnJ0sXX8+wNC7e0bC8ACaU80BDNMzSOwtm3OEVsp+t
   dgs1ua9mhzNQ3pTCqXt+SWFKxIR96HN5FcVeTpbQkVq36CB3N83qA3fje
   g+4VX5H6wl2GpzpHxE5rM4HFLyJekwuD99+dColgoFupesKIT0A4tNB6H
   7pQNgBQufFo35Be+5WcVD1VAPu8QmW93eZAAHfUNUF93q2VysY49YeSlV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357650981"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="357650981"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 18:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="824433823"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="824433823"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2023 18:13:21 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWRZG-0000h5-1F;
	Thu, 17 Aug 2023 01:12:57 +0000
Date: Thu, 17 Aug 2023 09:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13678/30000]
 drivers/rtc/hctosys.c:27:5: warning: no previous declaration for
 'rtc_hctosys'
Message-ID: <202308170943.sBGM9jSy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a89c7b9715e2d482a08b58b698f0cf37da373070
commit: 0b145f91d8fdbe39900356c8ad3ba4e41ce95fab [13678/30000] ANDROID: rtc: class: support hctosys from modular RTC drivers
config: x86_64-buildonly-randconfig-r001-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170943.sBGM9jSy-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170943.sBGM9jSy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170943.sBGM9jSy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/hctosys.c:27:5: warning: no previous declaration for 'rtc_hctosys' [-Wmissing-declarations]
    int rtc_hctosys(void)
        ^~~~~~~~~~~
   drivers/rtc/hctosys.o: warning: objtool: missing symbol for section .text


vim +/rtc_hctosys +27 drivers/rtc/hctosys.c

    15	
    16	/* IMPORTANT: the RTC only stores whole seconds. It is arbitrary
    17	 * whether it stores the most close value or the value with partial
    18	 * seconds truncated. However, it is important that we use it to store
    19	 * the truncated value. This is because otherwise it is necessary,
    20	 * in an rtc sync function, to read both xtime.tv_sec and
    21	 * xtime.tv_nsec. On some processors (i.e. ARM), an atomic read
    22	 * of >32bits is not possible. So storing the most close value would
    23	 * slow down the sync API. So here we have the truncated value and
    24	 * the best guess is to add 0.5s.
    25	 */
    26	
  > 27	int rtc_hctosys(void)
    28	{
    29		int err = -ENODEV;
    30		struct rtc_time tm;
    31		struct timespec64 tv64 = {
    32			.tv_nsec = NSEC_PER_SEC >> 1,
    33		};
    34		struct rtc_device *rtc = rtc_class_open(CONFIG_RTC_HCTOSYS_DEVICE);
    35	
    36		if (rtc == NULL) {
    37			pr_info("unable to open rtc device (%s)\n",
    38				CONFIG_RTC_HCTOSYS_DEVICE);
    39			goto err_open;
    40		}
    41	
    42		err = rtc_read_time(rtc, &tm);
    43		if (err) {
    44			dev_err(rtc->dev.parent,
    45				"hctosys: unable to read the hardware clock\n");
    46			goto err_read;
    47	
    48		}
    49	
    50		tv64.tv_sec = rtc_tm_to_time64(&tm);
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
