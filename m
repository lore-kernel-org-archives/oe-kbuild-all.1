Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2738420EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728981042; cv=none; b=fxcjBc14XphVQs/zSZchYhK9vHZnZKKZ+QstlpXRh5GdAKD7xyC44zp7RPwosHKFVsexgzn49wJ3GlxpuFFkVudNllbMJ6PyYHNlD5Mae1cyZmSc9ltIG7pKF/ztc1iUR5iCllMxknJLoM84y7Nz+Wg061aWK1VFM2eRjDMnVjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728981042; c=relaxed/simple;
	bh=cMTzJZ2bwEE5jCF6RnMeESdhjb8Fpg9YvPmC4/FixT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tGmONzHHLoEkQQQu22XvUqHIvHlUExB438dI4yTLZQtWbz29oTNjCDHB3s/yqCnuOrQXEi+N5OUvyB/zX5HWEu+exjrXNRD+4Coo5U4xu8Glu1tEFb+4DEI7PlBHyeJlN7O6fCW6KKt5E2E5c27wBcUFfJhZd9hQiG2lxp4nX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gdr6EtXp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gdr6EtXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728981040; x=1760517040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cMTzJZ2bwEE5jCF6RnMeESdhjb8Fpg9YvPmC4/FixT4=;
  b=Gdr6EtXpiDNFX9oHJ+YBTtT/fX2YbGVZbdeCTCj+wYWeOthcHiHfIYJ3
   2B5B9NsrRf0hHAZ1TTyQ4VUOcseTjXCYkrLmKTLY0F5ekn+ybhIHsgzoH
   ERwe6xvu0Bvx6WOiS85CE9C0t7N5UxvmB34wbwOev1DRnryRK9C044NN+
   O/PW7ksWWLR5V7eGFxtVxZ/yP0rY2J5VXHqzjD/7aUt3ORoK9vl9mgG1R
   7HkgMvdcEzMeXHm5RD2N+Z7CxtMvCnUHLVmeCp1iZe9aWAMKzRXZ3yxUA
   vsJd99vwB6cy46ZpcWzviEmP3qbp8dQh4ZHPmTNzAw8pPigZ79STGGum6
   w==;
X-CSE-ConnectionGUID: Fo/Spn9cSAqgmU9/pSLLrQ==
X-CSE-MsgGUID: yqFknb1FQy2QBMzL1fsuRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32052691"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32052691"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 01:30:40 -0700
X-CSE-ConnectionGUID: v+0AeRryRduJX/iARRKyKg==
X-CSE-MsgGUID: 2CRk2Qa6QLC+qFwssCUvXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="81803403"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2024 01:30:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0cwu-000Hp8-1R;
	Tue, 15 Oct 2024 08:30:36 +0000
Date: Tue, 15 Oct 2024 16:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-6.1.y-cip-rt-rebase 188/440] kismet: WARNING: unmet
 direct dependencies detected for ERRATA_ANDES when selected by
 ARCH_R9A07G043
Message-ID: <202410151605.c12GZRQJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rt-rebase
head:   08788bbb26e6f92122914516e7d36ade297a3f3e
commit: 5f6eeb7dbc55b8b2859a8776e825e68b6b2e5730 [188/440] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
config: riscv-kismet-CONFIG_ERRATA_ANDES-CONFIG_ARCH_R9A07G043-0-0 (https://download.01.org/0day-ci/archive/20241015/202410151605.c12GZRQJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241015/202410151605.c12GZRQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151605.c12GZRQJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ERRATA_ANDES when selected by ARCH_R9A07G043
   WARNING: unmet direct dependencies detected for ERRATA_ANDES
     Depends on [n]: RISCV_ALTERNATIVE [=n]
     Selected by [y]:
     - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
