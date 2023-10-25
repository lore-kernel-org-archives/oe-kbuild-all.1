Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EA01386
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 02:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0EX6wIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698202125; x=1729738125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q1iOGyeXNGObEn5+pOwahyJsYg5W5zn98HxAib4rFdo=;
  b=P0EX6wIqtUQ9MLlXYseg2/XOtXytu23jDNsdzkcUd7ZciaqwnuzYMSzJ
   JgB7OcXAc5QQpMVCh1kaVisHE3UXJaE2yvmFs4UgDbOw2R7IKNAwqdWVK
   L4hYtUK81tfizaadjmZcnEqVQPGW0W+Dg4uoApF1ixkcFIZePNuMPnTS3
   ENJuVRO9++TSrTfywZO9wTi1gcdxYNJJlN0dwf40qjm8MHKvacdkP5jIO
   RTs0D//kxc6swTu4KbB9lIG27ntepvOgw91ejEJGV6suACMnvlCK/+Ei2
   Q8MC9H61P/2XkHiv1CMJCeGLk6VVJaCZZsf2tXbniymu+FjfE3EZP2jrK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="366570064"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="366570064"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 19:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="735245535"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="735245535"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Oct 2023 19:48:43 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvTwn-0008YD-0E;
	Wed, 25 Oct 2023 02:48:41 +0000
Date: Wed, 25 Oct 2023 10:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 3942/27782]
 drivers/rtc/hctosys.c:24:5: warning: no previous declaration for
 'rtc_hctosys'
Message-ID: <202310251034.R7cxmq8L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   fda8861893ecfbcb5775c1ac8ec20e41ce326e42
commit: 5f378fd56aa3988be21e859254a2d72628d044c6 [3942/27782] ANDROID: rtc: class: support hctosys from modular RTC drivers
config: i386-randconfig-013-20231025 (https://download.01.org/0day-ci/archive/20231025/202310251034.R7cxmq8L-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310251034.R7cxmq8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310251034.R7cxmq8L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/hctosys.c:24:5: warning: no previous declaration for 'rtc_hctosys' [-Wmissing-declarations]
    int rtc_hctosys(void)
        ^~~~~~~~~~~


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
