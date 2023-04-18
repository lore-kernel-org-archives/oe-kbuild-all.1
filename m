Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4A12572
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 13:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681823565; x=1713359565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hnQZ2tty3f5/OgQf1LsEwU7GqZY3GsTZG/g2X9O6714=;
  b=HN1UvOo5Kvc/gytc5qmBMn2mZd/alclC4483qeP4qnasX6Vd+FFvR8L0
   K6tri/EQA2Mp01qWIbcW//ji7+6tE6WXWM+t8KsLcr5hwn075J/MCszyg
   XrJxebkL1Kxa4X/T2E//sgsljt/gdJoovnZX/L4YAfOY5kgqpFvCXU9hf
   Pfm9M09/cOEfKgWd1uwz0p3OQjUwABxrbtIH7O2Zsay7U+iT5mNoc8WX2
   HAWRtbnKKhYItFYIYIj7vTICvaxgfYT7onMpHeTeJhGmEohepicSHFG/L
   EwWaDOFeqPa/ylsHkxcaU/fWZNroL6YPK7MA1tDqOoCcGVPnfAhtzrS9T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="410384825"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="410384825"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 06:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="755694439"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="755694439"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Apr 2023 06:12:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pol8V-000dTa-1A;
	Tue, 18 Apr 2023 13:12:43 +0000
Date: Tue, 18 Apr 2023 21:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13748/29414]
 drivers/rtc/hctosys.c:27:5: warning: no previous prototype for 'rtc_hctosys'
Message-ID: <202304182110.pEYO0yYT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steve,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   9b68392a2b5860995364db295d0d869b413fdfdf
commit: 0b145f91d8fdbe39900356c8ad3ba4e41ce95fab [13748/29414] ANDROID: rtc: class: support hctosys from modular RTC drivers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230418/202304182110.pEYO0yYT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 0b145f91d8fdbe39900356c8ad3ba4e41ce95fab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/rtc/ drivers/usb/host/ kernel/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304182110.pEYO0yYT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/hctosys.c:27:5: warning: no previous prototype for 'rtc_hctosys' [-Wmissing-prototypes]
      27 | int rtc_hctosys(void)
         |     ^~~~~~~~~~~


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
https://github.com/intel/lkp-tests
