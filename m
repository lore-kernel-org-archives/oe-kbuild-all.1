Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598347;
	b=4gqchNPGqAen4uB72tB9vIsGkzhpW+u7jGVjH4NGNdxFWXopAqdHBrlKuI6mPRK3hPV2
	 5TeHTv3aOe91ejtuuHna28p77dSCETY5g4KD2ZSqsVC2dtjZ0nW1cXz/3uMhWPIpFkYTo
	 BXNfKalaA4BaEM0kpQBsqzVIbR9hOFJobN69+nDQVJHCxyWi1LeRIc3dhwUoGdd8POG3P
	 sLAiwvuqpMW6JD/2oCwCqhTQalMA32CCTDU/AbV8n6EIGo48Zc7ZGgi6yFZRE3dobl0KI
	 gDf1bsgW9+zbdoP656Rms6lGs1qFLflrLJF0DaVMJI4rLTiuIasfbk87dXuSCRn8dAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598347;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ynmYsghxgOODSQ0llMBGyixv4qizPknF2tHzXaljfHg=;
	b=pwTEVYOU8OOL2UVpq6B5+hoa2/Bc0jpHKZDmJDt+qnIQmhhIhpoMBIUNDDzJVdN5bpNr
	 /Y16/fmAaWgDZRhjs6zQw41H6MzENP91xxX6tPok0/HtIYhjzIoyDga1gW+4okD9dHm9t
	 QM1T3FSaa0JqPaeHCjU9y+YbM5a55uAKOlrrnA2DDIc5NkBMc4xClL9ufjIKA5d1hzqte
	 5B9nWRp4/FjvwYSu2osjZx9wnSVrweP3BZwEJnfm9AODD0FogEaR94zKq/h07uW73Yj4K
	 sjddPZdH0lKlmtkoDikisWaI6Yjs2BbDo9Ue5KetkEyntjDnYEzagSRSFKSma3NTf0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j2qVScJp;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03585606A323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 19:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03585606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j2qVScJp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794598346; x=1826134346;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=owt5GIyYcSjK4jPPrxCdWjxfKXNpIouQ0UtS0pnQwNw=;
  b=j2qVScJpzDV9HvY6MlGxrE/JcWjv210Pbyvohx01t8FIMMFGKxoxlLNA
   B0GQTV+GgFV/RPq6e7kbzZIqE6fLPxFAgk2zw3zMmcUoB96Hvn5leknb0
   neWjfPpbxG+6zO+Pvmjq0s4g7Ho4aSdhajxrkvKKpuNUaIgsPKTuLZoV0
   X8Tn/7NMuPbSaX+Gbfq9o4oMvPf55mJiml463v5POyPVOEwaTd/31BNoq
   onZu/VriJlXJp8ByaDQhHjSrIdlyyNLFatd9+lcO9Hf0B+TBZYcb9yJB3
   V9oc4SPyLYDy8X6RcUH3mihEWqRYqty+jL8YmUFOTCwSn9BGfpDgQgQjw
   g==;
X-CSE-ConnectionGUID: VOI74AeoToCRp5bhgf2Ufg==
X-CSE-MsgGUID: xjbRd15CQl+3jvqEt87JnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3288218"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3288218"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 11:32:25 -0800
X-CSE-ConnectionGUID: 3BIq86x+Qf263kQK/hqauw==
X-CSE-MsgGUID: K1yEiP5sTHK/IYXsA2q6kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8837759"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2026 11:32:23 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRx0W-000000013o7-2ogT;
	Fri, 13 Nov 2026 19:32:20 +0000
Date: Sat, 14 Nov 2026 03:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, macro@orcam.me.uk,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SiByte: Fix missing function prototypes
Message-ID: <202611140334.Ag9JVIC0-lkp@intel.com>
References: <20261112195824.298915-1-f.fainelli@gmail.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112195824.298915-1-f.fainelli@gmail.com>

Hi Florian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.4-rc2 next-20261112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Florian-Fainelli/MIPS-SiByte-Fix-missing-function-prototypes/20261112-115739
base:   linus/master
patch link:    https://lore.kernel.org/r/20261112195824.298915-1-f.fainelli%40gmail.com
patch subject: [PATCH] MIPS: SiByte: Fix missing function prototypes
config: mips-ip27_defconfig (https://download.01.org/0day-ci/archive/20261114/202611140334.Ag9JVIC0-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140334.Ag9JVIC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140334.Ag9JVIC0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/include/asm/sibyte/sb1250.h:28,
                    from arch/mips/mm/tlbex.c:40:
>> arch/mips/include/asm/sibyte/bcm1480_scd.h:261:9: warning: 'M_SPC_CFG_CLEAR' redefined
     261 | #define M_SPC_CFG_CLEAR                 M_BCM1480_SPC_CFG_CLEAR
         |         ^~~~~~~~~~~~~~~
   In file included from arch/mips/include/asm/sibyte/sb1250.h:27:
   arch/mips/include/asm/sibyte/sb1250_scd.h:392:9: note: this is the location of the previous definition
     392 | #define M_SPC_CFG_CLEAR         _SB_MAKEMASK1(32)
         |         ^~~~~~~~~~~~~~~
>> arch/mips/include/asm/sibyte/bcm1480_scd.h:262:9: warning: 'M_SPC_CFG_ENABLE' redefined
     262 | #define M_SPC_CFG_ENABLE                M_BCM1480_SPC_CFG_ENABLE
         |         ^~~~~~~~~~~~~~~~
   arch/mips/include/asm/sibyte/sb1250_scd.h:393:9: note: this is the location of the previous definition
     393 | #define M_SPC_CFG_ENABLE        _SB_MAKEMASK1(33)
         |         ^~~~~~~~~~~~~~~~


vim +/M_SPC_CFG_CLEAR +261 arch/mips/include/asm/sibyte/bcm1480_scd.h

4cbf2beac2265b3 include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  252  
4cbf2beac2265b3 include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  253  /*
4cbf2beac2265b3 include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  254   * System Performance Counter Control Register (Table 32)
4cbf2beac2265b3 include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  255   * Register: PERF_CNT_CFG_1
4cbf2beac2265b3 include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  256   * BCM1480 specific
4cbf2beac2265b3 include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  257   */
4cbf2beac2265b3 include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  258  #define M_BCM1480_SPC_CFG_CLEAR	    _SB_MAKEMASK1(0)
4cbf2beac2265b3 include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  259  #define M_BCM1480_SPC_CFG_ENABLE    _SB_MAKEMASK1(1)
8deab1144b55354 include/asm-mips/sibyte/bcm1480_scd.h Mark Mason      2007-03-28  260  #if SIBYTE_HDR_FEATURE_CHIP(1480)
8deab1144b55354 include/asm-mips/sibyte/bcm1480_scd.h Mark Mason      2007-03-28 @261  #define M_SPC_CFG_CLEAR			M_BCM1480_SPC_CFG_CLEAR
8deab1144b55354 include/asm-mips/sibyte/bcm1480_scd.h Mark Mason      2007-03-28 @262  #define M_SPC_CFG_ENABLE		M_BCM1480_SPC_CFG_ENABLE
8deab1144b55354 include/asm-mips/sibyte/bcm1480_scd.h Mark Mason      2007-03-28  263  #endif
4cbf2beac2265b3 include/asm-mips/sibyte/bcm1480_scd.h Andrew Isaacson 2005-10-19  264  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
