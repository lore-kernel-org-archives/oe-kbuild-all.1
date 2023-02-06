Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D541428E8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 11:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675681497; x=1707217497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3DZ7EdfAEQQpy5e0soDpt6dUvbTj2v3pY/BKHFBx2P0=;
  b=lyBSbncF1lObHDhOBtZwd7YaI+klsd/kWIrDI8KM85M7sOn5KEJjwbxV
   D9BtdjKWNLHm7mnUT3QmBMnCXmm23VfbQuvflLJZE6jqrxMAd/ejLxvRq
   V1cr7HQ7R6glUOeWOkY3oepKykzz3cMiYKexunoAEFWgyLRImmfg3L7lM
   P3cW8oAaSlRBHuxs5iD9DuSVxhJi1KgRZUTLfdHz37bh/jnaJ9y3YFZjT
   P9iL9qBkwgvfNpW+s2WUdEE+oG7sZDaghbLKf2HrT7EZ8OBVg5sl9YeMv
   fMs8deW/U5zXSpG8bHpG/TkrRTOvUzJkrLLYrevUDDKfn3A1/3m9e9eka
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="312832086"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="312832086"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 03:04:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911886646"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="911886646"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 03:04:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOzIs-0002VH-0M;
	Mon, 06 Feb 2023 11:04:54 +0000
Date: Mon, 6 Feb 2023 19:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: ssanil <shruthi.sanil@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [intel-lts:5.10/yocto 21175/29177]
 drivers/thunderbolt/path.c:353:13: warning: unused variable 'i'
Message-ID: <202302061824.8tX4qGkP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi ssanil,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   a28867696061a1be54960089016434aee399da9d
commit: e245401d950c34509657e26d89c98e789068abdc [21175/29177] Tear down existing tunnels when resuming from hibernate
config: i386-randconfig-a013-20230206 (https://download.01.org/0day-ci/archive/20230206/202302061824.8tX4qGkP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/e245401d950c34509657e26d89c98e789068abdc
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout e245401d950c34509657e26d89c98e789068abdc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/thunderbolt/ sound/soc/codecs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/thunderbolt/path.c: In function 'tb_path_free':
>> drivers/thunderbolt/path.c:353:13: warning: unused variable 'i' [-Wunused-variable]
     353 |         int i;
         |             ^


vim +/i +353 drivers/thunderbolt/path.c

520b670216a15f Andreas Noever  2014-06-03  344  
520b670216a15f Andreas Noever  2014-06-03  345  /**
ab9f31cfa89ad7 Mika Westerberg 2019-03-06  346   * tb_path_free() - free a path
ab9f31cfa89ad7 Mika Westerberg 2019-03-06  347   * @path: Path to free
ab9f31cfa89ad7 Mika Westerberg 2019-03-06  348   *
ab9f31cfa89ad7 Mika Westerberg 2019-03-06  349   * Frees a path. The path does not need to be deactivated.
520b670216a15f Andreas Noever  2014-06-03  350   */
520b670216a15f Andreas Noever  2014-06-03  351  void tb_path_free(struct tb_path *path)
520b670216a15f Andreas Noever  2014-06-03  352  {
8c7acaaf020fe5 Mika Westerberg 2017-02-19 @353  	int i;
8c7acaaf020fe5 Mika Westerberg 2017-02-19  354  
e245401d950c34 ssanil          2022-02-07  355  	if (path->alloc_hopid) {
e245401d950c34 ssanil          2022-02-07  356  		int i;
e245401d950c34 ssanil          2022-02-07  357  
8c7acaaf020fe5 Mika Westerberg 2017-02-19  358  		for (i = 0; i < path->path_length; i++) {
8c7acaaf020fe5 Mika Westerberg 2017-02-19  359  			const struct tb_path_hop *hop = &path->hops[i];
8c7acaaf020fe5 Mika Westerberg 2017-02-19  360  
8c7acaaf020fe5 Mika Westerberg 2017-02-19  361  			if (hop->in_port)
8c7acaaf020fe5 Mika Westerberg 2017-02-19  362  				tb_port_release_in_hopid(hop->in_port,
8c7acaaf020fe5 Mika Westerberg 2017-02-19  363  							 hop->in_hop_index);
8c7acaaf020fe5 Mika Westerberg 2017-02-19  364  			if (hop->out_port)
8c7acaaf020fe5 Mika Westerberg 2017-02-19  365  				tb_port_release_out_hopid(hop->out_port,
8c7acaaf020fe5 Mika Westerberg 2017-02-19  366  							  hop->next_hop_index);
8c7acaaf020fe5 Mika Westerberg 2017-02-19  367  		}
e245401d950c34 ssanil          2022-02-07  368  	}
8c7acaaf020fe5 Mika Westerberg 2017-02-19  369  
520b670216a15f Andreas Noever  2014-06-03  370  	kfree(path->hops);
520b670216a15f Andreas Noever  2014-06-03  371  	kfree(path);
520b670216a15f Andreas Noever  2014-06-03  372  }
520b670216a15f Andreas Noever  2014-06-03  373  

:::::: The code at line 353 was first introduced by commit
:::::: 8c7acaaf020fe54baf2eccc5e1071341754d22be thunderbolt: Extend tunnel creation to more than 2 adjacent switches

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Mika Westerberg <mika.westerberg@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
