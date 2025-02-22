Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DB74A05
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 06:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740205015; cv=none; b=XfAjGamYNrSDKLbob/5DAuyffPH+gCsqdvbmcQ9PV6HWetGX2E9yMiExjQ6uL357Pg7MgrJt+XSQwtFq205sfAx/d3JrcbJSJB9cUX+EzqSX6QdUUdgSFvbz2yqF/YT3mRjZApCDt6XppwNiRqyglwLCQtt8af36+qrrpYk0ECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740205015; c=relaxed/simple;
	bh=bERci+EnP68fSaz8z6pV4FtfvjP9YJlknHF4NJgGmH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eCGeTsc87Nsu25iw0mIqmBIRa6fizHtgAad5jqeRFuIi8W+eDgcX6gH2XmEhrJtuEecVjdUJsLEc7fTrZqUpULEXu6T1XQCPL7aPLd+81kFwKS17UeFaSyDyAXwOtrnj0Rfjcel89ODq4iKO+ARkNBLj+xrM4lM9RAiNKR9k9CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ap+fIVDw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ap+fIVDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740205014; x=1771741014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bERci+EnP68fSaz8z6pV4FtfvjP9YJlknHF4NJgGmH8=;
  b=Ap+fIVDw8Auey5vAt7ZGrczFL7S4NI2xBFiz82t22P8NHMAe1eO4B7MV
   bFGR2T3LitAQ9f43YvkkFx8Szg/mDZg2rtUE0lmHDrEno6Zoq3TrckvnN
   TdRx28l0XOgmugAaMe9Jf53RfdQDfTI8wrAplQuoa1Gty9i1iK6Cqh1FX
   BFsydBZFQFYrxOb62VZpcfDduzy9PUJ+ieW7Fn8qoz/cNTzBZMhTU7zzI
   l6ZC5nEGs4puZjz3bPLkNbUHVWcHYJUb+k88TLY/h5ajGEniAE5rtCZwk
   XlZjQFQMLRefnUde2WVBS7bND+hzDdRJARKBPk0UiUVO0hozwumzAClMo
   Q==;
X-CSE-ConnectionGUID: KuurN7z2QwCjW498Gi5EaQ==
X-CSE-MsgGUID: A4wisSetQBSbYc2bIlmR4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44681642"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="44681642"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 22:16:53 -0800
X-CSE-ConnectionGUID: TUR3361IQRmk2o/yleH7ow==
X-CSE-MsgGUID: ujlA1LrzRf2vfaH/1XGt7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="115277019"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 21 Feb 2025 22:16:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tliof-0006LN-0w;
	Sat, 22 Feb 2025 06:16:46 +0000
Date: Sat, 22 Feb 2025 14:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [tnguy-next-queue:40GbE 8/39] wx_ethtool.c:undefined reference to
 `ptp_clock_index'
Message-ID: <202502221412.TDbqnUpd-lkp@intel.com>
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
commit: ce114069a654be6b1597da983a201c72ceca7a85 [8/39] net: wangxun: Support to get ts info
config: i386-buildonly-randconfig-005-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221412.TDbqnUpd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221412.TDbqnUpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221412.TDbqnUpd-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/wangxun/libwx/wx_lib.o: in function `wx_clean_tx_irq':
   wx_lib.c:(.text+0x3334): undefined reference to `ptp_schedule_worker'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ethtool.o: in function `wx_get_ts_info':
>> wx_ethtool.c:(.text+0x739): undefined reference to `ptp_clock_index'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_stop':
   wx_ptp.c:(.text+0xaa0): undefined reference to `ptp_clock_unregister'
   ld: drivers/net/ethernet/wangxun/libwx/wx_ptp.o: in function `wx_ptp_init':
   wx_ptp.c:(.text+0x104e): undefined reference to `ptp_clock_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LIBWX
   Depends on [m]: NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PTP_1588_CLOCK_OPTIONAL [=m]
   Selected by [y]:
   - NGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_WANGXUN [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
