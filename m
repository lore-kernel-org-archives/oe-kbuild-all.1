Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A2133CFC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 01:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734745424; cv=none; b=s17H0V8jOzJOoBLjpATpAImXPrS//t8M1nIcwFFdtCUJ3nfW6DVjKIKAaVo6J8TpiPF1xR0TZPp1f8mQOKGEiPFYzdl/ILCXii0VjlIQidB7V+E0v8We+MAxwPkbdizWw2yV416n+yEkByln4N4X2ERddGOlpn/LKb2V3bFC9HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734745424; c=relaxed/simple;
	bh=l9OB3WeZBCa7EjzzMv8qGnQJVG59xF8v5bFcZYOKStU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDY9s9q4+kzUTuzNgpzpSQ4IWOmbHzp3RsqZuBwL3ZGrdLdjfXf+OuYRdEmH3alGimIJVoEMrYDTJnrqgyd7qsPmI8qimoAMaTrTvysXi1nvhgTlitCG/pMOc8SbXA4xr8wabfcC8mU48e58tIFwTP0MeWlHNxFS9LK46PmkttI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTkMLZIs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTkMLZIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734745423; x=1766281423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l9OB3WeZBCa7EjzzMv8qGnQJVG59xF8v5bFcZYOKStU=;
  b=iTkMLZIsFfzAmV3ug8ymdu3tJtnzSL3aWCNHAozM7PFEn3DR0BcSFLRF
   bIKbCdKfPatQjwOeO1AaYb6i4AVTzXLqSTeF8KBsU5ZG83MGsadNfKvyq
   RUQ+DjwIAebikZy0x34MHXFYefdnAomgzwNH/CZH/qeURiFAjqUWGZ1ry
   chwM+INbrXRimBEPaWPKwdZlfldOg/ba0S1iroQLHVthvvtzG+Z/z55NL
   UNNdnYoFw1Prz8AyyDzuumew575TmnnXi+IhUnVDRIm53/eGraZuDQ9qI
   //51PTH2klyQV504lbBamfRvgl/wigGuCEtt0ody8ZtKCfYe5OICHlNAo
   A==;
X-CSE-ConnectionGUID: IOj3KgPXQFS3e4wQYzaLzw==
X-CSE-MsgGUID: KBZwWcZPQVybUEj17+SXhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38984751"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="38984751"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 17:43:42 -0800
X-CSE-ConnectionGUID: j88nWNy4ReCZE3bOsc1sBA==
X-CSE-MsgGUID: K+zc8JYvTzyh+eKzHL8GIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="103524778"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2024 17:43:39 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOoWn-0001qd-0D;
	Sat, 21 Dec 2024 01:43:37 +0000
Date: Sat, 21 Dec 2024 09:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: Crystal Guo <crystal.guo@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/2] memory/mediatek: Add an interface to get current DDR
 data rate
Message-ID: <202412210955.FvO0Pee3-lkp@intel.com>
References: <20241212090029.13692-2-crystal.guo@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212090029.13692-2-crystal.guo@mediatek.com>

Hi Crystal,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk-mem-ctrl/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Crystal-Guo/memory-mediatek-Add-an-interface-to-get-current-DDR-data-rate/20241212-170306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20241212090029.13692-2-crystal.guo%40mediatek.com
patch subject: [PATCH 1/2] memory/mediatek: Add an interface to get current DDR data rate
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241221/202412210955.FvO0Pee3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210955.FvO0Pee3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210955.FvO0Pee3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/memory/mediatek/mtk-dramc.c:300:19: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Wincompatible-pointer-types]
     300 |         .remove = dramc_remove,
         |                   ^~~~~~~~~~~~
   drivers/memory/mediatek/mtk-dramc.c:300:19: note: (near initialization for 'dramc_drv.<anonymous>.remove')


vim +300 drivers/memory/mediatek/mtk-dramc.c

   297	
   298	static struct platform_driver dramc_drv = {
   299		.probe = dramc_probe,
 > 300		.remove = dramc_remove,
   301		.driver = {
   302			.name = "dramc_drv",
   303			.owner = THIS_MODULE,
   304			.of_match_table = dramc_of_ids,
   305		},
   306	};
   307	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
