Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85281AA8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770840111; cv=none; b=Sy+EP9u5zVSWM1xne5Ue8omQY0KlrYLlF0VtfapADyRijYFqfy+3UesxiZiZgN0WVLGgEL1HVjdcF1Uj36o6Aq9wyfWf6ikX8jls+3hxa+kAG7CRdhhTLsRWkhX5qfflcVCiEmdztXaJWR17SuClfhyHWI1LfA3Lj69AP+LtE0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770840111; c=relaxed/simple;
	bh=FRK80FtOeNHas7nb8MAtDSMxEW26e50AfyrrYROtmVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=d7Jxv9TEK1yq2Zsf4RnYu3fkkNDeFBUEx/Z1mNqICPIxS8PlC1jQaB3aWSFnpuf+ynK2kn4ACLxXDZ8cYe7LP6rZ0I9BjKKbNIFZa++kEJTJ16DVXl7EV0HpT3FfF5d/gR/UlXRzeehExhB7I+smN8gd/qgVsxw/NaeCfEDP0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6LnmXlM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6LnmXlM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770840110; x=1802376110;
  h=date:from:to:cc:subject:message-id;
  bh=FRK80FtOeNHas7nb8MAtDSMxEW26e50AfyrrYROtmVM=;
  b=i6LnmXlMVBF4OkbtN9gYXOBi98j/YH1pXDjCyKVeRJ+naFLCCNrNL9X/
   /JCazpdF/gJW8skCxofoogKPXWm5z3cQ5Oz0qNCGcxO5PHHnp9oUrKHXl
   ZkZWPaPv6afs3qaCk3XC1beQtSgM9bQf6to/+Byc+Ij2r1eLyen9ZcCuE
   jhFlvqAWePBVbOsbz5IWmWfbYlOksSCtlDm8ACcIx0Y2UHfE5ewMcWRNt
   NqtTMe7QAm9YqS7O+pdwqiVdXM4HGAwsrINaGa8mHEh28GRvf3bZhdvi+
   mcsQ+/XT49y3m8w6M7chN51u+pHLssgd/tXLM9oKV5nFwd4npi6Tj3zWU
   Q==;
X-CSE-ConnectionGUID: WQzTQRaCQkOSxsgomB5ccw==
X-CSE-MsgGUID: 4EPpHscfRJW14qxaT1MaCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="82324375"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="82324375"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 12:01:49 -0800
X-CSE-ConnectionGUID: 8zwdOS0ERNqveyr98P2Dog==
X-CSE-MsgGUID: tq0zQTybScW3bv/T1OnmDg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Feb 2026 12:01:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqGPB-00000000qKm-3YjJ;
	Wed, 11 Feb 2026 20:01:45 +0000
Date: Thu, 12 Feb 2026 04:01:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 203/203]
 arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype for
 'arm64_noalias_setup_dma_ops'
Message-ID: <202602120354.qLUGCIYa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Robin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: 3c75a6fb7fd1cd149d7af1a2e200b064a2d12782 [203/203] ANDROID: arm64: Work around Cortex-A510 erratum 2454944
config: arm64-randconfig-r134-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120354.qLUGCIYa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120354.qLUGCIYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120354.qLUGCIYa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/dma-mapping-noalias.c:550:6: warning: no previous prototype for 'arm64_noalias_setup_dma_ops' [-Wmissing-prototypes]
     550 | void arm64_noalias_setup_dma_ops(struct device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/arm64_noalias_setup_dma_ops +550 arch/arm64/mm/dma-mapping-noalias.c

   549	
 > 550	void arm64_noalias_setup_dma_ops(struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
