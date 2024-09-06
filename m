Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D78114A4DD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725617711; cv=none; b=nqO8Dtt6VqYCq8yIUrOM9m3uQ37E/M+DVW3dbktsUXIc6ZqoYLjzAZ62KrU4vK3Mw+A66Ayj3crhZSerqhgde7ijvAkh4YeZKC2GEireQaUpdxleU51XVskcxcv8e19+RBDsAUMstdp4xv2edwEMETclLEUjOh8ol2m4y+x0zzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725617711; c=relaxed/simple;
	bh=JilLDIARawAYZ5+h2p21sCJojFgsPf0eqQHITIKUxgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=srYxt+AXSyDu0JT/j5X6N5Y4y0i34rSzlBmtg4C92og2GT2vwpiIXhZQ5Z8nGQOrtiqvRTwQqAALwNurB25rPZLThQ7PXYEybvQjg1SLr3BdE4Tpmk9GcpUSWN7qgzBOHhYIiY/gzr4uC/dIDkWV9na3jkXbyFMmo7wtJu7Iu4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlIGUyrn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlIGUyrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725617711; x=1757153711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JilLDIARawAYZ5+h2p21sCJojFgsPf0eqQHITIKUxgs=;
  b=BlIGUyrnGJ0+W1FDEqqR8F9vz0Ma0/GOUWdx4vupA+TjA21FDbmBMURq
   Nr22crlokibKD7W+2i+91v66J1AAdzqgBRGEG+cubAqc2h7YzDHpJGLq6
   QvLWsschl0vtQT/CtDAmRJRjmZnhWS5ievDv5VNlKh4QFqfWlQAHcLLcA
   LuU7zyibpOSsNBY1A9yDzIgXd/t9IvuofTHilK/fKc5fsOsD7JqcXJAz0
   DcueEHoJk1fc1Q+YWdkez56D1ooIrs6JhuIoQ7pyLuANKb/nFlAqk7YlA
   78JRK6VO6cmykJ+/HiEGlj82gWO8025tamQJ0d3vpQ6uXGx9avNBzCLn3
   g==;
X-CSE-ConnectionGUID: Z8LLYN46Tumj9BsnehL4yw==
X-CSE-MsgGUID: GkUMgtJPQX+qPDEjKuhk5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24526110"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24526110"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 03:15:10 -0700
X-CSE-ConnectionGUID: bzwMtyJYT3i0O4LhcJ5SbQ==
X-CSE-MsgGUID: XHN68hdfRCyODWtHmVZfWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65908994"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Sep 2024 03:15:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smVze-000Ayn-1h;
	Fri, 06 Sep 2024 10:15:06 +0000
Date: Fri, 6 Sep 2024 18:14:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 153/155] ERROR: modpost: "__udivdi3"
 [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202409061851.qPfyD3Gi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   b675b2e4be615427aeda508cf0570e9e865835ab
commit: 7abab864a198fbb6045ece57950ceda622443284 [153/155] bcachefs: Progress indicator for extents_to_backpointers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240906/202409061851.qPfyD3Gi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061851.qPfyD3Gi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061851.qPfyD3Gi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/ch341.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/qcaux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-serial-simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symbolserial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
>> ERROR: modpost: "__udivdi3" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
