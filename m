Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E988944B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 20:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EI6x1Cda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698526604; x=1730062604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2xdmOX1+nYScj0V27GtRPbDInoXKHqK1zJN9coZYscc=;
  b=EI6x1Cdae8qW6JxXzOpwEmQhlv+kyz3XJbrj6EkaSxWudgyMDK+tLV8S
   KAO+a0d/UQYKvBksHGFfpSC3wm6w7fMzcAtDFJ3D+klyKO9JnPqR1lore
   aOAoCeWgwgxAM/GLfyhVjVrOmpOWbbaymn+AIGoo6HMBwoZ3GukW7q2Lm
   P/oEV4GKaSKcuwxCl8baUhEnBvHI0JDPlCrnYJldjiYtq957wOLDB71sE
   HV3uK/MFFbE/TFas9uHF+GDQxsSKpr0GARMDVWJRbkn1NPerPt+krpRKc
   C2ktecitwf6j0Sf7WwqOvvq/g4B2YLrVb5paBA6aTtgua2G9q8j3SNuIz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="452168105"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="452168105"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 13:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="1106760"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Oct 2023 13:56:02 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwqMG-000C4y-38;
	Sat, 28 Oct 2023 20:56:36 +0000
Date: Sun, 29 Oct 2023 04:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>, broonie@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	kevin-lu@ti.com, shenghao-ding@ti.com, baojun.xu@ti.com,
	peeyush@ti.com, navada@ti.com, tiwai@suse.de
Subject: Re: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
Message-ID: <202310290433.ay15yHii-lkp@intel.com>
References: <20231028092409.96813-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028092409.96813-1-baojun.xu@ti.com>

Hi Baojun,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.6-rc7 next-20231027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baojun-Xu/ASoC-tas2783-Add-source-files-for-tas2783-driver/20231028-172643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231028092409.96813-1-baojun.xu%40ti.com
patch subject: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20231029/202310290433.ay15yHii-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290433.ay15yHii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290433.ay15yHii-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `__kernel_entry':
   (.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_entry'
   arch/mips/kernel/head.o: in function `smp_bootstrap':
   (.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `start_secondary'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x10): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x18): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0x50): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x58): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x90): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x98): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0xd0): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xd8): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x108): additional relocation overflows omitted from the output
   mips-linux-ld: sound/soc/codecs/tas2783-sdw.o: in function `tas2783_calibration.isra.0':
>> tas2783-sdw.c:(.text.tas2783_calibration.isra.0+0x50): undefined reference to `efi'
>> mips-linux-ld: tas2783-sdw.c:(.text.tas2783_calibration.isra.0+0x80): undefined reference to `efi'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
