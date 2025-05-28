Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099528C2A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452595; cv=none; b=CeowxBEYksrjmGZY6bAFmfyEAnQ2gMA8Sxibp9Fo3fSNdtGzsx90vpuhWGUDIus5xbnpMmgxhDkdoDHZE/tPs47ASX5MWxKS2+dfKe6GRpYNCvXmLF0tGwszGgpROlQRarL+dPM71073H067kt+rL8qP8Ldnz6HOx7QeEhLOrDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452595; c=relaxed/simple;
	bh=tduqZ/CJFhWFzmrr9fOX8JQcbOdcRL7V1rEr/cybqDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQ4LezrpiK1V025mJ+uOWThCQT4HACdf3yX29i6ejf7nBLQrDffdHLQ1aWtViAo1ZD2O5s12jwP/IzdGHVZk1/yBC7iA1yOOeixekG9fzDyKGAQRS02Y9wt1xsiiOwfxyT6R2DlwTENLqHsKgVUiJCINATp5yRh0yZOqpRTJIaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6oD2Tpl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6oD2Tpl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748452593; x=1779988593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tduqZ/CJFhWFzmrr9fOX8JQcbOdcRL7V1rEr/cybqDQ=;
  b=T6oD2Tpljlr/0cKboFi0Zv3OHgp4c+FUTHEvl0E01N9tPyxt2eOLEFFS
   BK/378maThlyP5pvPNBY9gGCg+q1bwT2wuBz42+tkRFofC6ppQrb0kh2/
   W8VzXEzbVzY6D0kGe9WptvsFjrXbzrs5OzykZTxr2A4s6Jt5GYWGu00fW
   AGqrj3hwZ0WWTwaE8r5da7xMnRhjkE+Zhb/mn2hVLoRtax3wDZoTsPevr
   YHobva1LuXNTsywFKZcWsqpGZHKbH1rx4GMpO1EJGL/ebdkOKBZm7bW3Y
   jzKw+nw8NXgiQ2fCsg7Yt2Oyi0HkbSe1RktlhaD8jrax0E1mjfgOrW4K0
   A==;
X-CSE-ConnectionGUID: gOt2lVEuSaGrIwsSRABuWw==
X-CSE-MsgGUID: uSRCbNj2SQCA+WmNFXA9bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50595968"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50595968"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 10:16:32 -0700
X-CSE-ConnectionGUID: 1rOaaxqtRBumgUEGscoxvA==
X-CSE-MsgGUID: mogsiH3aQIOBKClT1Gum5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143212840"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 May 2025 10:16:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKKOD-000Vvo-0H;
	Wed, 28 May 2025 17:16:29 +0000
Date: Thu, 29 May 2025 01:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2329/2329] arch/arm64/kvm/virtcca_cvm.c:810:5:
 warning: no previous prototype for 'virtcca_get_tmi_version'
Message-ID: <202505290152.me3JXaGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66b0cef2a959be1562a528e3d8cc260dc3803e61
commit: 86b9cab8c4752eb46e3ec038325aee5686805c69 [2329/2329] VirtCCA: an interface to retrieve the TMI version is added
config: arm64-randconfig-004-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290152.me3JXaGE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290152.me3JXaGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290152.me3JXaGE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/virtcca_cvm.c:810:5: warning: no previous prototype for 'virtcca_get_tmi_version' [-Wmissing-prototypes]
    u64 virtcca_get_tmi_version(void)
        ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/virtcca_get_tmi_version +810 arch/arm64/kvm/virtcca_cvm.c

   809	
 > 810	u64 virtcca_get_tmi_version(void)
   811	{
   812		u64 res = tmi_version();
   813	
   814		if (res == SMCCC_RET_NOT_SUPPORTED)
   815			return 0;
   816		return res;
   817	}
   818	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
