Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF6DF71
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738760020; cv=none; b=Lk0/8YUedfvEcQX+iH7PYm8q2yGzB07YuLLOBt5g+SWdMZaOFH8fNO3InxXhYjdFWwjzd6sI10/I05xPMCTm615vRo4vkLrktfLAHqpkRmFyP1P5U8OMeVl4fftHX58qi/pWrcRMMlq9hVrHW22UtTglTz4v+QmEZgkn0NdP2xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738760020; c=relaxed/simple;
	bh=TRlEBWfS2Zs1fpNNBXV3ZwEMt7Zoiaf2cLeVJBoDQ2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rNMOdG5BvQuCDmQq+TayWfhAn9rNJd9C7aiIsIBh38+lYuCtED6P0Kcoxc9l0ns7evAkI+ZrrYKFrdOILehhPbOa0jFvSS/+EjeswWfiAW11mJS+oVykc7dBUBarEV0pd9J3FHs5/rxwvEnKoI8BEbLxbrIyTV0HyYdsd5et9HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHtguqfT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHtguqfT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738760019; x=1770296019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TRlEBWfS2Zs1fpNNBXV3ZwEMt7Zoiaf2cLeVJBoDQ2o=;
  b=ZHtguqfTshchkesdD84D9TgvCjn24krMeLz2m+KDH5PWuxp1mnil1fT+
   QGQPg7gFlVUnd0zlBPj9d6DHd8ahtfueRZJe1uWX+i1kpXXys5gNYZ7Da
   cJrz9GjKiiUlfNVeh8mXP2mCYg96dvFEi1mnJCx7iFAt4JLD9Kuen/TIN
   vwfaxZPdWuGqbMpuHt2hdqQUvlxDgg8ovtBlDLIVpq6J4v9U8GaO+Yxnr
   f/LqXMo73YybDHdjBU0/kqKdym3CzFGlKJ3H8HbhK61TAT9FGElp7Lvqm
   eF0U5UzoGXYFUoHKEf0+s3FHKicPooDwl5AQN4urRGt97tEnCU+2+uxKT
   w==;
X-CSE-ConnectionGUID: qcgINZjiTKOkcRyVedm0Og==
X-CSE-MsgGUID: HtKFcLOQQ+ylpK6oRp1A3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39206133"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39206133"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 04:53:38 -0800
X-CSE-ConnectionGUID: zCzw2/vwTsuXmAEP3Yo64g==
X-CSE-MsgGUID: bOjTsopgSs67ngGfZp+wcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="111074723"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2025 04:53:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfeuM-000ttP-2E;
	Wed, 05 Feb 2025 12:53:34 +0000
Date: Wed, 5 Feb 2025 20:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192] tinysys.c:undefined reference to
 `scmi_protocol_register'
Message-ID: <202502052008.aIhzxqPF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: f1e104ed61ffbb353b91e2a25e09f96ac805bd4c [192/192] CHROMIUM: firmware: arm_scmi: Porting tinysys_scmi driver
config: i386-buildonly-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052008.aIhzxqPF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052008.aIhzxqPF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502052008.aIhzxqPF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/firmware/arm_scmi/tinysys.o: in function `scmi_tinysys_register':
>> tinysys.c:(.text+0x41d): undefined reference to `scmi_protocol_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
