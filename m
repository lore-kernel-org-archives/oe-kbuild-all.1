Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1CD1B80F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 02:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719540860; cv=none; b=AU2sYeEngQwVZ0FyJgzmNDpeIXvjp8ZInFOeSjZHpWAkuCtkFVle39WIC0alYgywtCVnivlpSXgsRM/cg0jTMAGu6qhk7vqzPMF3d53GAdqp4Nz2Ij1C/dd/2IElSZK/Sqofk5m3o57PcFeetBWwYEZ6FJmvSa2LPzLF0reAAQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719540860; c=relaxed/simple;
	bh=qRdHRD9HTB4U9n62DbQovrhamYXj4ymf6CH5wF3eqlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WB/ZWaiPpW3S2j9SzZXaELuzkZJ+1SPog13PEyDifNiSdxzHGorYa45PyuU5afMn2pz8Dim2tqNEmS5wlXOodI2CS1ixLEUwuQghFYln3Zj+ya3Rs4rODb6PwYUfoBbImK2UAFq7+PTvi2rPkNbimC/aJjIWCuXz7ce192igRgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+bUTZL4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+bUTZL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719540859; x=1751076859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qRdHRD9HTB4U9n62DbQovrhamYXj4ymf6CH5wF3eqlw=;
  b=i+bUTZL4qyrndrO+mvAlfzADbjjPVOSZveEUCNdLC5Du+/mUHZgcvGmU
   eOaSe9Cq/cV1ixRbjwgNsIJkLafPKS9pcYhsPTaulSAEQ9R3lyQx82BkZ
   u1JnWgT1WdcMt9KlbrrHHmTSqCxWsmbDozAn9TaP/gjU6UM08LC5mgp92
   Jd5C3gZ1JiFPD+MIlixdKLyhBV4F7/Eb/KKquGb9TKwSB8Smpd9IqMZd9
   HlfbmWya00xwbAIYommEkjFz3lVbVg4YA/ELKk0nsGujL9kHFozWyZpHZ
   g15zZIiO7ObKiN5hjDEr9R877lvcTkqeWAk4LowXp3tdY+WmcApQel0xp
   w==;
X-CSE-ConnectionGUID: ihi15dlOQt6uokEwi14+rQ==
X-CSE-MsgGUID: 3e+yqL6USwuIVEs62l5H5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="39226352"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="39226352"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 19:14:19 -0700
X-CSE-ConnectionGUID: hXaE1l1NTiu3mt2ujLzInw==
X-CSE-MsgGUID: 7xTySdsDSHuwRxmubzKEhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="49497277"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2024 19:14:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN17v-000Giq-1b;
	Fri, 28 Jun 2024 02:14:15 +0000
Date: Fri, 28 Jun 2024 10:13:15 +0800
From: kernel test robot <lkp@intel.com>
To: Esteban Blanc <eblanc@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/5] dt-bindings: iio: adc: add ADI ad4030 and ad4630
Message-ID: <202406281018.rHMeGwPm-lkp@intel.com>
References: <20240627-eblanc-ad4630_v1-v1-1-fdc0610c23b0@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-eblanc-ad4630_v1-v1-1-fdc0610c23b0@baylibre.com>

Hi Esteban,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 07d4d0bb4a8ddcc463ed599b22f510d5926c2495]

url:    https://github.com/intel-lab-lkp/linux/commits/Esteban-Blanc/dt-bindings-iio-adc-add-ADI-ad4030-and-ad4630/20240628-081907
base:   07d4d0bb4a8ddcc463ed599b22f510d5926c2495
patch link:    https://lore.kernel.org/r/20240627-eblanc-ad4630_v1-v1-1-fdc0610c23b0%40baylibre.com
patch subject: [PATCH RFC 1/5] dt-bindings: iio: adc: add ADI ad4030 and ad4630
reproduce: (https://download.01.org/0day-ci/archive/20240628/202406281018.rHMeGwPm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281018.rHMeGwPm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/iio/adc/adi,ad4630.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
