Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CDA1DFEF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Mar 2024 20:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711226359; cv=none; b=a5UImwm8j090eoceIRizygMx3Eddaifcchds6idm5krU4LABlkylTXiO1vYa1tGsGP00CaHj3W42W+1QdgxyD7SCr9KMqZLJ4IM2kf6cqOMCz35hw//H1tFSj143Vl8bS3vh1bKa9tkeHrfpi3GOBUC0Lx3DtAp3nainrVtr7L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711226359; c=relaxed/simple;
	bh=gOL+PAsgYiNI15/W22l27PdytPI0/m2kt+zHs8oEr+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kidj4Ju7AeusvwUW2Berz6AYlmggoRZ67u6rWVj8Gasgot16tXT9/aTh8RA68nolZhquzAddXAA1A33Jd0pOIdmn6dF2TiFMO/DcPShdnWKFnXLgamGsFnxcnmkMuWZLDYtH7ZyOYbGOdgDuIGdYf2kXGa1iSeeowBg9Vtmth/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrK5nNS9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrK5nNS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711226357; x=1742762357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gOL+PAsgYiNI15/W22l27PdytPI0/m2kt+zHs8oEr+g=;
  b=WrK5nNS9ZK+4DUnBGBV1WPNXv+jPGg5Yo7yknIzYXrShfchRu2/g3bTs
   WBHB3xe9xu1g0/rrtyZrcvtdFDbK7cnREynMV8cYRVuefAAX4R4nl2txM
   XcxbRYwRnkBMUV9Qde+w9EVj64R9vB9KGYNGpfZun+cw4OkkjnXokLbes
   Dx9QvRpydKSHhKCm26umEoHhwCEtV2qzw9D3QekcX646HnPH5ZJ9MbXe0
   hM08EAvBskjbWxTGMiZ9N/JOB1wjReqherYPeXL686sELGtc/l8e3fr3S
   kLRKRz+zLJfB5D9VMrKNMGGl9V0IuBfri1axNVzv/2mbktYVrCQgpV4sN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6449325"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="6449325"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 13:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15125583"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Mar 2024 13:39:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro893-000LSB-0M;
	Sat, 23 Mar 2024 20:39:13 +0000
Date: Sun, 24 Mar 2024 04:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko]
 undefined!
Message-ID: <202403240422.Abh1O9vI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   484193fecd2b6349a6fd1554d306aec646ae1a6a
commit: fc93a4cdce1db7568fcdff608924324f5754efe5 kbuild: make *.mod not depend on *.o
date:   1 year, 11 months ago
config: sh-randconfig-002-20240323 (https://download.01.org/0day-ci/archive/20240324/202403240422.Abh1O9vI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403240422.Abh1O9vI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403240422.Abh1O9vI-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/iio/afe/iio-rescale.o
>> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
