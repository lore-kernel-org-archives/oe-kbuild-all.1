Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F1A10E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680208513; x=1711744513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HGh1/X74MEu04RnTGb5ZYozzO1uoA97Mi+duqFNs0gI=;
  b=XfEZfnqLUkHSn9ngwCW4M8JHX95VuBjSwKKCrj77abRXbfnMqfchV5aV
   zr2HlSwIz7lTp0ipI+qmeVBeZ3MXtLOflONQy8XBcuPfhpbI51qpFjP3D
   iIQIZWToG29pFgstH/v/AUWG+NAA2zX1CuWdObOTVcnhn05SV8yOAccaD
   EhjTG6+4uA62ce5+Zdj7mji+ExPAh9xBYyTNkHVDtPWE7H9EBxNtJELdh
   VujKyz69fQFzV05GNCF0RZaaNGQCqgcRGhGV+DzssgtrcrPX5sjFE7q35
   92dngVl+3hzwWjpQ/OCOuj8ca3dCbVNB5wfcYoORsS9+eg1D4AZQtgWxI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343780331"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="343780331"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 13:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="828455770"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="828455770"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2023 13:35:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phyzF-000LC0-11;
	Thu, 30 Mar 2023 20:35:09 +0000
Date: Fri, 31 Mar 2023 04:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 2/6] firmware: smccc: Add support for erratum discovery
 API
Message-ID: <202303310415.JJnkYNSr-lkp@intel.com>
References: <20230330165128.3237939-3-james.morse@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330165128.3237939-3-james.morse@arm.com>

Hi James,

I love your patch! Yet something to improve:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on robh/for-next arm/for-next arm/fixes kvmarm/next soc/for-next xilinx-xlnx/master linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Morse/dt-bindings-firmware-Add-arm-errata-management/20230331-005505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230330165128.3237939-3-james.morse%40arm.com
patch subject: [PATCH 2/6] firmware: smccc: Add support for erratum discovery API
config: arm-randconfig-r046-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310415.JJnkYNSr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d17afdb2a97dfce25c3005a165eb38c4d35d31ed
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review James-Morse/dt-bindings-firmware-Add-arm-errata-management/20230331-005505
        git checkout d17afdb2a97dfce25c3005a165eb38c4d35d31ed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/firmware/smccc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310415.JJnkYNSr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/em.c:19:10: fatal error: asm/alternative.h: No such file or directory
      19 | #include <asm/alternative.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +19 drivers/firmware/smccc/em.c

    18	
  > 19	#include <asm/alternative.h>
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
