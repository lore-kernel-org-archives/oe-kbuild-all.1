Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4795037C8C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 19:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mp7th5Pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696878264; x=1728414264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VcIVbkjldo4NhjDRdGLwRnd1Gsbr7VebFElrMtcM+SQ=;
  b=mp7th5PnKadZ74a1ue3j5d4vTqQpsZ/yxZBB8VA56R5j1IiAqcvnmYS6
   kFQhSg8rFm1aTgRWNzlk2JXV/vJN9wQw3nTSSDB9bOvLclYbOp+c79K6A
   IAKL+3SRqzW9edaSL5DeMwMFFLY9umIv38W34u1f0bxxO1Dspb6HFnrgL
   Fc6zkuFeYBKI8/KziUEytqbj0m73MYJ+4oyev60ZxZ/0fI3bs2LSa65rJ
   SCCBGW2NjLhG/wo11xbFO0PctRadDyc4L9/w5mk4z/j2kIxHs0Ey9/T2w
   Rxl8q5NXjCbA600N73qO5YM793TtAOQsqBEA/KN5UTVSGhZlNmBzGWc/U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="364515882"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="364515882"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 12:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="746783124"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="746783124"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 09 Oct 2023 12:03:27 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpvXK-0000Y0-0j;
	Mon, 09 Oct 2023 19:03:26 +0000
Date: Tue, 10 Oct 2023 03:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org, rui.zhang@intel.com,
	lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, treding@nvidia.com, jonathanh@nvidia.com,
	bbasu@nvidia.com, sumitg@nvidia.com, sanjayc@nvidia.com,
	ksitaraman@nvidia.com, srikars@nvidia.com, jbrasen@nvidia.com
Subject: Re: [Patch v4 2/2] ACPI: processor: reduce CPUFREQ thermal reduction
 pctg for Tegra241
Message-ID: <202310100219.lpVzbckv-lkp@intel.com>
References: <20231009171839.12267-3-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009171839.12267-3-sumitg@nvidia.com>

Hi Sumit,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on next-20231009]
[cannot apply to linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Gupta/ACPI-thermal-Add-Thermal-fast-Sampling-Period-_TFP-support/20231010-012229
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231009171839.12267-3-sumitg%40nvidia.com
patch subject: [Patch v4 2/2] ACPI: processor: reduce CPUFREQ thermal reduction pctg for Tegra241
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231010/202310100219.lpVzbckv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100219.lpVzbckv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100219.lpVzbckv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/setup.o: in function `acpi_thermal_cpufreq_pctg':
>> setup.c:(.text+0x3): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/x86_init.o: in function `acpi_thermal_cpufreq_pctg':
   x86_init.c:(.text+0x44): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/i8259.o: in function `acpi_thermal_cpufreq_pctg':
   i8259.c:(.text+0x2dd): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/irqinit.o: in function `acpi_thermal_cpufreq_pctg':
   irqinit.c:(.text+0x0): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/bootflag.o: in function `acpi_thermal_cpufreq_pctg':
   bootflag.c:(.text+0x0): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/e820.o: in function `acpi_thermal_cpufreq_pctg':
   e820.c:(.text+0x144): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/pci-dma.o: in function `acpi_thermal_cpufreq_pctg':
   pci-dma.c:(.text+0x0): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: arch/x86/kernel/process.o: in function `acpi_thermal_cpufreq_pctg':
   process.c:(.text+0xe5): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/sysctl.o: in function `acpi_thermal_cpufreq_pctg':
   sysctl.c:(.text+0x48): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: kernel/dma/mapping.o: in function `acpi_thermal_cpufreq_pctg':
   mapping.c:(.text+0x5ba): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: drivers/base/core.o: in function `acpi_thermal_cpufreq_pctg':
   core.c:(.text+0x13e9): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: drivers/base/platform.o: in function `acpi_thermal_cpufreq_pctg':
   platform.c:(.text+0x8b8): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: drivers/base/cpu.o: in function `acpi_thermal_cpufreq_pctg':
   cpu.c:(.text+0x128): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: drivers/base/property.o: in function `acpi_thermal_cpufreq_pctg':
   property.c:(.text+0xa87): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here
   ld: drivers/base/cacheinfo.o: in function `acpi_thermal_cpufreq_pctg':
   cacheinfo.c:(.text+0x231): multiple definition of `acpi_thermal_cpufreq_pctg'; init/main.o:main.c:(.text+0x32): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
