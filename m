Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29322CA6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 22:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678831374; x=1710367374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jln/JtuSjQA1Gr0K1qnFydKTS/ohGXtSp20+X9by3Ww=;
  b=kZa+5G85qZckpeC+oK8tBj82kF8eCMBzAXEyNuD27bJ//N/bxp1NDIz3
   b+bmPCaTafiQcZQVRtUa5svzYNMzE1mwhe5kZLFNJAexbYxyx2HpmIf7W
   RNsDDSVhmRbukaGF/+++N+VdU8KjVwAyH6ih0ByyntZWumuLRn/YKcXkl
   oTklFDe3iyzJ685pBwZnfcjQrJJWZ1n2T3OkOUyXZgoRmeHTFC1YC9fTW
   NkVsWMKZLO0AkKu1qWJlDvMNN92CCZsWT9oh6wkna758XcjF8k+siMHzt
   xpvlkqc3y3xaaBxrMytIxADxzIbx0NieYr7URf2gXRhA7aJwS/gumzow3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339093455"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="339093455"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 15:02:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="853358322"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="853358322"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Mar 2023 15:02:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcCjM-0007Dc-1T;
	Tue, 14 Mar 2023 22:02:52 +0000
Date: Wed, 15 Mar 2023 06:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 28/39] ERROR: modpost:
 "netfs_extract_iter_to_sg" [crypto/af_alg.ko] undefined!
Message-ID: <202303150528.BIcl787B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   04b41c19739aec7e0cae6cba28b4e317d703a614
commit: e86fe778095cc1e1ce411e2e6b4c207b56a8e029 [28/39] crypto: af_alg: Use sendmsg(MSG_SPLICE_PAGES) instead of sendpage()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230315/202303150528.BIcl787B-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=e86fe778095cc1e1ce411e2e6b4c207b56a8e029
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout e86fe778095cc1e1ce411e2e6b4c207b56a8e029
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150528.BIcl787B-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "netfs_extract_iter_to_sg" [crypto/af_alg.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
