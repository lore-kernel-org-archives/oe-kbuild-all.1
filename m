Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C4B13A3F3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713348135; cv=none; b=afelhOw0/ti8H+ex3voluCcM8fLYPa6Iv3G0gnUmyIZanbKd1M69C5rp1Sl2BOp+9ohtiD9GnZdsWhhMbf2qWEpX0OoWO3QxYyfdvRHi/Q2DRrcAKvzrgYO63zO35GcmZRBuEo5ro2L2OLKfi4/H6z65UrqKtg21ow+rgmvxJQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713348135; c=relaxed/simple;
	bh=j5QapwJgxI2kAVpWJ86KsfIFve70wOAB94QAKWyo+8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g19YLSu998+yuYFtZ5Q+xnBgPbzfAr5F7vftB0GJcvk3c/Fl+H68MqfBFijqLidZRBfSxQRVyqtYVyXbBV9Hr4GEN8rSxvh4DRVC0dbXFqPZ0PRHLbzjuH5OjQh4WctqBsj805wnrbBZ1AYYBly/ckL2hWMdGhFO+CXL4AREd6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dppc0cte; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dppc0cte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713348131; x=1744884131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j5QapwJgxI2kAVpWJ86KsfIFve70wOAB94QAKWyo+8s=;
  b=dppc0cteN8if9HbRe5NP9KuowqqK14Sb+xfME6S999OawsDvOrld4LYf
   B+0KGxKBtg5BEQ/hd06xqVz5uS+jVXiz0WzMsfM+OrMuQhcDvTJHgBCBE
   lGgGln0AW20yuIhYM16/PY8+Ite+cw8SLPb7YFES22+aVFh3fBAfO/V6R
   tix4epSJWGs6SCaHRMS9b8T5U5vdzYwmAy69qEbIsEprK97XSzZTkLMzk
   ABFchAYTqSjzklVlfHeup/5pwyFP0aUvACZdoFdO2Mc3L0YIrfQJiR8RM
   nVkasdFUaYU1tosOFzFhp6gS6TYH5y0YCtAFwmBzwk+xFdMXd3zADEBiU
   Q==;
X-CSE-ConnectionGUID: hRYV1Th2TduGoyGetngf0A==
X-CSE-MsgGUID: 3dxb5PSWR7mM50z/y9nxQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19977839"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="19977839"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 03:02:05 -0700
X-CSE-ConnectionGUID: SXGPqkptROK03BOFiHKbJw==
X-CSE-MsgGUID: V5WWlJZXTUq+1eW/WdLPQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="27013466"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2024 03:02:01 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx275-0006SX-15;
	Wed, 17 Apr 2024 10:01:59 +0000
Date: Wed, 17 Apr 2024 18:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-spi@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, broonie@kernel.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, nbd@nbd.name,
	john@phrozen.org, dd@embedd.com, catalin.marinas@arm.com,
	will@kernel.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v2 3/3] spi: airoha: add SPI-NAND Flash controller driver
Message-ID: <202404171712.GiwLsZEI-lkp@intel.com>
References: <25dd4334e3b37eaa628c20265841f251968c2b75.1713335916.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25dd4334e3b37eaa628c20265841f251968c2b75.1713335916.git.lorenzo@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240416]
[cannot apply to broonie-spi/for-next robh/for-next arm/for-next arm/fixes arm64/for-next/core kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v6.9-rc4 v6.9-rc3 v6.9-rc2 v6.9-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/dt-bindings-spi-airoha-Add-YAML-schema-for-SNFI-controller/20240417-144847
base:   next-20240416
patch link:    https://lore.kernel.org/r/25dd4334e3b37eaa628c20265841f251968c2b75.1713335916.git.lorenzo%40kernel.org
patch subject: [PATCH v2 3/3] spi: airoha: add SPI-NAND Flash controller driver
reproduce: (https://download.01.org/0day-ci/archive/20240417/202404171712.GiwLsZEI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171712.GiwLsZEI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/spi/airoha,spi-airoha-snfi.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
