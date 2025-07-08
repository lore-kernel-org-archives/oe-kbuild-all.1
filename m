Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8A1401B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Jul 2025 00:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751934831; cv=none; b=gn6hNbW4x8CgeeJxRaczTVcMdsYLXatSGu4/uopZrMq9jIiSiRdi7kH/2R183XSYhri9pSto7Lk5pZ7CuIClmaAXFHQkxu6E3O2LtWTvovfxPdx8gjXknvIN4SPE30bGsrd8i2aITsbGxtCerosMZDSD0O3e+usSExAeoG+j2r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751934831; c=relaxed/simple;
	bh=Hw4jbKwxA8fefoR4cQCVG/kFO4MWrh89BQDlQGttE6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VV9MgEyszYkBhCjcoAcg93wbItfliIvPKttdXyuv23GSPp+/mbj8NCCjdTOfvF47BCO/AtVEx/rULnI8JPcFiJg9+7lZf3NV0Z2YomW4ENxPOO9JbQMmQ86yMs3nbddhhXOCaBGL3ixkp24as/gUrFReOr8m4Zw1CnaolMTBVmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3PCP0rc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3PCP0rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751934830; x=1783470830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hw4jbKwxA8fefoR4cQCVG/kFO4MWrh89BQDlQGttE6M=;
  b=L3PCP0rctskXFKTqCyY2K2DOUlWn71CaQKG8UtjKT7pzJIyar36Wyiz3
   s0DZb0tMzJuGuwTZQlbB2bgAvnFcJIK3Lo8IzNxDdvufCa6EzPcRGhG1Y
   llYpELTVUhlzpW92ROvou4A1StgJpQnTNkJL9aDhoQrsm+CXSzXRnou1r
   3OApqAzP2P5cFRCAr1FNtpsu1XKdxTyH7xxVAsVumZH55Oih3SOR5sy5Y
   8cawzH1HRTmXCYvKk9VJrDOzuEJflcy9s5fTgULykO48YxRN0E9rl2Wdd
   HunDXWhNF+vteGY2rxfOEBJPkCrXvNjIoxKdaLNW64iVzeXbIHqfvPgzS
   Q==;
X-CSE-ConnectionGUID: vcMpsLRiRTOprI9c3WQ7eg==
X-CSE-MsgGUID: 3L8mb5yTTkyk4Y721VM4Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65227950"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="65227950"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 17:33:49 -0700
X-CSE-ConnectionGUID: 6MZAhGHaRjyDHwlKMDSvJA==
X-CSE-MsgGUID: rJQeKJN9SkSq6e6Ouq0Bog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; 
   d="scan'208";a="155841839"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Jul 2025 17:33:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYwHJ-0000r9-32;
	Tue, 08 Jul 2025 00:33:45 +0000
Date: Tue, 8 Jul 2025 08:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 18/18] ld.lld: error: undefined
 symbol: devm_intel_scu_ipc_dev_get
Message-ID: <202507080800.uMuhlS2E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   d9b6a03e619fac3b4e05f3eae76a415d78c7b05a
commit: cb2eff1500d4d5b48b1f2955d5b5490f0398088d [18/18] ANDROID: GKI: x86: Enable Intel SCU IPC as x86 hidden
config: x86_64-randconfig-r052-20250708 (https://download.01.org/0day-ci/archive/20250708/202507080800.uMuhlS2E-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080800.uMuhlS2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507080800.uMuhlS2E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_intel_scu_ipc_dev_get
   >>> referenced by intel_soc_pmic_mrfld.c:116 (drivers/mfd/intel_soc_pmic_mrfld.c:116)
   >>>               vmlinux.o:(bcove_probe)
--
>> ld.lld: error: undefined symbol: intel_scu_ipc_dev_ioread8
   >>> referenced by intel_soc_pmic_mrfld.c:80 (drivers/mfd/intel_soc_pmic_mrfld.c:80)
   >>>               vmlinux.o:(bcove_ipc_byte_reg_read)
--
>> ld.lld: error: undefined symbol: intel_scu_ipc_dev_iowrite8
   >>> referenced by intel_soc_pmic_mrfld.c:94 (drivers/mfd/intel_soc_pmic_mrfld.c:94)
   >>>               vmlinux.o:(bcove_ipc_byte_reg_write)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
