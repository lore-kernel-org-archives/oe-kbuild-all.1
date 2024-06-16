Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355F6433CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 04:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718511378; cv=none; b=ZLIFnVsqkzFdnV4sVrfImV5XjXn0Ahcn3BceVOg7de+eSbU8G0JTqBt9t7AuYznt0FjkKK/uHAJOdJ5obU/pgB26G40Ht7pTNJRZRVToS5JVgxLqg+KbQIC2tkwS1DEaeOzRbEW9mOPTKQWHces+3hHIobf8fpf6Wutx9Ix4xYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718511378; c=relaxed/simple;
	bh=1bi1oGUSmGQFW+oIC8IqTOQth7HkWQiCfPa3FYzkwqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gv+VGZTGlKNPfQmjM5dC0GBq9mZgkjFiKjSj8/Iji6SYaqkc2wOhuXOrC152PFkXuByEzKOBQwNbdvCdH3iTM07Daz6DeUTmG4n+uPo60D7uxibqjrV669FLb+mtEXlTDKae0DQnBCM0kYUOWOu5b6cnI/JmsCO2x+7wPTDbEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kil2+fFM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kil2+fFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718511376; x=1750047376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1bi1oGUSmGQFW+oIC8IqTOQth7HkWQiCfPa3FYzkwqw=;
  b=Kil2+fFMcy52TFHjWgjBi2DMS7whLpdZbkDHegg0rVIMrqeTrY6LYqlS
   FrtaGkNqwvjVGwJwomi7E6ypX0UY15KPmyflJJzCGN3ijQNAEvbhPDGif
   uV2q4JVRM1fDMJEUFU5jmeUu04Ms43cUr1ZQ/yF1TrwBw1GZ3GZYYGfdW
   ZYCj3zJ+YCUBkRF2MhOztLAP3Gtj/J3xkn4QaSlGpVIv4eLTz2ySX/QBI
   BsVu+g461Wc1XiEFIJ7M2qWIYvr2oOGHyJEc2uUU2+UXBky/taDs+xPsR
   qE4h36TCFVqtWreniWC0KsQn0IjucfTjU+ucLOsBbtVVfcCBhxlNXm601
   Q==;
X-CSE-ConnectionGUID: WCCYI0QOT6+JRKkt1YfYgA==
X-CSE-MsgGUID: Gm5ZVDFjT2OsRQFoUzrkrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="37891355"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="37891355"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 21:16:16 -0700
X-CSE-ConnectionGUID: 61hnLH7rSZKeV4WyFwG/bQ==
X-CSE-MsgGUID: 5KEKfXX9S0Wf+76qDu5BYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41559532"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2024 21:16:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIhJM-0000qk-13;
	Sun, 16 Jun 2024 04:16:12 +0000
Date: Sun, 16 Jun 2024 12:15:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.10-rsslro 2582/2587]
 drivers/net/phy/aquantia/aquantia.h:205:94: error: expected ';' after return
 statement
Message-ID: <202406161249.XhU6H1vF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.10-rsslro
head:   eb3136f791cd4e799431e1050a94b2b25b20dc0d
commit: b7efc711a9edfbc427f07e5542fdad6030468d22 [2582/2587] net: phy: aquantia: add support for PHY LEDs
config: i386-buildonly-randconfig-005-20240616 (https://download.01.org/0day-ci/archive/20240616/202406161249.XhU6H1vF-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406161249.XhU6H1vF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406161249.XhU6H1vF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/phy/aquantia/aquantia_main.c:16:
>> drivers/net/phy/aquantia/aquantia.h:205:94: error: expected ';' after return statement
     205 | static inline int aqr_phy_led_polarity_apply(struct phy_device *phydev, int index) { return 0 };
         |                                                                                              ^
         |                                                                                              ;
   1 error generated.


vim +205 drivers/net/phy/aquantia/aquantia.h

   202	
   203	int aqr_phy_led_polarity_set(struct phy_device *phydev, int index, unsigned long modes);
   204	#else
 > 205	static inline int aqr_phy_led_polarity_apply(struct phy_device *phydev, int index) { return 0 };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
