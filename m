Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D466FC4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Mar 2023 23:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678577766; x=1710113766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LxCkZFFBUSqyoRujVzpc+BFMkltK7X0C3jBoRWSzf/k=;
  b=cNiYW/UGc9SgMWj3wPQwbd9HE4B24V4N+meGLR5P1HmflY5M9ZNTaisb
   1prrprlXIThmGFSlvdNaqzaO4co0U8X4dHPAZS1zOU/acprQJBTeEI6GH
   bkxTfkhN1qhloNEoOdFGxuhvRgRE9UwA63aDnN2qRpgIpHx03bA4VJ1S+
   MnBhSDmo09sWRcr4d28goSxRZtte3e2dQzKPgGqXoKupzn7un2Q2d3yHz
   0xeZIedeBbBHE9jmPkN4Yx6Ro767F5M7w2vZYYvIaZD6Q70UuauH0/llu
   I802aeUeVKWTXWJzzPUn3ddtuFk2FzHHO4QaziB3hJwB2WsJrhZleB2Lm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="339317109"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="339317109"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 15:36:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="788464983"
X-IronPort-AV: E=Sophos;i="5.98,253,1673942400"; 
   d="scan'208";a="788464983"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2023 15:36:05 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pb8ku-0004qz-1Z;
	Sat, 11 Mar 2023 23:36:04 +0000
Date: Sun, 12 Mar 2023 07:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:sysctl-testing 43/44] net/sunrpc/sysctl.c:178:1: warning: no
 previous prototype for 'rpc_register_sysctl'
Message-ID: <202303120749.zTHy3Yi1-lkp@intel.com>
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
head:   f66d0fcc0d9164174c2e72045110f43557649cad
commit: 95e20e8aa440148ec8eed523ecc683e4dad15644 [43/44] sunrpc: move sunrpc_table and proc routines above
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230312/202303120749.zTHy3Yi1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=95e20e8aa440148ec8eed523ecc683e4dad15644
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof sysctl-testing
        git checkout 95e20e8aa440148ec8eed523ecc683e4dad15644
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/sunrpc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303120749.zTHy3Yi1-lkp@intel.com/

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
