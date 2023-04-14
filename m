Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD52A1FBB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681479873; x=1713015873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+3JYaC3p3YBKaEBZpFZPcDE48aRUzlBZU904vSSX370=;
  b=Cm+p/afdQg8BLSZZtQM+jMxknnjWM2BanZanzBKbK3s47V9Wb064uaEO
   ZnKGXC0BTkiRy2Wt62U6Hk8WcP0X+K0MW+UmJEoojfl50hLVm4rhjGmqm
   6rjFHqMVFxcvJRFWeOZueIt/LtkYCeZj2oEQQQgslpZBhrQ9+rtG3be6a
   g/5PLDQiV2KqM4ISi+IpfLTCqV8rBEQbuuwnC69qC0k+sy9dTifcGGEyu
   jS5KwklRjuw43a98dC3IygUh0BQH1fy+gszBbjI3a1cHb0j0u8PIj527z
   vOXrOpyRKtHqrlqhp+UFHDorFk+HU/0tICJAQV/sUVS08nrvRVOKiTBwa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="341963300"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="341963300"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 06:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="833552773"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="833552773"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2023 06:44:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnJj5-000Za7-1v;
	Fri, 14 Apr 2023 13:44:31 +0000
Date: Fri, 14 Apr 2023 21:43:56 +0800
From: kernel test robot <lkp@intel.com>
To: Judith Mendez <jm@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/5] arm64: dts: ti: Add AM62x MCAN MAIN domain
 transceiver overlay
Message-ID: <202304142144.4XDZIfzJ-lkp@intel.com>
References: <20230413223051.24455-2-jm@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413223051.24455-2-jm@ti.com>

Hi Judith,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230413]
[cannot apply to mkl-can-next/testing robh/for-next arm64/for-next/core v6.3-rc6 v6.3-rc5 v6.3-rc4 linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Judith-Mendez/arm64-dts-ti-Add-AM62x-MCAN-MAIN-domain-transceiver-overlay/20230414-063717
patch link:    https://lore.kernel.org/r/20230413223051.24455-2-jm%40ti.com
patch subject: [RFC PATCH 1/5] arm64: dts: ti: Add AM62x MCAN MAIN domain transceiver overlay
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304142144.4XDZIfzJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ec85544c219bbe3e8c693d520b5ce579c836a9e0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Judith-Mendez/arm64-dts-ti-Add-AM62x-MCAN-MAIN-domain-transceiver-overlay/20230414-063717
        git checkout ec85544c219bbe3e8c693d520b5ce579c836a9e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304142144.4XDZIfzJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/boot/dts/ti/k3-am625-sk-mcan-main.dtso:11:
>> scripts/dtc/include-prefixes/dt-bindings/pinctrl/k3.h:16:2: warning: #warning "These bindings are deprecated. Instead, use the header in the DTS source directory." [-Wcpp]
      16 | #warning "These bindings are deprecated. Instead, use the header in the DTS source directory."
         |  ^~~~~~~


vim +16 scripts/dtc/include-prefixes/dt-bindings/pinctrl/k3.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
