Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECD225392A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790705286; cv=none; b=WULghiIqjvuG5DU+dJrijxOca1xFMKblma04sQkQ87fdyjNGO49D1uIiJFDirR/zwNQRYnA+t2mD+Hkiyo7IVYM3rYVgUXCxXTp/QCQvwJ80zzq5wDwT+Jcb+YyARtyY6RmfRGBp2QAINlt1gJaBiIX8ZZ8kVAuzWIlyh0VETwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790705286; c=relaxed/simple;
	bh=57j1o5FOkLaS1gwQYIxlXqg6bifR9t9dEVXyXQ6kff8=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifvJbkgbINWvZMyx8CiJYQ4m68/as5AOGod9h1IfhqbE9Cb9nGdcuiYaoG2mPPVgmf4U/AUm1nceKrHsO6zHwIIocf+tGQHGvppMQgUzVoUpYWm0fNodM8BsBCAi2UB5o64LEbtft1l37tsCBgSVVen5t23hrpW0jsnDIPGoJ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nt0C6loG; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nt0C6loG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790705284; x=1822241284;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=57j1o5FOkLaS1gwQYIxlXqg6bifR9t9dEVXyXQ6kff8=;
  b=Nt0C6loGBQgSV1J9OZVC/vcuJ762lC459MYNsrU7WD1NlvOrTZtJfS11
   Fd0kstkDqMFdcHVUlWeQNzL9p943Wy1pzVnYKmSLwel9YlO37N/VcKIAX
   lv3Uxus0pft3bcrGvwvHW7dZ8bqzjnQAdfEkeAWOpFvD4/ncgN7+povzV
   BC89o2TfUnDXb54x+HeOKo3NCDIGx1QeuZeRpPeJgqyOCVuDzP8kddvyV
   dk8FDq3hXX3hEWauEc+FbmPNv5pUwSXhcJbmNC7QUfgfASWkzYhUy5SSY
   hrHQn0WVkj98kyHz6PKbcnaqtH0V0Zgq1LhPq2YGkaGoJIT2QkpI7HKKP
   Q==;
X-CSE-ConnectionGUID: tTkkXYukQL6LGiRuueimRQ==
X-CSE-MsgGUID: nL08yPhBRHC+tVKSdeqtXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91293054"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="91293054"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 11:08:03 -0700
X-CSE-ConnectionGUID: WI9gcFLVTcOvwNihea5weg==
X-CSE-MsgGUID: UhtF+S8HSJyQGVg3JoKmJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="275470040"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Sep 2026 11:08:03 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBcFE-00000000PdY-1dXU
	for oe-kbuild-all@lists.linux.dev;
	Tue, 29 Sep 2026 18:08:00 +0000
Date: Wed, 30 Sep 2026 02:07:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: tcp: Add TCP ROCCET congestion control module.
Message-ID: <202609300219.dgCOHxKL-lkp@intel.com>
References: <202609300219.dgCOHxKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609300219.dgCOHxKL-lkp@intel.com>

Hi Tim,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Tim-Fuechsel/tcp-Add-TCP-ROCCET-congestion-control-module/20260928-171154
base:   
patch link:    https://lore.kernel.org/r/202609300219.dgCOHxKL-lkp%40intel.com
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260930/202609300219.dgCOHxKL-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300219.dgCOHxKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300219.dgCOHxKL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x14 (section: .data) -> ice_adv_lnk_speed_100 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x30 (section: .data) -> ice_adv_lnk_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x4c (section: .data) -> ice_adv_lnk_speed_2500 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x68 (section: .data) -> ice_adv_lnk_speed_5000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x84 (section: .data) -> ice_adv_lnk_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0xa0 (section: .data) -> ice_adv_lnk_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0xbc (section: .data) -> ice_adv_lnk_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0xd8 (section: .data) -> ice_adv_lnk_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0xf4 (section: .data) -> ice_adv_lnk_speed_100000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/intel/ice/ice.ko: section mismatch in reference: ice_adv_lnk_speed_maps+0x110 (section: .data) -> ice_adv_lnk_speed_200000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x14 (section: .data) -> qed_mfw_ext_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x30 (section: .data) -> qed_mfw_ext_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x4c (section: .data) -> qed_mfw_ext_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x68 (section: .data) -> qed_mfw_ext_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0x84 (section: .data) -> qed_mfw_ext_50g_base_r (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0xa0 (section: .data) -> qed_mfw_ext_50g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0xbc (section: .data) -> qed_mfw_ext_100g_base_r2 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_ext_maps+0xd8 (section: .data) -> qed_mfw_ext_100g_base_r4 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x14 (section: .data) -> qed_mfw_legacy_1g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x30 (section: .data) -> qed_mfw_legacy_10g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x4c (section: .data) -> qed_mfw_legacy_20g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x68 (section: .data) -> qed_mfw_legacy_25g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0x84 (section: .data) -> qed_mfw_legacy_40g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0xa0 (section: .data) -> qed_mfw_legacy_50g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qed/qed.ko: section mismatch in reference: qed_mfw_legacy_maps+0xbc (section: .data) -> qed_mfw_legacy_bb_100g (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x14 (section: .data) -> qede_forced_speed_1000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x30 (section: .data) -> qede_forced_speed_10000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x4c (section: .data) -> qede_forced_speed_20000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x68 (section: .data) -> qede_forced_speed_25000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0x84 (section: .data) -> qede_forced_speed_40000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0xa0 (section: .data) -> qede_forced_speed_50000 (section: .init.rodata)
WARNING: modpost: drivers/net/ethernet/qlogic/qede/qede.ko: section mismatch in reference: qede_forced_speed_maps+0xbc (section: .data) -> qede_forced_speed_100000 (section: .init.rodata)
>> ERROR: modpost: net/ipv4/tcp_roccet.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
