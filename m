Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989A3B47F5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791389576; cv=none; b=J5EoyMY9yMv/uGpGup83I3an1EI2Gs3mhMnWvJr6I3/kVMlUkz9fe978skU291HzMJ0fEVjmqA5v1iJnWwBpkr7DFFb7yB4ddRhqAvW0cAGXIA2CdguFmYJ6ehkWKvD/HMUbzsw3UEMaRLgW8iLdLGI4PoLZ0xj9Q1YE+jL0cAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791389576; c=relaxed/simple;
	bh=JY6h5+ru0o+OD7F2FVKaL6hwN/c70eEvqGSZuO9aYyU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XMEylgAApQgh4wDh97zs/l9rOkS3u+zFfM/zsYZDKdtxT2nEZnJT1lRpTDG0l/n/9Pbg49kVAi0+F2QplF8tiGpJHwOe9pXaF6+M4e7MhusQ7goTT9h6E2iAK7g154Yx1IBf7N4ajnlzZIlrpYdwjLTNRk91uMnQL/QLWR/156E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWaOy0oH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWaOy0oH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791389574; x=1822925574;
  h=date:from:to:cc:subject:message-id;
  bh=JY6h5+ru0o+OD7F2FVKaL6hwN/c70eEvqGSZuO9aYyU=;
  b=UWaOy0oHqAfLw/OYRgmTeMX0IyCaXOuXvclCOQsC1VgWVW3orf0TjV7e
   Y3Ot/64VM4nYTKWp3ZyRJ/oETsOyTD2OfG0VtmVrz9KW5C8GmNtG+OPi4
   2WGMufm54a6W2KpHUxOFRs7QClwZ6z4b3GNxGJNb7kPDUQsVEYtZDdfuv
   bWHKA8XmoD7aiMF+l6s4vJYjAWXu4HzqEhI70uU3TRQnCWOHemzaIo9So
   K4rQkwBc+yBNoVI7bdvoEAOdqFShJdzEj2ng8p3wA2bq2BiLByHQxUdfc
   Rw5D4y1KFHDyndrkvqG/qOeT0YvyAPxN6YBC74u9apyhLCzGgChfOr8Q+
   A==;
X-CSE-ConnectionGUID: iuXkueJLSn251Dcisgd48g==
X-CSE-MsgGUID: uGJu2n1dROupGRbp0BJ7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="155123"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="155123"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 09:12:53 -0700
X-CSE-ConnectionGUID: K9UpjhGtSv22H3o0zEqWSg==
X-CSE-MsgGUID: TLwt6sCOS8+tecT2D3SLWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="216400"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Oct 2026 09:12:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEUG9-000000003FC-4AS6;
	Wed, 07 Oct 2026 16:12:49 +0000
Date: Thu, 08 Oct 2026 00:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-rc 153/153] ERROR: modpost:
 drivers/net/pcs/pcs-mtk-usxgmii.ko: symbol 'mtk_xfi_tphy_valid_ctle'
 undefined!
Message-ID: <202610080045.yMqQf2ln-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rc
head:   32b3bd5458be1657056f9852b0b309f73b65a4d7
commit: 769cea6dc4204ef3e43ac347d91ae9ef74f81b1d [153/153] net: pcs: mtk-usxgmii: check link status and phy ctle before reset
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261008/202610080045.yMqQf2ln-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 80cd965b6323b208519f8ab1d5ee86e4ea9862f4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080045.yMqQf2ln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080045.yMqQf2ln-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/clk/mediatek/clk-mt7987-apmixed.ko: missing MODULE_DESCRIPTION()
WARNING: modpost: drivers/clk/mediatek/clk-mt7987-topckgen.ko: missing MODULE_DESCRIPTION()
WARNING: modpost: drivers/clk/mediatek/clk-mt7987-infracfg.ko: missing MODULE_DESCRIPTION()
WARNING: modpost: drivers/clk/mediatek/clk-mt7987-mcusys.ko: missing MODULE_DESCRIPTION()
>> ERROR: modpost: drivers/net/pcs/pcs-mtk-usxgmii.ko: symbol 'mtk_xfi_tphy_valid_ctle' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
