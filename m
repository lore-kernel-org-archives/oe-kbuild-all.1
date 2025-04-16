Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4122040B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Apr 2025 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822529; cv=none; b=r7C7aVe/wysb9OMOD2wAtmDbh2ttcWbNichdErqZwsxWqKcdJ+NnwZ0Mr42ROwH6REUYd2LSsVnx5tAmrS6TZx5D1CeiNqpGB+7dh8zVzD77zc0/IS3va+CGwltkdkIsaqqQhpaXTHlpego8N093N4rmm/Yf+/inSB3EbgeyITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822529; c=relaxed/simple;
	bh=AZHlkAaTfNRMqWEeUXVxAnHvQMyNT8l/Gd0cjs7sudI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VUSZhDxFu97nIeUP0H/gyu/Af5YsBRQ9mfVIHvVmTD67Hqbj+qs++bpPX7rBCS56TQIHQdE4Z83LwRr4EWHskXmKFb0Quhf++Swzo4BvdcFpA5xZX8Er4crKL+TUVI6kAWOGqIZK1RKXL7XiWEimbOlLpC8S0IgPscOF7K/TPFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdVPpTmb; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdVPpTmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744822528; x=1776358528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZHlkAaTfNRMqWEeUXVxAnHvQMyNT8l/Gd0cjs7sudI=;
  b=cdVPpTmbYj9GU6J5iMvVE4LpofFM7gQzPgLUT7vrvw7qoiaHLCi1gJfe
   iTW3SGxoJoI5Ev6X826Mfgu/Ym/bkdAEExaLoig/7pd/e52sZOedrznSF
   g/cvGe/mMsLOx0MmmEQ6Hbn1rK3hjK9PM/vPOCeUxpf1G/9Y+4awt+KWn
   6ckJwlcZg5FlFS1wL9DvzrSw0ZPw5Dyxm4GT0BStEiq5rm5J1a3//NZck
   agcEUjY4C21OLnNDKFeYCdIip78ixOcwlbN9JxfRPfr3bvYhRxLQJbumF
   6rtBtxttAOk7jpQexI9W0EJ8Q7KcrjYOeZfPY3PH6jr8aZqLeL0GdjAme
   A==;
X-CSE-ConnectionGUID: aaQDyqYrRkCFPzEbj0osYQ==
X-CSE-MsgGUID: lM1GPhAJSjaLlkasLLUKgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46266797"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="46266797"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 09:55:27 -0700
X-CSE-ConnectionGUID: KrxRBLf1TNq6gqwi9CKSJQ==
X-CSE-MsgGUID: 2WKz82SARye/NSo1elP4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135394207"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2025 09:55:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u562k-000K5o-2t;
	Wed, 16 Apr 2025 16:55:22 +0000
Date: Thu, 17 Apr 2025 00:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 24/24] kismet: WARNING: unmet
 direct dependencies detected for EEPROM_AT24 when selected by ZII_RAP
Message-ID: <202504170046.sG30K0Wl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v6.15-rc1-next-next-inband
head:   9e2d85243a79cbf10ea6538b605260e3199fda1a
commit: 9e2d85243a79cbf10ea6538b605260e3199fda1a [24/24] platform/x86: Add Zodiac Radio Access Point platform driver
config: x86_64-kismet-CONFIG_EEPROM_AT24-CONFIG_ZII_RAP-0-0 (https://download.01.org/0day-ci/archive/20250417/202504170046.sG30K0Wl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250417/202504170046.sG30K0Wl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504170046.sG30K0Wl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for EEPROM_AT24 when selected by ZII_RAP
   WARNING: unmet direct dependencies detected for IGB
     Depends on [n]: NETDEVICES [=y] && ETHERNET [=n] && NET_VENDOR_INTEL [=n] && PCI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for PINCTRL_SX150X
     Depends on [n]: PINCTRL [=y] && I2C [=n]=y [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for RTC_DRV_DS1307
     Depends on [n]: RTC_CLASS [=y] && I2C [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for EEPROM_AT24
     Depends on [n]: I2C [=n] && SYSFS [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for USB_SERIAL
     Depends on [n]: USB_SUPPORT [=y] && USB [=y] && TTY [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for DS1682
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]
   
   WARNING: unmet direct dependencies detected for I2C_OCORES
     Depends on [n]: I2C [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - ZII_RAP [=y] && X86_PLATFORM_DEVICES [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
