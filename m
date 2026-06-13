Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B9C3955CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781345799; cv=none; b=oKnKYSTKB7CkGAhpEvkpV7dmnncPZf1C83tGJ1YBqUS8YJxe5dFH59U3coizPPY9bCfYVnb2X3lLlLZm4Dab3cDxKsiQKj5gAU9WIwuBPg097jbyq8zfFXHX5Bsf+rCa4Xx5joWuRTn57mBltB8EIGw2Cce3W/SkvxcUWsgwyXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781345799; c=relaxed/simple;
	bh=socp63xHqkCfoQGzIXMBgLUmQWgNK9NeVXBGUaGAB4Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gqo27WgsWyi/fV/a9aYXsamkBiyb5acy68Ic96DtCzWlxcTZg7gSAbTMsHVncp0UmdMkbbYRbftVSJG6MmToHQ5vvjKCGu8kgeuLLx5TmL+2LkjOZOpoK2a8l3QvcSV2VmEf1A1P39Av+rwmqlAFGuaaenme5QetRKRX5T54DUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ax8X52Hw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ax8X52Hw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781345797; x=1812881797;
  h=date:from:to:cc:subject:message-id;
  bh=socp63xHqkCfoQGzIXMBgLUmQWgNK9NeVXBGUaGAB4Y=;
  b=ax8X52HwYw1hdW7ptGN1bH4R9MDD9Tyw3dH9aTt6CpOOVietY4MMRDC/
   xMW01ylPv8MCDVjBORJW/3PfcqEYHVPjGUiGItSuKqXKnlJRxEw4o67vb
   nZ5YI8HM3bX5+aaP5XRcGnJC60YFeVRKL+9ahq+gEQUCAOurYZCAvAFbc
   EVT16OLaYuovfMi+6vT8mcFiUziu7X67wZU23i8vARCbSnz2yIxBWEFtB
   hr5DgH54LH/9f6XN99wiA0B16N75kY+HgSdpmY612dID4h16lMgUxp9GT
   wQdCIbTzMCmzuIvL+2fGSDooDbUX2BaD5rLUBWYEJ+y1aee3tINr6sgZ5
   g==;
X-CSE-ConnectionGUID: dt6FdkPBR3e4rF+AKywz5Q==
X-CSE-MsgGUID: k8mxr/JlQX6XMlgZWY0Usg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92840206"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="92840206"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 03:16:36 -0700
X-CSE-ConnectionGUID: fMn3V14NSMaOUpz1ve53Wg==
X-CSE-MsgGUID: n6QDLL4KRiiGlNABV2zF4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="246134217"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jun 2026 03:16:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYLPk-00000000PqY-2aVI;
	Sat, 13 Jun 2026 10:16:32 +0000
Date: Sat, 13 Jun 2026 18:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 2/2] Warning:
 drivers/android/wonder/mac80211_txs.c:19 cannot understand function
 prototype: 'struct txs_queue g_txs_queue;'
Message-ID: <202606131833.rDy9La3M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Will,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   4a8e51250625671e4a0175e18b4001cc03ac3971
commit: 8a7c7d3954c2839bb2f6ebe475648ec14b8a2c9f [2/2] ANDROID: Add Wonder driver to GKI
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260613/202606131833.rDy9La3M-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606131833.rDy9La3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131833.rDy9La3M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/android/wonder/mac80211_txs.c:19 cannot understand function prototype: 'struct txs_queue g_txs_queue;'
--
>> Warning: drivers/android/wonder/nl80211_ven_cmd.c:23 Cannot find identifier on line:
   * @brief Auto-generate policy for integer attributes
   Warning: drivers/android/wonder/nl80211_ven_cmd.c:24 Cannot find identifier on line:
   */
   Warning: drivers/android/wonder/nl80211_ven_cmd.c:25 Cannot find identifier on line:
   #define WONDER_POL_SCALAR(attr) \
   Warning: drivers/android/wonder/nl80211_ven_cmd.c:26 Cannot find identifier on line:
   [attr] = { .type = _WONDER_GET_TYPE(attr##_SIZE) }
   Warning: drivers/android/wonder/nl80211_ven_cmd.c:27 Cannot find identifier on line:
--
>> Warning: drivers/android/wonder/nl80211_ven_cmd.c:108 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
   static int wonder_vendor_cmd_set_frequency(struct wiphy *wiphy,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
