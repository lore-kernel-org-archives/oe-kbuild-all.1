Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB6381B4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705856425; cv=none; b=WsAJN/rxFcxWgnlNtGbjUOVHR65h5GIy6klznByftybVjqoLWgYOIcRAFGlGpMqgRr3vxpTkdMFP2oL2e8mlDiMp4h87/jokLkewlys9saHqO1RyntHaHO1KhOTFv1hTuPi4xI9WecV6AxtIq5dJfXzEdi/LBALc7E98lg+FalY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705856425; c=relaxed/simple;
	bh=4kifNtFhbsVdvI7NAAIcRll4FeCxSZCMyaQQywPhX6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=okK3hjZxJI17fKsehOJgxb0t+EnpXoYt0Q5+v1vJlNFz+q6RhktSdJUfm5eNT2y8t5VMRNPeuA4pdmkqYdeybm9FS+oOEpwP1W3ARCseuOu0oSOweM6a/FjEGwaIva+cCCiseC0mV6tFvzaEVDmxvLor1X4H7gueLn10oVaU0vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHeftqjM; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHeftqjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705856423; x=1737392423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kifNtFhbsVdvI7NAAIcRll4FeCxSZCMyaQQywPhX6s=;
  b=kHeftqjMK9n7n7+uVfjdm3rndJ8C1HoxpW1VkwpdkQ6Y8Xtcd345qC//
   UOhWwBPlKbNdJqRQcEmEbPF2gwkngFDBzVeLwx3grRu3lTzt2CWqY4nSz
   3URqbAoYca517thp1KTwnAoPeTnBPFXw5TIqk+BGhxGNzxp1VhNGjTuTG
   qRuywT59iB6YLLV4koM6JK3T0i/KJDJCNOsS0eo8Yxlrs5e8HPiRLePqM
   JB4OuuHULSwURgfiP3TNhhj7VcF9UswF11XXkK9OcfooSod1WM1rNGurK
   1o4o9iA1Nya5xygjhbcMGg/IcMXF0gsPZVaLhnfJLJdeQ3f+qsMi1xYJj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="398206699"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="398206699"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 09:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="761536763"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="761536763"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Jan 2024 09:00:20 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRbBB-000658-2E;
	Sun, 21 Jan 2024 17:00:17 +0000
Date: Mon, 22 Jan 2024 00:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21358/21561]
 drivers/rtc/rtc-phytium.c:65:23: warning: variable 'tmp' set but not used
Message-ID: <202401220030.RR66GHaX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d29fbb6f9321a629cbf0ca30f15ce6f333ed7b9
commit: 1ce24a39db64afc5041e3a32893f3e5f1f5d4b9d [21358/21561] rtc: add rtc drivers for Phytium SOCs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240122/202401220030.RR66GHaX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220030.RR66GHaX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220030.RR66GHaX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_read_time':
>> drivers/rtc/rtc-phytium.c:65:23: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
      65 |         unsigned long tmp = 0;
         |                       ^~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_set_mmss':
   drivers/rtc/rtc-phytium.c:85:23: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
      85 |         unsigned long tmp = 0;
         |                       ^~~
>> drivers/rtc/rtc-phytium.c:84:23: warning: variable 'counter' set but not used [-Wunused-but-set-variable]
      84 |         unsigned long counter = 0;
         |                       ^~~~~~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_set_alarm':
>> drivers/rtc/rtc-phytium.c:139:23: warning: variable 'rtc_time' set but not used [-Wunused-but-set-variable]
     139 |         unsigned long rtc_time;
         |                       ^~~~~~~~


vim +/tmp +65 drivers/rtc/rtc-phytium.c

    59	
    60	static int phytium_rtc_read_time(struct device *dev, struct rtc_time *tm)
    61	{
    62		struct phytium_rtc_dev *pdata = dev_get_drvdata(dev);
    63	
    64		unsigned long counter = 0;
  > 65		unsigned long tmp = 0;
    66	
    67		spin_lock(&spinlock_phytium_rtc);
    68		writel(RTC_AES_SEL_COUNTER, pdata->csr_base + RTC_AES_SEL);
    69		counter = readl(pdata->csr_base + RTC_CCVR);
    70		tmp = readl(pdata->csr_base + RTC_CDR_LOW);
    71	
    72		dev_info(dev, "%s_%d : counter : 0x%lx\n",
    73		__func__, __LINE__, counter);
    74	
    75		spin_unlock(&spinlock_phytium_rtc);
    76	
    77		rtc_time_to_tm(counter, tm);
    78		return rtc_valid_tm(tm);
    79	}
    80	
    81	static int phytium_rtc_set_mmss(struct device *dev, unsigned long secs)
    82	{
    83		struct phytium_rtc_dev *pdata = dev_get_drvdata(dev);
  > 84		unsigned long counter = 0;
    85		unsigned long tmp = 0;
    86	
    87		spin_lock(&spinlock_phytium_rtc);
    88	
    89		writel(RTC_AES_SEL_COUNTER, pdata->csr_base + RTC_AES_SEL);
    90		writel(0x00000000, pdata->csr_base + RTC_CLR_LOW);
    91		writel((u32)secs, pdata->csr_base + RTC_CLR);
    92		writel(RTC_AES_SEL_COUNTER, pdata->csr_base + RTC_AES_SEL);
    93		counter = readl(pdata->csr_base + RTC_CLR);
    94		tmp = readl(pdata->csr_base + RTC_CLR_LOW);
    95	
    96		spin_unlock(&spinlock_phytium_rtc);
    97	
    98		return 0;
    99	}
   100	
   101	static int phytium_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
   102	{
   103		struct phytium_rtc_dev *pdata = dev_get_drvdata(dev);
   104	
   105		rtc_time_to_tm(pdata->alarm_time, &alrm->time);
   106		alrm->enabled = readl(pdata->csr_base + RTC_CCR) & RTC_CCR_IE;
   107	
   108		return 0;
   109	}
   110	
   111	static int phytium_rtc_alarm_irq_enable(struct device *dev, u32 enabled)
   112	{
   113		struct phytium_rtc_dev *pdata = dev_get_drvdata(dev);
   114		u32 ccr;
   115	
   116		ccr = readl(pdata->csr_base + RTC_CCR);
   117		if (enabled) {
   118			ccr &= ~RTC_CCR_MASK;
   119			ccr |= RTC_CCR_IE;
   120		} else {
   121			ccr &= ~RTC_CCR_IE;
   122			ccr |= RTC_CCR_MASK;
   123		}
   124		writel(ccr, pdata->csr_base + RTC_CCR);
   125	
   126		return 0;
   127	}
   128	
   129	static int phytium_rtc_alarm_irq_enabled(struct device *dev)
   130	{
   131		struct phytium_rtc_dev *pdata = dev_get_drvdata(dev);
   132	
   133		return readl(pdata->csr_base + RTC_CCR) & RTC_CCR_IE ? 1 : 0;
   134	}
   135	
   136	static int phytium_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
   137	{
   138		struct phytium_rtc_dev *pdata = dev_get_drvdata(dev);
 > 139		unsigned long rtc_time;
   140		unsigned long alarm_time;
   141	
   142		rtc_time = readl(pdata->csr_base + RTC_CCVR);
   143		rtc_tm_to_time(&alrm->time, &alarm_time);
   144	
   145		pdata->alarm_time = alarm_time;
   146		writel((u32) pdata->alarm_time, pdata->csr_base + RTC_CMR);
   147	
   148		phytium_rtc_alarm_irq_enable(dev, alrm->enabled);
   149	
   150		return 0;
   151	}
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
