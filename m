Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C03186E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 04:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694666407; x=1726202407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TKi52rvlfIoGcPmcOL9hgF/Ozj/+C1T6xU6PAFOkPHA=;
  b=GDM/3GN9mCbkwWiTB9vYXZ9dHxLWSn7f941VSUf1QE/AfhQFXoGAHCFN
   1DDeMrvMGSocOtiIMo0xenlHW6VgYbfdVuJzpcOxK4QmsRZmxtQfzVtpJ
   lLZDmez9A6QwsSoPkTEQdq0eB1hCOXd2vRAqesFanvMdVQ2pDsTeEFArQ
   3Um3aPzFI+wR0eAL/0pv3HwHhar5cp61aw/qAJ8dgCTwrJTY1K5nSJOe3
   Z46jBDZKM+rGYPBk62OpsQ5kdrUHHrRfwB+kXyr6ogboCzdMCPyLbzV5/
   oc/ykR5TyXSFx8B0tgGg19mEOX9Dy3NDu6gCIygYrCpQmBTnqRD2O2DZa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369123209"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="369123209"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 21:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="868097149"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="868097149"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 13 Sep 2023 21:39:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qge8w-0001AD-35;
	Thu, 14 Sep 2023 04:39:54 +0000
Date: Thu, 14 Sep 2023 12:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org, rui.zhang@intel.com,
	lenb@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sumitg@nvidia.com, sanjayc@nvidia.com,
	ksitaraman@nvidia.com, srikars@nvidia.com, jbrasen@nvidia.com,
	bbasu@nvidia.com
Subject: Re: [Patch v2 2/2] ACPI: processor: reduce CPUFREQ thermal reduction
 pctg for Tegra241
Message-ID: <202309141242.CUDGcSdC-lkp@intel.com>
References: <20230913164659.9345-3-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913164659.9345-3-sumitg@nvidia.com>

Hi Sumit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Gupta/ACPI-thermal-Add-Thermal-fast-Sampling-Period-_TFP-support/20230914-004929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230913164659.9345-3-sumitg%40nvidia.com
patch subject: [Patch v2 2/2] ACPI: processor: reduce CPUFREQ thermal reduction pctg for Tegra241
config: i386-randconfig-062-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141242.CUDGcSdC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141242.CUDGcSdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141242.CUDGcSdC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/processor_thermal.c:141:6: sparse: sparse: symbol 'acpi_thermal_cpufreq_config_nvidia' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
