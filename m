Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623F2F99BD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756140464; cv=none; b=Apy6Aftfc07HGngVU/Gu565QdzP2H8IErrC7quZpPTJ1Vt+Pg0nNQckA7ICLv5MpfixBK2whHVrFVHRxI5WsyVVkxkAJNT5Z8d7GdmhUc2jnvmuw/E4j1Ud/K9tzl+IxLZs9tcOzWal+OyQwgL1ERCkr76h4bkMcufr8DgcsVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756140464; c=relaxed/simple;
	bh=2yoCOdFB3cwySroCx37f7k0hMpG9yJAYUAv3BtRyT40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f+04ECRWIDqJPtrgAzjvtpsg34D2KzusOrOmrGBB/wLOZ/8jwmiewqFTkn3I1prpnNBwO/BH0u5gcOrTNPYKQt9XtyA5Q3desIKiLg2AaqmTbUkQ8mCQO9utnf8IOYMJqsSBeE6goXrBtPdMT/sENtAoQuUponuZBFAtQpMVhno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WowKmV+r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WowKmV+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756140460; x=1787676460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2yoCOdFB3cwySroCx37f7k0hMpG9yJAYUAv3BtRyT40=;
  b=WowKmV+r0tcI5EjmAZoUFrIoWz4LuTCkD19lloVwOxN19n45Mg3ZxWnc
   4mqxbiKNzKcQ+xZpwjZ3OuNupZbqdIt2lhTD6GAeklmh6NEMwEOup4kvI
   feU6q92K98cdLYh8FsBsbD523wfTvXBRKAsJ8paXVWuTQXTq+fJJa9fgh
   GJduLkIKlhJ4Oq4YHznpP6e+H01u0DuPguhqv89bpr51ZhZAXgVDFileI
   Z5hA50Z6MDb04giYpWN+fos03Nzl04ZWCQOVLzokRWdi/6UqQMEVJXDDf
   l7JjdrskYjkJqkvK3ggaUv6VSF2q6SaLwIaVOlYfLZBFLlIfOqTyH8dZo
   g==;
X-CSE-ConnectionGUID: pOzYtT3kSCCIZxVbDzKzpQ==
X-CSE-MsgGUID: k8HkHFZfS1i9syz78Odjzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62186120"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62186120"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:47:39 -0700
X-CSE-ConnectionGUID: zj9DZpvmRaK/8TNdlvig/Q==
X-CSE-MsgGUID: Vu/hbbTYQqGHBc3kxtP/gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="173743101"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Aug 2025 09:47:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqaLv-000Nqv-0g;
	Mon, 25 Aug 2025 16:47:28 +0000
Date: Tue, 26 Aug 2025 00:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1761/1761] kismet: WARNING: unmet
 direct dependencies detected for SPI_PHYTIUM when selected by
 SPI_PHYTIUM_PCI
Message-ID: <202508260038.ZjYGT3xz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6140b9e22a5c2bec953454ba4737dd9cd2a1f754
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [1761/1761] spi: add phytium spi support
config: arm64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PCI-0-0 (https://download.01.org/0day-ci/archive/20250826/202508260038.ZjYGT3xz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250826/202508260038.ZjYGT3xz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508260038.ZjYGT3xz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PCI
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM [=n] || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PCI [=y] && SPI [=y] && SPI_MASTER [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
