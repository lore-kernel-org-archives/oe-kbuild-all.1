Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E93918C002
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 11:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734177347; cv=none; b=LROL15JYEVyGfU6WLim19jGYu0ajNal804PNWXycjTYju2jZr/ySEb99mgpmMO8rQk6hYk1ZPb773RL6DCXKABLllihMeNkkKut8Vu5x5db614uZLLp2SVnhojNa7U6zVfwKiblcYKxTI2SiCmGR8W3hBRzjAlmitkF+6aCht38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734177347; c=relaxed/simple;
	bh=sh5ggzlwN6srYMX5ICXa3ED2LcKqi2tnrqTeUnFkRpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fC0QTf8FpOAl6O7Ha8mzy7Ch72sdJmqEA+FgZAfJu0k3a/xEmoOdye+FBAHc9Z5g9Ad0sqj3/Y+6JM1cHhwLcRJf4kDIsJIosoBFXs08fnRUTW9lpXXZkKa/oWdHPxTRukx7tk0osZ1/pVAf1/Odt863XA0nviMP9MRvEP0OTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P85szFsr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P85szFsr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734177346; x=1765713346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sh5ggzlwN6srYMX5ICXa3ED2LcKqi2tnrqTeUnFkRpw=;
  b=P85szFsrUYOf8Ez64kib435NCRjNclgVXHfKecPebv2IDSaNzv2ZZ2Rb
   exJJl3pS5i6EbkUFTUgJJ0U0/0ByG2FCiujrianKRJMZt8tWMzrqEiIF/
   uL9SU5TYXBxCeY7USfxWNA7EybXmG9nJ6z+rHFDeTxep8L+wl69r3ui/r
   pi0l8yE6ecyH/BZV56dtnUyylCA7fyzJR/oH/LD0RmcyuCk0VurYmYUxB
   6OxMMchJTwKZQeAUZZioY9KSljGOD4wCqiF6GRmPXq1eQIftJiFU85GTc
   ZCwL0SPd+xjAOCVt2XUfmBbAVqEFInRjbJ71AQLo5iMZ95wzIEU/R7zmC
   Q==;
X-CSE-ConnectionGUID: WLFykiUwSgi87fdWm38Z2A==
X-CSE-MsgGUID: EoZq6r8URUKUKwqM7BTpJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38308557"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="38308557"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 03:55:46 -0800
X-CSE-ConnectionGUID: Avws1216SYSRwne22lcaow==
X-CSE-MsgGUID: ZigdQtO6Rhm5zMfZehMvVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100925434"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Dec 2024 03:55:44 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMQkH-000CtP-1a;
	Sat, 14 Dec 2024 11:55:41 +0000
Date: Sat, 14 Dec 2024 19:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-misc:asoc-6.14 4/25] ERROR: modpost: "__get_user_bad"
 [sound/core/snd-compress.ko] undefined!
Message-ID: <202412141955.FBjr5T5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git asoc-6.14
head:   5ce3beed07b8145aff61f2cb41f1868f6221271f
commit: 24a01710f6271ec32b629d714e6a64a69665128b [4/25] ASoC: fsl_asrc_m2m: Add memory to memory function
config: arm-randconfig-001-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141955.FBjr5T5q-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141955.FBjr5T5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141955.FBjr5T5q-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__get_user_bad" [sound/core/snd-compress.ko] undefined!
WARNING: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
