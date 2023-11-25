Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083A5946F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOwBMvte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700925454; x=1732461454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lXoo/wENBOzNUHHpGLsgMwgoln3XgEzuwfN3XMR4XGI=;
  b=ZOwBMvteqDq2Z17WPtxYr7YqT3h6TY4lQlloS5+ckwaGXugQ6aBTqT3w
   eS+zwzM4DECeliP3mXsu9gywCGfX0RVuTqx1a/q5i5FnTZkEnV4lsVQ0R
   FxfMVymeM4F0U9qffRyuvPieY1bvDP6OItErBHWRTie+GHiFg2AJNiIJi
   klC48cllkDEd0N5D6lrvY8GRYRF5X7adYv4Pgad7FUvUDxaHy1HxcON55
   G0o76EUZ6lw4pT/+iLry+dcOnM73Cuq5rAzdY6QopszdhJdGsJeDzAcvm
   4GdsaCggLfk2KHeugAlsQVT6A8S44aEvrL3TE1CgsMux4gBSMkfb/jT/P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="389673579"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="389673579"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 07:17:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="885532603"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="885532603"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2023 07:17:32 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6uPS-00047Z-1d;
	Sat, 25 Nov 2023 15:17:30 +0000
Date: Sat, 25 Nov 2023 23:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/7] treewide: sysctl: migrate proc_dostring to
 proc_handler_new
Message-ID: <202311252245.dUU96Kqp-lkp@intel.com>
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
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231125/202311252245.dUU96Kqp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311252245.dUU96Kqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311252245.dUU96Kqp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/coredump.c:975:43: error: initialization of 'int (*)(const struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(const struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} from incompatible pointer type 'int (*)(struct ctl_table *, int,  void *, size_t *, loff_t *)' {aka 'int (*)(struct ctl_table *, int,  void *, long unsigned int *, long long int *)'} [-Werror=incompatible-pointer-types]
     975 |                 .proc_handler_new       = proc_dostring_coredump,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~
   fs/coredump.c:975:43: note: (near initialization for 'coredump_sysctls[1].proc_handler_new')
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
