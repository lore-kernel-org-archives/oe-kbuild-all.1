Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C571520FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674232392; x=1705768392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdCS5gtlVyzKWCCc/EGBuR/b+6b8OC22ovIgVUEkBO4=;
  b=m4ahM8UPTm2cch7butzGetJ2oWvDUhv2eK489rQBrVi4crIVI59kYgiG
   zuMF7cEc4te6bm7bJlpifj5+EEGD2paGJTcC1CGilJ/7XazrsA4Ttjms1
   3ujkbq4e2oVI7QsqYCqu6b5OOwtd6WGLDkQG5HpHeyvg68HFKni/lGl42
   db7r8viUmOCwK1II2CfBgyvU0FyPsGVnP9dBgkm8+ykOnJYjwFiFTbl+B
   vxaUpv1mSRftOQcDL9+AUxuwomdX+Czq7VfsPIzcMbciNhGOFW8SBTpDs
   D3fP0Gvz2YsszSWEPUkpJzE6GUwi88pMD7LPA06nxw4klQWmx6ttg5G45
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="387978903"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="387978903"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 08:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="803121438"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="803121438"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2023 08:33:11 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIuKE-0002hh-1e;
	Fri, 20 Jan 2023 16:33:10 +0000
Date: Sat, 21 Jan 2023 00:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/attach_btfid 1/2] net/bpf/test_func_2.c:8:5:
 warning: no previous prototype for 'bpf_test_func2_globl'
Message-ID: <202301210053.tfJmpL9H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/attach_btfid
head:   cfc34e8e2edc1d8ab7dde3a065bf708448ee9680
commit: bd258b52723730273fa04a9426777baf5017e1f9 [1/2] bpf: Add multiple bpf_test_func functions
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230121/202301210053.tfJmpL9H-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=bd258b52723730273fa04a9426777baf5017e1f9
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/attach_btfid
        git checkout bd258b52723730273fa04a9426777baf5017e1f9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash net/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/bpf/test_func_2.c:8:5: warning: no previous prototype for 'bpf_test_func2_globl' [-Wmissing-prototypes]
       8 | int bpf_test_func2_globl(int a)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> net/bpf/test_func_1.c:9:5: warning: no previous prototype for 'bpf_test_func1_globl' [-Wmissing-prototypes]
       9 | int bpf_test_func1_globl(struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~
--
>> net/bpf/test_func_3.c:9:5: warning: no previous prototype for 'bpf_test_func3_globl' [-Wmissing-prototypes]
       9 | int bpf_test_func3_globl(struct bpf_prog *prog)
         |     ^~~~~~~~~~~~~~~~~~~~


vim +/bpf_test_func2_globl +8 net/bpf/test_func_2.c

     7	
   > 8	int bpf_test_func2_globl(int a)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
