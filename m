Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A385695
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 02:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbFAZVW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701829579; x=1733365579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e51BPhpqRfhwtSoezmvbrjq5NjMJOONUAzCMVeXZ0M4=;
  b=bbFAZVW9lwwgbLFu+TIB2JQCN+FLo4LQgJshjwuUcphIHU9NnB/o/Rz+
   BIv5tW7gHYZcAHcs0UnoALqMdPmj/OgMpL5afrb/HuxTvwTSMg5XfgAdf
   Tqv5J9aTjY6rgzs14EfMjdtIqfQudJw0NPIj0FTKNo9WXh6Jt250D496c
   q7EnR7CWFYD9Rhl1UXdtk4M52dinNfVUJq6WV//GgsTkj0KojrY4CqgJi
   lcDzKCtwe4sdRPBQ1/Jtz7VWdNe0rk0ytMj4bMkRyvnCPanf2B7mJFdXm
   /+rcemocy+IeSlyYBIWj8pdDxxy4sBZsW3/mSobtC/nor//L+ZoCqutzH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="384396860"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="384396860"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 18:26:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018415922"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1018415922"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 18:26:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAhc6-000A5M-34;
	Wed, 06 Dec 2023 02:26:14 +0000
Date: Wed, 6 Dec 2023 10:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/pushpull 29/32] kernel/time/timer.c:2209:6:
 warning: no previous prototype for 'timer_base_is_idle'
Message-ID: <202312061029.iAzJMftN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anna-Maria,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/pushpull
head:   c5f729902c462bd2f9153641aebe042bbb5f9ede
commit: 2d179dd1eb10c4033f67686598041df429fb9382 [29/32] timers: Introduce function to check timer base is_idle flag
config: i386-buildonly-randconfig-004-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061029.iAzJMftN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061029.iAzJMftN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061029.iAzJMftN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timer.c:2209:6: warning: no previous prototype for 'timer_base_is_idle' [-Wmissing-prototypes]
    2209 | bool timer_base_is_idle(void)
         |      ^~~~~~~~~~~~~~~~~~


vim +/timer_base_is_idle +2209 kernel/time/timer.c

  2203	
  2204	/**
  2205	 * timer_base_is_idle() - Return whether timer base is set idle
  2206	 *
  2207	 * Returns value of local timer base is_idle value.
  2208	 */
> 2209	bool timer_base_is_idle(void)
  2210	{
  2211		return __this_cpu_read(timer_bases[BASE_LOCAL].is_idle);
  2212	}
  2213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
