Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2A1158859
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 23:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713223457; cv=none; b=RS/gs2xhnxdEr0PP+eUZPZo0DatvqRqEJYg27EAMZ/82dMjPZKa/iN9w02Su9eP1KgXoHXwuK36pNC73F9hIP0Zd9wwQfifXpFBbHfwwQTynJD7tQ83JKxDMP8HjkvirB4pIuPMWbkQ3DrHVr75FdGixivL8t4qiXhQGCS4qYL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713223457; c=relaxed/simple;
	bh=MRE9yPm+qzkCF+cMch2EEwoRY0wCxek4AvUtjBaZ3U4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gtwbVFmo8yq7cwA8eLXAoEiuzM1WNnOkceTiyBXZSqSrv+80xEL9fw5I+D8Hj3ml1YjofDCgdSgpqw5PCgctGfGJZ6lVRbsEGJ41BDOsDvti+IFlTQTwCIyruGqZZ4Tsih34oUf2Lf9PekHzheAB/A2788xIOGgx+ApCuqwarqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDUHKf0w; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDUHKf0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713223456; x=1744759456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MRE9yPm+qzkCF+cMch2EEwoRY0wCxek4AvUtjBaZ3U4=;
  b=HDUHKf0wLV1lnaCEkYryp8/4rsIznRVRfwDZBoeyLUVhYGKhYeSh+uMV
   WbyRWzsc/BQrmNO6MgQ2jpKtiCMFNaaZRKSkumW4XOB3JXlreFeAhUR9N
   kQ/NLnl+oMoxEvb03ID/rNcImAyXcWqQla2izXZV0nkfgLhJWgUEvrenw
   NjRxeZ+yqjz96GYQGaOuOic0+VJ3mpBAyfWg4NbWOjXLQaqXI8mYpiVxu
   e93lIlxG5cKOfkrZabFspjKHYIm2ZY/iFIJW3KLW8FwTujl+65sAvRx6w
   04VwvYOPxnxIYRZgp3elbKep+l36+8HiHD0AyCsTZmXwQ7hKgQ9izObAU
   Q==;
X-CSE-ConnectionGUID: pjIUHGq1RUit49VOMPlXiw==
X-CSE-MsgGUID: /Cfl+cJ3SSqPjULuVO0+mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8763974"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8763974"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 16:24:15 -0700
X-CSE-ConnectionGUID: 7FjwsOBxTZeonPEirn888w==
X-CSE-MsgGUID: RhNZItSHSY6A6TYrjc1l4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26494441"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 15 Apr 2024 16:24:14 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwVg8-0004iS-28;
	Mon, 15 Apr 2024 23:24:06 +0000
Date: Tue, 16 Apr 2024 07:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 9206/29883]
 io-pgtable-arm.c:(.text+0x500): relocation truncated to fit:
 R_AARCH64_CALL26 against undefined symbol `io_pgtable_alloc_pages'
Message-ID: <202404160752.kguAxD5w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   b598c719c03c1a2b1c34af3684d5cf7de0c5576b
commit: 5ab49e4b85a45bc4dab45785d90f1b9058289588 [9206/29883] ANDROID: iommu/io-pgtable: Allow IOMMU drivers to allocate/free page-table memory
config: arm64-randconfig-003-20240416 (https://download.01.org/0day-ci/archive/20240416/202404160752.kguAxD5w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160752.kguAxD5w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160752.kguAxD5w-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `__arm_lpae_alloc_pages':
   io-pgtable-arm.c:(.text+0x500): undefined reference to `io_pgtable_alloc_pages'
>> io-pgtable-arm.c:(.text+0x500): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `io_pgtable_alloc_pages'
   aarch64-linux-ld: io-pgtable-arm.c:(.text+0x5ec): undefined reference to `io_pgtable_free_pages'
>> io-pgtable-arm.c:(.text+0x5ec): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `io_pgtable_free_pages'
   aarch64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `__arm_lpae_free_pages':
   io-pgtable-arm.c:(.text+0xe14): undefined reference to `io_pgtable_free_pages'
   io-pgtable-arm.c:(.text+0xe14): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `io_pgtable_free_pages'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
