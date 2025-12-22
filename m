Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070772DCF41
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766413344; cv=none; b=Im5HnNk1Nb8yARjXOh1OfwBYdPJ3D9bGGedzxtaVJMPhY0PHykRJ1ar9h8q6YfCZN+JCNUNz70X/iqhHG73+X59BNc7zFf2HdsSClEz/puPwYGPGEa3Xy9Sf4T61avkL3DQB/AjDsrch5xqnMNm8p0TxLMddk+QQ5mtKRg1x4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766413344; c=relaxed/simple;
	bh=V9xzsJAwwzLLlWF6RSr0vOXifFLKVXky7XnyrOdraEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdsbY7d60m0GOm3oqw+tc03by98r823LZOb8yO7zg9yqZFyFu0akKOs8rfqEjHwDFPGAe9tb1mevJMA7Zxrqy0883/4q82bkm0pGHWqv/QMFZ8ItXKfPd5evhytT1/P0SCbpx6D7w5sS8Ac7V5rHDEGkOwrY/7L1sKNxn9BkiPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfTr31Uk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfTr31Uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766413343; x=1797949343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V9xzsJAwwzLLlWF6RSr0vOXifFLKVXky7XnyrOdraEo=;
  b=AfTr31UkHcM+FfbefF4qvk87WTCvqcyMc0LYqlo7YH+g+2SNx7c6HhcW
   9lcl4wMEe3E3EB8ZmWG8lqlCUnJejBnsYqOsgBB0W9+YRktnK1L3qexwA
   xAeMqpKMpr9DpbH1oyqY5+EkJs3kbgGsbV8Jroq7rFtTXrtFC5vwxN4q3
   m2GW75twdZ5sOzYX4wf07SsAhRojZZHttkcw+iMUCafk1F19TE4lav6c0
   Drmzj05eTsqRN/13faQ4JeN4EU9JktrJ6qylw/IcNfU3ad5hihfhbknKr
   cvBVRAbs5BtCmi2i75NSSbgBhn24MvoZd+aZVGO+gKSrwiIISUAUQ0Ma4
   Q==;
X-CSE-ConnectionGUID: r+oAkiRxSGSganBy9kdcTg==
X-CSE-MsgGUID: 82SUSK+tQUSUoge2m3LA6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79720560"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="79720560"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:22:22 -0800
X-CSE-ConnectionGUID: Ff0n0nZTSGSPjHUy+YIhpw==
X-CSE-MsgGUID: gApfS5p8RXW+uq+DrE5enA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="204483630"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 22 Dec 2025 06:22:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXgni-000000005VK-06wf;
	Mon, 22 Dec 2025 14:22:18 +0000
Date: Mon, 22 Dec 2025 15:21:42 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v12 2/2] iio: magnetometer: Add mmc5633 sensor
Message-ID: <202512221527.EgYuXXlm-lkp@intel.com>
References: <20251215-i3c_ddr-v12-2-1ae31225b4d9@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-i3c_ddr-v12-2-1ae31225b4d9@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-trivial-devices-add-MEMSIC-3-axis-magnetometer/20251216-010451
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251215-i3c_ddr-v12-2-1ae31225b4d9%40nxp.com
patch subject: [PATCH v12 2/2] iio: magnetometer: Add mmc5633 sensor
config: hexagon-kismet-CONFIG_REGMAP_I3C-CONFIG_MMC5633-0-0 (https://download.01.org/0day-ci/archive/20251222/202512221527.EgYuXXlm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221527.EgYuXXlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221527.EgYuXXlm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REGMAP_I3C when selected by MMC5633
   WARNING: unmet direct dependencies detected for REGMAP_I3C
     Depends on [n]: I3C [=n]
     Selected by [y]:
     - MMC5633 [=y] && IIO [=y] && (I2C [=y] || I3C [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
