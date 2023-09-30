Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1711FA8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 06:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696053784; x=1727589784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GpEV2PwaQQqT5AKdwqUAwuP0iOSDA54Ib3/6H+AgUlM=;
  b=CGy/k4doc5i9zyYoXpCaUWunItUDlhSpSExvUVlCaRFq+rVZhzIXuCN8
   SlfblrsKPrCx0ZgCHi9aO29d7pYXdxKjH3kRLiOtAvrpaFoLueQDeSKUo
   zvRgtnP4bLb6aktH4GOTJjr1F3h5GSksbcKy+33/8SGqRnIWJ/2x1Rziw
   zjQro29gfsj8M/CNdrX3xaRuYCWZU/7++7RMDH9ZvD+P0GT50Fek56sOH
   HtSiB3JIjraP/qSJresyBVHFeCn1kbP+gj6ShAA35wI3xvn4Uiz5Ht2iI
   u2Ur6w6JaKA/I6HW4DbhBjBf0tqraZBchO2Xe5y5ZisdnEGMlnrzoq6Y8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="385250449"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="385250449"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2023 23:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="726788552"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="726788552"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Sep 2023 23:03:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmT48-0003lb-1l;
	Sat, 30 Sep 2023 06:03:00 +0000
Date: Sat, 30 Sep 2023 14:02:24 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 2/3] x86/mce: Add per-bank CMCI storm mitigation
Message-ID: <202309301313.Vlgm72s1-lkp@intel.com>
References: <20230929181626.210782-3-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929181626.210782-3-tony.luck@intel.com>

Hi Tony,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6465e260f48790807eef06b583b38ca9789b6072]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Luck/x86-mce-Remove-old-CMCI-storm-mitigation-code/20230930-044421
base:   6465e260f48790807eef06b583b38ca9789b6072
patch link:    https://lore.kernel.org/r/20230929181626.210782-3-tony.luck%40intel.com
patch subject: [PATCH v8 2/3] x86/mce: Add per-bank CMCI storm mitigation
config: i386-buildonly-randconfig-002-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301313.Vlgm72s1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301313.Vlgm72s1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301313.Vlgm72s1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kernel/cpu/mce/core.o: in function `mce_timer_fn':
>> core.c:(.text+0x1130): undefined reference to `storm_desc'
   ld: arch/x86/kernel/cpu/mce/core.o: in function `machine_check_poll':
>> core.c:(.text+0x1634): undefined reference to `mce_track_storm'
   ld: arch/x86/kernel/cpu/mce/core.o: in function `mce_timer_kick':
   core.c:(.text+0x1919): undefined reference to `storm_desc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
