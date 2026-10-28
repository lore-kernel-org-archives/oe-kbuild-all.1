Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191918;
	b=oCHgEEGTFaEyp764JkdzhWd2D0hrFZQl6E0AwjZEIcA267O1LNM3s6c0QAk0+kV7GRd7
	 oIAaukL0yfZtpjAX3QrjF3OVI8h3U0Bo3C12tw2uy94ANmXwUoaddMHqM9dgnEnjZm4uS
	 Yz7ewqDaZvyQM+ztuWQEJyX0xeEhirnvcvAxaSs3Eotm+70dBFb2rtranLdyb9k9yA+Vi
	 a6o2it+sWWjL4qRDtSLF3GN4vfYKdZz0ncV76oqy6EvvDfAlXoanCVpPsD/6LwbI4Zdef
	 R7oybhOPtD2n6nErd+rjap4D9/pp38Rlv76D8XCN1F1wQAoa5utTx5HYm16uneE0gZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191918;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=O9lQTxHhrDDZBaYhoxDihJAEQpEwXxBwUYif7fMqA4Y=;
	b=iSbwqiYGzGI14rg6bge28sgcM0z8iyqtSrVqIb5CZmInxkyVGzJLngOO7T4jNfLXQFXp
	 TGtELhljMgNzu7v6FVpHUUO2Sr/UY7r9nFqH9xZ/g/lrzX3FK4n5qCjtoyAKfngBuWe+G
	 UYSFK2ckVG49J1gbvLZYGtV4CzqBVdwXuXdEgWg16cUOSd8GiwDeowK3ae1BxFjGaO0lx
	 3Xb8Bmd7H4ssFx6tG6qoCjOP3zk98N/pFdEq3H3bj8nh/3HgiO2eo42y16qCRCyb8RLXQ
	 iqMYwk2+5alu7fKQ3T2RGtxbWBCRof+KwxBYY1RGXrcnn9108aevreOCeEu7zbk1Phg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mLIW7Mf5;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F415606A329
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 12:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F415606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mLIW7Mf5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793191917; x=1824727917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lQkK7PFAdKklMS6gCoUL/ys4WtGBpYO+wvVN198lPt8=;
  b=mLIW7Mf5R7s6rr6IG0dfs9cPW1sAjWWep6kmdlxGDjPPAD3wccYlJRME
   25FFqUCpOOaYoax4HQuu6WjybMhRxn2CLAdkGRs4bCrdIE4AIXKOdePGm
   irhW2GBdbchkU6Aq7OyPTb6KHE4EQrKguoHm0y01gdAYE9zcgPJAmr+mv
   FfCwpHhwQUBmKnwaLBKtHVYfh/OzsYN2unfD5oPUyenvxWl72321mmDQ/
   nfui5yHm5MTpul8/XabX3ObbsyjZ7bRQ95RTiUaVarq3HXPG1lA/U9KXP
   0GWW219rSmikfpHTj3Jj/VeK+Wt9/vNhH1W3fDaoYf6mUyU5iNhPPufur
   Q==;
X-CSE-ConnectionGUID: U7SUoiYiRniWT7tz3V7bhQ==
X-CSE-MsgGUID: Pp949EfLS0KJbbGGlIrLAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="2016629"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2016629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 05:51:57 -0700
X-CSE-ConnectionGUID: 9HYSjOfJRYm/Zs5b9kQbsQ==
X-CSE-MsgGUID: 2QZnF2oaSrWvL1iW1QqPxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4874432"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2026 05:51:55 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM38C-000000004rt-33tE;
	Wed, 28 Oct 2026 12:51:52 +0000
Date: Wed, 28 Oct 2026 13:51:14 +0100
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [brgl:gpio/for-next 20/30]
 drivers/gpio/gpio-virtuser.c:1603:10: error: 'const struct config_item_type'
 has no member named 'ct_attrs_const'
Message-ID: <202610281320.OShGuP6l-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
head:   5e826d71d4839d8471784d968274823f1f492eb5
commit: a67ab3994716e1bfe86b53330d1cf2f5bf6bfbad [20/30] gpio: virtuser: constify struct configfs_attribute
config: openrisc-randconfig-r2200-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281320.OShGuP6l-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281320.OShGuP6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281320.OShGuP6l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-virtuser.c:1603:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1603 |         .ct_attrs_const = gpio_virtuser_lookup_entry_config_attrs,
         |          ^~~~~~~~~~~~~~
>> drivers/gpio/gpio-virtuser.c:1603:27: error: initialization of 'const struct configfs_group_operations *' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1603 |         .ct_attrs_const = gpio_virtuser_lookup_entry_config_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-virtuser.c:1603:27: note: (near initialization for 'gpio_virtuser_lookup_entry_config_group_type.ct_group_ops')
   drivers/gpio/gpio-virtuser.c:1719:10: error: 'const struct config_item_type' has no member named 'ct_attrs_const'
    1719 |         .ct_attrs_const = gpio_virtuser_device_config_attrs,
         |          ^~~~~~~~~~~~~~
   drivers/gpio/gpio-virtuser.c:1719:27: error: initialization of 'const struct configfs_group_operations *' from incompatible pointer type 'const struct configfs_attribute * const*' [-Wincompatible-pointer-types]
    1719 |         .ct_attrs_const = gpio_virtuser_device_config_attrs,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-virtuser.c:1719:27: note: (near initialization for 'gpio_virtuser_device_config_group_type.ct_group_ops')
   drivers/gpio/gpio-virtuser.c:1719:27: warning: initialized field overwritten [-Woverride-init]
   drivers/gpio/gpio-virtuser.c:1719:27: note: (near initialization for 'gpio_virtuser_device_config_group_type.ct_group_ops')


vim +1603 drivers/gpio/gpio-virtuser.c

  1599	
  1600	static const struct
  1601	config_item_type gpio_virtuser_lookup_entry_config_group_type = {
  1602		.ct_item_ops	= &gpio_virtuser_lookup_entry_config_item_ops,
> 1603		.ct_attrs_const	= gpio_virtuser_lookup_entry_config_attrs,
  1604		.ct_owner	= THIS_MODULE,
  1605	};
  1606	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
