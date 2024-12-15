Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77510187325
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734267523; cv=none; b=DLD4E4xtSE49JSKM1b4RS0/vEw2ErupFMO3oxKW5ucm+xsF74XKHz7uDnmTNXMxCO6hz/AXX7Nj3zJVYO1v7d4CwtAXFjw+cdGQVUK5xhaSaqGRLFYTHqO67TXqut/aumDwZKqYe5m23idCFWjojZ+PHRQqsJHOnDlrYysDxVao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734267523; c=relaxed/simple;
	bh=3QZlqGTTnldowiyG5mUgxJY2mrHvR8JiPxhMeE8Z4tA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aqz9bQdSqz4APE6PFTplVa7RlGtafU+nb0mNnmGnmH5Y6UsH6n6lsIrcfSf/1ZrNlKepFrdzrAeP8otvK8SaYzhJ7HpEhYV63W1qckngKSCB9zTM60Ino566IFSeAqt+Q0SPyVMREN3iXrhc2NMWQ6WpcitVcW6LrY3syZ0efpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jpAgK0hx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jpAgK0hx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734267520; x=1765803520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3QZlqGTTnldowiyG5mUgxJY2mrHvR8JiPxhMeE8Z4tA=;
  b=jpAgK0hxZI4lWc9L0+HFNQp0GYOBJLMhb3k2cFJZSgzFXFMMzI0CN7Lg
   kzyMWJ78Xf855x/ihAkZJgv0QqDk3soOsFQW4/qPlUIwbAGJVuZlJdGgF
   05hCyz3fKiWsrLgmWSxxiWuhaZI2nbeWEcn4sb+4qMt27yndlQVmPEmbA
   UMFEk+4fKUZnkZ393hclV32mR0pa5FQ7aJwJHkXrN+ImNVu2ATwjaTxN5
   CHbcDWTTND6EpIw5AQRBb5TFPVLDc0i2IHZderVe4QXgksNK8qvJwkPie
   fxLDf3BLeiOPsPkH2vLg5iNYQka0fxWXWWh3y3SSotBqvoNLpY5dW109E
   A==;
X-CSE-ConnectionGUID: 1ivzx9TJS/GqskIpDTt6gQ==
X-CSE-MsgGUID: 8UISaT1sRraGBZCOkgNwBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45354614"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="45354614"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 04:58:39 -0800
X-CSE-ConnectionGUID: xHBH1Qc3TNqnB7J/iHgaqw==
X-CSE-MsgGUID: 70ij6usqQpmSTPrvRXdCLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102049160"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Dec 2024 04:58:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMoCh-000Dcs-30;
	Sun, 15 Dec 2024 12:58:35 +0000
Date: Sun, 15 Dec 2024 20:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: kernel/reboot.c:226: warning: Function parameter or struct member
 'cmd' not described in 'do_kernel_restart'
Message-ID: <202412152053.KeJr8B5f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2d8308bf5b67dff50262d8a9260a50113b3628c6
commit: 0c3ebff535956d2718594dc90aa9cc87521ec9fd scripts: kernel-doc: Clarify missing struct member description
date:   1 year ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241215/202412152053.KeJr8B5f-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412152053.KeJr8B5f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412152053.KeJr8B5f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/reboot.c:226: warning: Function parameter or struct member 'cmd' not described in 'do_kernel_restart'
>> kernel/reboot.c:952: warning: Function parameter or struct member 'poweroff_delay_ms' not described in 'hw_failure_emergency_poweroff'
--
>> lib/hweight.c:14: warning: Function parameter or struct member 'w' not described in '__sw_hweight32'
   lib/hweight.c:14: warning: expecting prototype for hweightN(). Prototype was for __sw_hweight32() instead


vim +226 kernel/reboot.c

b63adb979583ef Guenter Roeck 2014-09-26  213  
b63adb979583ef Guenter Roeck 2014-09-26  214  /**
b63adb979583ef Guenter Roeck 2014-09-26  215   *	do_kernel_restart - Execute kernel restart handler call chain
b63adb979583ef Guenter Roeck 2014-09-26  216   *
b63adb979583ef Guenter Roeck 2014-09-26  217   *	Calls functions registered with register_restart_handler.
b63adb979583ef Guenter Roeck 2014-09-26  218   *
b63adb979583ef Guenter Roeck 2014-09-26  219   *	Expected to be called from machine_restart as last step of the restart
b63adb979583ef Guenter Roeck 2014-09-26  220   *	sequence.
b63adb979583ef Guenter Roeck 2014-09-26  221   *
b63adb979583ef Guenter Roeck 2014-09-26  222   *	Restarts the system immediately if a restart handler function has been
b63adb979583ef Guenter Roeck 2014-09-26  223   *	registered. Otherwise does nothing.
b63adb979583ef Guenter Roeck 2014-09-26  224   */
b63adb979583ef Guenter Roeck 2014-09-26  225  void do_kernel_restart(char *cmd)
b63adb979583ef Guenter Roeck 2014-09-26 @226  {
b63adb979583ef Guenter Roeck 2014-09-26  227  	atomic_notifier_call_chain(&restart_handler_list, reboot_mode, cmd);
b63adb979583ef Guenter Roeck 2014-09-26  228  }
b63adb979583ef Guenter Roeck 2014-09-26  229  

:::::: The code at line 226 was first introduced by commit
:::::: b63adb979583ef185718d774d8162387db5589c0 kernel: add support for kernel restart handler call chain

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
