Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7205A21CD8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685629239; x=1717165239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V3aEMThk1aOvzxlN2qMLUYHQSrj7IvusSGmojZBE7Fk=;
  b=N3xOU0PSichqdb244fCVPPFJa1nuH2/NEsqWMaK0Xt9TCTLTxvXuff/j
   m0A9YKzphvVxlZ5G0QiJDmg6YuicBfGqr5atD0BvrqEpwiyty/lXTa5Xc
   79M6n2wgcbTyfequdxFI0nPBYlXhqllBmtjq8v1oE1W52GBrSJzxRgTJR
   v7Z6053ravIFPs1hkt7euKlqT01gZZHrRt7octu1ELIBghd4SDpsxgmbP
   W0m7RhGWs+BS6jw0HIS4pxYMRwqNPj7Qi0Jn2CQISTiaNXI5ZVp7byqzV
   fP/stlJ48de98c93z1UP6L1DUV/QVWgngMr1P4JF4pyHeUsBW8Kax8b+z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="357989669"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="357989669"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 07:18:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="881625227"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="881625227"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Jun 2023 07:18:15 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4j82-0002Lg-38;
	Thu, 01 Jun 2023 14:18:14 +0000
Date: Thu, 1 Jun 2023 22:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 40/43] ARM: ep93xx: soc: drop defines
Message-ID: <202306011611.BkjkqkuR-lkp@intel.com>
References: <20230601054549.10843-22-nikita.shubin@maquefel.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601054549.10843-22-nikita.shubin@maquefel.me>

Hi Nikita,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.4-rc4]
[cannot apply to soc/for-next robh/for-next next-20230601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikita-Shubin/dt-bindings-soc-Add-Cirrus-EP93xx/20230601-143415
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230601054549.10843-22-nikita.shubin%40maquefel.me
patch subject: [PATCH v1 40/43] ARM: ep93xx: soc: drop defines
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230601/202306011611.BkjkqkuR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/372fa9eb75b475c6b8f26079e8716c95622ae9b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nikita-Shubin/dt-bindings-soc-Add-Cirrus-EP93xx/20230601-143415
        git checkout 372fa9eb75b475c6b8f26079e8716c95622ae9b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/input/keyboard/ sound/soc/cirrus/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011611.BkjkqkuR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/input/keyboard/ep93xx_keypad.c:30:
   include/linux/soc/cirrus/ep93xx.h: In function 'ep93xx_devcfg_set_clear':
   include/linux/soc/cirrus/ep93xx.h:22:16: error: 'return' with a value, in function returning void [-Werror=return-type]
      22 |         return 0;
         |                ^
   include/linux/soc/cirrus/ep93xx.h:19:20: note: declared here
      19 | static inline void ep93xx_devcfg_set_clear(unsigned int set_bits,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/cirrus/ep93xx.h: At top level:
>> include/linux/soc/cirrus/ep93xx.h:24:6: warning: no previous prototype for 'ep93xx_syscon_swlocked_write' [-Wmissing-prototypes]
      24 | void ep93xx_syscon_swlocked_write(unsigned int val, unsigned int reg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/cirrus/ep93xx.h: In function 'ep93xx_syscon_swlocked_write':
   include/linux/soc/cirrus/ep93xx.h:26:16: error: 'return' with a value, in function returning void [-Werror=return-type]
      26 |         return 0;
         |                ^
   include/linux/soc/cirrus/ep93xx.h:24:6: note: declared here
      24 | void ep93xx_syscon_swlocked_write(unsigned int val, unsigned int reg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/cirrus/ep93xx.h: At top level:
>> include/linux/soc/cirrus/ep93xx.h:28:6: warning: no previous prototype for 'ep93xx_swlocked_update_bits' [-Wmissing-prototypes]
      28 | void ep93xx_swlocked_update_bits(unsigned int reg,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/cirrus/ep93xx.h: In function 'ep93xx_swlocked_update_bits':
   include/linux/soc/cirrus/ep93xx.h:31:16: error: 'return' with a value, in function returning void [-Werror=return-type]
      31 |         return 0;
         |                ^
   include/linux/soc/cirrus/ep93xx.h:28:6: note: declared here
      28 | void ep93xx_swlocked_update_bits(unsigned int reg,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/keyboard/ep93xx_keypad.c: In function 'ep93xx_keypad_probe':
   drivers/input/keyboard/ep93xx_keypad.c:262:9: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
     262 |         of_property_read_u32(np, "cirrus,debounce-delay-ms", &keypad->debounce);
         |         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from sound/soc/cirrus/ep93xx-i2s.c:28:
   include/linux/soc/cirrus/ep93xx.h: In function 'ep93xx_devcfg_set_clear':
   include/linux/soc/cirrus/ep93xx.h:22:16: error: 'return' with a value, in function returning void [-Werror=return-type]
      22 |         return 0;
         |                ^
   include/linux/soc/cirrus/ep93xx.h:19:20: note: declared here
      19 | static inline void ep93xx_devcfg_set_clear(unsigned int set_bits,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/cirrus/ep93xx.h: At top level:
>> include/linux/soc/cirrus/ep93xx.h:24:6: warning: no previous prototype for 'ep93xx_syscon_swlocked_write' [-Wmissing-prototypes]
      24 | void ep93xx_syscon_swlocked_write(unsigned int val, unsigned int reg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/cirrus/ep93xx.h: In function 'ep93xx_syscon_swlocked_write':
   include/linux/soc/cirrus/ep93xx.h:26:16: error: 'return' with a value, in function returning void [-Werror=return-type]
      26 |         return 0;
         |                ^
   include/linux/soc/cirrus/ep93xx.h:24:6: note: declared here
      24 | void ep93xx_syscon_swlocked_write(unsigned int val, unsigned int reg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/cirrus/ep93xx.h: At top level:
>> include/linux/soc/cirrus/ep93xx.h:28:6: warning: no previous prototype for 'ep93xx_swlocked_update_bits' [-Wmissing-prototypes]
      28 | void ep93xx_swlocked_update_bits(unsigned int reg,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/soc/cirrus/ep93xx.h: In function 'ep93xx_swlocked_update_bits':
   include/linux/soc/cirrus/ep93xx.h:31:16: error: 'return' with a value, in function returning void [-Werror=return-type]
      31 |         return 0;
         |                ^
   include/linux/soc/cirrus/ep93xx.h:28:6: note: declared here
      28 | void ep93xx_swlocked_update_bits(unsigned int reg,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ep93xx_syscon_swlocked_write +24 include/linux/soc/cirrus/ep93xx.h

    10	
    11	#if defined(CONFIG_ARCH_EP93XX)
    12	unsigned int ep93xx_chip_revision(void);
    13	void ep93xx_devcfg_set_clear(unsigned int set_bits, unsigned int clear_bits);
    14	void ep93xx_syscon_swlocked_write(unsigned int val, unsigned int reg);
    15	void ep93xx_swlocked_update_bits(unsigned int reg,
    16					 unsigned int mask, unsigned int val);
    17	#else
    18	static inline unsigned int ep93xx_chip_revision(void) { return 0; }
    19	static inline void ep93xx_devcfg_set_clear(unsigned int set_bits,
    20					unsigned int clear_bits)
    21	{
  > 22		return 0;
    23	}
  > 24	void ep93xx_syscon_swlocked_write(unsigned int val, unsigned int reg)
    25	{
  > 26		return 0;
    27	}
  > 28	void ep93xx_swlocked_update_bits(unsigned int reg,
    29					unsigned int mask, unsigned int val)
    30	{
    31		return 0;
    32	}
    33	#endif
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
