Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF53361
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 01:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678151927; x=1709687927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6nUDV9lWe16wWOD5QiB0vavIJTLVLuliyg3OxQF3L44=;
  b=HICnpYTyF+8K/KYED5bed+7U9xk557u9/iBwoS3YToMWdDeKjfeQOYEr
   T40Wx+LmwcXcGxO03zWws7hhhEIHt0dGdQRI2ojjHcMpx8I0tnR0aL+3S
   BsNc2b6FvKWHhvKEKhPyRO01d8PbMw5LlMG3KkbOFZNZe5ELSmqjQhGDj
   OGNHzm7RBKUyJ3zS48z3ofFxE/PGR0A8s4Eu/uWN+qSTTdkILypOCI74B
   pZxNyyIvKIFoAbaaSsdgEWJwRGluy2EAiXz128jm8xIxHWvWcukrsvDW5
   RPAqFxcVJYktkBB0wKui3lPe/aRPm1wUvPBDKJvYtyREymWwR1SMOjfSY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316131228"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="316131228"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 17:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="708875025"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; 
   d="scan'208";a="708875025"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Mar 2023 17:18:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZLyW-0000qB-36;
	Tue, 07 Mar 2023 01:18:44 +0000
Date: Tue, 7 Mar 2023 09:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.02.27a 107/108]
 arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for
 'set_nmi_torture'
Message-ID: <202303070906.VxnzlSyY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.02.27a
head:   b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
commit: 80dd9f246f8a23a0fd0ed69e51dbdcb389806254 [107/108] x86/nmi: Add a set_nmi_torture() function to control NMI testing
config: i386-randconfig-a004-20230306 (https://download.01.org/0day-ci/archive/20230307/202303070906.VxnzlSyY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/80dd9f246f8a23a0fd0ed69e51dbdcb389806254
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.02.27a
        git checkout 80dd9f246f8a23a0fd0ed69e51dbdcb389806254
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303070906.VxnzlSyY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/nmi.c:441:6: warning: no previous prototype for 'set_nmi_torture' [-Wmissing-prototypes]
     441 | void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
         |      ^~~~~~~~~~~~~~~


vim +/set_nmi_torture +441 arch/x86/kernel/nmi.c

   439	
   440	/* Set the test values as desired. */
 > 441	void set_nmi_torture(int nmi_delay_in, bool nmi_halt1_in, bool nmi_halt2_in, bool nmi_halt3_in)
   442	{
   443		WRITE_ONCE(nmi_delay, nmi_delay_in);
   444		WRITE_ONCE(nmi_halt1, nmi_halt1_in);
   445		WRITE_ONCE(nmi_halt2, nmi_halt2_in);
   446		WRITE_ONCE(nmi_halt3, nmi_halt3_in);
   447		pr_info("%s: Set NMI test parameters nmi_delay=%d nmi_halt1=%d nmi_halt2=%d nmi_halt3=%d\n",
   448			__func__, nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
   449	}
   450	EXPORT_SYMBOL_GPL(set_nmi_torture);
   451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
