Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639D4161339
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724836808; cv=none; b=PyR+nc4U8IwbMjgCFJOXVjAamfDIZFg96l6NazpAba8dFLqvxWWjZkbbnCtUclQg7hcdQ8Qx/XUKhXpuhSN/KftUrV16jRDSGqYpzfl1PXlYMY6y1mwS6hAvWNSyx/FPrUzbGWZA93mrnyhiGUGutt7bOTmQhQzT8xX0ACUFSxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724836808; c=relaxed/simple;
	bh=hu883E1FxjVyQTtyknLveLynp6p7J0+GSlG4ENdgxUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivgHai4y6NPOxKq1e6Yiy7ZTCdx+zrLGhIJx4XmqhYrwcLuGzbbCY8B01qannCWmODCi7lQVIaCRcs8Y0wmy7Jqf0Q2qw4JB+p0ea8FtY0ZJHt9UoFsA6Gpq129Z8WlDEQQIi6vJACtlkpnP3oiNUoZvVxhuhYlr6pRvmhiCgYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1aZ+Hjf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1aZ+Hjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724836807; x=1756372807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hu883E1FxjVyQTtyknLveLynp6p7J0+GSlG4ENdgxUU=;
  b=W1aZ+Hjf0rodAHX1wF9EIZMI3WQ9Ccz3CgCfA8cAyZCSzPjvA/0ttA+r
   +H2u9ES6+hwyff36kYl/1MRoBBDAZzVAMNRyWudxTv8+HQAGY632pHi0B
   ZIxBD0oBDEddcKLbrDUT8YrmyZXfkAMZ5ZWPh9Vhx7MrBSUattfNqzN5L
   uqkU/UZYi1Kx30ztXnqIcwuEyy5i6ECEnTouf/3Rn00+vi1ioSS9nsrJE
   n2D9QIjMw1L0Ee7zfGfiIHA6qQOVFoFu9qKoIGdil96YoG39rIPge5ujc
   MtSIALSXEACc+cjZL051Dr18WtbBySL04W9CxGYQcG3ZBZJG4g/jKNRCm
   Q==;
X-CSE-ConnectionGUID: FpqxYw/CS6++u08imUGb8g==
X-CSE-MsgGUID: h3tiMkEiQgWyluqrEyOxLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48740546"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="48740546"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 02:20:06 -0700
X-CSE-ConnectionGUID: Pt4rjWGjQcKZPk14WOlAYA==
X-CSE-MsgGUID: rBPFDe7NRPqAj1M9ZhODcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="67314408"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Aug 2024 02:20:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjEqR-000KjG-0R;
	Wed, 28 Aug 2024 09:20:03 +0000
Date: Wed, 28 Aug 2024 17:20:02 +0800
From: kernel test robot <lkp@intel.com>
To: xuxiang <xuxiang@eswincomputing.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 18/24] drivers/rtc/rtc-eswin.c:113:23: warning:
 variable 'rtc_time' set but not used
Message-ID: <202408281743.j1XDEvG0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: 36a8667f93cd7cea30fc8617f3fb00c73a3bf832 [18/24] drivers: rtc: Added EIC7700 Internal RTC driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240828/202408281743.j1XDEvG0-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281743.j1XDEvG0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281743.j1XDEvG0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-eswin.c: In function 'eswin_rtc_set_alarm':
>> drivers/rtc/rtc-eswin.c:113:23: warning: variable 'rtc_time' set but not used [-Wunused-but-set-variable]
     113 |         unsigned long rtc_time;
         |                       ^~~~~~~~


vim +/rtc_time +113 drivers/rtc/rtc-eswin.c

   109	
   110	static int eswin_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
   111	{
   112		struct eswin_rtc_dev *pdata = dev_get_drvdata(dev);
 > 113		unsigned long rtc_time;
   114		unsigned long alarm_time;
   115		rtc_time = readl(pdata->csr_base + RTC_CCVR);
   116		alarm_time = rtc_tm_to_time64(&alrm->time);
   117	
   118		pdata->alarm_time = alarm_time;
   119		writel((u32) pdata->alarm_time, pdata->csr_base + RTC_CMR);
   120	
   121		eswin_rtc_alarm_irq_enable(dev, alrm->enabled);
   122	
   123		return 0;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
