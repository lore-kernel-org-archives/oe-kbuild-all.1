Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13E41E3789
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987831; cv=none; b=XkY6DupBT6884LSIzZdqEPslYH3QfU44zkNQCxQ03447DdS2hgHd1DyG4jUFPduWqopUbRED0k8guDZ6bGmqINJnlfPhYtucSKRvna7NHPMSztcCRSR3WXSYXMnIPszkE6s0onkNjiotk2WOSTYP0cpohBmx796eNEuot+jtBfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987831; c=relaxed/simple;
	bh=1yHwDQOI2rB5H2SNmFOtdzu0Mf8dqQTXaOmEdKqYPvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbAope/a2O8bs5558pHOhT/2rq6GVJO6VYy0jZDo9NozdYtHXV8LbJ/OvdTHZcDoE5fu+cXjwN9tZSU9oS96lHH1REPIr7ueaClDSiHiYM2IiZExPY7nY8irfeJylnuYRU8qo8fnb+x8/eTNkmqUodQL71WlpPbnaADL/cesa+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTbxsyZ6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTbxsyZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728987830; x=1760523830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1yHwDQOI2rB5H2SNmFOtdzu0Mf8dqQTXaOmEdKqYPvs=;
  b=GTbxsyZ6TJ6jjiTEgbSVaaSNGOP5Q5JWEzd7PTr2QwHMVmyIvCiiXj1T
   884Wc+jEUS9npfeYH1M8LSHYXpKvZhtgQRTvsRkZ+d1ONe4CJ3aVqIbA5
   Z8B3Ad0n1F7XvEMCWkWtHiQgq2qZbJHOcipOe79wtlFpyvsVE4V3kdjVQ
   l+zr7EjV6JCdJ3aWfZTJpk6F9fsn3dRH6KQfkxu0C1jeaQdMDCMOf0/Zc
   KXtRJXxAmlHcNHw50CvM0NDQo/tjC4iqj2YlZiv5w3vBH4LVdColnaW3v
   DqI22tkgCn+NqU0r4jJmBoWbZmAxi61FkUIcvox2EukJXjR99oTuDq9mZ
   w==;
X-CSE-ConnectionGUID: 8/0H38h+QZmyPJ1jb8uhbQ==
X-CSE-MsgGUID: rtH4iwTARwCV8BIHnfRc3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39494439"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39494439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 03:23:47 -0700
X-CSE-ConnectionGUID: t+NP8CiaT6OhjZ/oA4nguw==
X-CSE-MsgGUID: Kvq0DhR0RP6Xkea3emFU8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="82900597"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Oct 2024 03:23:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0eiN-000Hxz-1H;
	Tue, 15 Oct 2024 10:23:43 +0000
Date: Tue, 15 Oct 2024 18:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: [linux-next:master 1741/4439] aarch64-linux-ld: HYP init code too big
Message-ID: <202410151849.itPwK8Hi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
commit: ff5181d8a2a82c982276a7e035896185c390e856 [1741/4439] arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1
config: arm64-randconfig-001-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151849.itPwK8Hi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151849.itPwK8Hi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151849.itPwK8Hi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: HYP init code too big

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
