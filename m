Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1557C179AE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 23:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710631628; cv=none; b=CRO1gheUixrMwMnoQtT2IZq+QEANmifzblbH45KhdEqol8sJjRYs6f+KkilDmVHxbSDP40uUdFqDsFABULYEivx5YyMzZx8xUkLiVHF+zadm2RxOUIJ1hMsx3JHDTyqtU8ax4yp8Nv2RV05r84chHPCL9t9IpOzdqoklZzN4o0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710631628; c=relaxed/simple;
	bh=CeP0RAq1F2VOkdfWSsKlniGTWuiNENIM30Z9/KdcV+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R0YxWpDVkF3fzDFMkxyG+9Yulltw5ZMFg3mWongkiwQ6Ajm3wbUi9Q5fS2fD0A4tNXCySygA7MOqD8qJI+QWV1lhRuIQymbCAvzOa+g1oU6PP2xZ2ksNzRoBm5nOebxQDepyv9ha7rrwN/2zsgjCnl+PiHB+o+iSHm57fSlU3HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IO5SgfEU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IO5SgfEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710631626; x=1742167626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CeP0RAq1F2VOkdfWSsKlniGTWuiNENIM30Z9/KdcV+Y=;
  b=IO5SgfEUUG94dIO5fGosKlFWfaEZI3s1R1q8dqb0LC9lnBSUnkfn1vPh
   01DvDhr3kZApgLzNZ7m9wnPyNW80/zLzMAK1tWW15oOPKw2F9yP/cXDaa
   KweFyGI14M3Ap2W87L2Ud1x3F3smdBy9+i3x9NjFSRJ9+2BIESouaEPhp
   oKCN1F9CUo+a3IPV8w9Tj8W/tjWgRHWShoYwwBbE+u2+Z53xS8WjfiGWa
   IbcQOYv5Jt8j6p0VUTvCi5RYrNNR2XQBma1i4PxCttMDI4DDxG6MixLy1
   yWqAmcv0taPhgTMMNjE5mftAsoF8MZpySkpTASml6uVO0fbzsbh4+AlJA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="22941383"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="22941383"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 16:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="13031286"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Mar 2024 16:27:04 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rldQc-000Frh-07;
	Sat, 16 Mar 2024 23:27:02 +0000
Date: Sun, 17 Mar 2024 07:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 262/9335] ld.lld: error: undefined
 symbol: wext_handle_ioctl
Message-ID: <202403170715.6MOC1lsD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   083527b0f2eb59482d9a8d37da790bc9fe728506
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc [262/9335] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
config: x86_64-buildonly-randconfig-001-20240316 (https://download.01.org/0day-ci/archive/20240317/202403170715.6MOC1lsD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170715.6MOC1lsD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170715.6MOC1lsD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: wext_handle_ioctl
   >>> referenced by socket.c
   >>>               socket.o:(sock_ioctl) in archive net/built-in.a

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
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
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
