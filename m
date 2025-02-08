Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105771DA5F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 00:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738974813; cv=none; b=nvI9EOZDQDU4NicyfXs50Z98tS9rGG8nGQ1J/u6ZNW728T8xCClhW/utEl/2djrUXyyDVtCI5CjmIwwTa7AmL9leO0MqkIJ8ksRAHbQIF0STVf9L6M+/zgeoaXsb72HgJVGioPib/MD5z2o5Zl1c/h8bemk4TVlRhotwSorq2aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738974813; c=relaxed/simple;
	bh=t1199/Bc8Br4JURh9yKGLcekD20GnbyZIbmk/Ii2yd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uePb1lIecq2miVViBPi3BIQQDTtzw94BB+1IKSaOWaFpSTpnjTRsSR2fl811a7w3o5knSwcY+O6oWRA68h5CfUf7EGF4Or0WKJX+kp66i5MRil7i63EpktRKDhhaqlNQnXFCLHqlNl3eeUI+Rw3hmY2dM+WMY5Aaj0D/j/NHehI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdjr01vf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdjr01vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738974811; x=1770510811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t1199/Bc8Br4JURh9yKGLcekD20GnbyZIbmk/Ii2yd4=;
  b=fdjr01vfpeAdYZEVf+V5xfN+nExfedhJXaunCt1VphT7dzg48YQRF9Lb
   1e77pvjcf61PljhgXudgnt6ascXNIcd9O3Beyx5Y0eyK24RbyZU67U6Gb
   Gt447n+zse8pH0yffLxjulJDG+1iQFU7UfoBScHj4QPLbPyk3JRXbb43G
   xZ5Ep/ffnrTHU/TLVCDcv13ClVxq104tZD+HDOPoCohKWsCfT4k9Cc0c4
   L53Y4zEhUg8SqSb7FrRTAh4zZowcmgT1yMu69qmoFdlo7UqF9Khqymbks
   P4By1ssQCgrjjd+1ZsBi8+E8ZXhWkpKPCQmM/jFsh+U30SjeC92V8qwwK
   A==;
X-CSE-ConnectionGUID: o6Qq7rbERK2QjkwgI+N/aQ==
X-CSE-MsgGUID: qhYG7vyET2WprEMCJETHyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42470799"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="42470799"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 16:33:30 -0800
X-CSE-ConnectionGUID: DMohFPpnRDWlEh2vZQ+4Lw==
X-CSE-MsgGUID: rFFhc93pRd+XbaPxVr6UmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134905528"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Feb 2025 16:33:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgYml-000zEP-0l;
	Sat, 08 Feb 2025 00:33:27 +0000
Date: Sat, 8 Feb 2025 08:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Ping-Ke Shih <pkshih@realtek.com>
Subject: [pkshih-rtw:rtw-next 14/30]
 drivers/net/wireless/realtek/rtw89/regd.c:20:2: warning: excess elements in
 array initializer
Message-ID: <202502080807.Llhy1Ovu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/pkshih/rtw rtw-next
head:   3d3e28feca7ac8c6cf2a390dbbe1f97e3feb7f36
commit: 79a36fc56beaeac31cb9b0ca10618b88f4ac31c8 [14/30] wifi: rtw89: regd: handle supported regulatory functions by country
config: i386-randconfig-052-20250208 (https://download.01.org/0day-ci/archive/20250208/202502080807.Llhy1Ovu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080807.Llhy1Ovu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080807.Llhy1Ovu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/realtek/rtw89/regd.c:20:2: warning: excess elements in array initializer [-Wexcess-initializers]
      20 |         COUNTRY_REGD("00", RTW89_WW, RTW89_WW, RTW89_WW, 0x0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:23:2: warning: excess elements in array initializer [-Wexcess-initializers]
      23 |         COUNTRY_REGD("AR", RTW89_MEXICO, RTW89_MEXICO, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:24:2: warning: excess elements in array initializer [-Wexcess-initializers]
      24 |         COUNTRY_REGD("BO", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:25:2: warning: excess elements in array initializer [-Wexcess-initializers]
      25 |         COUNTRY_REGD("BR", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:26:2: warning: excess elements in array initializer [-Wexcess-initializers]
      26 |         COUNTRY_REGD("CL", RTW89_CHILE, RTW89_CHILE, RTW89_CHILE, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:27:2: warning: excess elements in array initializer [-Wexcess-initializers]
      27 |         COUNTRY_REGD("CO", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:28:2: warning: excess elements in array initializer [-Wexcess-initializers]
      28 |         COUNTRY_REGD("CR", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:29:2: warning: excess elements in array initializer [-Wexcess-initializers]
      29 |         COUNTRY_REGD("EC", RTW89_FCC, RTW89_FCC, RTW89_NA, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:30:2: warning: excess elements in array initializer [-Wexcess-initializers]
      30 |         COUNTRY_REGD("SV", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:31:2: warning: excess elements in array initializer [-Wexcess-initializers]
      31 |         COUNTRY_REGD("GT", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:32:2: warning: excess elements in array initializer [-Wexcess-initializers]
      32 |         COUNTRY_REGD("HN", RTW89_FCC, RTW89_FCC, RTW89_FCC, 0x0),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:16:20: note: expanded from macro 'COUNTRY_REGD'
      16 |                 .func_bitmap = { BITMAP_FROM_U64(_fmap), },     \
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitmap.h:736:5: note: expanded from macro 'BITMAP_FROM_U64'
     736 |                                 ((unsigned long) ((u64)(n) >> 32))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/realtek/rtw89/regd.c:33:2: warning: excess elements in array initializer [-Wexcess-initializers]
      33 |         COUNTRY_REGD("MX", RTW89_MEXICO, RTW89_MEXICO, RTW89_FCC, 0x0),


vim +20 drivers/net/wireless/realtek/rtw89/regd.c

     9	
    10	#define COUNTRY_REGD(_alpha2, _rule_2ghz, _rule_5ghz, _rule_6ghz, _fmap) \
    11		{							\
    12			.alpha2 = _alpha2,				\
    13			.txpwr_regd[RTW89_BAND_2G] = _rule_2ghz,	\
    14			.txpwr_regd[RTW89_BAND_5G] = _rule_5ghz,	\
    15			.txpwr_regd[RTW89_BAND_6G] = _rule_6ghz,	\
    16			.func_bitmap = { BITMAP_FROM_U64(_fmap), },	\
    17		}
    18	
    19	static const struct rtw89_regd rtw89_ww_regd =
  > 20		COUNTRY_REGD("00", RTW89_WW, RTW89_WW, RTW89_WW, 0x0);
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
