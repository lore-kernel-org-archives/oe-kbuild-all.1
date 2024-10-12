Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2653E2C95
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 04:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728708066; cv=none; b=E/PWsEUgIPgUjEWS8eLYX0+IJBtRg9SNVwuE45OTmpoy5Pa+27l0JfvVrHgjj2wn8doKgocHLppp9wgdJ3t46op1O7lbySuycSvcXHk26+/ZYIkJKZ5h7V/Mb7DfTNfymUcuvV5yhzugfb8Wa/vr2WB6qLjoPRCUIk5J3MMdBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728708066; c=relaxed/simple;
	bh=CoLEJ0mMaDPn2rFYDVQdeZ4Zyb7MYb2hcTb/0Ia+o9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e2X3jvBfIlOPlI24vqNuzspNPtAswxe7GVOIv0czkRong1RiTpAzGN8RGoXZZ3/br/lQmPyrBk2djruLxOFrN3nocby+vbN1gI/RDhsqyE7r5M3Go33Qk4bwsLuR2ppAD7F7UC7ife0/A56ylRnuRMyY9lSMM4WS+bAh18j23T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LC05hQIb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LC05hQIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728708065; x=1760244065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CoLEJ0mMaDPn2rFYDVQdeZ4Zyb7MYb2hcTb/0Ia+o9o=;
  b=LC05hQIbRKTm26fIVcdkda8bYx4ZPI0rvcsV1abSETUAaVK+iMRsFT/M
   K8ut8K2cXnIiGIvvNR6OB0ZT+ttqZ+VHt6h00+oKOGqYgCtUcBbbx2ifg
   kyYl5ft3wyFUVMlSHh9Sep2l6x3gEN89awL9M8ejoaJmeIq3NjrkdPnZY
   LWkQmWvDXGQ1khCeoQcY2+P2i6OR9Wv8Bz0orL8Z+MPrWPIsHPp5mW84H
   Op7SHsCNnLSEQz0F70zHVfSEUGyrh+J5rFcCbrGI1twM1nVVgGFNSALxQ
   tTIG6+dX/mQbyA0Nb2cGHq89rtViGmL6DbC+3enteIXK1Wnb0VCJV6NFl
   A==;
X-CSE-ConnectionGUID: S1K0CmogQASPatr9Md4Vpw==
X-CSE-MsgGUID: 71+6zwb0RvW6ajUspSOf1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28246748"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="28246748"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 21:40:54 -0700
X-CSE-ConnectionGUID: uu+kNr7URGi1omCNcFMinA==
X-CSE-MsgGUID: G77qHO8hRCucv9Hlsp8QYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; 
   d="scan'208";a="77913316"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Oct 2024 21:40:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szTvu-000D3f-1K;
	Sat, 12 Oct 2024 04:40:50 +0000
Date: Sat, 12 Oct 2024 12:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Holla <pholla@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: [lee-mfd:for-mfd-next 13/27] drivers/mfd/cros_ec_dev.c:132:35:
 error: 'EC_FEATURE_UCSI_PPM' undeclared here (not in a function); did you
 mean 'EC_FEATURE_USB_PD'?
Message-ID: <202410121250.Uq55vsGc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
head:   bc37b44978d38e1b38373b2a5774e4b4753a7523
commit: e5d1202b6b1efa2a533564e21476dadb1b838f6b [13/27] mfd: cros_ec: Load cros_ec_ucsi on supported ECs
config: i386-buildonly-randconfig-003-20241012 (https://download.01.org/0day-ci/archive/20241012/202410121250.Uq55vsGc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121250.Uq55vsGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121250.Uq55vsGc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/cros_ec_dev.c:132:35: error: 'EC_FEATURE_UCSI_PPM' undeclared here (not in a function); did you mean 'EC_FEATURE_USB_PD'?
     132 |                 .id             = EC_FEATURE_UCSI_PPM,
         |                                   ^~~~~~~~~~~~~~~~~~~
         |                                   EC_FEATURE_USB_PD


vim +132 drivers/mfd/cros_ec_dev.c

   114	
   115	static const struct cros_feature_to_cells cros_subdevices[] = {
   116		{
   117			.id		= EC_FEATURE_CEC,
   118			.mfd_cells	= cros_ec_cec_cells,
   119			.num_cells	= ARRAY_SIZE(cros_ec_cec_cells),
   120		},
   121		{
   122			.id		= EC_FEATURE_GPIO,
   123			.mfd_cells	= cros_ec_gpio_cells,
   124			.num_cells	= ARRAY_SIZE(cros_ec_gpio_cells),
   125		},
   126		{
   127			.id		= EC_FEATURE_RTC,
   128			.mfd_cells	= cros_ec_rtc_cells,
   129			.num_cells	= ARRAY_SIZE(cros_ec_rtc_cells),
   130		},
   131		{
 > 132			.id		= EC_FEATURE_UCSI_PPM,
   133			.mfd_cells	= cros_ec_ucsi_cells,
   134			.num_cells	= ARRAY_SIZE(cros_ec_ucsi_cells),
   135		},
   136		{
   137			.id		= EC_FEATURE_USB_PD,
   138			.mfd_cells	= cros_usbpd_charger_cells,
   139			.num_cells	= ARRAY_SIZE(cros_usbpd_charger_cells),
   140		},
   141		{
   142			.id		= EC_FEATURE_HANG_DETECT,
   143			.mfd_cells	= cros_ec_wdt_cells,
   144			.num_cells	= ARRAY_SIZE(cros_ec_wdt_cells),
   145		},
   146		{
   147			.id		= EC_FEATURE_LED,
   148			.mfd_cells	= cros_ec_led_cells,
   149			.num_cells	= ARRAY_SIZE(cros_ec_led_cells),
   150		},
   151		{
   152			.id		= EC_FEATURE_PWM_KEYB,
   153			.mfd_cells	= cros_ec_keyboard_leds_cells,
   154			.num_cells	= ARRAY_SIZE(cros_ec_keyboard_leds_cells),
   155		},
   156	};
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
