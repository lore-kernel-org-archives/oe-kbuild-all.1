Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E6F2561
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682070072; x=1713606072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JMQ+0NA+THeHIv7Q3o7Db/qZ99DlQudFotNICM8RYek=;
  b=SlpwJhTbM7dL1r77YUErv6zGcBaMPQLxXidxAK9ynws2S7BigfkeRQta
   +onKioJchttxLfnUuPWecGVCKB4CmNkYTPLndROS53dOAL5dTa4b/eMdC
   c/r4eepcR8qrM5HgA2+81VaPgCOS9YPbAepuPizDyDn7EBlaW+MKpvowK
   9g8SngydHuvFc39ujtCaK+RNltrrnKEYaMoq/jw/xR1xJ4417Q9iiRYEM
   77TFgVa8CaNu8/HRL8FDBGhmLFaIxfjTksE8lDaCFxxCHiBmO1nu2iUvW
   pfOeNSrcuGYjSqgPhrMeIEmZ4tGkxr9Jk38ruhnoNqTvwlR4Kb/Yi/h4q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="347856537"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="347856537"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 02:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816365874"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="816365874"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Apr 2023 02:41:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppnGP-000gV0-3C;
	Fri, 21 Apr 2023 09:41:09 +0000
Date: Fri, 21 Apr 2023 17:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop-debugobj 3/3] tree.c:undefined reference to
 `__udivdi3'
Message-ID: <202304211723.uleSuifc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop-debugobj
head:   9357d040b9058b29f31cd1cd4ba4503058f52714
commit: 9357d040b9058b29f31cd1cd4ba4503058f52714 [3/3] rcu/debugfs: Add debugfs nodes to read data
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230421/202304211723.uleSuifc-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=9357d040b9058b29f31cd1cd4ba4503058f52714
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop-debugobj
        git checkout 9357d040b9058b29f31cd1cd4ba4503058f52714
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211723.uleSuifc-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/rcu/tree.o: in function `rcu_debug_show':
>> tree.c:(.text+0x6774): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
