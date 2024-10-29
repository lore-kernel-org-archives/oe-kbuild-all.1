Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C031974FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730218598; cv=none; b=uIyE89YGnFh6cCKuyqe1BzwpNDRJhR6UWr61JfM38kFypqjltglWTIrwzw8CWSUotCidVm2tHZJplbmQQ/+yjzUjcFhDMkz/K+TANfpWsI5ortrcT/pXnB3VG5LQlDFObbZPiGgtQzTt1/Oh4GPHbRK3YOkgvGdm+GhbwxJVjgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730218598; c=relaxed/simple;
	bh=pxtiCkL0ccOEA8/9U5wCIl1YZ8l5UHauFy7tueK3lRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=evOzzEqO354jzLwfSdRE2ywDHk9VmQM8aVehlAhSGTaCBhxcAODXEc1ad2iGnrSB4TnyidmfuxjCzK3pJ9FPkPApFkB6SLuBjsZxNh+tzyIttjIvNXAHsYE9EjSUT7hplH6mm7fWxsW8d8dL6MWPgOreFL6ef1FSq9T1INf0Foc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHPk7P8w; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHPk7P8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730218596; x=1761754596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxtiCkL0ccOEA8/9U5wCIl1YZ8l5UHauFy7tueK3lRc=;
  b=BHPk7P8wZm/hkHTsriEO016q2IjtTtENRcoCE2fVdSeiNpJ1SJ6M/wOT
   yAQgUFdvoT3/oM25P6C9hs+5cqB655aeZtPyyqRZk7YC0NZEoyiwl8R8g
   g3yTv7LvZj9dMi6B4IDbMIoDF5c+bx2ZSElJVzfsda69n5qaOfSiwrgVv
   DLQxFVymJ4pHKSZlCjWEIefo2cQ3MTgZRc2+J1Rg6LIpGSuJknCsegXNz
   oC1tNr/LlQPASaYiWXgXkLn2r9fARO0Yd7ENEIkBAHqrknop6YVHgHUPp
   84SYsMK6p5RNLDQ0PzDikEkzxCPcObqntEJhfXsb5thtrhDgV1D8lf5Zm
   g==;
X-CSE-ConnectionGUID: O/3DTLOeQoGK7VdUmAeklQ==
X-CSE-MsgGUID: 39fIqVnpRmicL24TPmdldw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40455588"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="40455588"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 09:04:09 -0700
X-CSE-ConnectionGUID: EieAGHdKRI+zWoarrK/0AA==
X-CSE-MsgGUID: ZaZYssB1QF+SBYiOrDL6OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81634353"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2024 09:04:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5ohR-000drK-3C;
	Tue, 29 Oct 2024 16:04:05 +0000
Date: Wed, 30 Oct 2024 00:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 3378/30000] ld:
 sc2731_charger.c:undefined reference to `usb_phy_get_charger_current'
Message-ID: <202410292300.tUxMxPTj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sandeep,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   ca48ea8b94307a011f58fdc6efa124ff7f5508f8
commit: f7941b37ab1c4cc0a85a5617d32495908c3d08a2 [3378/30000] ANDROID: GKI: Enable CONFIG_USB_PHY for usb drivers like dwc3
config: x86_64-buildonly-randconfig-002-20241029 (https://download.01.org/0day-ci/archive/20241029/202410292300.tUxMxPTj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410292300.tUxMxPTj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410292300.tUxMxPTj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: drivers/power/supply/sc2731_charger.o: in function `sc2731_charger_probe':
   sc2731_charger.c:(.text+0xcc5): undefined reference to `devm_usb_get_phy_by_phandle'
>> ld: sc2731_charger.c:(.text+0xd96): undefined reference to `usb_phy_get_charger_current'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
