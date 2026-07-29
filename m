Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF35F411A15
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785342103; cv=none; b=KBUnxNTJ1fm/8fwZ1yBoX4HS8L6RQCSvr4KARGQfoIi5NCYZnKapVHAqx29YRX9h1A8ZRA26k6tKvOF7UFvrjBwx1wrDDKtWdr7+Vw1ugTBYWa50dhL1e0LHlTBqujD27YsHVSS1dkyrkuSG8UCWO56z+pwim7Tbba1U9Ok1TKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785342103; c=relaxed/simple;
	bh=muVZmz0NG1/5SFI0xSMewb/5uHf9adrna+dF0VAHUso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A4uvF1wNCHOzXRhFcYylCHQx0NfbF+eJFS7K6MasXf/Jga4RVwh2O7kWvbPcTLsXRTcg+z7wu+j95ogt1HJRrZ7FjwPR77bfcRDs1B9GZ0Ueetd3r/6ICT44YDMiM7yncgfmpdOGUEVYlUwaj6WX61bSl7ZnMqjAvxr1mxTje1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDVsZ+hc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDVsZ+hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785342102; x=1816878102;
  h=date:from:to:cc:subject:message-id;
  bh=muVZmz0NG1/5SFI0xSMewb/5uHf9adrna+dF0VAHUso=;
  b=WDVsZ+hcMeXge5C4uWLM45dcSnSC0cB5aHpHMtZNyduPzYH86hJtxVui
   ia0z6xTePFAl3ZROyjGz07C80nrst0LJSR37EmaIl6fl4zjbpER6kFlV1
   hCSTPnDhUi9uGOUzQQvLRow+dPiXncvzcFiRTkQidC/u+D7gnB7BBXmDb
   8Uuw3TVomdHkVHngVO70sYyA7mnLe6veUBoFEA8u4z37YlqhB2Ltal/MT
   LkQqi6qG8eQ8EJPpgUmGKcTgPMuCNU0OnrYgfzpnzHyVXQHoVgW4d3C9C
   MQkr2bUGh4HOLpG7HnBgom+sObE19FLemXqUJFNgLnPqiLqTGTpA4RIDK
   g==;
X-CSE-ConnectionGUID: aYay68gzRNaT11OdxNKjBw==
X-CSE-MsgGUID: izQk5CHdQgGVf6vdwnViDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96313819"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="96313819"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 09:21:41 -0700
X-CSE-ConnectionGUID: Q5AaD8mqRjSu2YM0cc5oqQ==
X-CSE-MsgGUID: AGMkeOWST9WP/K/fT8B2gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="265089912"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jul 2026 09:21:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp72H-000000002B8-3nG5;
	Wed, 29 Jul 2026 16:21:37 +0000
Date: Wed, 29 Jul 2026 18:20:48 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 344/700] kismet: WARNING: unmet
 direct dependencies detected for GENERIC_PINMUX_FUNCTIONS when selected by
 MSC313E_SAR
Message-ID: <202607291822.YxFqMUlK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 88c3adc69c81ffc51dcc5902ec2f4b50e72ce948 [344/700] iio: adc: Add driver for mstar SAR
config: alpha-kismet-CONFIG_GENERIC_PINMUX_FUNCTIONS-CONFIG_MSC313E_SAR-0-0 (https://download.01.org/0day-ci/archive/20260729/202607291822.YxFqMUlK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260729/202607291822.YxFqMUlK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607291822.YxFqMUlK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GENERIC_PINMUX_FUNCTIONS when selected by MSC313E_SAR
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
