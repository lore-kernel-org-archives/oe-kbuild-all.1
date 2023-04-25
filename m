Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D2110C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682410470; x=1713946470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=STT4LXvh/H32YBaXD2LGnLhItIJkAlacFAgSr/5w4mk=;
  b=E4TnOZvBmjqJknXU4cXJByLJDaqOCH1AkeUv01AO55aVPtP8zjMO/m8G
   0kOUH/9Q49Flf/3QH4mYGWvT7GPt28uMoCi0yhxJJRpaTsdV0VPsOuson
   fRQ1J9ErXKBXtKKEejgYxKr8yiqV5L+BXg7YM1vgdI9gqGzah8yuNuvRG
   +CzqYAF6tFYOHYatd8WO1uKENAwOp1c3NFBYcnvanALA/TgkLVfMFssYp
   23mGyuvbfpKYCEg81plzkZsxpJtdTXnxSahJkKhOOZ0E5fubrpVtbfWMC
   iV2h2rXeXi7DwdE53iGzHaiqWSnmSOxt7GykUBs2SkTlpL+ASzCdBhEk6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="411984407"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="411984407"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 01:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="837339253"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="837339253"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2023 01:14:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prDoe-000jBo-35;
	Tue, 25 Apr 2023 08:14:24 +0000
Date: Tue, 25 Apr 2023 16:13:40 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com
Cc: oe-kbuild-all@lists.linux.dev, heiko@sntech.de, kito.cheng@sifive.com,
	jrtc27@jrtc27.com, conor.dooley@microchip.com,
	matthias.bgg@gmail.com, heinrich.schuchardt@canonical.com,
	greentime.hu@sifive.com, nick.knight@sifive.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	richard.henderson@linaro.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 3/4] RISC-V: export the ISA string of the running machine
 in the aux vector
Message-ID: <202304251516.YPx3mm3W-lkp@intel.com>
References: <20230424194911.264850-4-heiko.stuebner@vrull.eu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424194911.264850-4-heiko.stuebner@vrull.eu>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20230424]
[also build test WARNING on v6.3]
[cannot apply to soc/for-next linus/master kees/for-next/execve v6.3 v6.3-rc7 v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/RISC-V-create-ISA-string-separately-not-as-part-of-cpuinfo/20230425-035214
base:   next-20230424
patch link:    https://lore.kernel.org/r/20230424194911.264850-4-heiko.stuebner%40vrull.eu
patch subject: [PATCH 3/4] RISC-V: export the ISA string of the running machine in the aux vector
config: riscv-randconfig-r042-20230424 (https://download.01.org/0day-ci/archive/20230425/202304251516.YPx3mm3W-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3f82c51fa0f92c257313a0291c7a36cbdfdc5bb1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heiko-Stuebner/RISC-V-create-ISA-string-separately-not-as-part-of-cpuinfo/20230425-035214
        git checkout 3f82c51fa0f92c257313a0291c7a36cbdfdc5bb1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251516.YPx3mm3W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/cpu.c:122:14: warning: 'riscv_create_isa_string' used but never defined
     122 | static char *riscv_create_isa_string(void);
         |              ^~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_create_isa_string +122 arch/riscv/kernel/cpu.c

   120	
   121	const char *riscv_base_platform = NULL;
 > 122	static char *riscv_create_isa_string(void);
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
