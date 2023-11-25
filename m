Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA92428383
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIAgZB05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700931009; x=1732467009;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=euAsx7VOqlNdaxrw2r9sqZMtIc8RCOuVcbaE0BhI5Tk=;
  b=CIAgZB05JPbo0ADu8JpmxWD+2xYQooDgVGwJaPxBBGOfk/kMYBkWF5WH
   PYtt5qzle5JsN1KLlU63G1TkQ7KtiSFuBHv8HR1IeuOMlf+ucMxLG8RMO
   fVNcdBMyX4mwWY0iYEnjeEeDfRWVOibD2cDG41xEbIAqiilEFzGQasguq
   JyqjCS1x8FRsjfc98OeQL/ECdIqGC8VI+S5KhWg0m62ZWVH36voIJiwdJ
   q2wzdzrU7MUKuxWjwOi2FAWOqtTgIgkxZ/mt9RVJ2G+4+mDcsPiy4qArW
   870OdYhmeWF87Vf7Z8500KwDs5IXCs9Rqsm7mv5EgSGkBWjStaJkOvrat
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="377567732"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="377567732"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 08:50:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="761224149"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="761224149"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Nov 2023 08:50:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6vr4-0004DY-0o;
	Sat, 25 Nov 2023 16:50:06 +0000
Date: Sun, 26 Nov 2023 00:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/7] treewide: sysctl: migrate proc_dostring to
 proc_handler_new
Message-ID: <202311252321.0Ol0kDcR-lkp@intel.com>
References: <20231125-const-sysctl-v1-5-5e881b0e0290@weissschuh.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125-const-sysctl-v1-5-5e881b0e0290@weissschuh.net>

Hi Thomas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0f5cc96c367f2e780eb492cc9cab84e3b2ca88da]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Wei-schuh/sysctl-add-helper-sysctl_run_handler/20231125-205506
base:   0f5cc96c367f2e780eb492cc9cab84e3b2ca88da
patch link:    https://lore.kernel.org/r/20231125-const-sysctl-v1-5-5e881b0e0290%40weissschuh.net
patch subject: [PATCH RFC 5/7] treewide: sysctl: migrate proc_dostring to proc_handler_new
config: i386-defconfig (https://download.01.org/0day-ci/archive/20231125/202311252321.0Ol0kDcR-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252321.0Ol0kDcR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252321.0Ol0kDcR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/coredump.c:975:23: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
      .proc_handler_new = proc_dostring_coredump,
                          ^~~~~~~~~~~~~~~~~~~~~~
   fs/coredump.c:975:23: note: (near initialization for 'coredump_sysctls[1].proc_handler_new')
   cc1: some warnings being treated as errors


vim +975 fs/coredump.c

   961	
   962	static struct ctl_table coredump_sysctls[] = {
   963		{
   964			.procname	= "core_uses_pid",
   965			.data		= &core_uses_pid,
   966			.maxlen		= sizeof(int),
   967			.mode		= 0644,
   968			.proc_handler	= proc_dointvec,
   969		},
   970		{
   971			.procname	= "core_pattern",
   972			.data		= core_pattern,
   973			.maxlen		= CORENAME_MAX_SIZE,
   974			.mode		= 0644,
 > 975			.proc_handler_new	= proc_dostring_coredump,
   976		},
   977		{
   978			.procname	= "core_pipe_limit",
   979			.data		= &core_pipe_limit,
   980			.maxlen		= sizeof(unsigned int),
   981			.mode		= 0644,
   982			.proc_handler	= proc_dointvec,
   983		},
   984		{ }
   985	};
   986	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
