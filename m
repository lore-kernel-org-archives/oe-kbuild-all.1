Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1388210FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676117050; x=1707653050;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/5FdCymE4SJTyFdQiUPkip98JbmSB1YHM08nsA2g3eE=;
  b=TVhFqLS6Km9KvUF4GQP7Kv2NwFp4XWWkva9u5D/RM7cR/8fjhrk5c01H
   1V1svVBRgllELxVVNN69cpixWanUR1bnrC7giEQnB+P1DkwxnQ47VCA49
   oOFs6NP4P626huWcdTiO9IueFO0IXMANXcwh8N1utSdtM60IU7Ex9Zbub
   NAY2bcuEoDROhsJfYnECuINDbCsS1O0VtuARGK1X0pNmnCA5QDGT7mK6+
   tpJ+ivRcQK9Lcfwup2QoP+1DUM1gLpPLdLT7p3m6eTWkpG1YC8Bhvawuo
   kaf8DumuaZXIPDJzojHcONOecJ3P5Lm9tCgOGRhAvLjTRZOKDi27Oa5Fc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="330614314"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="330614314"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 04:04:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="700744573"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="700744573"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Feb 2023 04:04:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQobu-0006TN-2M;
	Sat, 11 Feb 2023 12:04:06 +0000
Date: Sat, 11 Feb 2023 20:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 1091/9999] ERROR: Input tree has errors,
 aborting (use -f to force output)
Message-ID: <202302111929.p1VomUPI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Arınç,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   85d7786c66b69d3f07cc149ac2f78d8f330c7c11
commit: 127a5d3e732df7d7fb5bdbbaca3acdd679003605 [1091/9999] staging: mt7621-dts: fix GB-PC2 devicetree
config: mips-randconfig-r005-20221117 (https://download.01.org/0day-ci/archive/20230211/202302111929.p1VomUPI-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=127a5d3e732df7d7fb5bdbbaca3acdd679003605
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 127a5d3e732df7d7fb5bdbbaca3acdd679003605
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111929.p1VomUPI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/mt7621-dts/gbpc2.dts:22.28-26.4: ERROR (duplicate_label): /palmbus@1e000000: Duplicate label 'palmbus' on /palmbus@1e000000 and /palmbus@1E000000
>> ERROR: Input tree has errors, aborting (use -f to force output)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
