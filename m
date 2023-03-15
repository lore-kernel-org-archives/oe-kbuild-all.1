Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B84D193
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 22:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678920566; x=1710456566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hn1T9lfJLT4sd3ZWTd7QnFSn+OPgoQxCfE5guxD4r0Q=;
  b=QAf5xXoRXnakNah+35T5DuKmyKbAR6qbPig7vpRTiltSbbF3t2ykKSJz
   YckWpsqDmyooGQGVNM3dPES72i7aLS2L/mmReCk28ZwE2a+8IorSP8pHz
   eCP7vz0gs34JWU77ShiOx8OxkTomWCqeDWZJS/jKnisFT+zR3dQEiTtnq
   CIXZCIbJkAyqCW2VqnVy+iSVe7BAOzC62gKODDPLxrdVZSxLXGQtTkH60
   j5AccWf59lOWNz0vezrEmUCm7PUROJLrQfbBdm/acEelY195630P+cr53
   nUPSBKPiNWTFthRAIZvamvZsN4o0+FEggGVUPI/6JE/yU3fFQ2VeGzbjb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="339371198"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="339371198"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 15:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="682034502"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="682034502"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Mar 2023 15:49:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcZvj-000862-0e;
	Wed, 15 Mar 2023 22:49:11 +0000
Date: Thu, 16 Mar 2023 06:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2] irqchip/gicv3: Workaround for NVIDIA erratum
 T241-FABRIC-4
Message-ID: <202303160647.R16cnZkc-lkp@intel.com>
References: <20230314135128.2930580-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314135128.2930580-1-sdonthineni@nvidia.com>

Hi Shanker,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on tip/irq/core soc/for-next linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shanker-Donthineni/irqchip-gicv3-Workaround-for-NVIDIA-erratum-T241-FABRIC-4/20230314-215648
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230314135128.2930580-1-sdonthineni%40nvidia.com
patch subject: [PATCH v2] irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
config: arm-randconfig-r046-20230315 (https://download.01.org/0day-ci/archive/20230316/202303160647.R16cnZkc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f796361134151057b68a259013204e8fa5516aee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shanker-Donthineni/irqchip-gicv3-Workaround-for-NVIDIA-erratum-T241-FABRIC-4/20230314-215648
        git checkout f796361134151057b68a259013204e8fa5516aee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160647.R16cnZkc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/irqchip/irq-gic-v3.c:9:
   drivers/irqchip/irq-gic-v3.c: In function 'gic_enable_quirk_nvidia_t241':
>> drivers/irqchip/irq-gic-v3.c:1775:35: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
    1775 |                 chip_bmask |= BIT(FIELD_GET(T241_CHIPN_MASK,
         |                                   ^~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
>> drivers/irqchip/irq-gic-v3.c:1786:33: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
    1786 |                         phys |= FIELD_PREP(T241_CHIPN_MASK, i);
         |                                 ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1775 drivers/irqchip/irq-gic-v3.c

  1760	
  1761	static bool gic_enable_quirk_nvidia_t241(void *data)
  1762	{
  1763		unsigned long chip_bmask = 0;
  1764		phys_addr_t phys;
  1765		u32 i;
  1766	
  1767		/* Check JEP106 code for NVIDIA T241 chip (036b:0241) */
  1768		if ((smccc_soc_id_version < 0) ||
  1769		    ((smccc_soc_id_version & SMCCC_SOC_ID_MASK) != SMCCC_SOC_ID_T241)) {
  1770			return false;
  1771		}
  1772	
  1773		/* Find the chips based on GICR regions PHYS addr */
  1774		for (i = 0; i < gic_data.nr_redist_regions; i++) {
> 1775			chip_bmask |= BIT(FIELD_GET(T241_CHIPN_MASK,
  1776					  gic_data.redist_regions[i].phys_base));
  1777		}
  1778	
  1779		if (hweight32(chip_bmask) < 3)
  1780			return false;
  1781	
  1782		/* Setup GICD alias regions */
  1783		for (i = 0; i < ARRAY_SIZE(t241_dist_base_alias); i++) {
  1784			if (chip_bmask & BIT(i)) {
  1785				phys = gic_data.dist_phys_base + T241_CHIP_GICDA_OFFSET;
> 1786				phys |= FIELD_PREP(T241_CHIPN_MASK, i);
  1787				t241_dist_base_alias[i] = ioremap(phys, SZ_64K);
  1788				WARN_ON_ONCE(!t241_dist_base_alias[i]);
  1789			}
  1790		}
  1791		static_branch_enable(&gic_nvidia_t241_erratum);
  1792		return true;
  1793	}
  1794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
