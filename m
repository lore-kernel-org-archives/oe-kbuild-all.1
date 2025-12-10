Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB3A182D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 00:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765324940; cv=none; b=ATJAuM81TTXgmFgG16d3F2KCYdia2XaPTUyHbBfBWnwb9sFooNXVk+Rtg2KNLwHknqcHg+0KwaWQLf3cTGFs4AA22Z1F0xvyjAldBM6QU/NS0oEhKifxQX2hSR9ZNKjipcAdFz4ixEdpRnqWRl1IYyPYejmwql6NNjHsE78FJ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765324940; c=relaxed/simple;
	bh=DqhMn1ggCmoabglSeGRqvda/NrKLjj6td7x595wZhgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5VC8O6yAJjdBHSaQGU35RrEc/lb/cf9ObhZUqToaXLa9IAYn1tSiBDI9BjCGXhGo7jQXW/pLCvBUvTJocgqvGDFUbquWxJcX/5Y18JFNUhEceMGw4tspeFuewVvuvJJeeezsxBYTPdFYKR4moXiZNbjlCjhOwH5bsnA9dpJHC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AiykeBaa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AiykeBaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765324938; x=1796860938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DqhMn1ggCmoabglSeGRqvda/NrKLjj6td7x595wZhgU=;
  b=AiykeBaav5wJOHe11KpJgQpleAEADBFR8hJ4pFmgqdyDXZTCAQPNx0RC
   l0cgY786FtX2rimgDQViy8rVNExUzw4fImUwCW5tiYK8TETwFTeFPvRir
   9LkCgqKyc24WlGVSHNhLG53v5euYsqiBb/xW8NQSnbHotqE6DuZ2QBNNY
   j8lzExAp5X7bBCflyPLrGck/9AR/Ox2FNbPVyg5B9uVuFjKV5e/gYwa9A
   dW+Ov0PEw1bogBkuqidtBZMSJRWdb8IS0N6hlHBvmAcFz32dle/pq2oQA
   jMwp2w7MIJCgi8PS3j8KjhGTX1tUUe3JQVoToYUSvCL6OWPTFA2TVrnhr
   A==;
X-CSE-ConnectionGUID: c65OAa+pTmGCceVU1k3vTg==
X-CSE-MsgGUID: 7u20MuRIRcm4T7IvIZMkBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77982035"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="77982035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 16:02:17 -0800
X-CSE-ConnectionGUID: WX/VGAxuTGGwdTJcXtLSIg==
X-CSE-MsgGUID: A7TpG9NzQEej+cdx5ji92g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196267137"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2025 16:02:15 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT7en-000000000RB-1vME;
	Wed, 10 Dec 2025 00:02:13 +0000
Date: Wed, 10 Dec 2025 01:01:14 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Chang <jeff_chang@richtek.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for OF_GPIO when
 selected by REGULATOR_RT5133
Message-ID: <202512100142.lHmIE6YU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d588a1140b9ae211581a7a154d0b806d8cd8238
commit: 714165e1c4b0d5b8c6d095fe07f65e6e7047aaeb regulator: rt5133: Add RT5133 PMIC regulator Support
date:   4 months ago
config: um-kismet-CONFIG_OF_GPIO-CONFIG_REGULATOR_RT5133-0-0 (https://download.01.org/0day-ci/archive/20251210/202512100142.lHmIE6YU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512100142.lHmIE6YU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100142.lHmIE6YU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_GPIO when selected by REGULATOR_RT5133
   WARNING: unmet direct dependencies detected for OF_GPIO
     Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
     Selected by [y]:
     - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
