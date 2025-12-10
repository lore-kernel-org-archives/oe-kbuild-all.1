Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0722227FD52
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765353084; cv=none; b=P4ydMFiZomjDvLaop0SDv4aAJUS9scakNQaIOVw80yfTu9Vf/CQpUPrgu4C/4i0ZqI5O65T50G38hzaI5CW5cO6JTTPJKbCCLFD0UrcEIzu2upXfPYzn/TrKRCGn2JSXoeK2EtJjcnBchYkKJkiQEpfQpvrPcqXpUtOXLvBKsDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765353084; c=relaxed/simple;
	bh=spxHpwRtHzpFNCmxCrDFqF+uKRYSXOdfYnZx6TTu2Sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CKvEQTUCRQwvlLrurRjNTc/i2wVZjLiBeELsfjuWa0oLPPY3FTqFEjLn8D7IQrAwsKwTLoHqUeFOUpgOCERB+utbdwkhPdxP+Kn+Yd+MotCPhk6NPPFw6RSLsUB6Tw/tntp7wQun0ylsoQPuv8IlYPal2a7/M0UfKg70M9Pufkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1yOIGZ7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1yOIGZ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765353082; x=1796889082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=spxHpwRtHzpFNCmxCrDFqF+uKRYSXOdfYnZx6TTu2Sg=;
  b=V1yOIGZ7vaCDFO3se9B3hN1d3lZrI9XxjStaqbfaStJTv8+sbvxpiO4R
   2G1EiFM52I1GDgtpq5XFyaF8+ZIL7HDy23pgI1Qkqd+O401W383QUsHuB
   0OjJfMTQa2T5elyxt445gmODIslbka+3JiutoBsdmNWUHN+F1EX2SkInU
   18dkfizzkZWKnUuIBsTB9SZjTMtHqUEseQPXs9p7YEpOCVlRldf8aa1BO
   uyN85uBCrzGcO7tn6fd7mLet1FOxBuV554984jPb4VLj7ukjZvjyh28OR
   Rx3twoZXw1EeW5pjavpnuDtJ0zLZ/6onoA38+bUVr+TZ8eJRCTe0la/9D
   w==;
X-CSE-ConnectionGUID: cb6tyKmjRB62ileZKMdU6g==
X-CSE-MsgGUID: HCdn01KIQTit6mu1HxEHdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71184518"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="71184518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 23:51:21 -0800
X-CSE-ConnectionGUID: V+/v6OHHTB+U5oAGYzCvpQ==
X-CSE-MsgGUID: 6NnmTTL+Q4qq0W04j9e4DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="196359674"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2025 23:51:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTEyk-000000000Xc-1fwV;
	Wed, 10 Dec 2025 07:51:18 +0000
Date: Wed, 10 Dec 2025 08:50:28 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3399/3399]
 drivers/net/ethernet/linkdata/sxe/base/log/sxe_log.c:24: warning: Function
 parameter or member 'buff' not described in 'time_for_file_name'
