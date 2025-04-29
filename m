Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20B2D320C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935999; cv=none; b=Yxvt6Q3/QXQdCzFOTkn1BrnvnN0ftZ+LRwAzLdcwWTl20zfnU6CMLdHUErHoXydfAP+zvAAFGstvbbGjUhCuMjSH85FPTYUb2lGYnZhG9bMyg3P2a8XvR1zv8X2rNcCgTr9LpudhxZZcugI+JoTmtbKa2K78ZTvU9yqkg7u4SzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935999; c=relaxed/simple;
	bh=brV8IFavx6WYxAuFWGw0W0xF5SBjwJMBcWbVgUsnHu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPzB1QgvK4D2HQ/4VaBWCE3JOszjq0VJh/QbtVPSq7TaKKbHx6wsCFWcRJOn3Gb83oba/6Xb5H9jTJza17Q7yvj2N0sj9foT1LiyiY+jDmHbB569SRikKd3sPMYQ6SAvWsUVm1BaQ9XLVds5v5CHOMLdbWoGDJCmVn/RDKlLr60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HE1dffXr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HE1dffXr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745935998; x=1777471998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brV8IFavx6WYxAuFWGw0W0xF5SBjwJMBcWbVgUsnHu4=;
  b=HE1dffXr4qLA0bsmEJxvmyn2McerGewJ9h1nh3KI8/lFJZ8Vswk/yDo0
   SD/l7l2oZA1VqJyiB82NNsqgfShjM/5J8HaI1LAyYaa6UVP2LQnJ2Mid2
   sYcFM70AEZLAK4id1fTmMRSDSo1aF9tNQumCFL1GKK7eKI70Th7pPir8f
   zPHrhIEHlfCucsUMlKCF6G5pQjuar40M+6rC+CUqY/gUp2ooO2kC0IN60
   Uy12SlWh/OYc2y4suayQA+k8GubJWECiKXmI13ORXGNkeKzz6hJo2hgPM
   4YV4ED0paEv/ZCiVg6/KtMVG7y/pZW0LjIJbbLmPb9g4kDT2gxi7HYRh+
   w==;
X-CSE-ConnectionGUID: ZjRqcdO+Qyq1e2Gv4e5R5A==
X-CSE-MsgGUID: 55gKBGssT3CTIV+1lYDJUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47654141"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47654141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:12:57 -0700
X-CSE-ConnectionGUID: MI2hokfsQ4ayK0CXqweGmw==
X-CSE-MsgGUID: NJ35Ie5fQIGvC5AIkdAHdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="137869492"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2025 07:12:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9lhc-0000lR-2f;
	Tue, 29 Apr 2025 14:12:52 +0000
Date: Tue, 29 Apr 2025 22:12:48 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Pasternak <vadimp@nvidia.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ciju Rajan K <crajank@nvidia.com>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 55/58] kismet: WARNING:
 unmet direct dependencies detected for REGMAP_I2C when selected by
 MLXREG_DPU
Message-ID: <202504292201.JSFwvIMC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   f618f1b298d3195d363b20f158ccb3facf553f0d
commit: 3e75f295411679e999dbcca37499cd00bd643060 [55/58] platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU
config: nios2-kismet-CONFIG_REGMAP_I2C-CONFIG_MLXREG_DPU-0-0 (https://download.01.org/0day-ci/archive/20250429/202504292201.JSFwvIMC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250429/202504292201.JSFwvIMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292201.JSFwvIMC-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REGMAP_I2C when selected by MLXREG_DPU
   WARNING: unmet direct dependencies detected for REGMAP_I2C
     Depends on [n]: I2C [=n]
     Selected by [y]:
     - MLXREG_DPU [=y] && MELLANOX_PLATFORM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
