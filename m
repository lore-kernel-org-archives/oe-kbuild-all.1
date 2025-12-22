Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD738DEC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 00:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766363190; cv=none; b=KL1jFVUEA1y8jQVsJxYuyP8VYX5EfeTpOcsOVHelGVsLnbAjmd4zjorm4RWubOD543f2S1mbwTvRzjKs5nl+hq/nFqLdSM7eX3UNJ/UDpwbTgmLEs3CsNCceb06r77rP+rwR7TP05GxDEsMzEYKskTgnaYpxTqGvFMSXrFsIgXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766363190; c=relaxed/simple;
	bh=v8Z9Q4KBjAVK/BOVAkUty0DQg+7Skx7LGCJpCUig2l4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJF/hExaDGqkt8wtstTMTE4/yH//F8sDO7peoB7/KEfOzRlYNkGr6DRz4M+PST2kVKtdaYpLvaRa03k4/JNSGAuBi38257HdOVk07SPASgPf8ZwgDw77igpKD1o1RGrLq12VVmoVNNVuUxVNCGJgfQ6kbWFWOaczzhvaOWDTPeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecta8sd8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecta8sd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766363188; x=1797899188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v8Z9Q4KBjAVK/BOVAkUty0DQg+7Skx7LGCJpCUig2l4=;
  b=ecta8sd8ZgGugKsLnHt9+eYbaLyemdsoeQ3Xpxtqdsm3amIaPsf+Gt62
   Pju6oiB+ZoiRuuyIk+zZVoujGrjUZa3vdStDWM0DHlrOPv4C91GxAOWy4
   a7/MueywVdHaRXgQNfDy9Zaa8kz5FB6LVfaKvgK+387LQH3uEaKOIQh22
   hw7PiWKAgu1WnbJ1P/y48LBoPPghq9UIXaxTQYexR8OGYhzEt6KuRPiZL
   M3IpGowKD2xyBZlzHB70VpzqR9ZJ/yW5xa9vGiAminvfNOtuOprWsmiMR
   oFcmEYLHFwvzQuHkFrAAYFfPBR4s2U6pPbPWu+LENKfWLzCiMWQrrn+ax
   Q==;
X-CSE-ConnectionGUID: UBOIU2rIR7WAm2YFnG3HLw==
X-CSE-MsgGUID: eyTSXwRuRKKDz+mXrnsPDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85806727"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85806727"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 16:26:28 -0800
X-CSE-ConnectionGUID: xjNj5YWrT2SCAD/lWk9s1Q==
X-CSE-MsgGUID: gB9mEzaHTRSPEZJwvbXEpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230047342"
Received: from lkp-server01.sh.intel.com (HELO 0713df988ca2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 16:26:27 -0800
Received: from kbuild by 0713df988ca2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXTkm-000000000Kz-17nm;
	Mon, 22 Dec 2025 00:26:24 +0000
Date: Mon, 22 Dec 2025 08:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2025-10 1/1]
 kernel/gki_module.c:31:6: warning: no previous prototype for function
 'gki_is_module_unprotected_symbol'
Message-ID: <202512220803.O7CwsqQ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15-2025-10
head:   d2dca14b9f2c3e17c56ed5380f1c7cbf16c4870e
commit: e7451150cb701de01d6b836c496e1bd012d885cd [1/1] ANDROID: GKI: Add module load time symbol protection
config: arm64-randconfig-r072-20251221 (https://download.01.org/0day-ci/archive/20251222/202512220803.O7CwsqQ7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 42b3483ac4987cae1bdb632398e8a3ce2dea6633)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220803.O7CwsqQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220803.O7CwsqQ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:31:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/gki_module.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      31 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/gki_is_module_unprotected_symbol +31 kernel/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
