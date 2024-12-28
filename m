Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF01E511
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 02:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735354585; cv=none; b=fZMUUKzYAFcr4ayRZeQyu3GqzXQJgGSd14bJvPPK3DL/tDfhPyhHZTCWcl/0E+6QSk0jp/ynehLgEWfAjxP1o/oolGPADY7oEAkqOWf25zIB+IWL7bqhrws2P4vnh2Oc+FSNuNWp7Wq34J9dN7EiffmjW56GP927IOHZIWCUFHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735354585; c=relaxed/simple;
	bh=rGPGUAl0zvO6NLn5NPn2uorCAHPoVd1o+kSJlvBJnZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxRfqNeR8kdW7Bb0TJMCMqKH6csmOv0LS+P931IjfM+Kl1a4C8KKJjlEJ6h/mFLHkWdzrKkx6zN6bbwmwQfATDJNtxPhJGfDpG96tyNG5WKHcofx/iSneaVEI6QMqf2B0KrE38/pEfZ6gF7ljB5pe3CHLCBz3fylL0cKsbNNUHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwPLrW4P; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwPLrW4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735354583; x=1766890583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rGPGUAl0zvO6NLn5NPn2uorCAHPoVd1o+kSJlvBJnZA=;
  b=cwPLrW4PXXeJZ2IzO6k64joTw933RIYWybM9QOxJuWLC9EcxPZwtPVzH
   UDR7V7bwtydGzoElvrySAWrC5Yzx5EDSTYRJapR52WNwchAv180QfSphV
   9pi236UecVAmL2mZHnkcd6G+nOpUG/+52ws7veqjTSbkhvUKIeDkQftma
   C8mvOEbMdQ3x4MwDAtlJFdVDrzMh03iQS1mlNOjG1/jGB0QKeAl3K2sRz
   voD4E31BhlAa03vgLpvaTcG72g+y31+bpMUwu0iv6nBqtyTjLChjqeW4S
   TRtOYwTDlZKixEACwtLid+r1s/y06lku9yqG1hGZhZE53wyf0sbsMkk/x
   w==;
X-CSE-ConnectionGUID: Y8DfsjP5S9SQ/OXxsV4GVg==
X-CSE-MsgGUID: 4sNp6h+BR6u5MUaz6+lnuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46742714"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="46742714"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 18:56:22 -0800
X-CSE-ConnectionGUID: tdZ/jdfuTK2LIMii2Bjukg==
X-CSE-MsgGUID: SQ7QTKNQRw+wMJ4cPqgmuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100774285"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Dec 2024 18:56:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRMzz-0003pM-05;
	Sat, 28 Dec 2024 02:56:19 +0000
Date: Sat, 28 Dec 2024 10:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Gwendal Grignou <gwendal@chromium.org>
Subject: drivers/hid/hid-google-hammer.c:261:36: warning: 'cbas_ec_acpi_ids'
 defined but not used
Message-ID: <202412281020.IX2iXHrC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd0584d220fe285dc45be43eede55df89ad6a3d9
commit: 47f11e0b40e97f373da4efbacee0a9526c816ed5 mfd / platform: cros_ec: Move cros-ec core driver out from MFD
date:   5 years ago
config: sparc-randconfig-002-20241212 (https://download.01.org/0day-ci/archive/20241228/202412281020.IX2iXHrC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281020.IX2iXHrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281020.IX2iXHrC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-google-hammer.c:261:36: warning: 'cbas_ec_acpi_ids' defined but not used [-Wunused-const-variable=]
     261 | static const struct acpi_device_id cbas_ec_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~
--
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMPAT_BINFMT_ELF
   Depends on [n]: COMPAT [=y] && BINFMT_ELF [=n]
   Selected by [y]:
   - COMPAT [=y] && SPARC64 [=y]


vim +/cbas_ec_acpi_ids +261 drivers/hid/hid-google-hammer.c

eb1aac4c8744f7 Dmitry Torokhov 2018-10-05  260  
eb1aac4c8744f7 Dmitry Torokhov 2018-10-05 @261  static const struct acpi_device_id cbas_ec_acpi_ids[] = {
eb1aac4c8744f7 Dmitry Torokhov 2018-10-05  262  	{ "GOOG000B", 0 },
eb1aac4c8744f7 Dmitry Torokhov 2018-10-05  263  	{ }
eb1aac4c8744f7 Dmitry Torokhov 2018-10-05  264  };
eb1aac4c8744f7 Dmitry Torokhov 2018-10-05  265  MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);
eb1aac4c8744f7 Dmitry Torokhov 2018-10-05  266  

:::::: The code at line 261 was first introduced by commit
:::::: eb1aac4c8744f75460c34d71b0c73bebf3e8ee5c HID: google: add support tablet mode switch for Whiskers

:::::: TO: Dmitry Torokhov <dtor@chromium.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
