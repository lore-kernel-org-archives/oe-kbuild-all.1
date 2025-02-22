Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BE71482F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740213830; cv=none; b=Sp8PV+Djnh/rhLuiIEm8Sdm7L2+1t5HbJugNheJGDjzaPilW70WZ5u9a5wIMmHM/d5cG7HH+VEF3aAlPz1co2jdglvoywjWtMvn7llRrelz6i7StodpqcUEiQhkjUVuKtiK4KGZbqMfLMU6uihsyQWxGH+t1ItwdprFo9jWeljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740213830; c=relaxed/simple;
	bh=z4QxPZ7S5Tph4cngarX01l9GKqX7BM2RMxwu4WKOsew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ai0rxh2AGdU19t1hKEMjwgVc9iu/9wl2gjDS2oLLaEFrYLVjncF6cUdoCu+8+hgs7YJNdai6CnGXVuD9+TK8OA16YtMlat64QnFWkxsnl6j0a0CoNKG8cBCjKobhMlls6sa/rRDHEC9RoamEt72yZ2BY5oyM0aF7DeLflhbh0O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbpL91Zh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbpL91Zh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740213828; x=1771749828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z4QxPZ7S5Tph4cngarX01l9GKqX7BM2RMxwu4WKOsew=;
  b=UbpL91ZhYVlNo9I5q9UqQupgp0Ck2yX7qBIhO9/M4vdk0bj7Hu4myNHy
   +FBG9FOhNNnFe2tB2bjBUTOQOWsWz6Yilzj9cQDPURhHOJPyzEGL9doUz
   HbpA+eynuAKhOmeaMloeBgbGQlrENU917V0sUkFdCi1q0yNI43ahUgQck
   WpB97AvrzqVrxHzpVJdUQtYfmmmu7EDzVQvZAS5xnugzKopFkz2UgNTWR
   uruJ30S3RRsWQzdvzEkmsZ7mGfVN9LbGTeBNMDdbMoRItFGonPiBpPrs+
   sUulRa/AnFBE+5MaroEQ+HZ3A6BRxkyydLSWtIdQ1LDKz7jSA6DwTO3BD
   Q==;
X-CSE-ConnectionGUID: r5225NStRbSHPCRrEvcvrw==
X-CSE-MsgGUID: R1lGBR1vSnG35UR7BsrR4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40951180"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="40951180"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 00:43:48 -0800
X-CSE-ConnectionGUID: qKgRUfuYQ6WnFVtG56Z3Bg==
X-CSE-MsgGUID: u4yFtYZPR6WX/oLZkfOXPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="116214957"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 22 Feb 2025 00:43:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tll6u-0006PQ-0q;
	Sat, 22 Feb 2025 08:43:44 +0000
Date: Sat, 22 Feb 2025 16:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [tnguy-next-queue:40GbE 9/39] wx_ptp.c:undefined reference to
 `ptp_schedule_worker'
Message-ID: <202502221622.yPBcg0Uh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git 40GbE
head:   bb3bb6c92e5719c0f5d7adb9d34db7e76705ac33
commit: 704145a854ee01015d52fb8c4c0c319d1810bf32 [9/39] net: wangxun: Add periodic checks for overflow and errors
config: i386-buildonly-randconfig-005-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221622.yPBcg0Uh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221622.yPBcg0Uh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221622.yPBcg0Uh-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/wangxun/libwx/wx_lib.o: in function `wx_clean_tx_irq':
   wx_lib.c:(.text+0x3334): undefined reference to `ptp_schedule_worker'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_ts_info':
   wx_ethtool.c:(.text+0x739): undefined reference to `ptp_clock_index'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_stop':
   wx_ptp.c:(.text+0x940): undefined reference to `ptp_clock_unregister'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_reset':
>> wx_ptp.c:(.text+0xd67): undefined reference to `ptp_schedule_worker'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_init':
   wx_ptp.c:(.text+0xefe): undefined reference to `ptp_clock_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LIBWX
   Depends on [m]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PTP_1588_CLOCK_OPTIONAL [=m]
   Selected by [y]:
   - NGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
