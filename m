Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB7020EB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 00:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728089571; cv=none; b=oKRHIp0vXL/nmP5aSf5wUCpMvSNDZHIn8hXENRCaS1so9lIiwrOEKS11IPzuyHLxGyZ/0ogMpI+SCPcWQYmXpqnCBnN78PUHwGM/gknkZfZ68Q1HAVZ9V/J3DMUaYK2sEvSGwzH3z4dLFGWViCcDLuneDK+7bDwzYxuB2ZbfGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728089571; c=relaxed/simple;
	bh=xUis1Np6K2u8tpKkYQbQP9AOGIGPowxhrx1+Bv8RmKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sp3KPI0XaCHvG+sEVydQNAdcWG4Puj43gc7NtGgX5SXEBMnVwqHQ++iqkJEMZdI2xL3bo3076xZYTG+7jNUg8TjpYrrl2l9u9DrDDEzZ7U/uRhpsQOtgbOtA5jZhygARsD8SmScVaiVmwPpzOCUMmI0KMppWKjZSuE0hRTcYCIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LvG8wSur; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LvG8wSur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728089569; x=1759625569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUis1Np6K2u8tpKkYQbQP9AOGIGPowxhrx1+Bv8RmKI=;
  b=LvG8wSurteXWoq0+k+GC3Kw1vBUVoBxuNBp3o++v25fRFSSYLpK70hn2
   2XGYI5x4t1/fLgBlYmQvtJchxmfdUl8MWu2VJ3Xe/H6T8Wnca597A5lM2
   /j10DE+RKUNpwpyvmBoyoKT3YxacKYIH6QiW238vccbNhyoC7aGsZkWUO
   aLFvPuvE2P+TXo3ut5/iAZPeOzE9ZUM6aY22CNVcEUdbtq/oqi0A8QMyP
   iMRbQYv1C55QRQEDROkYr8ZEh18aRQowLQvzODiGza+5fVLZLexo9ZM/a
   8zkj3ttsm4F6hPLepdq5I+NYF5WXCLHvRa4cV0aiu0fIWwRowXcayj2GX
   g==;
X-CSE-ConnectionGUID: 63bzBlaJQi+NPUgPU3is+A==
X-CSE-MsgGUID: PkLBPRG8ScWSrCC7DfrHMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27468843"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="27468843"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 17:52:48 -0700
X-CSE-ConnectionGUID: 8v3uyNIeTAOzuOSo0hVpow==
X-CSE-MsgGUID: 2Chp/5PLRc6gFwuMTUL+FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; 
   d="scan'208";a="79826470"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Oct 2024 17:52:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swt2L-0002OP-0z;
	Sat, 05 Oct 2024 00:52:45 +0000
Date: Sat, 5 Oct 2024 08:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 1262/1491]
 sound/soc/intel/avs/tgl.c:53:2: error: use of undeclared identifier
 'icl_enable_logs'; did you mean 'avs_icl_enable_logs'?
Message-ID: <202410050811.PB6BJG9o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 6da61689a4e7a301ea3db2ecc1b5f37dd464478f [1262/1491] UPSTREAM: ASoC: Intel: avs: TGL-based platforms support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241005/202410050811.PB6BJG9o-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050811.PB6BJG9o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050811.PB6BJG9o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/avs/tgl.c:53:2: error: use of undeclared identifier 'icl_enable_logs'; did you mean 'avs_icl_enable_logs'?
      53 |         AVS_SET_ENABLE_LOGS_OP(icl)
         |         ^
   sound/soc/intel/avs/avs.h:374:17: note: expanded from macro 'AVS_SET_ENABLE_LOGS_OP'
     374 |         .enable_logs = name##_enable_logs
         |                        ^
   <scratch space>:153:1: note: expanded from here
     153 | icl_enable_logs
         | ^
   sound/soc/intel/avs/avs.h:257:5: note: 'avs_icl_enable_logs' declared here
     257 | int avs_icl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
         |     ^
   1 error generated.


vim +53 sound/soc/intel/avs/tgl.c

    37	
    38	const struct avs_dsp_ops avs_tgl_dsp_ops = {
    39		.power = avs_tgl_dsp_core_power,
    40		.reset = avs_tgl_dsp_core_reset,
    41		.stall = avs_tgl_dsp_core_stall,
    42		.irq_handler = avs_irq_handler,
    43		.irq_thread = avs_cnl_irq_thread,
    44		.int_control = avs_dsp_interrupt_control,
    45		.load_basefw = avs_hda_load_basefw,
    46		.load_lib = avs_hda_load_library,
    47		.transfer_mods = avs_hda_transfer_modules,
    48		.log_buffer_offset = avs_icl_log_buffer_offset,
    49		.log_buffer_status = avs_apl_log_buffer_status,
    50		.coredump = avs_apl_coredump,
    51		.d0ix_toggle = avs_icl_d0ix_toggle,
    52		.set_d0ix = avs_icl_set_d0ix,
  > 53		AVS_SET_ENABLE_LOGS_OP(icl)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
