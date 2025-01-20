Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91886EB4C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 03:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737343864; cv=none; b=gb/RvxcsaUPmbOIfSimxK8Zm1lIZFU5u0aWfGdaFzemo1j2zl1FFS3oH99rhysnwuw1r8qRZrNKJls2bZllkt/V8loObZq2srF73i+r6vm0w8MYYImrYGaXQDXNEEK6kvi5iRhynETO+RrKd4TqjUTNg3oR2YptDU7aLbjghaKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737343864; c=relaxed/simple;
	bh=ZIxfPfJs/ZyhvRRxjjH9r5V3LUJffwXTUH3cg5Pk6+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dtReHD6Qjk+Ei6KJ2Rl+G6LFn+mtVdY2OtH5OmIDf/RHfPCepPXgJWW9jCtgfMmf3yJGd5vM2gah6PHfKzQMpj/p+HL8dmavHdwVpFePgiu4kGKhKuhl54+G4lEUw3eBEzk/vZGiAdcFMn/PmUlUSTlbwrRWdWc9aoamLSIAxH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtKXd62l; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtKXd62l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737343863; x=1768879863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZIxfPfJs/ZyhvRRxjjH9r5V3LUJffwXTUH3cg5Pk6+A=;
  b=dtKXd62lJZQsvRsFbCk9B15Mb34V8WGj+1WbOFG6QT+y3pVnMHeWID7C
   eC4eCTB7DWxSuTSHJaeHXYhokES9xdo7WVfn4IKgxLagA9LsJ0L4NL1Kd
   OCtgryce5PvHMNsvtzbBR1pNl7X2Gz+6IaiG6Yo1gAc8AvG6e4BZ+F2i0
   OxS5v18VoNaV6niCg5x8kJnHoxFrtQlRLjeFVJDmuIiTSiWPyrfNt64x1
   wwNj3LNN6l/+31ItxSOBvux/KQRtJL41v6AKSwMTaHxTyp1OvZH8B/Nor
   ACP1owX+qYhxSWKvo03wPG3kknfLaaRYJAl7kteL4yuIXU39fDkvqj0D5
   g==;
X-CSE-ConnectionGUID: uB8+awLtQm65zqnglrAgLw==
X-CSE-MsgGUID: 8ZbvTsaqRKKelFkuapZ1BA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48367181"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="48367181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 19:31:01 -0800
X-CSE-ConnectionGUID: oow0NTZ2QZ6AGHVhSRxECg==
X-CSE-MsgGUID: 7Q7e2cHNRwyz3uem+HPyLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129620552"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2025 19:30:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZiV7-000W85-15;
	Mon, 20 Jan 2025 03:30:57 +0000
Date: Mon, 20 Jan 2025 11:30:27 +0800
From: kernel test robot <lkp@intel.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Gwendal Grignou <gwendal@chromium.org>
Subject: drivers/hid/hid-google-hammer.c:261:36: warning: 'cbas_ec_acpi_ids'
 defined but not used
Message-ID: <202501201141.jctFH5eB-lkp@intel.com>
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
head:   ffd294d346d185b70e28b1a28abe367bbfe53c04
commit: 47f11e0b40e97f373da4efbacee0a9526c816ed5 mfd / platform: cros_ec: Move cros-ec core driver out from MFD
date:   5 years ago
config: csky-randconfig-r026-20230823 (https://download.01.org/0day-ci/archive/20250120/202501201141.jctFH5eB-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501201141.jctFH5eB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501201141.jctFH5eB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-google-hammer.c:261:36: warning: 'cbas_ec_acpi_ids' defined but not used [-Wunused-const-variable=]
     261 | static const struct acpi_device_id cbas_ec_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~


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
