Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B638838B7B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339044; cv=none; b=jG1QflXw1c1onsGiguhcMX0ByI4SYxYqm2h4T85vyHLCDwqHbne04l9IefHyfN5kpLiTUix5yy5TdtGg499lmZsX8fq5+wcNBXNc3nfg1aQ7CPg4CMHa5McHK+u7b+5Z/0PMOyuCncDzq0QYFdHL/1DZ8wURuQnPyprRnIwzlM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339044; c=relaxed/simple;
	bh=/XoDcK9uQuA1PFvOVhQ4vfwrB/BkjWb28CrWHHfY5N4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ffDdYt6OFue+rubgpQD4L23ZTCovr8QLhSGqvrfg+hqNz1FpnXrIGs0DTZDP+rMOOrDOUvPQszgvDgvoxpZwp/KUrY6xSLUgQxoWnMBPeL+bTzGIc56LrIrUmSd7SvhFTqVvM6gD39J7zu7rr5Tdgzv77RvpgKYrVgcWpRqzif8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=We6A0GDB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="We6A0GDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785339041; x=1816875041;
  h=date:from:to:cc:subject:message-id;
  bh=/XoDcK9uQuA1PFvOVhQ4vfwrB/BkjWb28CrWHHfY5N4=;
  b=We6A0GDBTu5HyR+5Yz1dXaaLDRHzzgqe9ljfdlCFrYsV8E3xfgZKchmS
   W2oAo/JJJUv1VujElsBhk4lAap5rS+sHR8OfXwZYeJq1Hc9q5ioOwWJTH
   1ZQRfPj88yvIWKyGIzmNbPllWeBYiASv2LsZbZdnCgQgnCmHkghTQBlVU
   bfIfQoegQJJ8Q1xwHrWjx6DgKRc6tJqKHsP4XxBx1LhgYGJf1MhiFIqhz
   S9EJQYZ/kT6JW3ShvZGplHq6TeFwMzuuv1GIar0jupJ6PE4Of/fNPHPba
   hb2yQKWPf1wB3n062H+HYzvhHKiJUmkPETZp8LX6MtClyaWjZUQ77iW2N
   w==;
X-CSE-ConnectionGUID: oUWXJBKMRc6fIF0QBr51sQ==
X-CSE-MsgGUID: lt8sPu+FTjObCX/4Tb01uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89626934"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="89626934"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 08:30:41 -0700
X-CSE-ConnectionGUID: jFZ1J6SdQJiycy3xUseW3w==
X-CSE-MsgGUID: Hn15DNGDSu6GA15JEFLBiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="258798390"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 29 Jul 2026 08:30:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp6Ev-000000002Ao-2Vt4;
	Wed, 29 Jul 2026 15:30:37 +0000
Date: Wed, 29 Jul 2026 17:29:58 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 344/700] kismet: WARNING: unmet
 direct dependencies detected for GENERIC_PINCTRL_GROUPS when selected by
 MSC313E_SAR
Message-ID: <202607291716.vdYwPbw6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 88c3adc69c81ffc51dcc5902ec2f4b50e72ce948 [344/700] iio: adc: Add driver for mstar SAR
config: alpha-kismet-CONFIG_GENERIC_PINCTRL_GROUPS-CONFIG_MSC313E_SAR-0-0 (https://download.01.org/0day-ci/archive/20260729/202607291716.vdYwPbw6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260729/202607291716.vdYwPbw6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291716.vdYwPbw6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS when selected by MSC313E_SAR
   WARNING: unmet direct dependencies detected for GENERIC_PINCTRL_GROUPS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - MSC313E_SAR [=y] && IIO [=y] && (ARCH_MSTARV7 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINCONF
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - MSC313E_SAR [=y] && IIO [=y] && (ARCH_MSTARV7 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
   
   WARNING: unmet direct dependencies detected for GENERIC_PINMUX_FUNCTIONS
     Depends on [n]: PINCTRL [=n]
     Selected by [y]:
     - MSC313E_SAR [=y] && IIO [=y] && (ARCH_MSTARV7 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
