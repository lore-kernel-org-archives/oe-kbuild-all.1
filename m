Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2487F378D80
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483690; cv=none; b=bIsTe+9qF6YaH4ZfQBKP0DxmLFbuXjZmgrNwkb7ZkyAo22xEjGwWcks3Z2ICmHSnl1N8YG/mGe3bmxHT5C3W/LI416VwSxEPFFkCvbJJbbIFZbB70lzJCeF+zQmaqpRBkvHxg5uBLGzBlL1bTTkgVwoPSFxiBBpFGleoPuWAY6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483690; c=relaxed/simple;
	bh=A4nOlaWdKouI3tyaJTPELa+WT9XIutfpXFUpjnMkVrk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q1GMy7q6XOCI/4FRFv1lExhfkfwXRGYOI6GPcnp+qRbHHARMpp1gVVm/TQBnDMEhasEhekCFb1X3I+lu9Q7AOfVGyK74M4i/Osc1UultBvTsyFujqg+K84pTUx7wc7SuRne1J8FdgjsNBwGmtaxAC0qRU3+qk5+J9wFVEDkSl0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFBo+u61; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFBo+u61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768483689; x=1800019689;
  h=date:from:to:cc:subject:message-id;
  bh=A4nOlaWdKouI3tyaJTPELa+WT9XIutfpXFUpjnMkVrk=;
  b=oFBo+u61xE529qzFBh0E8p19daQ5a8U/Qhl1B+Ex++HWo5/spq3aRboi
   EDdwMczhvnihyAG5Mj0XlW/M3ZaVcz7zL1a6V3LzIFop5RVlvdG/yoH0v
   h+SxsUtl7lHJRCXdrE3/tCKOpA3hGBVmGKQ1t/3yhdzCfDoU4y0YBoQ4j
   r1LiFOTIuTspfnBFawR/9NbtokYiWTPen23pgGQ/uRKXwKSjCqB0jZq8P
   jsnnUl8hBulIwlNAHcRTvTmMBvXSS+2qeaOi/Nazn2YqZgJOO/jKc6TTN
   N7qPwds3OrkzO0b2NlcorgwByehFZliDGirvcYGPe/S22B/YajUe/89+s
   g==;
X-CSE-ConnectionGUID: wqyxOAdVROWTHxsbruObdA==
X-CSE-MsgGUID: fVH7s7c/TOObPuByuTAmWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69704699"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69704699"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:28:07 -0800
X-CSE-ConnectionGUID: nMewqBtQQ2mowds3GpqdDA==
X-CSE-MsgGUID: wRxbjHDZSP2EVvippJSzxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209467817"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jan 2026 05:28:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgNON-00000000I0a-11gA;
	Thu, 15 Jan 2026 13:28:03 +0000
Date: Thu, 15 Jan 2026 21:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 1/1]
 drivers/tty/tty_port.c:420: warning: Function parameter or struct member
 'async' not described in '__tty_port_tty_hangup'
Message-ID: <202601152117.hNT0RwRh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   d8df691c15ecca8cee9b28ff82915c7034e90794
commit: 2299e3ba1247c9e61d432355f98cd6f9872e67da [1/1] tty: introduce and use tty_port_tty_vhangup() helper
config: arm-randconfig-004-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152117.hNT0RwRh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152117.hNT0RwRh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152117.hNT0RwRh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/tty_port.c:420: warning: Function parameter or struct member 'async' not described in '__tty_port_tty_hangup'
>> drivers/tty/tty_port.c:420: warning: expecting prototype for tty_port_tty_hangup(). Prototype was for __tty_port_tty_hangup() instead


vim +420 drivers/tty/tty_port.c

3e61696bdc2103 drivers/char/tty_port.c Alan Cox          2009-01-02  413  
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  414  /**
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  415   * tty_port_tty_hangup - helper to hang up a tty
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  416   * @port: tty port
cb6f6f9877928f drivers/tty/tty_port.c  Jiri Slaby        2021-11-26  417   * @check_clocal: hang only ttys with %CLOCAL unset?
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  418   */
2299e3ba1247c9 drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  419) void __tty_port_tty_hangup(struct tty_port *port, bool check_clocal, bool async)
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07 @420  {
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  421  	struct tty_struct *tty = tty_port_tty_get(port);
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  422  
2299e3ba1247c9 drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  423) 	if (tty && (!check_clocal || !C_CLOCAL(tty))) {
2299e3ba1247c9 drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  424) 		if (async)
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  425  			tty_hangup(tty);
2299e3ba1247c9 drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  426) 		else
2299e3ba1247c9 drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  427) 			tty_vhangup(tty);
2299e3ba1247c9 drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  428) 	}
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  429  	tty_kref_put(tty);
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  430  }
2299e3ba1247c9 drivers/tty/tty_port.c  Jiri Slaby (SUSE  2025-12-30  431) EXPORT_SYMBOL_GPL(__tty_port_tty_hangup);
aa27a094e2c2e0 drivers/tty/tty_port.c  Jiri Slaby        2013-03-07  432  

:::::: The code at line 420 was first introduced by commit
:::::: aa27a094e2c2e0cc59914e56113b860f524f4479 TTY: add tty_port_tty_hangup helper

:::::: TO: Jiri Slaby <jslaby@suse.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
