Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9D714F9CC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722852286; cv=none; b=WJDhBJ1HoE+kKg5lPb6BPYsv49Y/TzLSRjyr9DcvIW8VB+qzfPYbKy+hN2tUPuwyT0opHRnK0XZwDSC8+Dcp6iEI0mkKWsqqX7rnE9zM/+jOgqKCyO/y94UxcTBAm7yFpZEGBB2r/qkADVb237AXSbEguBDJ+Z5cCO1NXqEw4qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722852286; c=relaxed/simple;
	bh=ToDphomYN0bQnyqulhkcAB76UxHr84zoFKIZyYfPsWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hx+pwho4ZLmo4YXzGkvWw0MZfRnjGUzt9mO/JitAXBSQlAByC9T7l5DGpI9itYs/0358xydeDinLUL0wmP8ZOTmAQVcW3aoVbQ8n/dZhqgXYNFOlTBm+kUWk7Xrt586ftpZyPp9Q/ka42dtK0Gfv426g/h1Av/t8NPjZDQ0ei3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3umD3oY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3umD3oY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722852282; x=1754388282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ToDphomYN0bQnyqulhkcAB76UxHr84zoFKIZyYfPsWk=;
  b=f3umD3oYKtm2XdBNvXALa6j0kYseTnzbHk1meIywiBR3QY1+MujuupXx
   muWdD/dx5PiI3gjDPKLq18ZloFIvZsBNBkfdpER0gMfVPWTilyIjz01Ie
   byL6A9wpi9ZWIM4oqApWBPzXhbgg46piGqKOF4h1ARLtgczgIkKbpxTGi
   /87bTPhDxP5zZgmKWQfhXpZXhIlCX5g7qKHcahmc35h/oQdSfQXA+gyec
   U7aY8eQiHQYBW9DGAbnRQDEoDUvSDtkKk2Y65s0Fvpxpw/psFiQVxWOl5
   2MI1ixLh7V0rLNcAV359QY4rsJdjdN8aALmfZsgKNiDFmTgShyJO1vSCo
   w==;
X-CSE-ConnectionGUID: OM3ZquoLQu+Y8prBedcIBA==
X-CSE-MsgGUID: njujStgnS5eY3iTPdYXPEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="31462840"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="31462840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 03:04:41 -0700
X-CSE-ConnectionGUID: nvxV0/MoQlCqRvsr2XBj0Q==
X-CSE-MsgGUID: 8h1yuF3cRxuYaueTnAHVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="56036267"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2024 03:04:40 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sauZx-00023q-2A;
	Mon, 05 Aug 2024 10:04:37 +0000
Date: Mon, 5 Aug 2024 18:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [linux-next:master /3069] ERROR: modpost: "tpm2_sessions_init"
 [drivers/char/tpm/tpm_ibmvtpm.ko] undefined!
Message-ID: <202408051735.ZJkAPQ3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f524a5e4dfb75b277c9a5ad819ca5f035f490f14
commit: a223ab72caee9aa1250386c90176fa3f2c2f1d50 [/3069] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize session support
config: powerpc64-randconfig-002-20240804 (https://download.01.org/0day-ci/archive/20240805/202408051735.ZJkAPQ3b-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408051735.ZJkAPQ3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408051735.ZJkAPQ3b-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/ch341.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/qcaux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb-serial-simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
>> ERROR: modpost: "tpm2_sessions_init" [drivers/char/tpm/tpm_ibmvtpm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
