Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8AC2309B3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 23:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752536442; cv=none; b=XNR4Xg/Vei5FxNsEvo2HHpypn3UnhmlgW2Gyagr9q0L6dvR4MF0T9r/RsA6u902rFfn9Pf6vxIEl+slRTU3whmS1afCXn8WNaWXwT8syKqm+h45907unZsbktHD7ESpd4RUg9bZ4dTQfyIWM/MpYMPLCd5lqB8GouWd+Tax8nCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752536442; c=relaxed/simple;
	bh=FoRjAb1eVjuFF1Ornq1aA/FmrK6LeXaa5iGVabwaD+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bchnvq6Degc9+Zv5/zLVuSF3tQ+nlujMN6vpf0xDBcwhWPI4GCPjgpLAZPrLqf3DTX4IZ2G7Unrh8g/wa4WyyG+jZjuVd15Of0FrLXcER3ZTg5o2/eMcEqX+Q3WELOuBLLEh2h4/j4smeylTg6yL5jeOimujl/5e1wTxbi3ERHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEDgbNIv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEDgbNIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752536440; x=1784072440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FoRjAb1eVjuFF1Ornq1aA/FmrK6LeXaa5iGVabwaD+g=;
  b=kEDgbNIv5Qkr6ng3p9o1Qz0mRYmZSmJrwhFheNzS6R18tAS6ql850MUk
   MujW8GM/+1mKNhZnc7MtnykOe2pqpYggmHGRe8j8OEwR4cJpCRGc/TixN
   jkJre9s8jD1rNXjki45F6C4ZDPmkNTwPGBuOjWnTWJ2bzacF6CgmmsJPE
   i+4BCio/myKhynZyuwtF8ckkeu2KRWR1mvYrTcnHrjZDXqsq2meBw8420
   1qpL587XeWhJmKHhFMBFnlBkp7+/yCgPQIWBgPaypU+Nps0RkJZfJuvqT
   npNfdNodT9JmEooO2wPTfKUC/MnayYhEwgICdhL5y7aV6oWTK3c6KoGiX
   Q==;
X-CSE-ConnectionGUID: L4GmgAlHT+ekJe6W6cQRTQ==
X-CSE-MsgGUID: ecagf6nkRZOh8fA/jl+Frw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54449213"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="54449213"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 16:40:38 -0700
X-CSE-ConnectionGUID: e0EpCsPUSwmuIfyqe/qgnA==
X-CSE-MsgGUID: mzObt9EATniWvBr09SukUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157781824"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jul 2025 16:40:37 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubSmg-0009Rr-2E;
	Mon, 14 Jul 2025 23:40:34 +0000
Date: Tue, 15 Jul 2025 07:39:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Weili Qian <qianweili@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2512/2512] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_DRBG_CTR when selected by
 CRYPTO_DEV_HISI_TRNG
Message-ID: <202507150723.SAa7Ty5b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   83b79525e1b864357a25073f671a320c4be5a5b5
commit: e623afb45e58ded6b45cc4f0ac6c19b3736c96f9 [2512/2512] crypto: hisilicon/trng - support to obtain random numbers from soft algorithm
config: arm64-kismet-CONFIG_CRYPTO_DRBG_CTR-CONFIG_CRYPTO_DEV_HISI_TRNG-0-0 (https://download.01.org/0day-ci/archive/20250715/202507150723.SAa7Ty5b-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250715/202507150723.SAa7Ty5b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150723.SAa7Ty5b-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_DRBG_CTR when selected by CRYPTO_DEV_HISI_TRNG
   WARNING: unmet direct dependencies detected for CRYPTO_DRBG_CTR
     Depends on [n]: CRYPTO [=y] && CRYPTO_DRBG_MENU [=n]
     Selected by [y]:
     - CRYPTO_DEV_HISI_TRNG [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
