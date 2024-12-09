Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243EE2AF1B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717118; cv=none; b=VikgFOylne1x6srwZ1WgktJLtmtm/JsmXR8uJwHE6nxgoS7shyYysd7Y4rCEIzKYBD/N2pkutcSeNOOgVCgBoXXY6cejLH1LbW7Fp7v/rA92pu0I1dM1jj2oBmHnCxTcUd2q9DyIhKXPMLc8aP0ERQv4xEoYKv3aGSRHhrnv+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717118; c=relaxed/simple;
	bh=E3ZvC3O2eZ9A0yzuZHGVlm2/05VOaS+KPtoBU2Cfenc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9O5LiKL6UQV0gwEmAEtT3JdPdALLX+07X8NoY+g2CqUQwjKgxGTeWep3wo6IEJANH/aUSjzPNFVhwkQslCdFIhW7fk6T2Tbw/oRajQfsYuiKqGE7DxYdtqLy+l13Hv5pTzFP2qlMvSArRIc8iIvoJX/MVm5feS5h0MyaoY9SFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXm/tprS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXm/tprS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717118; x=1765253118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3ZvC3O2eZ9A0yzuZHGVlm2/05VOaS+KPtoBU2Cfenc=;
  b=HXm/tprSEC24pOw25Y9ZIey2NL/J/IaDXKlF4E0oXRw9ze8k6IOY51u8
   oUIoiCDiEgbfgOKt0Oj3PNLGCEVJGQMkNICkPN3uaR5VjZY/YulXmrLob
   FhCK06LNN5SQWCfByCResLmBfCNwX3wB7j/7fmmdLzWPy+UbHtiBrfBmz
   LbszQmmrcIFi7ysNmLsltaCOGDbZkHfCO82qaE4nubm7v5Fi0LN8bT8Bk
   EbCg2hCCeR6A6Qg5sQ+rJU38nOJOqBVkEw+98xr3z4ms/4n6BTPDlng8H
   tyGVwPqCrS2XRN/30I2aWsCVebXfyTP/BsMmkf1eF9BMDkKzu5Pw2/A99
   g==;
X-CSE-ConnectionGUID: +htaBK5dRieOq3FM0DhDYQ==
X-CSE-MsgGUID: 8BZ3n7/4TViGLZw68fhTSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33923808"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33923808"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:05:08 -0800
X-CSE-ConnectionGUID: w3nAQ+5PSquIWdMR3H5efw==
X-CSE-MsgGUID: u3V0gI3gTH+lD4g+PwNdUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125793224"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Dec 2024 20:05:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV14-0003mk-0d;
	Mon, 09 Dec 2024 04:05:02 +0000
Date: Mon, 9 Dec 2024 12:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v6 4/4] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S20 (x1slte)
Message-ID: <202412071131.v9GOab0D-lkp@intel.com>
References: <20241206184609.2437-5-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206184609.2437-5-umer.uddin@mentallysanemainliners.org>

Hi Umer,

kernel test robot noticed the following build errors:

[auto build test ERROR on krzk/for-next]
[also build test ERROR on next-20241206]
[cannot apply to krzk-dt/for-next pinctrl-samsung/for-next krzk-mem-ctrl/for-next linus/master v6.13-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Umer-Uddin/dt-bindings-arm-samsung-samsung-boards-Add-bindings-for-SM-G981B-and-SM-G980F-board/20241207-024917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20241206184609.2437-5-umer.uddin%40mentallysanemainliners.org
patch subject: [PATCH v6 4/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
config: arm64-randconfig-002-20241207 (https://download.01.org/0day-ci/archive/20241207/202412071131.v9GOab0D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071131.v9GOab0D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071131.v9GOab0D-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/exynos/exynos990-x1slte.dts:9:10: fatal error: exynos990-hubble-common.dtsi: No such file or directory
       9 | #include "exynos990-hubble-common.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +9 arch/arm64/boot/dts/exynos/exynos990-x1slte.dts

   > 9	#include "exynos990-hubble-common.dtsi"
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
