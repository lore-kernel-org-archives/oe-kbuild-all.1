Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3974B352C2C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 06:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182167; cv=none; b=I4N2im6seHsglralHD+5zX2Jvu6cpmXMCzItpoRxrnQgsn3o+2fL5JPJIyUo4o3FSgbNH5K8OY3+AXrwVOYBSDAj6Lu/d0wA/GPlExMBeYH9MmQ1dG1InRMksyLGt6AvWflObUE0+fwx8CYupyFgl1SsGFDjQbWqmNAkOtKvo/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182167; c=relaxed/simple;
	bh=I2rYjJCJUGDrCJEVD+Xjp9aaowIt3/UesWq8dzb2iWs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B1LRPbrFKejKEvJOJ9VLGVUkaQpC31cKqt7VgHEwpO7zCwWzt6kttq8z66cnKQRQEM6fN/FNjM0aATQr00OaACh94fkaJH1SPsY7HG9kpYHwBIwvO/a7lISEqJqSNBIJ15Vr48q5rTFTdshyaP5qQgHDaqENPjOc5vKrfdo5zRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVQo0URC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVQo0URC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791182165; x=1822718165;
  h=date:from:to:cc:subject:message-id;
  bh=I2rYjJCJUGDrCJEVD+Xjp9aaowIt3/UesWq8dzb2iWs=;
  b=EVQo0URCu21BX295p6lnwh6Gk/QPA1nJiIeKVt+vtWdle2pp0GId7gef
   QXICMPoH5UFjdcECBwDsEKRpPrC5R/VS0nJXTA6qAVjw182JKFCdYjhO+
   wh1D9qLYQekh81ybGLLK0qhTXZFs1XrNyKdKVZXsJ2LELA37pR5KnRZAA
   puQr3lJvRpyw9I6Uw32j+O+36521PNp0vZA5BO2tiJldKRNtRX8h1+pb8
   ssg7oaZeuIKpwTeASgD5w83YF34C5h3bYWMwLe0RuEsUJCmlkTx7sWW0L
   57JOMQrFHvyCo9gwsq/6+J0Yz99O2fihdydsFyNhrHWY97qWpxs4cFhgr
   Q==;
X-CSE-ConnectionGUID: AAOXVuu9QCmpnN9lCokZnA==
X-CSE-MsgGUID: IZFYqVcrTj6AbSrU72Hzdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109334016"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="109334016"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 23:36:05 -0700
X-CSE-ConnectionGUID: RgaXGsRVT32NQyUDibK0bw==
X-CSE-MsgGUID: tzAHAc84SiqIxfeLnFxSCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="778624"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 04 Oct 2026 23:36:04 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDcIr-00000000VPx-0PNK;
	Mon, 05 Oct 2026 06:36:01 +0000
Date: Mon, 05 Oct 2026 14:35:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-p3-wip 7/8] kernel/time/ntp.c:175:9:
 error: implicit declaration of function 'pps_fit_reset'
Message-ID: <202610051451.E6GGdAVP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-p3-wip
head:   24b5bb6499c7dcc715bf50f768bc24b50f9cc631
commit: f04f156f18471fef43c99e5ef017165b43f34e7a [7/8] ntp: Estimate PPS frequency by least-squares fit over the interval
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20261005/202610051451.E6GGdAVP-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051451.E6GGdAVP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051451.E6GGdAVP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/time/ntp.c: In function 'pps_clear':
>> kernel/time/ntp.c:175:9: error: implicit declaration of function 'pps_fit_reset' [-Wimplicit-function-declaration]
     175 |         pps_fit_reset(ntpdata);
         |         ^~~~~~~~~~~~~
   kernel/time/ntp.c: At top level:
>> kernel/time/ntp.c:1244:13: warning: conflicting types for 'pps_fit_reset'; have 'void(struct ntp_data *)'
    1244 | static void pps_fit_reset(struct ntp_data *ntpdata)
         |             ^~~~~~~~~~~~~
>> kernel/time/ntp.c:1244:13: error: static declaration of 'pps_fit_reset' follows non-static declaration
   kernel/time/ntp.c:175:9: note: previous implicit declaration of 'pps_fit_reset' with type 'void(struct ntp_data *)'
     175 |         pps_fit_reset(ntpdata);
         |         ^~~~~~~~~~~~~


vim +/pps_fit_reset +175 kernel/time/ntp.c

   162	
   163	/**
   164	 * pps_clear - Clears the PPS state variables
   165	 * @ntpdata:	Pointer to ntp data
   166	 */
   167	static inline void pps_clear(struct ntp_data *ntpdata)
   168	{
   169		pps_reset_freq_interval(ntpdata);
   170		ntpdata->pps_tf[0] = 0;
   171		ntpdata->pps_tf[1] = 0;
   172		ntpdata->pps_tf[2] = 0;
   173		ntpdata->pps_fbase.tv_sec = ntpdata->pps_fbase.tv_nsec = 0;
   174		ntpdata->pps_rawring_n = 0;
 > 175		pps_fit_reset(ntpdata);
   176		ntpdata->pps_freq = 0;
   177	}
   178	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
