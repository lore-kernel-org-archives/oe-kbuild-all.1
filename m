Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F714EC4D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712844037; cv=none; b=MKvMBshlIIpFg3RksXdUrdxSpd0pc3Br0Wr2XkM0J1EWQe+d/qeNOJ0diws6CpnDmW3GqVTY/eicc2zK48yFviuAGJNe2c1uSLKHFwQRbXCTOclfr/mgTq5mqCAgHnzis1dBYcX8DaIcUTzFZrJHlaswelpUD2Y5YrbMZXF4+vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712844037; c=relaxed/simple;
	bh=wtoxgvwYkV7Dbw7lm70qfG6vFHI7fzMCqf0BHScSVBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LmZwrZSY77XD6yjFnXdc7sOTHtz9eZCPk1o1X6EHuQyv5c+nhpBRDYgl4oYJEjX0gajSCAyoQZfy8IsaOUlE7naDPE+VUI/a5sd7T3Fz+OQpcBfxsXs3eeKsMw4QSJCnTYHUjHflm67Wn4gZzfXA4edqLqdpPYviTfZK8UwIVvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1qIe33g; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1qIe33g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712844036; x=1744380036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wtoxgvwYkV7Dbw7lm70qfG6vFHI7fzMCqf0BHScSVBY=;
  b=F1qIe33g5soNwDhUNpfJRLv6QjSq3hUDndBsq2av0+ahaFJdoJo2VMEX
   w9MMUSQefk2sKeKKqfrMqIkHEKWz/m4yOzKl7K8w//iiP3CMaC9SXp6Im
   1X+nFBQe70IM3MAgh74DmLzbhdwzTHVuifnvV5k4wULYtXMY39rzdkIkF
   /fwax8H71EkS+Wvq0OxZbyn1Tuy3p/7jY0pDpHkEd6o4Yt74NkuBnJvG3
   H0RxIqTrwsn6t0FWr+/GNUHWj+Z44isq8ehmOyqp41dTzGjonrPddrA5i
   M7YnLymYxlyBgFN46PQ15YsFHIBrnMFHbhExL/fWt5gTTe+h3RoT7fRya
   A==;
X-CSE-ConnectionGUID: 97iwNcI+RTqvziglxe0BPQ==
X-CSE-MsgGUID: 2JFiSfltQNeCMNK4JtgZUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18857028"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="18857028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 07:00:34 -0700
X-CSE-ConnectionGUID: GsHr4epxRf6bXJwGPEeweQ==
X-CSE-MsgGUID: NXYXBfhiTKeC/zbrh6GX2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="58327721"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2024 07:00:33 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruuyc-0008fi-1B;
	Thu, 11 Apr 2024 14:00:30 +0000
Date: Thu, 11 Apr 2024 22:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 264/415] drivers/watchdog/wdrtas.c:407:
 warning: Function parameter or struct member 'iocb' not described in
 'wdrtas_temp_read'
Message-ID: <202404112153.mqNJ9gxw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2cdbd541e4481cb9cbd08913e0586dc8a2570aec
commit: 06288b00e82efd3da6c84434c0b6d9ba8cb7abe0 [264/415] watchdog: wdrtas: convert to read/write iterators
config: powerpc-randconfig-003-20240411 (https://download.01.org/0day-ci/archive/20240411/202404112153.mqNJ9gxw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112153.mqNJ9gxw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404112153.mqNJ9gxw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/wdrtas.c:407: warning: Function parameter or struct member 'iocb' not described in 'wdrtas_temp_read'
>> drivers/watchdog/wdrtas.c:407: warning: Function parameter or struct member 'to' not described in 'wdrtas_temp_read'
>> drivers/watchdog/wdrtas.c:407: warning: Excess function parameter 'file' description in 'wdrtas_temp_read'
>> drivers/watchdog/wdrtas.c:407: warning: Excess function parameter 'buf' description in 'wdrtas_temp_read'
>> drivers/watchdog/wdrtas.c:407: warning: Excess function parameter 'count' description in 'wdrtas_temp_read'
>> drivers/watchdog/wdrtas.c:407: warning: Excess function parameter 'ppos' description in 'wdrtas_temp_read'
   drivers/watchdog/wdrtas.c:460: warning: Function parameter or struct member 'this' not described in 'wdrtas_reboot'
   drivers/watchdog/wdrtas.c:460: warning: Excess function parameter 'nb' description in 'wdrtas_reboot'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +407 drivers/watchdog/wdrtas.c

031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  392  
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  393  /**
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  394   * wdrtas_temp_read - gives back the temperature in fahrenheit
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  395   * @file: file structure
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  396   * @buf: user buffer
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  397   * @count: number of bytes to be read
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  398   * @ppos: position in file
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  399   *
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  400   * returns always 1 or -EFAULT in case of user space copy failures, <0 on
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  401   * other failures
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  402   *
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  403   * wdrtas_temp_read gives the temperature to the users by copying this
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  404   * value as one byte into the user space buffer. The unit is Fahrenheit...
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  405   */
06288b00e82efd3 drivers/watchdog/wdrtas.c      Jens Axboe 2024-04-09  406  static ssize_t wdrtas_temp_read(struct kiocb *iocb, struct iov_iter *to)
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23 @407  {
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  408  	int temperature = 0;
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  409  
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  410  	temperature = wdrtas_get_temperature();
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  411  	if (temperature < 0)
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  412  		return temperature;
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  413  
06288b00e82efd3 drivers/watchdog/wdrtas.c      Jens Axboe 2024-04-09  414  	if (!copy_to_iter_full(&temperature, 1, to))
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  415  		return -EFAULT;
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  416  
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  417  	return 1;
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  418  }
031f7edecf46d73 drivers/char/watchdog/wdrtas.c Utz Bacher 2005-06-23  419  

:::::: The code at line 407 was first introduced by commit
:::::: 031f7edecf46d731673a5dd19ecb0de38f1a2219 [PATCH] ppc64: add a watchdog driver for rtas

:::::: TO: Utz Bacher <utz.bacher@de.ibm.com>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
