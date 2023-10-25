Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A96A17CA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 01:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myfSxIcF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698198165; x=1729734165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/yjOGSG/zxjaMJ7kW13P0KfSRDPFA8lg85Qo6TNJwqA=;
  b=myfSxIcFaNiKrd5RaZ33/439mMOMmEtHXw3p8vz4hRUjP6NemlGqe/0p
   cNaxEdgmbUJZkYTQIck7A6jl2X6Hvu/w9YrQ7dPBRxxnq8ocwHhx1F0LV
   52OlP1YZ5H4zstpxHGsc+ANZf5mI24f/tFPV2vROT0JOAOVppE0W7a5gi
   oouKH6dyFPsNbdnRYVFJCjha7oM033Ounbl3m5pXb4q/5XURCuThvUOxM
   vo8/eJIVteWElsGMkQ7mBxe5pZPMFBPAW7FjbObY8E/Q7sVspAvLR8kdS
   fyoJHqliymsxreFshPOSUMvbvawpstt/n+GCDCrktsHBQK5DB+xOIRDS6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451441127"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="451441127"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 18:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="762295737"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; 
   d="scan'208";a="762295737"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2023 18:42:41 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvSut-0008VZ-15;
	Wed, 25 Oct 2023 01:42:39 +0000
Date: Wed, 25 Oct 2023 09:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Avri Altman <avri.altman@wdc.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Adrian Hunter <adrian.hunter@intel.com>,
	Daniil Lunev <dlunev@google.com>,
	Asutosh Das <quic_asutoshd@quicinc.com>,
	Avri Altman <avri.altman@wdc.com>
Subject: Re: [PATCH v2 2/2] mmc: host: msm: Disable auto-cmd12 during ffu
Message-ID: <202310250913.ri6qqodu-lkp@intel.com>
References: <20231023132128.1871269-3-avri.altman@wdc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023132128.1871269-3-avri.altman@wdc.com>

Hi Avri,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on ulf-hansson-mmc-mirror/next v6.6-rc7 next-20231024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Avri-Altman/mmc-core-Mark-close-ended-ffu-in-progress/20231023-212707
base:   linus/master
patch link:    https://lore.kernel.org/r/20231023132128.1871269-3-avri.altman%40wdc.com
patch subject: [PATCH v2 2/2] mmc: host: msm: Disable auto-cmd12 during ffu
config: csky-randconfig-001-20231025 (https://download.01.org/0day-ci/archive/20231025/202310250913.ri6qqodu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250913.ri6qqodu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250913.ri6qqodu-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: drivers/mmc/host/sdhci-msm.o: in function `sdhci_msm_request':
>> sdhci-msm.c:(.text+0x540): undefined reference to `mmc_is_ffu_cmd'
   csky-linux-ld: drivers/mmc/host/sdhci-msm.o: in function `sdhci_and_cqhci_reset':
   sdhci-msm.c:(.text+0x5c0): undefined reference to `mmc_is_ffu_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
