Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC68F6B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jan 2025 20:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280627; cv=none; b=B0UEn/eAAOMXN6X0NlDbE9zJ4IypfHIQ4fWslQ9jEXy0hC8PjEryz4QqOhu7ZsEN9McvMg3iczR1VHh8Qjeh7RpfaOdEEXowUDZSDc/uWNsajTMyIdklzmTkHTdLgxoFBLsPsQIx46epZnv6PTaLRuSZu370OO3bowbRDEAwxtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280627; c=relaxed/simple;
	bh=Ody/UlRgjlVKAEmimrlylCo3hZZLu7mclw3dvd9dH1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SGOQbQ/34QJI4+VLFxLsVu2W+isxKo6la/ngEAPqAK9AiFUjz0YmNokFhCeduGVbbHUUVNQ5+aOlbEUxN39xkElrwzuaQGYRRFTw1h1CYS49nneJ5J29H1oyDg2kVq/uCZEKZV6Jfo59WDbz9t60hMMSf+gPgL4Cg0Ye56suSgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgvoSC3N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgvoSC3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736280624; x=1767816624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ody/UlRgjlVKAEmimrlylCo3hZZLu7mclw3dvd9dH1g=;
  b=jgvoSC3Npd586TqdMCrgiqf2OXLYVGk2OJ55zhEsrImVKHDWPVchIzDZ
   5MIpoyOXsQhusPehA26WBMjCydEDyrX7FDJE4y8kuoFn5qY2Dna/72A0S
   S+98nGX9vP4patpr17b2MKKf/amqxdju82rRhGGo58WZaGtzkXs7OgUn/
   1JbM9mmn48zo9WypQYniJiV0zkMOMrWWNCBquGUoHHXTf+hBpIbkOeFWV
   ET4XSJQG6Fx322OJuT+gYB9vsAMdksAh0vcPSX4G3s0S9K6/n0zL/sPN3
   45MLcke99h5UY9oEf8h7eDeelHsjnJTxH6UcW9zRcIBfAbb1XV1HIEdck
   A==;
X-CSE-ConnectionGUID: FIIT1jh3RNCpEn2W+u1hlw==
X-CSE-MsgGUID: YHnW/UkaSe2a6aq2H0eBjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47900725"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47900725"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:10:23 -0800
X-CSE-ConnectionGUID: RhlrnGj3TbCBrfnUKvnFnA==
X-CSE-MsgGUID: fYp2ISwpQkqNLen7yFxO2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="103079460"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Jan 2025 12:10:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVFu7-000FAP-3B;
	Tue, 07 Jan 2025 20:10:19 +0000
Date: Wed, 8 Jan 2025 04:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Gwendal Grignou <gwendal@chromium.org>
Subject: drivers/power/supply/cros_usbpd-charger.c:15:49: warning: '%d'
 directive writing between 1 and 11 bytes into a region of size 5
Message-ID: <202501080332.cWaGQlRG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Enric,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fbfd64d25c7af3b8695201ebc85efe90be28c5a3
commit: 47f11e0b40e97f373da4efbacee0a9526c816ed5 mfd / platform: cros_ec: Move cros-ec core driver out from MFD
date:   5 years ago
config: arm-randconfig-r016-20221216 (https://download.01.org/0day-ci/archive/20250108/202501080332.cWaGQlRG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250108/202501080332.cWaGQlRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501080332.cWaGQlRG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/power/supply/cros_usbpd-charger.c: In function 'cros_usbpd_charger_probe':
>> drivers/power/supply/cros_usbpd-charger.c:15:49: warning: '%d' directive writing between 1 and 11 bytes into a region of size 5 [-Wformat-overflow=]
      15 | #define CHARGER_USBPD_DIR_NAME                  "CROS_USBPD_CHARGER%d"
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/cros_usbpd-charger.c:656:45: note: in expansion of macro 'CHARGER_USBPD_DIR_NAME'
     656 |                         sprintf(port->name, CHARGER_USBPD_DIR_NAME, i);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/cros_usbpd-charger.c:15:68: note: format string is defined here
      15 | #define CHARGER_USBPD_DIR_NAME                  "CROS_USBPD_CHARGER%d"
         |                                                                    ^~
   drivers/power/supply/cros_usbpd-charger.c:15:49: note: directive argument in the range [-2147483644, 2147483646]
      15 | #define CHARGER_USBPD_DIR_NAME                  "CROS_USBPD_CHARGER%d"
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/cros_usbpd-charger.c:656:45: note: in expansion of macro 'CHARGER_USBPD_DIR_NAME'
     656 |                         sprintf(port->name, CHARGER_USBPD_DIR_NAME, i);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/cros_usbpd-charger.c:656:25: note: 'sprintf' output between 20 and 30 bytes into a destination of size 23
     656 |                         sprintf(port->name, CHARGER_USBPD_DIR_NAME, i);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +15 drivers/power/supply/cros_usbpd-charger.c

f68b883e8fad23 Sameer Nanda  2018-05-02  14  
3af15cfacd1eef Fabien Parent 2018-08-10 @15  #define CHARGER_USBPD_DIR_NAME			"CROS_USBPD_CHARGER%d"
3af15cfacd1eef Fabien Parent 2018-08-10  16  #define CHARGER_DEDICATED_DIR_NAME		"CROS_DEDICATED_CHARGER"
3af15cfacd1eef Fabien Parent 2018-08-10  17  #define CHARGER_DIR_NAME_LENGTH		(sizeof(CHARGER_USBPD_DIR_NAME) >= \
3af15cfacd1eef Fabien Parent 2018-08-10  18  					 sizeof(CHARGER_DEDICATED_DIR_NAME) ? \
3af15cfacd1eef Fabien Parent 2018-08-10  19  					 sizeof(CHARGER_USBPD_DIR_NAME) : \
3af15cfacd1eef Fabien Parent 2018-08-10  20  					 sizeof(CHARGER_DEDICATED_DIR_NAME))
f68b883e8fad23 Sameer Nanda  2018-05-02  21  #define CHARGER_CACHE_UPDATE_DELAY		msecs_to_jiffies(500)
f68b883e8fad23 Sameer Nanda  2018-05-02  22  #define CHARGER_MANUFACTURER_MODEL_LENGTH	32
f68b883e8fad23 Sameer Nanda  2018-05-02  23  

:::::: The code at line 15 was first introduced by commit
:::::: 3af15cfacd1eef7f223802d49a88cae23c509183 power: supply: cros: add support for dedicated port

:::::: TO: Fabien Parent <fparent@baylibre.com>
:::::: CC: Sebastian Reichel <sre@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
