Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEF45258
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 02:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740881343; cv=none; b=pFYX4MRgiLZgl1crZHrttvTSYutEm9quou4w9gnHcnXlacLN0VhApf6CRgMSY9mHYyBXWgql7HE4kYzPhn2/EUq0p40IIYa1aF9tgGq8YdIr89RM3ohqwoMNBMvP2mqc0v/m5o/cGC87c0jJcXAH2u74E5btAFzcGDL4DPshB5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740881343; c=relaxed/simple;
	bh=EUyILAo/LHmTE2L/SZX4HWkTR2uIWoNtiKxCIzkoEPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=As7xGsmMY5NJWpxmTYALo271RdaGzBui1ii9G/2MxFvBw0FqojSHLXxOv2w7D6SEf60l5FnYa8trkD+UV0T3O/Ezpxp7jrtnmU48gZrWdWQXmDkeYYs/Btoi+uPQTHKnv2wGttpDfd8JrxjCDG192kBq65crGnjEWktzfgAc7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m09DNOdk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m09DNOdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740881342; x=1772417342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EUyILAo/LHmTE2L/SZX4HWkTR2uIWoNtiKxCIzkoEPs=;
  b=m09DNOdkVIjiX6LLPtZgFmvRiClZ3lAg1r6FNtaJ2KqXgtmr22pR5Z3R
   INib71r8IGswFMlgA89IUbsjICSousDqGD0sihOl3I64X00SEbp2wYtf9
   hM4qmpQ/UWQyDOd4Px6SBuPf+o10s2pCPaaR32QD2unbewHZjff6P2nqc
   P2Bs+4/qmi8Smq/BIiHGqZOP7ma9/VLSE5KUd0frQlnhpO263j/Ti7G4c
   BtNzfRWQus42ZodfjH4iI5qQYXG/D8pZ7YfXEzw6yXdThJ11sIrEslvdQ
   6zV95q7OKolfOtulSQWjFuPsXw6Gw1tcLVEMZLeg+MTiGGNTD+q+XWYEl
   g==;
X-CSE-ConnectionGUID: /61tb0PqTNKIvIk8HA0+yw==
X-CSE-MsgGUID: 8CpSAzdcSCetinvaEEXt1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="42028765"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="42028765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 18:09:01 -0800
X-CSE-ConnectionGUID: fYzE2oEvTB6RohCQmnpbIw==
X-CSE-MsgGUID: uk65wrW9RlyRs4aR09Y9MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="118171868"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Mar 2025 18:08:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toYlF-000GxI-20;
	Sun, 02 Mar 2025 02:08:57 +0000
Date: Sun, 2 Mar 2025 10:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [linux-next:master 4486/7423]
 drivers/net/ethernet/wangxun/libwx/wx_ptp.c:582: undefined reference to
 `ptp_schedule_worker'
Message-ID: <202503021023.e6NYNvZp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c0eb65494e59d9834af7cbad983629e9017b25a1
commit: 704145a854ee01015d52fb8c4c0c319d1810bf32 [4486/7423] net: wangxun: Add periodic checks for overflow and errors
config: x86_64-randconfig-121-20250226 (https://download.01.org/0day-ci/archive/20250302/202503021023.e6NYNvZp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021023.e6NYNvZp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021023.e6NYNvZp-lkp@intel.com/

Note: the linux-next/master HEAD c0eb65494e59d9834af7cbad983629e9017b25a1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/wangxun/libwx/wx_lib.o: in function `wx_clean_tx_irq':
   drivers/net/ethernet/wangxun/libwx/wx_lib.c:754: undefined reference to `ptp_schedule_worker'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_ts_info':
   drivers/net/ethernet/wangxun/libwx/wx_ethtool.c:483: undefined reference to `ptp_clock_index'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_reset':
>> drivers/net/ethernet/wangxun/libwx/wx_ptp.c:582: undefined reference to `ptp_schedule_worker'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_create_clock':
   drivers/net/ethernet/wangxun/libwx/wx_ptp.c:353: undefined reference to `ptp_clock_register'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_stop':
   drivers/net/ethernet/wangxun/libwx/wx_ptp.c:641: undefined reference to `ptp_clock_unregister'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LIBWX
   Depends on [m]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PTP_1588_CLOCK_OPTIONAL [=m]
   Selected by [y]:
   - NGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]


vim +582 drivers/net/ethernet/wangxun/libwx/wx_ptp.c

   563	
   564	void wx_ptp_reset(struct wx *wx)
   565	{
   566		unsigned long flags;
   567	
   568		/* reset the hardware timestamping mode */
   569		wx_ptp_set_timestamp_mode(wx, &wx->tstamp_config);
   570		wx_ptp_reset_cyclecounter(wx);
   571	
   572		wr32ptp(wx, WX_TSC_1588_SYSTIML, 0);
   573		wr32ptp(wx, WX_TSC_1588_SYSTIMH, 0);
   574		WX_WRITE_FLUSH(wx);
   575	
   576		write_seqlock_irqsave(&wx->hw_tc_lock, flags);
   577		timecounter_init(&wx->hw_tc, &wx->hw_cc,
   578				 ktime_to_ns(ktime_get_real()));
   579		write_sequnlock_irqrestore(&wx->hw_tc_lock, flags);
   580	
   581		wx->last_overflow_check = jiffies;
 > 582		ptp_schedule_worker(wx->ptp_clock, HZ);
   583	}
   584	EXPORT_SYMBOL(wx_ptp_reset);
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
