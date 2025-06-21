Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81941E833C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Jun 2025 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750507852; cv=none; b=glzPxkBxA/0Ba5mLC0D2eqqTndDWwdDLP4sXKPddw1W0rJSyMdJ8aQnsbRL80ntVQCMq3t24MTeWrOZuXnU4d07dHilxStFacRIDdiLcIKMnL94io9H4BOTLPRsKyivqyXgPWIGYrQhcQEwtMAaA14vT8xLZUIKuljx88u3ng5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750507852; c=relaxed/simple;
	bh=QVWAMK3eHc/WqFCLOQL6M2hP9vZNiFL/tTUUsyoP2kw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fbm5QVLN9pLTqVp85+M6QfYkeF/IVcCpLz3cG6gISMq7/FWmuwIVQZt8LjXg8BX52a4nipm48fTi5TqOiApp7OaTZrdpaSAyc0GVUQnqAJR3TLt9PFSsOZRbgFylAUgDFyzpfn1qVuD+P7yIKF1NsI2DLm6vJ5mqtuPV2nJqLyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzmBjZVy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzmBjZVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750507851; x=1782043851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QVWAMK3eHc/WqFCLOQL6M2hP9vZNiFL/tTUUsyoP2kw=;
  b=TzmBjZVy2q2Gzni1dr7Asqk9XkD2dJ6GBkH18HnRAVB2gA75FpBUe465
   WVm7zsYPgeQESjt1dqGnN72DXA8emqTOIUoMijnR/EijzLRSPAuc+8eF2
   d92T2knZrrUJmN+3dsWqSP6r/PtIs1eUVYY0r2WzGIIwG4RBtZ441Tal9
   JL00KeJfqAXHpOK93C9kBAWC5p0oxOpUkJnm1LtqM1WYQPCsm9v5C+1Ap
   XyZkmSgA0Ner4ZKUcAJVUiWV+l0Cc9Ykzgzx5m9MrQ8zcqAviRX20exUm
   Ll4SLOxQ8uMnR0v7xX14Kq21NmrG/EiWpWyOEwP04fZoW+lua9kGPgsVl
   A==;
X-CSE-ConnectionGUID: kYdAyhVGT5eIj1HhiL6zZg==
X-CSE-MsgGUID: h1dqrDiKRkup6H22cx0iaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="78163047"
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="78163047"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 05:10:50 -0700
X-CSE-ConnectionGUID: wq9FGrlhR5C/jrGpYrmqOg==
X-CSE-MsgGUID: fi5nHV68RFCnboK/fnvymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,254,1744095600"; 
   d="scan'208";a="155699203"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jun 2025 05:10:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSx3W-000Mbu-0t;
	Sat, 21 Jun 2025 12:10:46 +0000
Date: Sat, 21 Jun 2025 20:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 3068/4336] undefined reference to
 `pinconf_generic_dt_node_to_map'
Message-ID: <202506212021.deAhuaWr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5d4809e25903ab8e74034c1f23c787fd26d52934
commit: 1982621decaf788d0611fc291fe89b297b6e5510 [3068/4336] pinctrl: Allow compile testing for K210, TB10X and ZYNQ
config: alpha-randconfig-r132-20250621 (https://download.01.org/0day-ci/archive/20250621/202506212021.deAhuaWr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250621/202506212021.deAhuaWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506212021.deAhuaWr-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/pinctrl/pinctrl-zynq.o: in function `pinconf_generic_dt_node_to_map_all':
>> (.text+0x7f8): undefined reference to `pinconf_generic_dt_node_to_map'
>> alpha-linux-ld: (.text+0x804): undefined reference to `pinconf_generic_dt_node_to_map'

sparse warnings: (new ones prefixed by >>)
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *base @@     got void [noderef] __iomem * @@
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse:     expected void *base
   drivers/pinctrl/pinctrl-tb10x.c:770:21: sparse:     got void [noderef] __iomem *
>> drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     expected void const [noderef] __iomem *
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     expected void [noderef] __iomem *
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     expected void const [noderef] __iomem *
   drivers/pinctrl/pinctrl-tb10x.c:502:30: sparse:     got void *base
>> drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     expected void [noderef] __iomem *
   drivers/pinctrl/pinctrl-tb10x.c:504:30: sparse:     got void *base
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void *base @@
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse:     expected void const [noderef] __iomem *
   drivers/pinctrl/pinctrl-tb10x.c:511:31: sparse:     got void *base

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
