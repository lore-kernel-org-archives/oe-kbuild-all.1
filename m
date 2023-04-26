Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C9D6ADC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 19:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682537813; x=1714073813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZeBJDvoNGRvLCXl6gWcEeOEBIgiOy7IfNluC1I2XMc=;
  b=MJoKqrHQ6eafukIfNwd8W8YVE3UQCwSh3vdrwq4gE7o4hUQsPtjPiaXx
   /DSB2T7Gg/vDQ8tGgRiL3LKLBrP9LCav+Ix7QU3KLjlxEP4XXWl25lLGG
   D60ufdoLfTrDIg29MIERGw9GxG1I8pgtuHUd85BcRyn0uf3UgHwBjMfr9
   cBkdfTt5pDNWmNkKAADbJRwVsjQB9SHzmeBcoxuhRzcQ//mhTCqMwiOt4
   vQjwdljNBAWz/EEEW/WBNakGQBlxwv7zmHOvR+QBrvQgPdG9XgcR0mirY
   e1KPgHhB8md4Eb2yS2YZLbh7+2H35npuY4YLlYBGay6NZcsOsybfJ6zNy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="345975220"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="345975220"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 12:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="783448168"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="783448168"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Apr 2023 12:36:51 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prkwc-0000Tq-2b;
	Wed, 26 Apr 2023 19:36:50 +0000
Date: Thu, 27 Apr 2023 03:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 3942/27007]
 drivers/rtc/hctosys.c:24:5: warning: no previous prototype for function
 'rtc_hctosys'
Message-ID: <202304270348.lYT76t9s-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   8a14194b61dad2ebb4f6ccef25f1e13c77e42a45
commit: 5f378fd56aa3988be21e859254a2d72628d044c6 [3942/27007] ANDROID: rtc: class: support hctosys from modular RTC drivers
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230427/202304270348.lYT76t9s-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 5f378fd56aa3988be21e859254a2d72628d044c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mmc/host/ drivers/rtc/ lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270348.lYT76t9s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/hctosys.c:24:5: warning: no previous prototype for function 'rtc_hctosys' [-Wmissing-prototypes]
   int rtc_hctosys(void)
       ^
   drivers/rtc/hctosys.c:24:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rtc_hctosys(void)
   ^
   static 
   1 warning generated.


vim +/rtc_hctosys +24 drivers/rtc/hctosys.c

    12	
    13	/* IMPORTANT: the RTC only stores whole seconds. It is arbitrary
    14	 * whether it stores the most close value or the value with partial
    15	 * seconds truncated. However, it is important that we use it to store
    16	 * the truncated value. This is because otherwise it is necessary,
    17	 * in an rtc sync function, to read both xtime.tv_sec and
    18	 * xtime.tv_nsec. On some processors (i.e. ARM), an atomic read
    19	 * of >32bits is not possible. So storing the most close value would
    20	 * slow down the sync API. So here we have the truncated value and
    21	 * the best guess is to add 0.5s.
    22	 */
    23	
  > 24	int rtc_hctosys(void)
    25	{
    26		int err = -ENODEV;
    27		struct rtc_time tm;
    28		struct timespec64 tv64 = {
    29			.tv_nsec = NSEC_PER_SEC >> 1,
    30		};
    31		struct rtc_device *rtc = rtc_class_open(CONFIG_RTC_HCTOSYS_DEVICE);
    32	
    33		if (!rtc) {
    34			pr_info("unable to open rtc device (%s)\n",
    35				CONFIG_RTC_HCTOSYS_DEVICE);
    36			goto err_open;
    37		}
    38	
    39		err = rtc_read_time(rtc, &tm);
    40		if (err) {
    41			dev_err(rtc->dev.parent,
    42				"hctosys: unable to read the hardware clock\n");
    43			goto err_read;
    44		}
    45	
    46		tv64.tv_sec = rtc_tm_to_time64(&tm);
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
