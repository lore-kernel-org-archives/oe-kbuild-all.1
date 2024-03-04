Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883E11CA80
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709586328; cv=none; b=kryLs9V6EaI34rUA7gryUQJ+dAg8A5oHKT37qnPfg9lLJwdLrfvJLNxDqBmSUrenklD+ZHU+5LNysW7I73sEK5KmIaLtmzaa/3s33gTDHzS2m5AZU+isp/ekAO2K2NCZyBb+jqBfebNvB+zenLX2uOqI3DmL9+NXupzAmF5+f7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709586328; c=relaxed/simple;
	bh=fvrnR6RWkmdNFwmJ6EEwAspI9DHJ9dK1N7NiGYw5970=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VURz5sR1u6Zxzql+Mj4EjogzYvfd/mHxASO8C9HTw3kCBsqlPh5U/UpR2NFrrpGhWVD+dVOhLQ5mUJZaL+dlBu1BzUZN9Nzl95fc+fh60sYpAyJhWXrLwJU0ZTejV5vGnOX9wg6syJ7PW3zkjejhHbUbkuomu5Uz6OWPm/GOhg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfnf/DN4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfnf/DN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709586327; x=1741122327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fvrnR6RWkmdNFwmJ6EEwAspI9DHJ9dK1N7NiGYw5970=;
  b=lfnf/DN4IYFyj8ekBvWi5cN3MzmWiWjxuKh+a9EaAbUOw14XIRJggsu7
   0pUQX7HcLK75AIGVK2/BSCB2K00XzNCeXJIBWiLv15dmvknfUAbDguuRH
   g6mNftB1lbIIonEwVijXQh/vluL5hUNSkb3W44UltzW2StlZ1ZcdzDt9h
   G4quBn1KHtACY/dKnb+tvnvjdBnfiUlvbr4C9jwH8VVa8RQ5G73Pe76AQ
   8tuOIE9T3FRXMi9VIUckV0hJtfxIAOWqLvaWjSr9lZpeFHZqwdybrJcW/
   Hvp8gVfqdNc2BmZWKzdaMTOuEQjgTNKK9Zk8SMHCPFnXeuDR82esFZm3y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="21561130"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="21561130"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 13:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="13705842"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Mar 2024 13:05:22 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhFUu-0002ld-1n;
	Mon, 04 Mar 2024 21:05:20 +0000
Date: Tue, 5 Mar 2024 05:04:51 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.phytium 8/41]
 drivers/rtc/rtc-phytium.c:124:12: warning: 'phytium_rtc_alarm_irq_enabled'
 defined but not used
Message-ID: <202403050400.4ZCnAenc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.phytium
head:   974a90e098c75ef0e62d4bbbde4535368a61f98b
commit: ee21e032451ec1ca537bed3d9ec75fa5f76dc03d [8/41] RTC driver support for Phytium desktop and embedded CPUs
config: arm64-randconfig-r051-20240305 (https://download.01.org/0day-ci/archive/20240305/202403050400.4ZCnAenc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050400.4ZCnAenc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050400.4ZCnAenc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_read_time':
   drivers/rtc/rtc-phytium.c:63:23: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
      63 |         unsigned long tmp = 0;
         |                       ^~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_set_mmss':
   drivers/rtc/rtc-phytium.c:80:23: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
      80 |         unsigned long tmp = 0;
         |                       ^~~
   drivers/rtc/rtc-phytium.c:79:23: warning: variable 'counter' set but not used [-Wunused-but-set-variable]
      79 |         unsigned long counter = 0;
         |                       ^~~~~~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_set_alarm':
   drivers/rtc/rtc-phytium.c:134:23: warning: variable 'rtc_time' set but not used [-Wunused-but-set-variable]
     134 |         unsigned long rtc_time;
         |                       ^~~~~~~~
   drivers/rtc/rtc-phytium.c: At top level:
>> drivers/rtc/rtc-phytium.c:124:12: warning: 'phytium_rtc_alarm_irq_enabled' defined but not used [-Wunused-function]
     124 | static int phytium_rtc_alarm_irq_enabled(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/phytium_rtc_alarm_irq_enabled +124 drivers/rtc/rtc-phytium.c

   123	
 > 124	static int phytium_rtc_alarm_irq_enabled(struct device *dev)
   125	{
   126		struct phytium_rtc_dev *pdata = dev_get_drvdata(dev);
   127	
   128		return readl(pdata->csr_base + RTC_CCR) & RTC_CCR_IE ? 1: 0;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
