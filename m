Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF798EA0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 20:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686602950; x=1718138950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DuR3Mukky86FBCd65H8AtVQWyt7WrFN4rvrigdlzgLo=;
  b=M27Rt2Q94ZalqE9z2Tu0LWKsoQluNIq/jozpoCVCIEQdTRHVSbExXLWD
   qVyWyRLDg4oNDb+405wXcN3QZypZ3k/KjjM3Fq8OvVaCmY0dR9s777EoM
   S18o0N9XHu1pRPBFvlk7RBQehWz1Mrcuwv8+FM1tz9vwjFwn2vJKyB1UW
   jaC02CFUjbq9DGeORZWNZxED8uRxK63UfypsZ8mgg+sqJf1gKKQfotmD/
   LkNBb1wAs0Bv1GoXX7kHthHdQC4ciJUmYC0zKzRCgUc/K4j9bx2aSKKov
   fpG2whzpuCyf+kTQ2L8Vhx/I42odW3mJuUxeaHz3Rm5/kdO9jn86I+qUh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="386547161"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="386547161"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 13:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711360379"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="711360379"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jun 2023 13:49:07 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8oTK-0000hQ-1Q;
	Mon, 12 Jun 2023 20:49:06 +0000
Date: Tue, 13 Jun 2023 04:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 3942/27775]
 drivers/rtc/hctosys.c:24:5: warning: no previous prototype for 'rtc_hctosys'
Message-ID: <202306130441.fcsct95k-lkp@intel.com>
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
head:   e77ffdfd7269cc7a5b05a0a072f3063161d8b5ee
commit: 5f378fd56aa3988be21e859254a2d72628d044c6 [3942/27775] ANDROID: rtc: class: support hctosys from modular RTC drivers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230613/202306130441.fcsct95k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 5f378fd56aa3988be21e859254a2d72628d044c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/rtc/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130441.fcsct95k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/hctosys.c:24:5: warning: no previous prototype for 'rtc_hctosys' [-Wmissing-prototypes]
      24 | int rtc_hctosys(void)
         |     ^~~~~~~~~~~


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
