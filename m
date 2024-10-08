Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F8212EFB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 20:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418874; cv=none; b=GiXYSy7YIOHTWVRmf8YFRGdjmf263J4Ndhv/eHkt1WMv7gRoyIykPRHOxEyxDgrP3/6/AsbW0CjMwr+S3jb/Bf1gd+/2Xo5qfpd91W1RLfWCYEtBNBStQPgf1EZY888o7sppTOEKitx6LfMNcxQELZ/3VVyQdnY7axrqFAaX3Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418874; c=relaxed/simple;
	bh=RNE6bi0xfVuts1PuupWS9r3k1f4Xl/5rydWexvuybEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aiLm7NHxxgXdmE6bTTr4S+jDXQ0cZn+PWQwQqKcGGVFlNb7GgFfnLzdxXXUG32GYiVKXJIMN5yiQBPdek/tYHICD6C8ckM78E+cVCkEs3w4vgjQ7UK5H270LiqcHcZnNNiNysrW1BQfd78M9uj3IuM72+CETldQc1aLgS985qHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hzyt8ggk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hzyt8ggk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728418873; x=1759954873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RNE6bi0xfVuts1PuupWS9r3k1f4Xl/5rydWexvuybEw=;
  b=Hzyt8ggk7jC6TRvuAlRVtQCRB6fkJadaHnbkgXm6JfiD/+PezZXNIy9X
   dsywWHOp7PXwmv0sHvc15Xo2EuPm5Dl5mptCI4ZLMlDcOIfcof5h+jkJE
   SVGMt+CeZChyODqv87Up2HzPxFpW2an3LyyHrXTLL5KhlXs0IxzOg83Xp
   9JrHjfx4BtL/Hu46q1KAOCwp9Vlm8KVl13ekpV57AjQlQHGqcIB5hma9O
   FLTrR0MWsb7uMaBZhcSi+9h79bthsWxsAM3GLyUJt2xyo7qaB30FkiPqJ
   8YwaaEN5MU18c7uie97ZGvnWDiLoj9QWNuA0Qa+hQu7I+McfrZANawvfs
   A==;
X-CSE-ConnectionGUID: hkbBV0mVRW6wh8GKRr+dSg==
X-CSE-MsgGUID: Nod2NjnYS8qrUKelo3MoLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27140383"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="27140383"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 13:21:10 -0700
X-CSE-ConnectionGUID: JS/lvmi5R6aHe7VqodjxcA==
X-CSE-MsgGUID: NsH1UYxYQvOvsP8d8movXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="80761629"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2024 13:21:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syGhe-0008LQ-1C;
	Tue, 08 Oct 2024 20:21:06 +0000
Date: Wed, 9 Oct 2024 04:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/nv-next-fruit 14/18] ld:
 drivers/usb/host/xhci-pci-renesas.o:(.rodata+0x3c0): multiple definition of
 `__mod_pci__pci_ids_device_table';
 drivers/usb/host/xhci-pci-core.o:(.rodata+0xe0): first defined here
Message-ID: <202410090453.I6ca2kLy-lkp@intel.com>
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
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241009/202410090453.I6ca2kLy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090453.I6ca2kLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090453.I6ca2kLy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/host/xhci-pci-renesas.o: in function `xhci_renesas_pci_driver_init':
   xhci-pci-renesas.c:(.init.text+0x0): multiple definition of `init_module'; drivers/usb/host/xhci-pci-core.o:xhci-pci-core.c:(.init.text+0x0): first defined here
   ld: drivers/usb/host/xhci-pci-renesas.o: in function `xhci_renesas_pci_driver_exit':
   xhci-pci-renesas.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/usb/host/xhci-pci-core.o:xhci-pci-core.c:(.exit.text+0x0): first defined here
>> ld: drivers/usb/host/xhci-pci-renesas.o:(.rodata+0x3c0): multiple definition of `__mod_pci__pci_ids_device_table'; drivers/usb/host/xhci-pci-core.o:(.rodata+0xe0): first defined here

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
