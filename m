Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273738FA3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Aug 2025 01:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756604820; cv=none; b=ezg3VLM+ZyMQZNLUGrOF4FgDXK675jSHFc6HBS/TcjCANu4P0zqn4HZazaX4KjctJVtn/QeF7NDn3YUeBlpssoNXB5J6X4A1UruaAyWUtHRW1+LawB9W9AdLNzEL8mWVY84Fq8YX7DKl7oDarbaB17WX4oajNhoRqfzISO8MRQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756604820; c=relaxed/simple;
	bh=evjB2bgkaylmzbNeupVNS3ULhbirMtjfzQB3W4oTwSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ULdNHwHe4Zj5Szh9N5YhGjWSGmbYFP+4ijqq7vmiXvgKtpVK3q2UACeqcwAkbPH4bIyT8sAjxrHpyg9oZ66PcRuioeYtSJa7+HbFeIwcaNixxtNvpEStn64CF0auIJWYq+LOdB1oeSUM4Txc5R8bvRYRky9WeVEQ5VTAs+EVNic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwPAxY4u; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwPAxY4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756604818; x=1788140818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=evjB2bgkaylmzbNeupVNS3ULhbirMtjfzQB3W4oTwSM=;
  b=UwPAxY4uTJYhtH74IBqtaJUGM0n/xCC1ZPpZK7WRJd8t/pyXirYyhyFe
   GldJ44n9SKyO6MKnn4cdZ/VmhGSB54hPv22TKBkqJmfP8CmOk+inzuAVg
   8SsZDDbproKE5ZbRafmo2c4KTD9mO/Tt6EFLexMrQqXEjEcFwXJyZIqDF
   NYZFXR6QdJZcK48h3eTwEv10jZBr7r/rvPfHWUb+kzfq+7LH6EOXtnH5x
   z43knNLfesp+I+jHOe8dl/rrWf+OfkJCn6Wd1HsrSU2MHJ3zj6ls3bLIe
   Mn+mJXdc6vz1FiJxnr5j1wWdeX++cK/sDf/2vfZXQV5vqnZsrNcLmxHXm
   Q==;
X-CSE-ConnectionGUID: BWF5iNdLTD+xMcVCOKzfrg==
X-CSE-MsgGUID: 7Z/SwJMmQpmvQ805ZFnK6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="84251642"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="84251642"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 18:46:58 -0700
X-CSE-ConnectionGUID: jLpXtqWjS76RDxA4hXO7cQ==
X-CSE-MsgGUID: MvJHsNoqRa2z+fAaDWSjQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194340474"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2025 18:46:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usX9K-000VqZ-16;
	Sun, 31 Aug 2025 01:46:39 +0000
Date: Sun, 31 Aug 2025 09:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1768/1768] kismet: WARNING: unmet
 direct dependencies detected for UACCE when selected by CRYPTO_DEV_HISI_QM
Message-ID: <202508310929.Dvvw3W2k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7dd09dff93e7ad921baf5cec4b58301d9aebb79a
commit: c89f49b5f6b23b319f338f7e9e7e9b077ec8f5ff [1768/1768] crypto: hisilicon delete invlaid api and config
config: arm64-kismet-CONFIG_UACCE-CONFIG_CRYPTO_DEV_HISI_QM-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310929.Dvvw3W2k-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310929.Dvvw3W2k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310929.Dvvw3W2k-lkp@intel.com/

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
