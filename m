Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA4919B3FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728993484; cv=none; b=Ko+AT7d1SMsoloseol19NtM9GcocNnNVDzbn+ioXQV8z8tv6SZfFunbe5//Vb5FGkupyTEkeOjh9ufa+w3aAaOjB69wV5b4dHCBTrwLYSB04XuDLOmgvxM2voGGkqiWN2ijlemlNMDX/hpdpgEEDrKWAdUxJW1gnqCyRi86huD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728993484; c=relaxed/simple;
	bh=K1pUR7EXcsrVpqeCsF9LtLSC1G/KtIjxVoph8j4v/fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocSsTZckhAf5XWmtHEpGQ2Tp8RUh5RqrMU9DrTZc1TwPo1GCscjQyv1qdVB/TU9A2x2uFxU1JC/2c7dXsYPfavT8NfRfGLjLpufiQeOVSbbC5vGokf9nBe+L9fJcyJqmXElQdlNtvX+kPP05PQQLAGG7WukU3hKtVbB5nmEZZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkT0VPQ1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkT0VPQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728993483; x=1760529483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K1pUR7EXcsrVpqeCsF9LtLSC1G/KtIjxVoph8j4v/fM=;
  b=fkT0VPQ1hP3VFkuFEG9oBn7WewcvsXo2UE+mtX+vr+Romsox+xtoMvGp
   IVhjlC+FeOp6N8cffhB8k6AvZoSBx45WD+6yOYXd34ruWKBhsYdZFIuko
   3amjdtxovZeaBubiP4lyHEx9Lxvnboy+P4d6ATBK9QAjbm6yQgnm8TU+G
   gPVnKzqh+s8s+IvAepq/bITDleGwyy7mWiSZ3SzCwxToQSgfYmzAUv9hu
   DV6CTy8Um5fsYXPo1fkI10pGhI1oPl74FNuOho+oQ60Tc3vzIhyMdXL33
   8bw3ZCzq/+Kq8sSd7/xOp/i91jQUtXwiH5mi33tYjnHfyZUOxay9eeL9O
   Q==;
X-CSE-ConnectionGUID: iGcw+v48R5aTGj2O9ZvgSg==
X-CSE-MsgGUID: OFjTatDYThCdIhSCeWIj9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32180354"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="32180354"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:58:02 -0700
X-CSE-ConnectionGUID: eXbe0O5VRAyvT9jBxGLBPg==
X-CSE-MsgGUID: VgIxkNLZSEirhb+djKQUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="82528954"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2024 04:58:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0gBa-000ITI-2C;
	Tue, 15 Oct 2024 11:57:58 +0000
Date: Tue, 15 Oct 2024 19:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-cip-rebase 2994/3670] ERROR:
 "thermal_add_hwmon_sysfs" [drivers/thermal/rcar_thermal.ko] undefined!
Message-ID: <202410151921.GWQfVuLX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-cip-rebase
head:   974fc3cebfd1b8ab1c4217a2e40429768e3de3f9
commit: 79ae657a337042a64789caeb6b086dd975c27708 [2994/3670] thermal: rcar-thermal: enable hwmon when thermal_zone_of_sensor_register is used
config: arm64-randconfig-003-20241013 (https://download.01.org/0day-ci/archive/20241015/202410151921.GWQfVuLX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151921.GWQfVuLX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151921.GWQfVuLX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ERROR: "thermal_add_hwmon_sysfs" [drivers/thermal/rcar_thermal.ko] undefined!
>> ERROR: "thermal_remove_hwmon_sysfs" [drivers/thermal/rcar_thermal.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