Message-ID: <202512100859.mEVPzizr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7579fd89cb4a201d22bd5b78f48df5ce339c0b2d
commit: 8cee206b5558245197158bd20895f95cc28d8468 [3399/3399] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251210/202512100859.mEVPzizr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100859.mEVPzizr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100859.mEVPzizr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxe/base/log/sxe_log.c:24: warning: Function parameter or member 'buff' not described in 'time_for_file_name'
>> drivers/net/ethernet/linkdata/sxe/base/log/sxe_log.c:24: warning: Function parameter or member 'buf_len' not described in 'time_for_file_name'
>> drivers/net/ethernet/linkdata/sxe/base/log/sxe_log.c:24: warning: Excess function parameter 'file' description in 'time_for_file_name'
>> drivers/net/ethernet/linkdata/sxe/base/log/sxe_log.c:24: warning: Excess function parameter 'author' description in 'time_for_file_name'
>> drivers/net/ethernet/linkdata/sxe/base/log/sxe_log.c:24: warning: Excess function parameter 'date' description in 'time_for_file_name'
--
>> drivers/net/ethernet/linkdata/sxe/base/trace/sxe_trace.c:21: warning: Excess function parameter 'file' description in 'SXE_FILE_NAME_LEN'
>> drivers/net/ethernet/linkdata/sxe/base/trace/sxe_trace.c:21: warning: Excess function parameter 'author' description in 'SXE_FILE_NAME_LEN'
>> drivers/net/ethernet/linkdata/sxe/base/trace/sxe_trace.c:21: warning: Excess function parameter 'date' description in 'SXE_FILE_NAME_LEN'
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_csum.c:23: warning: Function parameter or member 'protocol' not described in 'sxe_is_sctp_ipv4'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_csum.c:23: warning: Function parameter or member 'skb' not described in 'sxe_is_sctp_ipv4'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_csum.c:23: warning: Excess function parameter 'file' description in 'sxe_is_sctp_ipv4'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_csum.c:23: warning: Excess function parameter 'author' description in 'sxe_is_sctp_ipv4'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_csum.c:23: warning: Excess function parameter 'date' description in 'sxe_is_sctp_ipv4'
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb.c:16: warning: Excess function parameter 'file' description in 'SXE_TC_BWG_PERCENT_PER_CHAN'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb.c:16: warning: Excess function parameter 'author' description in 'SXE_TC_BWG_PERCENT_PER_CHAN'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb.c:16: warning: Excess function parameter 'date' description in 'SXE_TC_BWG_PERCENT_PER_CHAN'
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb_nl.c:20: warning: Excess function parameter 'file' description in 'BIT_PFC'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb_nl.c:20: warning: Excess function parameter 'author' description in 'BIT_PFC'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_dcb_nl.c:20: warning: Excess function parameter 'date' description in 'BIT_PFC'
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:18: warning: Excess function parameter 'file' description in 'SKB_DESCRIPTION_LEN'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:18: warning: Excess function parameter 'author' description in 'SKB_DESCRIPTION_LEN'
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_debug.c:18: warning: Excess function parameter 'date' description in 'SKB_DESCRIPTION_LEN'
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_ipsec.c:23: warning: cannot understand function prototype: 'const char ipsec_aes_name[] = "rfc4106(gcm(aes))"; '
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_host_cli.c:18: warning: cannot understand function prototype: 'dev_t sxe_cdev_major; '
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_host_hdc.c:27: warning: cannot understand function prototype: 'atomic_t hdc_available = ATOMIC_INIT(1); '
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_filter.c:24: warning: cannot understand function prototype: 'struct workqueue_struct *sxe_fnav_workqueue; '
--
>> drivers/net/ethernet/linkdata/sxe/sxepf/sxe_monitor.c:24: warning: cannot understand function prototype: 'struct workqueue_struct *sxe_fnav_workqueue; '
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +24 drivers/net/ethernet/linkdata/sxe/base/log/sxe_log.c

    19	
    20	#if (defined SXE_DRIVER_DEBUG && defined __KERNEL__) ||                        \
    21		(defined SXE_DRIVER_TRACE)
    22	
    23	int time_for_file_name(char *buff, int buf_len)
  > 24	{
    25	#ifdef SXE_LOG_TIME_TO_TM
    26		struct timeval tv;
    27		struct tm td;
    28	
    29		do_gettimeofday(&tv);
    30		time_to_tm(tv.tv_sec, -sys_tz.tz_minuteswest * 60, &td);
    31	#else
    32		struct timespec64 tv;
    33		struct tm td;
    34	
    35		ktime_get_real_ts64(&tv);
    36		time64_to_tm(tv.tv_sec, -sys_tz.tz_minuteswest * 60, &td);
    37	#endif
    38		return snprintf(buff, buf_len, "%04ld-%02d-%02d_%02d:%02d:%02d",
    39				td.tm_year + 1900, td.tm_mon + 1, td.tm_mday,
    40				td.tm_hour, td.tm_min, td.tm_sec);
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
