Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FADB635
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 04:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424501; cv=none; b=YaqcTU1i1Jl9FMUJgJu6Z7e1xSSfb4TLGaePnMUNTuVbF9mrQ8gfoEu9h4DjYHbZBmk8lCKbw6wOieYC0PY2OINg3N9kKaHzRteoMRyGjalJmnldZiYEFaCbTBiAM+P1IWW2jitMnxDM1Fm1OM8b6cc8u/IW5PRSjBJ/3cjIfSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424501; c=relaxed/simple;
	bh=AUgQOZyBIC29UPPtSHyGp2bmKmx2u+vTy8Y4gxiH3ro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MF1k0gZQVrveBiLsyVHIe3+UR8RYc9TlydXDWX6Q2EHr/iVP+8N887hlX5nJuQURQoW4MRUhI4AuGojSSTwjV6u1+FKxXYDLljlfRXD3gJ0Rlg3y1Y50ur64GteE07t1pNyYlDRatDoDJ9/vettFendux5aOlS5Kwrmg8DE4PKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UA7B3QST; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UA7B3QST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725424499; x=1756960499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AUgQOZyBIC29UPPtSHyGp2bmKmx2u+vTy8Y4gxiH3ro=;
  b=UA7B3QSTBqBpdJh4Y+lSb5wKv/msuwuJzAQ4LOjgpI7CYkKD6NLDeOKz
   twVTS/vY8DOuGrAmPk82LQZNwAnRJqguWQjBt/fzVkRpvctbi3psWEaSI
   X15i+YMF4LyoAY+M/bCxcealUcEMOLhvV0okrucpp8QDDTx5S/q2hnq7x
   YbKKQDxBzdKJLh3kDCEtOe2Lh0nVskn98UuKHWK1chFoqGaY3Y6pV7yen
   SV2RANZrn8k4gcURHQtsPCot1Xg8MRx16Sqt3PoBGYw1+mYi0v262CnN8
   d2tfGgbboEaGASKE6TLp+7tIJYBwsr8nL3fkvdVnfpA6oGMc/J84vYVHb
   w==;
X-CSE-ConnectionGUID: VqXhLaVqSfqIyi/zUGqu3g==
X-CSE-MsgGUID: EsTVDJmVSBisQ5+ua2hM8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23934321"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="23934321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 21:31:50 -0700
X-CSE-ConnectionGUID: nymfU+6KR1qG22LgFC5s+Q==
X-CSE-MsgGUID: XBgDEPz0TQGQZhxwurHw2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65855896"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 21:31:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slhgI-0007Xi-0u;
	Wed, 04 Sep 2024 04:31:46 +0000
Date: Wed, 4 Sep 2024 12:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vibhore Vardhan <vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [linux-next:master 7528/8795] ERROR: modpost:
 "dev_pm_qos_read_value" [drivers/firmware/ti_sci.ko] undefined!
Message-ID: <202409041202.jzNZJv8m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6804f0edbe7747774e6ae60f20cec4ee3ad7c187
commit: 458d22d2e064ded193d697b0629822dc72814933 [7528/8795] firmware: ti_sci: add CPU latency constraint management
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240904/202409041202.jzNZJv8m-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409041202.jzNZJv8m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409041202.jzNZJv8m-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/lib/xor-neon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
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
>> ERROR: modpost: "dev_pm_qos_read_value" [drivers/firmware/ti_sci.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
