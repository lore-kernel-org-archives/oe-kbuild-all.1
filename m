Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A181EA1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 02:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678501720; x=1710037720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XPZHOa1ScopsZZyzgNWzaxCYy7FO1VyW3n/DC2fZBzE=;
  b=QMOBScLd1aiUUWeMp8cy4liyFzYPkVsf/2rIfoJvemKQ68nhwAvSAax2
   t95v2YFFAm0gzBFxqtNAcW81tI/lgpReetSAu0q2NNzFMHmazd1VOvnfV
   LJuhhSMLUy+s89cnRq4E2Q0zyhnX/KckI/W3wCHCDIudg7ZBtcsOr/6JA
   LD8xnfkA+9WHFXxlQxuQu7OnIjRrzfJLP3II+LqB4BjPPEwQg6hQjhHag
   JHBWagrQidmS/5nr4VFAJXL5Z8vkbGt/4gHjuxRxkW3FpbHRlqE3Dnt+s
   CFJYzYveaS0NqWwDV7jP3+f1Xd5swKxlsNm1gOZolluPYSdssGc1Wepbf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401730306"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="401730306"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 18:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="708234166"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="708234166"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Mar 2023 18:28:38 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paoyM-0004Ht-03;
	Sat, 11 Mar 2023 02:28:38 +0000
Date: Sat, 11 Mar 2023 10:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:sysctl-testing 43/44] net/sunrpc/sysctl.c:51:35: error:
 'proc_dodebug' undeclared here (not in a function); did you mean
 'rpc_debug'?
Message-ID: <202303111048.EpaZrpLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Luis,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sysctl-testing
head:   6c8aff8eb18d8b9ced4a13576d557c965182bd7a
commit: fab46485992acfd5f9186bbc75ff573be2462a2b [43/44] sunrpc: move sunrpc_table above
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230311/202303111048.EpaZrpLT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=fab46485992acfd5f9186bbc75ff573be2462a2b
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof sysctl-testing
        git checkout fab46485992acfd5f9186bbc75ff573be2462a2b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111048.EpaZrpLT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sunrpc/sysctl.c:51:35: error: 'proc_dodebug' undeclared here (not in a function); did you mean 'rpc_debug'?
      51 |                 .proc_handler   = proc_dodebug
         |                                   ^~~~~~~~~~~~
         |                                   rpc_debug
>> net/sunrpc/sysctl.c:78:35: error: 'proc_do_xprt' undeclared here (not in a function)
      78 |                 .proc_handler   = proc_do_xprt,
         |                                   ^~~~~~~~~~~~
   net/sunrpc/sysctl.c:131:1: warning: 'proc_dodebug' defined but not used [-Wunused-function]
     131 | proc_dodebug(struct ctl_table *table, int write, void *buffer, size_t *lenp,
         | ^~~~~~~~~~~~
   net/sunrpc/sysctl.c:109:12: warning: 'proc_do_xprt' defined but not used [-Wunused-function]
     109 | static int proc_do_xprt(struct ctl_table *table, int write,
         |            ^~~~~~~~~~~~


vim +51 net/sunrpc/sysctl.c

    44	
    45	static struct ctl_table debug_table[] = {
    46		{
    47			.procname	= "rpc_debug",
    48			.data		= &rpc_debug,
    49			.maxlen		= sizeof(int),
    50			.mode		= 0644,
  > 51			.proc_handler	= proc_dodebug
    52		},
    53		{
    54			.procname	= "nfs_debug",
    55			.data		= &nfs_debug,
    56			.maxlen		= sizeof(int),
    57			.mode		= 0644,
    58			.proc_handler	= proc_dodebug
    59		},
    60		{
    61			.procname	= "nfsd_debug",
    62			.data		= &nfsd_debug,
    63			.maxlen		= sizeof(int),
    64			.mode		= 0644,
    65			.proc_handler	= proc_dodebug
    66		},
    67		{
    68			.procname	= "nlm_debug",
    69			.data		= &nlm_debug,
    70			.maxlen		= sizeof(int),
    71			.mode		= 0644,
    72			.proc_handler	= proc_dodebug
    73		},
    74		{
    75			.procname	= "transports",
    76			.maxlen		= 256,
    77			.mode		= 0444,
  > 78			.proc_handler	= proc_do_xprt,
    79		},
    80		{ }
    81	};
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
