Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F950137923
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 13:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306859; cv=none; b=O5RA5WjJW0NoiBn4GEPzbmDpLazSHYP2L61PZvHv39lwAtpDNawM3BhgxSk9cWnzhDIdyxk+B0ZhHl+wt2KI1odWHDRz4j6OffHW7zDQsaA8i0R7lsGsq2N1rbdfU7CuK7GJNrGMcVbFoT38Xmu4e7YPOnd2RaNLsHQbLQT7OKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306859; c=relaxed/simple;
	bh=m2hoPe4gy/z/D+mSZW+ZLJeByhXbVD9rgfx3n154l1E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K9wx5ghVBWs5SwSffBbLBXt0HAKm+fyLloNmOeUhZIxQfFHjA+8HSiWzcrwgu1Z/or1QX/GKfQ2YpR9vIEOoYTGXl3lGwnh3aIzjhCikKrTmMBPF9Wc1+QmgT/GK7FI9+7AgOgUP3dW1m/xmfm44eXCsCwj9hPgVKs3iVa1XQks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A08DOQpc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A08DOQpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782306854; x=1813842854;
  h=date:from:to:cc:subject:message-id;
  bh=m2hoPe4gy/z/D+mSZW+ZLJeByhXbVD9rgfx3n154l1E=;
  b=A08DOQpcyLSFbteo0cArKfydA1rKu+49HI5tG08p492cL7uwvrb/VlBt
   0NfRECw4oDXRnz5fyFYFnS9uP0StTyGkJ1Bkup+v5jeBVp2YoOFcMEaw1
   NgcgaLOHjtsDDa306y502fNarHuC9eFyHEF0M+aGRPnAXL/yFP2C5UBUg
   9FxJNXXY+nCz16RGj6DJK7Zm7syddSJ85/cqgoCiHLncRYN24gTqRv2V9
   4EZM70Pl80C5nc5nxtiWfgjsMN9YINzHCYZUpCqluMD9sXl7ui84tH9an
   pDSH9aQhyXhNRnMFvmqML/WHndR9s3tsizjI/OUG0akIhHAAhMsBnXipf
   A==;
X-CSE-ConnectionGUID: betmU21KSiWucLZNskkbbg==
X-CSE-MsgGUID: zoZFDJxOQuu/pUY9AsGx2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100616087"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="100616087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 06:14:04 -0700
X-CSE-ConnectionGUID: 9aRsz0efQl2Mnw6ZCJty0w==
X-CSE-MsgGUID: jlTDxEPaTxmMzodyt8IWJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="254218283"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Jun 2026 06:14:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcNQT-000000003NV-29b4;
	Wed, 24 Jun 2026 13:13:58 +0000
Date: Wed, 24 Jun 2026 21:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-19 104/326] Warning:
 sound/soc/soc-devres.c:31 function parameter 'priv' not described in
 'devm_snd_soc_component_register5'
Message-ID: <202606242153.vIGrW6AT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-19
head:   885feafb1fe92b67450ae8ac4996368e3a6dd242
commit: 3f103eed0d2ffcbdd2f6d79426cd40bef638ef94 [104/326] ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
config: arm-tegra_defconfig (https://download.01.org/0day-ci/archive/20260624/202606242153.vIGrW6AT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606242153.vIGrW6AT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606242153.vIGrW6AT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: sound/soc/soc-devres.c:31 function parameter 'priv' not described in 'devm_snd_soc_component_register5'
>> Warning: sound/soc/soc-devres.c:31 expecting prototype for devm_snd_soc_component_register(). Prototype was for devm_snd_soc_component_register5() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
