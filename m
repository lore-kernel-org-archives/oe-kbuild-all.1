Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A44EA2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 02:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680833089; x=1712369089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=o+lKEA2i849Ia9WRvmNdVJ/OW0t436Xt6yXpPXK7v/o=;
  b=ZDYXcBoVFX2JkDRLSj2WnCrl03c69k3rRO8G4eHgcFuaU0/bpdc3gVDI
   /wBO6RAt8/SnFus2nayqXwiysbNFmOzn6LS7EaVpmEbZLdsBKQ7/Tv+Os
   lyCgfprIkLcVeehsWbg3xUzMwZ3ZoZyq5pbXvaYWdiUS0W6rU/4kiQRav
   KtPaUk6+P2r9totQTa8yZHHuy6Ik8IibSRai5VBGAUh09Mg/liRK7/+7A
   wEKEOo4nIcnqeX/naohfP/LVG8Fp1lN8eSb7RgKX90u1DkjKtYT4y9elX
   TsscGAHwdAa2L5RB6xXzt2HeAxklyG51+dmYoJvftBRY8E1eT4SBW0dUr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="344669187"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="344669187"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 19:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="719923596"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="719923596"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Apr 2023 19:04:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkbSh-000S1G-0K;
	Fri, 07 Apr 2023 02:04:23 +0000
Date: Fri, 7 Apr 2023 10:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next RFC v4 4/5] net: Let the active time stamping
 layer be selectable.
Message-ID: <202304070931.RDEjx8Aa-lkp@intel.com>
References: <20230406173308.401924-5-kory.maincent@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406173308.401924-5-kory.maincent@bootlin.com>

Hi Köry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230407-013517
patch link:    https://lore.kernel.org/r/20230406173308.401924-5-kory.maincent%40bootlin.com
patch subject: [PATCH net-next RFC v4 4/5] net: Let the active time stamping layer be selectable.
config: riscv-randconfig-r042-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070931.RDEjx8Aa-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/33059abec2b9e9f064c3a8ac681fc91bf857d888
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review K-ry-Maincent/net-ethtool-Refactor-identical-get_ts_info-implementations/20230407-013517
        git checkout 33059abec2b9e9f064c3a8ac681fc91bf857d888
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070931.RDEjx8Aa-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: net/core/dev_ioctl.o: in function `.L4':
>> dev_ioctl.c:(.text+0xaa): undefined reference to `phy_do_ioctl'
>> riscv64-linux-ld: dev_ioctl.c:(.text+0xae): undefined reference to `phy_do_ioctl'
   riscv64-linux-ld: net/core/dev_ioctl.o: in function `.L5':
   dev_ioctl.c:(.text+0x13e): undefined reference to `phy_mii_ioctl'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
