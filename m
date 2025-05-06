Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2C2192D8F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 May 2025 05:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746508730; cv=none; b=Xd17N1MkggnfN6dRb5+ueDNJDKvHYv6zbYOWaPVZlq4XqHHqfkUT28ewChCLgiQCAH4LZuZg8C9EnY2ZBT3O52DjrqJsfkLNLBygIJje3riNRKtFkORqci8kz7EUMG5CwQFI6bePhe9n3fLq7vowJyUVKekOq6kIyCnDzPss/vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746508730; c=relaxed/simple;
	bh=zWI65MzQjnJ6usI4mMXLuLZKjalbltYonzQ64VLaev0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUcZB7cD1pYw15WSFhWkwKzUJ2NNwIJnmYZJ5+VatjY72FDIuVm39YsRn9AIylo1pvS2H3eRVbXnduCh0rrUiibzZQUSAfdeEWnoCBOyacdIaFkg/Ht5BD2qIGBcWqyrmS0xX71XWL8cF1qT/05XYOIw8y2cGCviRhFIJsj1mbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ia71Dv4E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ia71Dv4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746508728; x=1778044728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zWI65MzQjnJ6usI4mMXLuLZKjalbltYonzQ64VLaev0=;
  b=Ia71Dv4EB1/aEPQOJ4MQfPg/Jn6KRIcE4F5Fq7OJNR6PTb9YB57/Vly+
   J5aEkDaaMvJ2r06fWOuXS7iWTh9tCbe/NlHchuL6fOeB/CqTVuZUKsb1z
   cp8+v+VOorj5ikQHspCkae5XM6hJWbFjiE7ZR/zMjTWN5qciPW91V0vJG
   6UIBM91SO5TS84CsEmMuGYYHk48HNd3D1kxwQ64Rleo2nQroVlj7D+wO0
   e+APcg3Z+d9yVUNJA5fq0Il5z6XdGf6hzCD+Sf5r2xTpg36g0Wo0AyJg7
   K/35AeeN9ERvnAhQcVNszeLFbPUzhoJC4gj5FIqnRYenxp2oEtHKanCyF
   w==;
X-CSE-ConnectionGUID: SMMgNPzCRwy7eyLOAx3/FQ==
X-CSE-MsgGUID: Ls7jFZ0NQwivSqXD7wWzPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59144915"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="59144915"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 22:18:47 -0700
X-CSE-ConnectionGUID: rX/IjSBKRIur36RIPUodhQ==
X-CSE-MsgGUID: qLhi52NcTYKdjhzRnQAbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="135460040"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2025 22:18:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCAhY-0006Ft-2U;
	Tue, 06 May 2025 05:18:44 +0000
Date: Tue, 6 May 2025 13:18:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] kismet: WARNING: unmet direct
 dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by
 GKI_HIDDEN_QCOM_CONFIGS
Message-ID: <202505061318.MGiJX55B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e20c2e5ba70ac5fd2f1157f57a8ee53e07b671b5
commit: 0c8ec66904ac0a02c5ca7d0498308d90356f81c7 [2/2] ANDROID: Switch CONFIG_QCOM_PDC CONFIG_QCOM_SCM and CONFIG_ARM_SMMU to be loaded as modules
config: arm64-kismet-CONFIG_IOMMU_IO_PGTABLE_LPAE-CONFIG_GKI_HIDDEN_QCOM_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250506/202505061318.MGiJX55B-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250506/202505061318.MGiJX55B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061318.MGiJX55B-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by GKI_HIDDEN_QCOM_CONFIGS
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
     Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
     Selected by [y]:
     - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
