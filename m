Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F196B4C74
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 05:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722662174; cv=none; b=BO2suG1/X4mQ3RFxt8CMxY99zLTbb6IeG99SqSE5sLY/Rjb/Zjlok8iEOGc5ogSHB+2mWOEin4H72X7YrUXMjm18g82YAfFyNGXVd25tWvFwc/7m31CyNUzpLWODfihv1SQIKLlu+/GIWMjYvfONdXUTh5a6nkNpxWLucPLC3s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722662174; c=relaxed/simple;
	bh=aLbAsemGuGh1A4xy9zLjEM1P9eitll2nJ1p0GC5FNUo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BFh7XHgtsMZHDczDo7ErsJfdvUekBV4fkmt7NsgjHGo99jVfR13gsn0GQpgUxb51lz/eg3Fm3ejH0p3o1m4gYh9ybMlUh81WWcAxq4tCYpW9O6F4IopC08Thg2eVoESr/4P41XX80S/udA4psh4Q5aMZt9b0gmx5TzXdMuRVVsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGTun3oL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGTun3oL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722662172; x=1754198172;
  h=date:from:cc:subject:message-id:mime-version;
  bh=aLbAsemGuGh1A4xy9zLjEM1P9eitll2nJ1p0GC5FNUo=;
  b=XGTun3oLXem61rx2sCwo4PAHX07fmOdr9C09xNfd+nV6cY2IQI9aJx5Z
   aouhSON5h/ue5uqhmLUEkXukRFNryKlqMgsM8pqCvlHcmldxfVMOw/Xfr
   qty9ELsIzjTdHDx9/WYrdXHME7g93uWoj7xZWqrqcvYfMqbvT5iPff99d
   NNkY4QydwEoCYsKnxdjuC3BudTeTbTTLntmvvK58Jp6+R/B1JreXlf5ji
   TYYIwA6Q7aVBpxCi8AkaIpA4jwck7LnCiB9ibCjQpf4CbOc4y2LRMPX2i
   6pXcGIfX2FeKFddvbgpnIyK5EYIofsjPa6LZDEm8RhMm+Kg45jX8vOPqt
   g==;
X-CSE-ConnectionGUID: T9692i7AQAaP6EPe91h0dw==
X-CSE-MsgGUID: HsIdqUsMR6G6E6XZNc5kBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31340615"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="31340615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 22:16:11 -0700
X-CSE-ConnectionGUID: qrcJT84aTuCt53jCS1uYGg==
X-CSE-MsgGUID: T2ST23GpQjqfmoWwu9guXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="56229643"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Aug 2024 22:16:10 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa77X-00006U-0c
	for oe-kbuild-all@lists.linux.dev;
	Sat, 03 Aug 2024 05:16:01 +0000
Date: Sat, 3 Aug 2024 13:15:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 868/29299] ld: hvc_console.c:undefined
 reference to `tty_do_resize'
Message-ID: <202408031337.nWne7Qej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   9485d66da87d67d1efc4a5f2d357616c6501dc72
commit: 180e8150bde1627efa62910f16ff32d2e4fa85db [868/29299] ANDROID: GKI: build in HVC_DRIVER
config: x86_64-buildonly-randconfig-003-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031337.nWne7Qej-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031337.nWne7Qej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031337.nWne7Qej-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x188): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x211): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0x243): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x32e): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x3b2): undefined reference to `tty_port_tty_set'
>> ld: hvc_console.c:(.text+0x451): undefined reference to `tty_port_tty_set'
>> ld: hvc_console.c:(.text+0x462): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
>> (.text+0x48f): undefined reference to `tty_port_tty_get'
>> ld: (.text+0x4da): undefined reference to `tty_port_put'
>> ld: (.text+0x4e7): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x50d): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x575): undefined reference to `tty_port_tty_set'
>> ld: hvc_console.c:(.text+0x5d5): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
>> (.text+0x619): undefined reference to `__tty_alloc_driver'
>> ld: (.text+0x657): undefined reference to `tty_std_termios'
   ld: (.text+0x66a): undefined reference to `tty_std_termios'
   ld: (.text+0x67a): undefined reference to `tty_std_termios'
   ld: (.text+0x68d): undefined reference to `tty_std_termios'
   ld: (.text+0x698): undefined reference to `tty_std_termios'
   ld: drivers/tty/hvc/hvc_console.o:(.text+0x6a2): more undefined references to `tty_std_termios' follow
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
>> (.text+0x6ab): undefined reference to `tty_set_operations'
   ld: (.text+0x6eb): undefined reference to `tty_register_driver'
>> ld: (.text+0x74e): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0x947): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0x986): undefined reference to `tty_buffer_request_room'
>> ld: hvc_console.c:(.text+0x9cf): undefined reference to `__tty_insert_flip_char'
>> ld: hvc_console.c:(.text+0xa8f): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0xb7c): undefined reference to `tty_port_tty_get'
>> ld: hvc_console.c:(.text+0xbcb): undefined reference to `tty_wakeup'
>> ld: hvc_console.c:(.text+0xc36): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0xf1f): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0xf38): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
>> (.text+0xfd0): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc.cold':
   hvc_console.c:(.text.unlikely+0x35): undefined reference to `put_tty_driver'
   ld: hvc_console.c:(.text.unlikely+0x6f): undefined reference to `put_tty_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
