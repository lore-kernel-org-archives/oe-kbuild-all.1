Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E79176ADE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731933873; cv=none; b=Dcw5sDu+XvH1fePXG5PWfoopV9mwMPXVPOZNZPrTvJqG9tiA40Fr6eU3ArBaTuuPsYVpgiDOivIaecYdjnnGeSNAmZc10nKTGvqt1k3o80ZOljRPsQGsQTcrQEK9ehDPZKvwpQFLago+XXX1OSR47u/SOfFBF7L5tK00NJZS/zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731933873; c=relaxed/simple;
	bh=O3zU7SV0PtPWT6csinnVi6nxU4smm9kPUDCFgw5p+cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3wv/g1KlFRiQ9XRnpTyxxWk1EkZ45gPG1svUlbtjvuzbz1o7HJkV+Q3LUiGxPG0REUZOT9p6M0uSl5RKhlmtpi6sfUuFEok8hN/lVL8eQjOvjzas3PVCtH/ooYwyrQ51YFWsinvWAfmEAKTJ0mqectFVhp/g//Sw7y0BcOB0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D//KJv9a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D//KJv9a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731933871; x=1763469871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O3zU7SV0PtPWT6csinnVi6nxU4smm9kPUDCFgw5p+cQ=;
  b=D//KJv9asH69qKXhYCw9Rw6wvgDTW64uQHwdgxbuAplvA06AHI7pU8e/
   NoaoSlX1x+XHJOJl+a/MVxRTIt6RRwkUA968281JQTJy7d8o+GOecq+vL
   Yhe4SiVnuTdBUqzIHDChlw/+rojlZoFoMvjIr8S7DWSpUDz/RJNo+mHFz
   9vQVLVb0pILCM6rih6YkvP8WDU5ZYVECixgb7fcP417kszQEn3FKT3UGh
   xF40oVBaMeBpH/NmRP4ZZ/Ce9BjJp7h0JuO3EoD0LDQ+nyJ5Y6Ms9KUoR
   UZsr2hl5F2ihzI3HcR+WMscETkoj3ihxxzgKeD0W3/waiV9mO2xBWBa/x
   A==;
X-CSE-ConnectionGUID: lBdJfdGISbeYcW/V/OLnPA==
X-CSE-MsgGUID: Q+zNSiPlRO+Vges/Wy+iCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31262052"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31262052"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 04:44:30 -0800
X-CSE-ConnectionGUID: Jb2Vc8TVTlivh4ArviG0vg==
X-CSE-MsgGUID: NrY2cKqLTC2wZa3wq1ipIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="93291779"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2024 04:44:29 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD17C-0002Qb-2Y;
	Mon, 18 Nov 2024 12:44:26 +0000
Date: Mon, 18 Nov 2024 20:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 114/119]
 sound/soc/apple/macaudio.c:1508:30: sparse: sparse: symbol
 'macaudio_j316_cfg' was not declared. Should it be static?
Message-ID: <202411182017.IDxJPBFV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   a89c7c8788b938f7b52c6ca56449de45e92a056e
commit: b88fdf069d7fbd0fadeb4091af54768599ace1f0 [114/119] READ COMMIT MESSAGE! macaudio: Enable first round of models
config: sparc64-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241118/202411182017.IDxJPBFV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411182017.IDxJPBFV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411182017.IDxJPBFV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/apple/macaudio.c:1289:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1299:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1489:30: sparse: sparse: symbol 'macaudio_j180_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1492:30: sparse: sparse: symbol 'macaudio_j274_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1496:30: sparse: sparse: symbol 'macaudio_j293_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1500:30: sparse: sparse: symbol 'macaudio_j313_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1504:30: sparse: sparse: symbol 'macaudio_j314_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1508:30: sparse: sparse: symbol 'macaudio_j316_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1512:30: sparse: sparse: symbol 'macaudio_j37x_j47x_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1516:30: sparse: sparse: symbol 'macaudio_j413_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1520:30: sparse: sparse: symbol 'macaudio_j415_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1524:30: sparse: sparse: symbol 'macaudio_j45x_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1528:30: sparse: sparse: symbol 'macaudio_j493_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1532:30: sparse: sparse: symbol 'macaudio_fallback_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +/macaudio_j316_cfg +1508 sound/soc/apple/macaudio.c

  1507	
> 1508	struct macaudio_platform_cfg macaudio_j316_cfg = {
  1509		false,	AMP_SN012776,	SPKR_2W1T,	true,	15,	-20,
  1510	};
  1511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
