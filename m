Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987BA1EA90
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 19:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747509793; cv=none; b=cJczX7S6eHd3apiIGaXJQXKuyrhH+OphwaBPpPowX6iIKqpY84hTPANg6A7Vo+yvcWTP5Bimtevx7qBTnfdTSjyXeDQSagPvUcTozS9tvWyH72sGJXigRb4tV+ONs2icAipbdMb9xrpcWEEmuPDXobi3/PHW3FppckEh2awuf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747509793; c=relaxed/simple;
	bh=hROtVqvgqF+EBTAzsDXJ7fegzHHYUxf3xoPt1vStWeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MMo0gAIBd9iCchDIyxGJ3yYk6hDkaZShK55FmOGkVKQbbXal0v+FDVLujKfobyLQW0ttUKktu8QOSJSIXF2Hx+HpxN7LFXh4iEo62YVkozV5Qv5Wf6M8QiwYNfJqZzBtSalbDKELYJkhvjBz9Z5cmtkk1r7gz4GPrhPO0ZFDvoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHrMP6mp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHrMP6mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747509791; x=1779045791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hROtVqvgqF+EBTAzsDXJ7fegzHHYUxf3xoPt1vStWeg=;
  b=bHrMP6mpyyB2CqjaRAUn+Ici0G+r9kXfjAyE5luIc5fyyX51nrbYSYRp
   2uWeMHXiq76WKsOIgnvnuJnx++4coqfho8ng2MKkZOR4744YpP7PuvJ2R
   9fSZipSfFxBdqXFEzJaTVghTrRfRsneA/f8gcIAtaVU/3gkgJWCjGhNX3
   B3XwUETKa4kq+UwU8pSZvKZ0mOqjdg4r6Itewiz6VBX+ik7JtTgI3VEUQ
   ZhwQ/8N5+I3dTUEjnNY0N5E8XT9cMtYsJarB+2vuXVeVJn+FTKrEcw6ut
   zbAi+cV+kqPF7T4WQzo6j2wSDuc+38i644tro+A0uHZBOZXiPIPTHIhZ8
   Q==;
X-CSE-ConnectionGUID: aqXcP3frTHKnqME4Dtk5UA==
X-CSE-MsgGUID: 4ewEvsUdTQaPW0gtQmj3Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60485448"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="60485448"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 12:23:11 -0700
X-CSE-ConnectionGUID: HhfTzJnAScGUPAYwtF+9Iw==
X-CSE-MsgGUID: OGk8+RMKSBGhQZ0uSqv/yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="139516250"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2025 12:23:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGN7j-000KNX-37;
	Sat, 17 May 2025 19:23:07 +0000
Date: Sun, 18 May 2025 03:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1640/1640] kismet: WARNING: unmet
 direct dependencies detected for UACCE when selected by CRYPTO_DEV_HISI_QM
Message-ID: <202505180330.wT5fsdK9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9f24885126c03082a677c4d607a2e3502781c858
commit: c89f49b5f6b23b319f338f7e9e7e9b077ec8f5ff [1640/1640] crypto: hisilicon delete invlaid api and config
config: arm64-kismet-CONFIG_UACCE-CONFIG_CRYPTO_DEV_HISI_QM-0-0 (https://download.01.org/0day-ci/archive/20250518/202505180330.wT5fsdK9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250518/202505180330.wT5fsdK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180330.wT5fsdK9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for UACCE when selected by CRYPTO_DEV_HISI_QM
   WARNING: unmet direct dependencies detected for PINCTRL_EXYNOS
     Depends on [n]: PINCTRL [=y] && OF [=y] && GPIOLIB [=n] && (ARCH_EXYNOS [=y] || ARCH_S5PV210)
     Selected by [y]:
     - ARCH_EXYNOS [=y]
   
   WARNING: unmet direct dependencies detected for UACCE
     Depends on [n]: IOMMU_API [=n]
     Selected by [y]:
     - CRYPTO_DEV_HISI_QM [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
