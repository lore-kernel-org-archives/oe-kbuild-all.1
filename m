Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94837B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Apr 2023 08:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682412331; x=1713948331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FsXK0pVsiKRVSRpZSn2/rIa4Ll3HrIxEMFe6k8mBodE=;
  b=LZ4RbAc5us9kruehnxpfoYSCYCDsRRYM4UEDANv91H0cZlCCDZfBZTbE
   at9OTuA+y+qGvmTqfh4azUAPOf9yAawe5nnrdCbvc6+1RXSV+9ScJdyQK
   b6s5+MZRp1w2jHWBUmv+i3QGCaCV/lCUjdd+dJbrNOFFtH05iD4nmeXOJ
   KpH3xPrj1KpX+IspB3nYCWL1kxpnQFMDHVXNRnjdByQJh3+PkzZduwfZD
   RE1YI2CDSMjd2Z+DsFEAB3EDADcB2iCZnahJ+qltYoCfR52P4H5Qc3TUY
   E2gnMijpMPq9nUkHSM/D+2A6/diMm303ySV2tGIdDdhUFQ+/h/9j+hSqR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="409642932"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="409642932"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 01:45:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="693415315"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; 
   d="scan'208";a="693415315"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Apr 2023 01:45:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prEIg-000jEJ-2E;
	Tue, 25 Apr 2023 08:45:26 +0000
Date: Tue, 25 Apr 2023 16:45:19 +0800
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
Subject: Re: [PATCH 1/4] RISC-V: create ISA string separately - not as part
 of cpuinfo
Message-ID: <202304251640.IVxoyd0v-lkp@intel.com>
References: <20230424194911.264850-2-heiko.stuebner@vrull.eu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424194911.264850-2-heiko.stuebner@vrull.eu>

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
patch link:    https://lore.kernel.org/r/20230424194911.264850-2-heiko.stuebner%40vrull.eu
patch subject: [PATCH 1/4] RISC-V: create ISA string separately - not as part of cpuinfo
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230425/202304251640.IVxoyd0v-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8f1a5a16616d673f2c82cdc54ff845fd8b125a21
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heiko-Stuebner/RISC-V-create-ISA-string-separately-not-as-part-of-cpuinfo/20230425-035214
        git checkout 8f1a5a16616d673f2c82cdc54ff845fd8b125a21
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251640.IVxoyd0v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/cpu.c: In function 'riscv_create_isa_string':
>> arch/riscv/kernel/cpu.c:269:25: warning: 'strncat' output may be truncated copying 1 byte from a string of length 13 [-Wstringop-truncation]
     269 |                         strncat(isa_str, &base_riscv_exts[i], 1);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncat +269 arch/riscv/kernel/cpu.c

   246	
   247	static char *riscv_create_isa_string(const char *isa)
   248	{
   249		int maxlen = 4;
   250		char *isa_str;
   251		int i;
   252	
   253		/* calculate the needed string length */
   254		for (i = 0; i < sizeof(base_riscv_exts); i++)
   255			if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
   256				maxlen++;
   257		maxlen += strlen_isa_ext();
   258	
   259		isa_str = kzalloc(maxlen, GFP_KERNEL);
   260		if (!isa_str)
   261			return ERR_PTR(-ENOMEM);
   262	
   263		/* Print the rv[64/32] part */
   264		strncat(isa_str, isa, 4);
   265	
   266		for (i = 0; i < sizeof(base_riscv_exts); i++) {
   267			if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
   268				/* Print only enabled the base ISA extensions */
 > 269				strncat(isa_str, &base_riscv_exts[i], 1);
   270		}
   271	
   272		strcat_isa_ext(isa_str);
   273	
   274		return isa_str;
   275	}
   276	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
