Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09418C0D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687528093; x=1719064093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p9NgACVaiSspactyT3RJcYZ9XddCzihsMDcpJG30mCs=;
  b=R3EOFUwH1yz4tkX5OdPo82lWbrFzEjKaSvw3njQp9TXKHtnIZ9W7I9Sk
   p96qpiBC2JtngPRx+F3YW64JK3XuMAKlVlr+iaasLQCgR78fT45GovXEQ
   b3Iz6r8JLeFQNaV+Gwt10v8GkNbIjma/lxJ0ThzZxjbehG6MQOLI1kVcM
   xtnds4gBoD511e1DmT26azDh4re3ltY+MTgaD7S2PT+KHgHkRYQg8R+se
   cegqjwZvIzGUSJLmtejLlkfg4TTp1g6Lmq9+XfZUbY1t9aBPJXCAFpTPt
   Iivdf3wFbw3voSvFJ71iM6UGCfiED7wxH8fm2ekrqbSnTVS6ZlYTERVZJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="364212124"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="364212124"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 06:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="805209567"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="805209567"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jun 2023 06:48:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCh8y-0008IZ-1j;
	Fri, 23 Jun 2023 13:48:08 +0000
Date: Fri, 23 Jun 2023 21:47:12 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	samuel@sholland.org, guoren@kernel.org, christoph.muellner@vrull.eu,
	heiko@sntech.de, conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 2/3] RISC-V: move vector-available status into a
 dedicated variable
Message-ID: <202306232112.kwDtMcou-lkp@intel.com>
References: <20230622231305.631331-3-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622231305.631331-3-heiko@sntech.de>

Hi Heiko,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230622]
[cannot apply to linus/master v6.4-rc7 v6.4-rc6 v6.4-rc5 v6.4-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/RISC-V-move-vector-available-status-into-a-dedicated-variable/20230623-081314
base:   next-20230622
patch link:    https://lore.kernel.org/r/20230622231305.631331-3-heiko%40sntech.de
patch subject: [PATCH v2 2/3] RISC-V: move vector-available status into a dedicated variable
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230623/202306232112.kwDtMcou-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306232112.kwDtMcou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306232112.kwDtMcou-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/setup.c: In function 'setup_arch':
>> arch/riscv/kernel/setup.c:315:17: error: implicit declaration of function 'riscv_vector_supported'; did you mean 'riscv_noncoherent_supported'? [-Werror=implicit-function-declaration]
     315 |                 riscv_vector_supported();
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 riscv_noncoherent_supported
   cc1: some warnings being treated as errors


vim +315 arch/riscv/kernel/setup.c

   304	
   305		if (!acpi_disabled)
   306			acpi_init_rintc_map();
   307	
   308		riscv_init_cbo_blocksizes();
   309		riscv_fill_hwcap();
   310		init_rt_signal_env();
   311		apply_boot_alternatives();
   312	
   313		if (IS_ENABLED(CONFIG_RISCV_ISA_V) &&
   314		    riscv_isa_extension_available(NULL, v))
 > 315			riscv_vector_supported();
   316	
   317		if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
   318		    riscv_isa_extension_available(NULL, ZICBOM))
   319			riscv_noncoherent_supported();
   320	}
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
