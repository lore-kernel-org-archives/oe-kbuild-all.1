Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8982114
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jan 2025 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735845852; cv=none; b=mqyy21xNNoFmgKvJmxkvGS5veSY3RqtI5UOenW1S3kA73a8JYab0bxi6PPFMX1kDZYWzLaheZ1PqliPFDK2wfPeXKgy9d0v1fmXJCizG74N38mVZvxGO+3nlRXFNqz6AGsxaM9yZJvL8mpX8tDOn9EkGHLBoI1ZnKeX9xF/x2Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735845852; c=relaxed/simple;
	bh=kVC9jmkIZWm8vHK81iU3lnlsXHqeboFpyNQBn6KA3WA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jxhRw0t3Z9HB9/Wt72NzYNdikJpdfu7ayGKInL7wtbuBdGJTLhgDlSpC0mEUjEg4dXye/KB+x3q9q8ZbQq3vdw0FtnbYZKQ+zqdcwk6zAKMRXTjGsDLw33GrIHdf6RbbWYo/0mCx2Wt/u3JRYpoA8e2d53/rTJlNPNWoNx4fuOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9i97OBS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9i97OBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735845850; x=1767381850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kVC9jmkIZWm8vHK81iU3lnlsXHqeboFpyNQBn6KA3WA=;
  b=V9i97OBSY0H/oSpGsohSEROAqFY3BgyQqiCq4slvAzZ74Oh9No9h1fLp
   pyfMHYqthZHJnKdoIzpqKV0y+cuK3AXlXIHuWrxbQfimC2CAknBX5lidz
   v3EulbTtxsLJtKNXTtsHf/WLMUt7acRGlL4bq5kyctKd9Xr+IVBCmWd2y
   IZt59LnB5jLYxLgA5eFQ05DhkS3xReLn+Ygu3L7VhgRwh23GAqTBkvzrd
   V+J1J7cvq/QVjhO8e6R0vwUoWbD6JqE3XK3XmWLZbehkH6Q/s2qaw9f2s
   oAi87RqNpWwC2weQIImC0Dbo/4RuV7K719AJ9/FNlPUOHG75IqshczTTp
   Q==;
X-CSE-ConnectionGUID: ipLR029bTGST3iGfoyvjnQ==
X-CSE-MsgGUID: +oKktvhvQ0SRvDPguavhYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36258207"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36258207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 11:24:10 -0800
X-CSE-ConnectionGUID: L3gxqDUeRZyNj8ZoxnLQzQ==
X-CSE-MsgGUID: 7od1gCwJQHy5RToFngX+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="101673601"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 Jan 2025 11:24:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTQne-0008nH-1F;
	Thu, 02 Jan 2025 19:24:06 +0000
Date: Fri, 3 Jan 2025 03:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@stackframe.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Helge Deller <deller@gmx.de>
Subject: kernel/reboot.c:214: warning: Function parameter or struct member
 'cmd' not described in 'do_kernel_restart'
Message-ID: <202501030323.cz0NqDd5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   56e6a3499e14716b9a28a307bb6d18c10e95301e
commit: e16260c21f87b16a33ae8ecac9e8c79f3a8b89bd parisc: fix compilation when KEXEC=n and KEXEC_FILE=y
date:   5 years ago
config: parisc-randconfig-c44-20220907 (https://download.01.org/0day-ci/archive/20250103/202501030323.cz0NqDd5-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030323.cz0NqDd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030323.cz0NqDd5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/reboot.c:214: warning: Function parameter or struct member 'cmd' not described in 'do_kernel_restart'
--
>> kernel/kexec_elf.c:64: warning: Function parameter or struct member 'ehdr' not described in 'elf_is_ehdr_sane'
>> kernel/kexec_elf.c:186: warning: Function parameter or struct member 'phdr' not described in 'elf_is_phdr_sane'
>> kernel/kexec_elf.c:253: warning: Function parameter or struct member 'buf' not described in 'elf_read_phdrs'
>> kernel/kexec_elf.c:253: warning: Function parameter or struct member 'len' not described in 'elf_read_phdrs'
>> kernel/kexec_elf.c:253: warning: Function parameter or struct member 'elf_info' not described in 'elf_read_phdrs'
>> kernel/kexec_elf.c:320: warning: Function parameter or struct member 'elf_info' not described in 'kexec_free_elf_info'
>> kernel/kexec_elf.c:329: warning: Function parameter or struct member 'buf' not described in 'kexec_build_elf_info'
>> kernel/kexec_elf.c:329: warning: Function parameter or struct member 'len' not described in 'kexec_build_elf_info'
>> kernel/kexec_elf.c:329: warning: Function parameter or struct member 'ehdr' not described in 'kexec_build_elf_info'
>> kernel/kexec_elf.c:329: warning: Function parameter or struct member 'elf_info' not described in 'kexec_build_elf_info'
>> kernel/kexec_elf.c:392: warning: Function parameter or struct member 'image' not described in 'kexec_elf_load'
>> kernel/kexec_elf.c:392: warning: Function parameter or struct member 'ehdr' not described in 'kexec_elf_load'
>> kernel/kexec_elf.c:392: warning: Function parameter or struct member 'elf_info' not described in 'kexec_elf_load'
>> kernel/kexec_elf.c:392: warning: Function parameter or struct member 'kbuf' not described in 'kexec_elf_load'


vim +214 kernel/reboot.c

b63adb979583ef Guenter Roeck 2014-09-26  201  
b63adb979583ef Guenter Roeck 2014-09-26  202  /**
b63adb979583ef Guenter Roeck 2014-09-26  203   *	do_kernel_restart - Execute kernel restart handler call chain
b63adb979583ef Guenter Roeck 2014-09-26  204   *
b63adb979583ef Guenter Roeck 2014-09-26  205   *	Calls functions registered with register_restart_handler.
b63adb979583ef Guenter Roeck 2014-09-26  206   *
b63adb979583ef Guenter Roeck 2014-09-26  207   *	Expected to be called from machine_restart as last step of the restart
b63adb979583ef Guenter Roeck 2014-09-26  208   *	sequence.
b63adb979583ef Guenter Roeck 2014-09-26  209   *
b63adb979583ef Guenter Roeck 2014-09-26  210   *	Restarts the system immediately if a restart handler function has been
b63adb979583ef Guenter Roeck 2014-09-26  211   *	registered. Otherwise does nothing.
b63adb979583ef Guenter Roeck 2014-09-26  212   */
b63adb979583ef Guenter Roeck 2014-09-26  213  void do_kernel_restart(char *cmd)
b63adb979583ef Guenter Roeck 2014-09-26 @214  {
b63adb979583ef Guenter Roeck 2014-09-26  215  	atomic_notifier_call_chain(&restart_handler_list, reboot_mode, cmd);
b63adb979583ef Guenter Roeck 2014-09-26  216  }
b63adb979583ef Guenter Roeck 2014-09-26  217  

:::::: The code at line 214 was first introduced by commit
:::::: b63adb979583ef185718d774d8162387db5589c0 kernel: add support for kernel restart handler call chain

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
