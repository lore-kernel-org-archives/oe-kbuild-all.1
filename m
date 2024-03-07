Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E966C81F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 06:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709794431; cv=none; b=IMPjdVBDZUooG1pgiXDFpPCYG4F+Z1cWj2cqXCCWi6O/F2Xmuzn5w5tSbRjVeNqI5jC1dIxl6POS09FdoG0m6lpz3rhWCDwm54NhRlwNzLWtC9Bf9fJFh+pH+nBkBlaIzCs6vKyfPyD10ntNR3HjVUi4zP8hsHWEZQFZMuUZddM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709794431; c=relaxed/simple;
	bh=tfWIqxAwEVakhPl9wq+MtTm8Tdx+lKZOe1C1ztImePY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ln1i8cUb3Ob1Ce4zumeIXRuh7PdIJk5ddkwzjmVGTbGPmQQtB76V2QbF6KRGSoSstgSDb83I9w3f1zrLFp4ktbJ9kFJzQwxSR1OVbuTr3uTnBdBuJ20+UVoRwzM36CVlyfKywaRfPdf9LV1G6NbxGTOxcBMRQwxdWvP3zVkWeqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nt0jZw4Y; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nt0jZw4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709794429; x=1741330429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tfWIqxAwEVakhPl9wq+MtTm8Tdx+lKZOe1C1ztImePY=;
  b=nt0jZw4Y2yG4cHROaXUVAgSPR9+tL/C9nO/79cGx+U2vfvovlWy5SCW6
   dpcC2EYTqn8w+9lO19kRUi+B75Y7jdpdytpRXOoPf8oy1Ph9LP5prENUN
   WDgihLtkjadfn9yinrXviAzI7lxW4C+No7bW8XcN73dwsyWf8jHhfNzy4
   I7DA03Ik42D7F4jUCL5EDvVA/ZucmoO4VLjHEPvHGiMYL+KlBJUpV0a4S
   YwvzDdPPO4gTbC8hoUSCG8XlUx0IxwZT8pnUPGFu2x2RbzlSfHMGtrMrF
   M0Ti7NJn//W6Qwxt/waqrs1qJl8iz/ty1ymF4bG//vQOO9O+yMh4Sh4wB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15587780"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="15587780"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 22:53:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="9918328"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2024 22:53:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri7dQ-0004uL-2t;
	Thu, 07 Mar 2024 06:53:44 +0000
Date: Thu, 7 Mar 2024 14:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 6086/21518] aarch64-linux-ld: ID map
 text too big or misaligned
Message-ID: <202403071400.bkgSZPrc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   6872638c2ef3e7439a7f074a8757cbf3060db80e
commit: 57f3ff9648991998d008ecf32f2f9e78a08bfb8b [6086/21518] ANDROID: fuse-bpf v1.1
config: arm64-randconfig-001-20240306 (https://download.01.org/0day-ci/archive/20240307/202403071400.bkgSZPrc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071400.bkgSZPrc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071400.bkgSZPrc-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
>> aarch64-linux-ld: ID map text too big or misaligned
   aarch64-linux-ld: fs/fuse/backing.o: in function `fuse_handle_bpf_prog':
   backing.c:(.text+0x51d0): undefined reference to `fuse_get_bpf_prog'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
