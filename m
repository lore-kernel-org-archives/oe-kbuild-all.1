Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4C52BE47
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 21:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766380; cv=none; b=j+CnSYHvx6yn4JJW6J57fJulFT+ajj3KA3TGp3S3wS+aizA1XDD8QmCJ3R3DoRLyDu7gzkj02UEGA/WTvTn3cIgiMkKn+8ziS0bZ4lQHyZElVZOMfbMpFi0J3lvPb0qXadh+iQJuCzyyg4YL890SHyx9EjonuoCbzTZDCB/vAac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766380; c=relaxed/simple;
	bh=U7l5mivh8gmJ0BrMDPQApB36xs9q0017XDHa0SOA4Dw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WaozUPU4j5WJP7kVcj9FBkFDji15qJ3zDQqPL6P714S0IjFmzxBcKh8wyRZwdfQSvTDZU1Qs79oqgnmVhU94FwsSIVSitvJx9fCrYkqMDSzYXQow4gvndjGhAbldEFcMf6Ca01ROVZacSrWg3pZIwzX3gbc7k62LmVCaEqhTjZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9qoaEFx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9qoaEFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789766379; x=1821302379;
  h=date:from:to:cc:subject:message-id;
  bh=U7l5mivh8gmJ0BrMDPQApB36xs9q0017XDHa0SOA4Dw=;
  b=Z9qoaEFxxCXI0Hk0sD76ypTLUeilD756m1rvfK7xz6qTQCS2tDwG2F8z
   w7IWn0NFcDNDSvEKhvV3vWS+988fxNPYWA0xFWVAUc0JHmfQrSXrskCk1
   TW1XhlKhtL1n+YRkR5bkQtRN+m6EBd3G3YiqtTmOxn9gsBwVM3TeOHY4G
   vCh02/sd3X1iu88QYq68/pqWSSW9Medft3KNddpEPsKyGZrtY8vDGwQ0p
   +KIm82GhuzkAePpv4zWQd4dV0jJCf3eB/U0dlUJrs/qlF1WcZ6VsRED0e
   St3JfER3DIEBOnhV12GSIeB7QyaebiBTPhVtrCP5haUnHYDLnGxMmK3NN
   g==;
X-CSE-ConnectionGUID: raM8DFDXSLWUWP6XuRbJ5Q==
X-CSE-MsgGUID: QmW6DJF6QvixhywCuBOkbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101649413"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="101649413"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 14:19:38 -0700
X-CSE-ConnectionGUID: 2qEGrn3IR9y+D3fwpxOEew==
X-CSE-MsgGUID: lxFD3YR2SbiftY3c2YhwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="276548162"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Sep 2026 14:19:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7fza-00000000ALV-3pXr;
	Fri, 18 Sep 2026 21:19:34 +0000
Date: Sat, 19 Sep 2026 05:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/2]
 drivers/crypto/qat/qat_common/adf_isr.c:128:43: warning: taking address of
 packed member 'status' of class or structure 'adf_accel_dev' may result in an
 unaligned pointer value
Message-ID: <202609190537.B3RFOTVl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   263b10a805c674d459d56d22ffe205ade744fe7e
commit: 218c2836b3987f3fa1d9eac505462cded0821e4c [0/2] crypto: qat - fix VF2PF work teardown race in adf_disable_sriov()
config: i386-randconfig-1005-20260918 (https://download.01.org/0day-ci/archive/20260919/202609190537.B3RFOTVl-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190537.B3RFOTVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190537.B3RFOTVl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   clang: warning: optimization flag '-falign-jumps=0' is not supported [-Wignored-optimization-argument]
   In file included from drivers/crypto/qat/qat_common/adf_isr.c:6:
   In file included from include/linux/pci.h:35:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:14:
   In file included from include/linux/percpu.h:6:
   In file included from include/linux/preempt.h:79:
   In file included from arch/x86/include/asm/preempt.h:7:
   In file included from include/linux/thread_info.h:39:
   arch/x86/include/asm/thread_info.h:185:13: warning: calling '__builtin_frame_address' with a nonzero argument is unsafe [-Wframe-address]
     185 |         oldframe = __builtin_frame_address(1);
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:187:11: warning: calling '__builtin_frame_address' with a nonzero argument is unsafe [-Wframe-address]
     187 |                 frame = __builtin_frame_address(2);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/crypto/qat/qat_common/adf_isr.c:6:
   In file included from include/linux/pci.h:35:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:13:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:1136:6: warning: variable 'nid' set but not used [-Wunused-but-set-variable]
    1136 |         int nid;
         |             ^
>> drivers/crypto/qat/qat_common/adf_isr.c:128:43: warning: taking address of packed member 'status' of class or structure 'adf_accel_dev' may result in an unaligned pointer value [-Waddress-of-packed-member]
     128 |         if (!test_bit(ADF_STATUS_IRQ_ALLOCATED, &accel_dev->status) || !msixe)
         |                                                  ^~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +128 drivers/crypto/qat/qat_common/adf_isr.c

   119	
   120	void adf_isr_sync_ae_cluster(struct adf_accel_dev *accel_dev)
   121	{
   122		struct adf_accel_pci *pci_dev_info = &accel_dev->accel_pci_dev;
   123		struct adf_hw_device_data *hw_data = accel_dev->hw_device;
   124		struct msix_entry *msixe = pci_dev_info->msix_entries.entries;
   125		u32 num_entries = pci_dev_info->msix_entries.num_entries;
   126		u32 irq_idx;
   127	
 > 128		if (!test_bit(ADF_STATUS_IRQ_ALLOCATED, &accel_dev->status) || !msixe)
   129			return;
   130	
   131		irq_idx = num_entries > 1 ? hw_data->num_banks : 0;
   132		if (irq_idx >= num_entries)
   133			return;
   134	
   135		synchronize_irq(msixe[irq_idx].vector);
   136	}
   137	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
