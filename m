Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988A616411
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 18:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683744293; x=1715280293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8DdeYYlCcT2S/F0tpRkmY5ZHIQLcag1+i+bKqFBqr1w=;
  b=IWuZu8LEt1D80dgJDGZounl0a9KBi3ReluAKF+d6tcJ832PHBstRSSHh
   jc+t2ifZXhG0p1bBzrQTL4+9tPL2hCPSCYVuKxtCh6yVH4aQkvQJqFMFm
   6rNJlNs/dLjSoIwLTSYOpzKwSOIV2AhHOEdtwi8w25MVwzYWyDpilByTh
   2MnB/C034KZtbAuAGSIcuD+wiNlA0dxkleMZvtB4qCbIqmNNedJzSm2b6
   /d03qPrvqVx0WcI8JoVvumZidkwPkVT/nNq+Wlu+nKmYMoZUzayBHntLM
   w7P78ylgf8UKqSnSoLR3v4JPfchnob4ksB9mNeSp5aLs95khbKVTlDNfs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330653949"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="330653949"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 11:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="764413792"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="764413792"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2023 11:44:43 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwonr-0003Vi-0r;
	Wed, 10 May 2023 18:44:43 +0000
Date: Thu, 11 May 2023 02:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 147/155] platform.c:undefined reference
 to `devm_ioremap_resource'
Message-ID: <202305110218.aa6Lqd1l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   07ce978e8014765f0fed390ba61c82635ca5c408
commit: 3adf8b2504f2991b04bcef6875a72cf3ebffe839 [147/155] drivers: provide devm_platform_ioremap_resource()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230511/202305110218.aa6Lqd1l-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=3adf8b2504f2991b04bcef6875a72cf3ebffe839
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout 3adf8b2504f2991b04bcef6875a72cf3ebffe839
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110218.aa6Lqd1l-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/base/platform.o: in function `devm_platform_ioremap_resource':
>> platform.c:(.text+0xefe): undefined reference to `devm_ioremap_resource'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
