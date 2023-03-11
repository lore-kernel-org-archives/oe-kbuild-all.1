Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149AE7E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 22:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678574046; x=1710110046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9rGZZ/Eujwewsm/pZBs6tSmsFn6250LJxWVk+UODIjE=;
  b=WLer+gUwb+sSIw46B53TlddnVyp6FJEjcGxiTK00QtVXex3UIkNI2SnI
   ljM+SsXy7SQljHKAGZo9MBctimVZTePx1JhfaviyOAdvDfp4DrNmUUym/
   ILIwb5t4HNt4R/UmOH7FO6qEREIhcB4/uvU0QZJrzXbRtlrtVy3jCRY0H
   Q577rDGYnf1DdRiBEK/ndBONzfPqCKCFerTCBstsrKTiqxCSBzL6ViaBa
   5a/Rk+obFWDzA2onrt+OQ7/xbAKrDzruvGRL5XitY7UH7I4NCPDpo36zB
   Bn3ISGEKbpfiY6uteGFck8qsxPrc5c5kjPityfo8alKbx2WtcrbLiJZyg
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="339314060"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="339314060"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 14:34:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="924070448"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="924070448"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 11 Mar 2023 14:34:04 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb7mt-0004pV-0w;
	Sat, 11 Mar 2023 22:34:03 +0000
Date: Sun, 12 Mar 2023 06:33:43 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/5] sunrpc: move sunrpc_table and proc routines above
Message-ID: <202303120646.T9Vnw7y8-lkp@intel.com>
References: <20230311205148.293375-5-mcgrof@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311205148.293375-5-mcgrof@kernel.org>

Hi Luis,

I love your patch! Perhaps something to improve:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.3-rc1 next-20230310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Chamberlain/sunrpc-simplify-two-level-sysctl-registration-for-tsvcrdma_parm_table/20230312-045320
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20230311205148.293375-5-mcgrof%40kernel.org
patch subject: [PATCH v2 4/5] sunrpc: move sunrpc_table and proc routines above
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230312/202303120646.T9Vnw7y8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ab6eabde979082754f93fa8556379b39585a5d04
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luis-Chamberlain/sunrpc-simplify-two-level-sysctl-registration-for-tsvcrdma_parm_table/20230312-045320
        git checkout ab6eabde979082754f93fa8556379b39585a5d04
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash net/sunrpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120646.T9Vnw7y8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sunrpc/sysctl.c:135:35: error: 'proc_dodebug' undeclared here (not in a function); did you mean 'rpc_debug'?
     135 |                 .proc_handler   = proc_dodebug
         |                                   ^~~~~~~~~~~~
         |                                   rpc_debug
   net/sunrpc/sysctl.c:162:35: error: 'proc_do_xprt' undeclared here (not in a function)
     162 |                 .proc_handler   = proc_do_xprt,
         |                                   ^~~~~~~~~~~~
>> net/sunrpc/sysctl.c:178:1: warning: no previous prototype for 'rpc_register_sysctl' [-Wmissing-prototypes]
     178 | rpc_register_sysctl(void)
         | ^~~~~~~~~~~~~~~~~~~
>> net/sunrpc/sysctl.c:185:1: warning: no previous prototype for 'rpc_unregister_sysctl' [-Wmissing-prototypes]
     185 | rpc_unregister_sysctl(void)
         | ^~~~~~~~~~~~~~~~~~~~~


vim +/rpc_register_sysctl +178 net/sunrpc/sysctl.c

   128	
   129	static struct ctl_table debug_table[] = {
   130		{
   131			.procname	= "rpc_debug",
   132			.data		= &rpc_debug,
   133			.maxlen		= sizeof(int),
   134			.mode		= 0644,
 > 135			.proc_handler	= proc_dodebug
   136		},
   137		{
   138			.procname	= "nfs_debug",
   139			.data		= &nfs_debug,
   140			.maxlen		= sizeof(int),
   141			.mode		= 0644,
   142			.proc_handler	= proc_dodebug
   143		},
   144		{
   145			.procname	= "nfsd_debug",
   146			.data		= &nfsd_debug,
   147			.maxlen		= sizeof(int),
   148			.mode		= 0644,
   149			.proc_handler	= proc_dodebug
   150		},
   151		{
   152			.procname	= "nlm_debug",
   153			.data		= &nlm_debug,
   154			.maxlen		= sizeof(int),
   155			.mode		= 0644,
   156			.proc_handler	= proc_dodebug
   157		},
   158		{
   159			.procname	= "transports",
   160			.maxlen		= 256,
   161			.mode		= 0444,
 > 162			.proc_handler	= proc_do_xprt,
   163		},
   164		{ }
   165	};
   166	
   167	static struct ctl_table sunrpc_table[] = {
   168		{
   169			.procname	= "sunrpc",
   170			.mode		= 0555,
   171			.child		= debug_table
   172		},
   173		{ }
   174	};
   175	
   176	
   177	void
 > 178	rpc_register_sysctl(void)
   179	{
   180		if (!sunrpc_table_header)
   181			sunrpc_table_header = register_sysctl_table(sunrpc_table);
   182	}
   183	
   184	void
 > 185	rpc_unregister_sysctl(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
