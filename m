Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7671179DC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 00:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730941189; cv=none; b=DMVgBOSGzFm+H0OoLb7JQVF/OdXyuzDPk85HASh3pXa3Y+9/rQ1DrB4luFW31ATZ50SkNN3tUL01oNmRVjlzXGk85mipLZzP4jSNOHCx6E9Ntr571txyqYuvrU7rMz0d0PHTHta5XvwY8V+WzdZmrT7JkoSU5fVVXBOY5qb/9fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730941189; c=relaxed/simple;
	bh=/SCgBm+It/PN05lQ/MCt0R4HsbsGfU0h8NeeLA8oRlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OL6/AQVNo6TwkVYF9fV8C2jfDA+TLCoq41H5sht/jqgxZwaJARn5ILP59efiCExe17UB5V9YlVC5cz/9JKtNHAgId2doa+9/1+g628S5ah9nYc0qDoPftGhkxZ4EUx+N8UbjPTvWLxa+sgfXjWlhPycKnpAvtjIWAZpOjO35U6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxIis65j; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxIis65j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730941189; x=1762477189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/SCgBm+It/PN05lQ/MCt0R4HsbsGfU0h8NeeLA8oRlE=;
  b=PxIis65jsZlwOKPRw3fcZpvyFWtCyx52jpwj/3IJBxBzDDYbcyZktpy+
   bUNJKokDFOgyCQz8tGIBsI3o1EVtHG2CJdzdQWmjAd2nBsOBVs/vHI1AP
   OoJZG5ai7TLxX2vwowcwuCWKU2rqpQMz2boCtCbEwXJKmYIeJLpKX5HFH
   FGf6FYiotsJ7JYQeUIUCOjUV3WvMWjx3vT1B6aiUamWqL1Q+AJ2fhKhuL
   0df5t6r2wGF5tfQAIe3rURdBGSzLuQLOkJQaFhHULnjMv28gxkPLHdhQ5
   mWizB+I7BeeGWFgs0+vjALZvPSSyjizhFUQ7h5N4qB6rIZcOduSW3cJgw
   w==;
X-CSE-ConnectionGUID: z/R8BmtwQFSJfyBFTSmxoA==
X-CSE-MsgGUID: 7YJpoV/CSaCLt8i+qRy9Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53323151"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53323151"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 16:59:47 -0800
X-CSE-ConnectionGUID: RJXiv74dSJSqhxID1jEdgA==
X-CSE-MsgGUID: tH4iSv9yTxi92QrV9VMv5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="85660211"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Nov 2024 16:50:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8qjS-000pac-0L;
	Thu, 07 Nov 2024 00:50:42 +0000
Date: Thu, 7 Nov 2024 08:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 262/6153]
 socket.c:undefined reference to `wext_handle_ioctl'
Message-ID: <202411070828.lNrPGy4S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   e38e1b5d82032316514aeb3da982a6b9b9863897
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc [262/6153] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
config: i386-buildonly-randconfig-006-20241107 (https://download.01.org/0day-ci/archive/20241107/202411070828.lNrPGy4S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070828.lNrPGy4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070828.lNrPGy4S-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: net/socket.o: in function `sock_ioctl':
>> socket.c:(.text+0x1846): undefined reference to `wext_handle_ioctl'
   ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
>> net-procfs.c:(.ref.text+0x27): undefined reference to `wext_proc_exit'
   ld: net/core/net-procfs.o: in function `dev_proc_net_init':
>> net-procfs.c:(.init.text+0x97): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
