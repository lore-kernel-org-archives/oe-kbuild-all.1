Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9AD33F9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732955588; cv=none; b=Sd5Ql1D40iUAIj7y5H/knZS/Xgwv6fdZ8kwjo55topU83zL0lRvtU3iqPz+Co1sPPAzZFcAzFsrQZpXzQ7JZzQOY4Cu3OfOsZG79cwyZGfLW/8rJeYJt9d0xlEhLVyT0Lj5AcWNKea1F0K7kWqsGMDW4m5rWHE7FQhrGrDBeaCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732955588; c=relaxed/simple;
	bh=SfrzAh77wGXbYRjzFw20yTowoUdty9XNRO8jpH2Sxlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmIIo8C8lnPvncQTHXBT7VX4UQ6xKiUB356D/GqgUg+SPkF88FRybkvZPpxpcqMvPqX7cVWOxDOiCI5h0Hmhf77//mfgzQvhP2R+cA7/m15cLoKe8tiF9/KyZsLnVG4R43wNtXx4BVvKwOeCjcw8402RahqrCZIWomiY9i43yGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5F1vmbN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5F1vmbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732955586; x=1764491586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SfrzAh77wGXbYRjzFw20yTowoUdty9XNRO8jpH2Sxlo=;
  b=B5F1vmbN+7ruC11RDOcU8LcHMfW0ElWfZZe2IhkYhX/4PXSTTI4P8cci
   IcQ4OIJquqhwziWFonkNlxuLS1Hb8LsqYQ2Qpj82hcwdAO/XIjm5fOUUG
   xxC3h5Isb4ihYYPFK2+8GzWA4jd+fYwg/z9b3RJpXsDqgxg/jOGi71RPy
   zHV2Yh+JT2U9tLXGeinzx78hE5PxPkGeBF/SDhJX+zaSzsldbaovUE2W8
   xJfqX/r/qrTef+GvOzu0NmEqvIxQIhaqxn2YTUSUb9izmoTezea3U7yzw
   Uv6wVqye5VIH3NjvV+4WGikANAbbksG08CNu3NlB2wRX8JD/RskjOZ86t
   w==;
X-CSE-ConnectionGUID: f/CiWelRToWX71fZJvAFIQ==
X-CSE-MsgGUID: uG42W1ywTOOwCY44Jj5FmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="44554755"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="44554755"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 00:33:05 -0800
X-CSE-ConnectionGUID: gdI4mJQ+QZO+DTY+WYj4fg==
X-CSE-MsgGUID: KKWUhWzOSASUJU0KaRey4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="97766387"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Nov 2024 00:33:04 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHIuT-0000QF-2z;
	Sat, 30 Nov 2024 08:33:01 +0000
Date: Sat, 30 Nov 2024 16:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 114/119]
 sound/soc/apple/macaudio.c:1508:30: sparse: sparse: symbol
 'macaudio_j316_cfg' was not declared. Should it be static?
Message-ID: <202411301633.o4NSfSqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   070347d4a0876921be5b0bbc11fff848c2ed3e59
commit: b88fdf069d7fbd0fadeb4091af54768599ace1f0 [114/119] READ COMMIT MESSAGE! macaudio: Enable first round of models
config: sparc64-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241130/202411301633.o4NSfSqR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241130/202411301633.o4NSfSqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301633.o4NSfSqR-lkp@intel.com/

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
