Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C491758B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 01:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720834139; cv=none; b=fgWsaeaYw1aGqkL1pe+BHWdczZ3zPw7IlWeecGMhxni8k9RaDGhi/BxC+oCPKdWOn86po8UYcdbmOhwoFABp81/s30DVGuvpe94x1ai9k7JM6rGylUO7PCpViMTjEASwZAcUSinZa/5teHl3PfLSuhBjaVEzUnT2a1kGfmfaOUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720834139; c=relaxed/simple;
	bh=6aygtoOP1vZnFXnOhsMoYYwYWdZ04maU0Kgj1y+yFog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JofJk+8sR8SyvHokTiZ1vOXXDXp/zxQJ/ka8b/b7mpwF/IDRXEK8sfdI5TNpfiUiiHndK1kLP85Bt1LrsatQCyHMKtoleeLtS3MCRdizbPCEsqRe7nn5ow1nNbcOBKaco3KSSKsRVEUFZvNkJG9th38wOYXrqIeKzlatTNytdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C76qtmDy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C76qtmDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720834138; x=1752370138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6aygtoOP1vZnFXnOhsMoYYwYWdZ04maU0Kgj1y+yFog=;
  b=C76qtmDyp7xXU/fJRvcgjzv62oc8CzRph2bIDBXsJ0X4CEUYXHhRcJVp
   J0xeeA9hd/PxG+oYU40heGy1seVoT8+mzby/AlAfPROm3Y2hPGJBH6lE+
   M4Yw7wOvQ7s65XFGoNgmh5LrF38v5drocBDFRTlx0EVTcjyKm4sQs+4iV
   5mfMnMQJ9eYC49jbTbWOnNzbywH5S6St71KWbgkA7UeOPgX9fdPPlU7fp
   v3W4TGuNqvtUfGEoeUtsV4KQVPeDOvKRK5kXeKKt5vql/TZ5jseWje8bh
   r26sptRCJJu7Kh1tkF05+Ak6q4QFRMIdBntRR+LsCcgH4yY9C8hZ3WhmM
   w==;
X-CSE-ConnectionGUID: eR/SOSyERcyrxGUsCcNzjA==
X-CSE-MsgGUID: i9/M4EDDRWWBcoQUe3mPNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="29441193"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="29441193"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 18:28:58 -0700
X-CSE-ConnectionGUID: cG7U99o1SxidUKyGUYLK2g==
X-CSE-MsgGUID: jTz8Tf9LTmGcIUzUYrMsVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="48812640"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2024 18:28:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSRZG-000bWV-2N;
	Sat, 13 Jul 2024 01:28:54 +0000
Date: Sat, 13 Jul 2024 09:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/asoc-wsa88xx-version 6/6] ERROR: modpost:
 "devm_hwmon_device_register_with_info" [sound/soc/codecs/snd-soc-wsa884x.ko]
 undefined!
Message-ID: <202407130958.ECoQeqGG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/asoc-wsa88xx-version
head:   82aff4b129f138d605adcb618c42f9f8bf851002
commit: 82aff4b129f138d605adcb618c42f9f8bf851002 [6/6] ASoC: codecs: wsa884x: Implement temperature reading and hwmon
config: i386-buildonly-randconfig-003-20240713 (https://download.01.org/0day-ci/archive/20240713/202407130958.ECoQeqGG-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130958.ECoQeqGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407130958.ECoQeqGG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in fs/adfs/adfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/ublk_drv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/qcaux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-serial-simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/dvb-usb/dvb-usb-dibusb-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/usb/dvb-usb/dvb-usb-dibusb-mc-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-winwing.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
>> ERROR: modpost: "devm_hwmon_device_register_with_info" [sound/soc/codecs/snd-soc-wsa884x.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
