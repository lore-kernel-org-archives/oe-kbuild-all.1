Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09618495
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714753854; cv=none; b=tz9rhAkS2vNuN1zQeP+Q4Vm0l32s9SugU97uM90BvzKAWkVKOVVsy1dyN52ktABN8PhdFStakywlcc/oiY0kCIsRp0/stcl0DQLODijHVjL2/ZSDE/HV+XIqmwmXzeLVehMaGNvNwcuotcZgGNO8+Mwpo/wyagbzc5KNlkb2GOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714753854; c=relaxed/simple;
	bh=ygtQdzbKR11vg6znzEmL2IcMG/WSaW8TdITD2d/NwNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrrKCr7xxx5rU13KPMWxecIhFAmojQATN0QDEen4WQUFIe8hdtayzrIzikOzZd6l/07iBmog9Q4ZftEZxx318mcVNLOrHLYLhWzFmOXJzdJNeYglit4jqO1UBDok9TNBdyxLWftkiw8qeZd0w/T9OzV0lV+1MhgPpFm5aEC9eOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UP9AC0Of; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UP9AC0Of"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714753853; x=1746289853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ygtQdzbKR11vg6znzEmL2IcMG/WSaW8TdITD2d/NwNo=;
  b=UP9AC0OfDBoB2RFvfTsSk47JmTrZTB+cryKHKm8JgkNF+Tr2QOiwwWnU
   dXR505hbNFPHkpAM4OXUDL7NArn/ST1btV+MBsUnMB4SlpUGplu3x6kkB
   q/CE+w1IDXlb7winL05ATj2ee7wKZAugzPpeTbAow5qpTHX2RneB0ZS6v
   kmAAyA4/d1OVpaKMZ330KCm+JHORrmW3YZ4fg2hXp54UPZdkHfJNqI5PI
   /l/EmkY/DqKlUVg9oer/nxg/9XbZX8nAv8uNVYLXLSYPcPKLLPW3x0tRb
   AOSbt94hebyz7xfgY5MUKUGrc0+fY2Xr2TjBCYTEI2e1uapxoe26XExsw
   g==;
X-CSE-ConnectionGUID: Hc2jO5+fQ7u9s+MJDEK1nQ==
X-CSE-MsgGUID: 0vw5l5NoTmGDtmz3ItjGeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10443054"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10443054"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 09:30:43 -0700
X-CSE-ConnectionGUID: mr70WP1eRwm6sZmRKQnYmw==
X-CSE-MsgGUID: wYVD0yuRSuu0Na4X8L5jKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27554101"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 May 2024 09:30:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2vnz-000BtQ-3B;
	Fri, 03 May 2024 16:30:40 +0000
Date: Sat, 4 May 2024 00:30:21 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 187/1143] drivers/rtc/rtc-aspeed.c:148:19:
 warning: variable 'reg2' set but not used
Message-ID: <202405040055.nnA5RRnd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: f963eb104497b49d1943ffd0909169de6f0a004b [187/1143] drivers: rtc: enable rtc and add alarm related rtc ops.
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405040055.nnA5RRnd-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405040055.nnA5RRnd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405040055.nnA5RRnd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-aspeed.c: In function 'aspeed_rtc_read_alarm':
>> drivers/rtc/rtc-aspeed.c:148:19: warning: variable 'reg2' set but not used [-Wunused-but-set-variable]
     148 |         u32 reg1, reg2;
         |                   ^~~~


vim +/reg2 +148 drivers/rtc/rtc-aspeed.c

   144	
   145	static int aspeed_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
   146	{
   147		struct aspeed_rtc *rtc = dev_get_drvdata(dev);
 > 148		u32 reg1, reg2;
   149		unsigned int alarm_enable;
   150		unsigned int alarm_status;
   151	
   152		if (!(readl(rtc->base + RTC_CTRL) & RTC_ENABLE)) {
   153			dev_dbg(dev, "%s failing as rtc disabled\n", __func__);
   154			return -EINVAL;
   155		}
   156	
   157		do {
   158			reg2 = readl(rtc->base + RTC_YEAR);
   159			reg1 = readl(rtc->base + RTC_TIME);
   160		} while (reg1 != readl(rtc->base + RTC_TIME));
   161	
   162		/* read alarm value */
   163		alarm->time.tm_mday = (reg1 >> 24) & 0x1f;
   164		alarm->time.tm_hour = (reg1 >> 16) & 0x1f;
   165		alarm->time.tm_min = (reg1 >> 8) & 0x3f;
   166		alarm->time.tm_sec = (reg1 >> 0) & 0x3f;
   167	
   168		/* don't allow the ALARM read to mess up ALARM_STATUS */
   169		mutex_lock(&rtc->write_mutex);
   170	
   171		alarm_enable = RTC_ALARM_SEC_ENABLE | RTC_ALARM_MIN_ENABLE |
   172			       RTC_ALARM_HOUR_ENABLE | RTC_ALARM_MDAY_ENABLE;
   173		/* alarm is enabled if the interrupt is enabled */
   174		if (readl(rtc->base + RTC_CTRL) & alarm_enable)
   175			alarm->enabled = true;
   176		else
   177			alarm->enabled = false;
   178	
   179		alarm_status = RTC_ALARM_SEC_CB_STATUS | RTC_ALARM_MIN_STATUS |
   180			       RTC_ALARM_HOUR_STATUS | RTC_ALARM_MDAY_STATUS;
   181		if (readl(rtc->base + RTC_ALARM_STATUS) & alarm_status)
   182			alarm->pending = true;
   183		else
   184			alarm->pending = false;
   185	
   186		mutex_unlock(&rtc->write_mutex);
   187	
   188		return 0;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
