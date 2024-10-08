Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0509A1E04A9
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728413947; cv=none; b=EyWnQCy8pjxsJDrL5Ee521qKF31siXXnpuNyEm5m77nNhPlGQDK0NSHwXQDl25Vr0dxVR+UoUzcZ957WzgBoDTZZqmb/ezURyGkVrb6c5HPt6QHC/F+4G3/DyzaTI/me5wNmQ0Iw+kwod43cJuNaGTz+4UTFjfZ9bVMi3lkKw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728413947; c=relaxed/simple;
	bh=yWZ6w62qxj0aC3nwZQolSNUDAezgvijNV59Gi5bPtXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OCcQFgpe8fS4RrGmeaa4C05TYN/DFHI1f/Jj1R8QHwdf4b07bIUiLXdhXP+I6XfOPfYkjccmckKykfPnbHk80lXOcVJt9MjpF7o5smSG6bn7dBai3BIHUkpNRlQAAy42flnxq7bUfprah4YpUyAGFlQPhGCI3BVSn/9zoC2obm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBdsHUdJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBdsHUdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728413946; x=1759949946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yWZ6w62qxj0aC3nwZQolSNUDAezgvijNV59Gi5bPtXo=;
  b=EBdsHUdJWSDqzoSgqlvEBQmgkQqzDDxUXvTRS2guY9d9RlYxqi8dv9kP
   Y6asiaPUea/okIZ6OQ5P8w9kYiu7scj0XHLaJhnNqAIsbyIKs3gevyUTt
   mvqA5eNaKKGJ1yXLEsf18NTIL5c7J1YNKYOEgkYAmMtE5wpvar7FN8bir
   KJ/eEf/NfJbPhwEcyV4tBjYACCRPrxa4NQKY/sAVEsgGc5FY0emFu7SQq
   8vpPU5SWsbphws3uNHpoT9CqO9ifw2Q7egyanV/5eSUTdbhxJkHbaHJSy
   dNtWHMvgY9LlRt9f5T7DnOd8LDQOLwGjWy4nLXFAq6HJ2uuREB09rPrhy
   A==;
X-CSE-ConnectionGUID: AA5gygRkRp+yjcy8qtpKEA==
X-CSE-MsgGUID: yQ4hSqC/SWWbLyC/SoXH8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45114447"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="45114447"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 11:59:06 -0700
X-CSE-ConnectionGUID: tJTDwJCxQqWgzVPygnte2w==
X-CSE-MsgGUID: SkPwQCrBSIeIw7c839GYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="75635312"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Oct 2024 11:59:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syFQE-0008HQ-0b;
	Tue, 08 Oct 2024 18:59:02 +0000
Date: Wed, 9 Oct 2024 02:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/nv-next-fruit 14/18] (.init.text+0x10):
 multiple definition of `init_module';
 drivers/usb/host/xhci-pci-core.o:(.init.text+0x10): first defined here
Message-ID: <202410090251.UkeM5Orj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv-next-fruit
head:   b77bafbf581d2b3a47072976dca8055250e314d1
commit: f8fca2a4374113358ba1e9ab01e3422dcd091834 [14/18] Merge remote-tracking branch 'asahi/bits/150-xhci-firmware' into kvm-arm64/asahi-base-6.12
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20241009/202410090251.UkeM5Orj-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090251.UkeM5Orj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090251.UkeM5Orj-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/usb/host/xhci-pci-renesas.o: in function `xhci_renesas_pci_driver_init':
>> (.init.text+0x10): multiple definition of `init_module'; drivers/usb/host/xhci-pci-core.o:(.init.text+0x10): first defined here
   hppa-linux-ld: drivers/usb/host/xhci-pci-renesas.o: in function `xhci_renesas_pci_driver_exit':
>> (.exit.text+0x0): multiple definition of `cleanup_module'; drivers/usb/host/xhci-pci-core.o:(.exit.text+0x0): first defined here
   hppa-linux-ld: drivers/usb/host/xhci-pci-renesas.o:(.rodata+0x3a8): multiple definition of `__mod_pci__pci_ids_device_table'; drivers/usb/host/xhci-pci-core.o:(.rodata+0x64): first defined here

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
