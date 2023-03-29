Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC963C0A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 21:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680124335; x=1711660335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uKu3EzpFLT43iL3GPNrRGvYA1IE+620E83CLuv0p13c=;
  b=XW5pHaYnjdkTJFYycUdcjCk6XOK13nI1Jz4v8PszgqLId9dE1+VnpmTx
   SugaCzN2e+JxCXgQdPi1R9nWHjj/4jKfpBaHfe9xgkD+2r1t0IdcbNX9r
   Lhzo7KxmixYudHeD2BpFdgjNLh4lV9RuJZ7YY9J9KT0WR9Fwvm4028oPR
   p9bnw+xyTlsnqTjc64rnjHe9KqQgqygTax1HyvJAbDYWow+PlmKh+zZoZ
   mhyDCt4byd+MgfWjdC8wykDL1U3VnVIlXLlwaQdWg08KTmQ4x3QaS8Vye
   EbDV2XyQ3xkngWvhRS8cXmgMamKW4cSuzJRALebNeW56v5W15M5ZKY8fL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339724501"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="339724501"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 14:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="677934297"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="677934297"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Mar 2023 14:12:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phd5Y-000JxU-2s;
	Wed, 29 Mar 2023 21:12:12 +0000
Date: Thu, 30 Mar 2023 05:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/address-helpers 16/20] drivers/crypto/n2_core.c:1799:19:
 error: conflicting types for 'reg'; have 'u64' {aka 'long long unsigned
 int'}
Message-ID: <202303300505.0Ig8Se9q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/address-helpers
head:   3a4e9c2e639e023556eefa93256ce5bf34137a60
commit: 1e15333ffa33f0ab8b3ee9506b9a59bd018048cd [16/20] crypto: n2: Use of_property_read_reg()
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230330/202303300505.0Ig8Se9q-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=1e15333ffa33f0ab8b3ee9506b9a59bd018048cd
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/address-helpers
        git checkout 1e15333ffa33f0ab8b3ee9506b9a59bd018048cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300505.0Ig8Se9q-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/crypto/n2_core.c: In function 'grab_mdesc_irq_props':
>> drivers/crypto/n2_core.c:1799:19: error: conflicting types for 'reg'; have 'u64' {aka 'long long unsigned int'}
    1799 |         u64 node, reg;
         |                   ^~~
   drivers/crypto/n2_core.c:1798:29: note: previous declaration of 'reg' with type 'const unsigned int *'
    1798 |         const unsigned int *reg;
         |                             ^~~
>> drivers/crypto/n2_core.c:1801:13: error: implicit declaration of function 'of_property_read_reg'; did you mean 'of_property_read_s32'? [-Werror=implicit-function-declaration]
    1801 |         if (of_property_read_reg(dev->dev.of_node, 0, &reg, NULL) < 0)
         |             ^~~~~~~~~~~~~~~~~~~~
         |             of_property_read_s32
   drivers/crypto/n2_core.c:1799:19: warning: unused variable 'reg' [-Wunused-variable]
    1799 |         u64 node, reg;
         |                   ^~~
   cc1: some warnings being treated as errors


vim +1799 drivers/crypto/n2_core.c

  1792	
  1793	static int grab_mdesc_irq_props(struct mdesc_handle *mdesc,
  1794					struct platform_device *dev,
  1795					struct spu_mdesc_info *ip,
  1796					const char *node_name)
  1797	{
  1798		const unsigned int *reg;
> 1799		u64 node, reg;
  1800	
> 1801		if (of_property_read_reg(dev->dev.of_node, 0, &reg, NULL) < 0)
  1802			return -ENODEV;
  1803	
  1804		mdesc_for_each_node_by_name(mdesc, node, "virtual-device") {
  1805			const char *name;
  1806			const u64 *chdl;
  1807	
  1808			name = mdesc_get_property(mdesc, node, "name", NULL);
  1809			if (!name || strcmp(name, node_name))
  1810				continue;
  1811			chdl = mdesc_get_property(mdesc, node, "cfg-handle", NULL);
  1812			if (!chdl || (*chdl != reg))
  1813				continue;
  1814			ip->cfg_handle = *chdl;
  1815			return get_irq_props(mdesc, node, ip);
  1816		}
  1817	
  1818		return -ENODEV;
  1819	}
  1820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
