Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796461FB5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677053385; x=1708589385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rN0BjrWKDlqQZyb2gQYZd9EENEEL7yiywoTz/UDc+ew=;
  b=c4d1c78LdAUJiygI8Vrcoob9MnSwBtxQGjMmN4OO8ezEhk44CCt4hmZu
   XrJ83yz1UGGgvcKVmLRzUXEbRjk402Q/cLys4kanB6PlWpBAL0Xo63CtM
   YgeCitcAPWAnppmRR8YcXa9/qM6kaI8nN9Mosxu1MwCkMZvcMhwAodoxn
   wWoZih31VutqBXR7/EhVHE2XsumbBTAXCWZzvnJTXwXFla3UWsBWClAYF
   JE9iGOVfpexpq09PwTvrV33wWTnNrOzZ94x8QVXCaQGC/gUpeAXlp9df9
   9ZyvJFouFxKNFw/o6O7bPMs7xArhrZbjhUsXix3d1VCYpkog2HF5NH0vR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="335060513"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="335060513"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 00:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="781338034"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="781338034"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Feb 2023 00:08:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUkAU-00009F-29;
	Wed, 22 Feb 2023 08:08:02 +0000
Date: Wed, 22 Feb 2023 16:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: ssanil <shruthi.sanil@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [intel-lts:5.10/preempt-rt 20907/30000]
 drivers/thunderbolt/path.c:353:6: warning: unused variable 'i'
Message-ID: <202302221612.g0wmIgLq-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   4278ee2bf6ce967d4eb3ff89f1371d4aa9b86558
commit: e245401d950c34509657e26d89c98e789068abdc [20907/30000] Tear down existing tunnels when resuming from hibernate
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230222/202302221612.g0wmIgLq-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/e245401d950c34509657e26d89c98e789068abdc
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/preempt-rt
        git checkout e245401d950c34509657e26d89c98e789068abdc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/thunderbolt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221612.g0wmIgLq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thunderbolt/path.c:353:6: warning: unused variable 'i' [-Wunused-variable]
           int i;
               ^
   1 warning generated.


vim +/i +353 drivers/thunderbolt/path.c

520b670216a15fb Andreas Noever  2014-06-03  344  
520b670216a15fb Andreas Noever  2014-06-03  345  /**
ab9f31cfa89ad70 Mika Westerberg 2019-03-06  346   * tb_path_free() - free a path
ab9f31cfa89ad70 Mika Westerberg 2019-03-06  347   * @path: Path to free
ab9f31cfa89ad70 Mika Westerberg 2019-03-06  348   *
ab9f31cfa89ad70 Mika Westerberg 2019-03-06  349   * Frees a path. The path does not need to be deactivated.
520b670216a15fb Andreas Noever  2014-06-03  350   */
520b670216a15fb Andreas Noever  2014-06-03  351  void tb_path_free(struct tb_path *path)
520b670216a15fb Andreas Noever  2014-06-03  352  {
8c7acaaf020fe54 Mika Westerberg 2017-02-19 @353  	int i;
8c7acaaf020fe54 Mika Westerberg 2017-02-19  354  
e245401d950c345 ssanil          2022-02-07  355  	if (path->alloc_hopid) {
e245401d950c345 ssanil          2022-02-07  356  		int i;
e245401d950c345 ssanil          2022-02-07  357  
8c7acaaf020fe54 Mika Westerberg 2017-02-19  358  		for (i = 0; i < path->path_length; i++) {
8c7acaaf020fe54 Mika Westerberg 2017-02-19  359  			const struct tb_path_hop *hop = &path->hops[i];
8c7acaaf020fe54 Mika Westerberg 2017-02-19  360  
8c7acaaf020fe54 Mika Westerberg 2017-02-19  361  			if (hop->in_port)
8c7acaaf020fe54 Mika Westerberg 2017-02-19  362  				tb_port_release_in_hopid(hop->in_port,
8c7acaaf020fe54 Mika Westerberg 2017-02-19  363  							 hop->in_hop_index);
8c7acaaf020fe54 Mika Westerberg 2017-02-19  364  			if (hop->out_port)
8c7acaaf020fe54 Mika Westerberg 2017-02-19  365  				tb_port_release_out_hopid(hop->out_port,
8c7acaaf020fe54 Mika Westerberg 2017-02-19  366  							  hop->next_hop_index);
8c7acaaf020fe54 Mika Westerberg 2017-02-19  367  		}
e245401d950c345 ssanil          2022-02-07  368  	}
8c7acaaf020fe54 Mika Westerberg 2017-02-19  369  
520b670216a15fb Andreas Noever  2014-06-03  370  	kfree(path->hops);
520b670216a15fb Andreas Noever  2014-06-03  371  	kfree(path);
520b670216a15fb Andreas Noever  2014-06-03  372  }
520b670216a15fb Andreas Noever  2014-06-03  373  

:::::: The code at line 353 was first introduced by commit
:::::: 8c7acaaf020fe54baf2eccc5e1071341754d22be thunderbolt: Extend tunnel creation to more than 2 adjacent switches

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Mika Westerberg <mika.westerberg@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
