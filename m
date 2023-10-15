Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15E0154AB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQfN2szl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697414231; x=1728950231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IVZJYL36C+WasPzn1FkHUY0T/UfbyX4hJlGy5eLZImE=;
  b=aQfN2szlVNAZKnC69oW9UYE2GbTFbTkFmxLTCbX2FZHFB+3Ms762Op/K
   MYRX9EFNtgnOpEfI5nYep/N7GV7m/RqQbhMrgoh64QYvT+fHd9+yaoQWa
   IQuPDNlHpJ9UDm4nCsgRcgwGZIG3wwapFaBtNOv3dyUvb1EzfZaiKDj7F
   c+iFUQ7MNl670sBIUhYCnirnL2M3Hi1xnDaPfjwUyFTo2Uj6WYBDlpJnC
   eP81AskITFNdPTs/vtXLMvw/6YiURgeEgaDoUNvEj0qFyT4DGX22ZzeOi
   gY+iPiYWEICX7AwWTHhbOZb1pdNcx3psVzLheDGzQaRj7vBIJMF0/YCDc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364784162"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="364784162"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 16:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="899283180"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="899283180"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Oct 2023 16:55:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsAyk-0007wH-0l;
	Sun, 15 Oct 2023 23:57:02 +0000
Date: Mon, 16 Oct 2023 07:56:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [abelloni:rtc-next 10/25] drivers/rtc/rtc-at91rm9200.c:561:13:
 warning: 'at91_rtc_remove' defined but not used
Message-ID: <202310160705.vlElNOGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
head:   dc71c03b0a2937545d2c6ff89d2275890a309618
commit: 48bc8830fbed98dff905fdbcaa424d59bb312043 [10/25] rtc: at91rm9200: Convert to platform remove callback returning void
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231016/202310160705.vlElNOGb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160705.vlElNOGb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160705.vlElNOGb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-at91rm9200.c:561:13: warning: 'at91_rtc_remove' defined but not used [-Wunused-function]
     561 | static void at91_rtc_remove(struct platform_device *pdev)
         |             ^~~~~~~~~~~~~~~


vim +/at91_rtc_remove +561 drivers/rtc/rtc-at91rm9200.c

   557	
   558	/*
   559	 * Disable and remove the RTC driver
   560	 */
 > 561	static void at91_rtc_remove(struct platform_device *pdev)
   562	{
   563		/* Disable all interrupts */
   564		at91_rtc_write_idr(AT91_RTC_ACKUPD | AT91_RTC_ALARM |
   565						AT91_RTC_SECEV | AT91_RTC_TIMEV |
   566						AT91_RTC_CALEV);
   567	
   568		clk_disable_unprepare(sclk);
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
