Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D922C134
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 06:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6oOLOz0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702967668; x=1734503668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A0drqVMqj7v6PRhaXyiv0NsaNO0KU5joPY45em+wUig=;
  b=h6oOLOz0sEAPku4JxVRlVCP99igJWTT0AhrfKr8+OtaM3B9R/yzWPU0Y
   Wv88Q+aWb7XLlfDD6OJlC+TNP34VX9G5/rhtzqexJOxOKkC8MhH+dsDn6
   B8Yuevp0W0h4D934bDtKaPgsBtWmi5ciFE5XBmgmwVvfJKWFcBwiBQCH6
   Wt4FYcGOHakaiBIdk1YP9BcJKYq7RKyvktVEb9OaqVd+L+QLZFlHbPgxG
   5Awr+qgryck7b2CO83bT5z07CGKtQgHtkePeVo5yZ36lmZTJpT7xrpLXR
   RrhwjJssifG0BYfyJRj2kUevGczAUi9oKn0iKzP86Gtodel3ukAWzkfGb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="375765983"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="375765983"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 22:34:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="894158310"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="894158310"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2023 22:34:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFTgO-0004w9-31;
	Tue, 19 Dec 2023 06:34:24 +0000
Date: Tue, 19 Dec 2023 14:33:39 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.7.y-rt-rebase 44/95] kernel/printk/printk.c:478:6:
 sparse: sparse: symbol 'have_nbcon_console' was not declared. Should it be
 static?
Message-ID: <202312191452.YT9GxeJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.7.y-rt-rebase
head:   b473adf4427bd1eee61358039ce357f79e3cfc0c
commit: 59d08e28dd7c3d91f6f130bc59d4f5421fc2e0ad [44/95] printk: Track nbcon consoles
config: x86_64-randconfig-121-20231219 (https://download.01.org/0day-ci/archive/20231219/202312191452.YT9GxeJY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191452.YT9GxeJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191452.YT9GxeJY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/printk/printk.c:478:6: sparse: sparse: symbol 'have_nbcon_console' was not declared. Should it be static?
   kernel/printk/printk.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +/have_nbcon_console +478 kernel/printk/printk.c

   472	
   473	/*
   474	 * Specifies if an nbcon console is registered. If nbcon consoles are present,
   475	 * synchronous printing of legacy consoles will not occur during panic until
   476	 * the backtrace has been stored to the ringbuffer.
   477	 */
 > 478	bool have_nbcon_console;
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
