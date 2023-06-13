Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620D22581
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 08:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686643425; x=1718179425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KLbCQJEhIllK63ICtQ+5udIYQn2nDWBVN/1vlG4Qpgw=;
  b=CMv4n5rjvN/SjH2Lu5pGMJn8od485jdLqFv5Qfvgds7xQWk6D2X16FOu
   +kTJhYnck/8SEd0Vr00WjsM6kYvRcvwKhkTX8oLGDmhBdNKxSSpmkoywE
   Vi5E0oSXnQqN+CbU9cbJfIbo3uoH2mf1a4NCIhH5GR0nSMe7dXWhWj2eO
   LVR353CsevcYjW0kprpCZ+sbBTmTQ8HkodwqhsTvJv/zam1pBWb+E8r67
   B5HB8xi7zKyg4T1Isx8aG3VzGpWY2JqIksuVrtHEk9lh2y5d9OzLCDUm9
   bmRwWEOoKmNa9fWi/1zwBxG+nRhb43TxWGpKfUWPkgGlZO794Dm2YJU9C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342950825"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="342950825"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 01:03:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="1041675168"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="1041675168"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2023 01:03:42 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8z09-00017U-2l;
	Tue, 13 Jun 2023 08:03:41 +0000
Date: Tue, 13 Jun 2023 16:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 3942/27777]
 drivers/rtc/hctosys.c:24:5: warning: no previous prototype for function
 'rtc_hctosys'
Message-ID: <202306131550.AlfT8DqG-lkp@intel.com>
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
head:   39a9b92e9828f28d3c1bfae81b3121d973b76ad3
commit: 5f378fd56aa3988be21e859254a2d72628d044c6 [3942/27777] ANDROID: rtc: class: support hctosys from modular RTC drivers
config: x86_64-randconfig-r003-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131550.AlfT8DqG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 5f378fd56aa3988be21e859254a2d72628d044c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/rtc/ lib/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131550.AlfT8DqG-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
