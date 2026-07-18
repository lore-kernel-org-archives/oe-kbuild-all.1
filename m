Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1696D175A84
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 18:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784398948; cv=none; b=skaIGTg+W5c7VXeVyxXgIy5bHke58Cw4h5akmk+6MBcCzTBX9CxYcfqWi/ZYIkhr1XMogR3PFSn3UZz0KaEJjb05WShGMRQK2rcvpwCjsqdqfj1rGQxnZwmL1yqKEqAxfjl5aC+zSL/NInh2+cJCKJmu3hlMREOR9tTyZ7m92gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784398948; c=relaxed/simple;
	bh=tguFR9XdJBlBePdYEfbCNqFDCqW398/s4fAlKKA/L6M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mdvm01UWgsa6hpAOeH9KwZfAwZCV513u2bO8Lu4QubN38/IgHBGlkz9MnOpNK+kzce+vzrVkrVtZ7H8/fM97rM8tg3TkZUHFVijzzR1uLIlzEsPCE15klNhEk3BARgt/NyF31pWHl1Qal1BhUcqXZwCQOGSggTiT95xPgAHaVI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kwnev8UF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kwnev8UF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784398946; x=1815934946;
  h=date:from:to:cc:subject:message-id;
  bh=tguFR9XdJBlBePdYEfbCNqFDCqW398/s4fAlKKA/L6M=;
  b=Kwnev8UFDPVPr1s7Y7IGEEEX0KQxLamN6sivnO0kKTGVjGWAi4LAhFUF
   p4BF+HDuuVYPIjpUQlq9/IHKkInxeWF829obYAEXjLygurh2IA1ZBzMsh
   bsQbS0q+kHz9OYf/zMgccNmP4Z2ZD1TPsFwqr1/iRJpw4BcXkYHkLTtqK
   DG9RsH9y4GtXd6iw4scUHZiV6jS7qclcTkGPPZHS+9a+YomboTElU9uF3
   yrA/VN/+1p5BG++oX995KF1wnEyxZNnSZyCYNRRX12fZiId0p+3VoEGJP
   BmK3H3zzN6FbmOfJfc+UCRu/J7zukk7v1baIUSTc4EC4+aAxSyaOXi+xF
   A==;
X-CSE-ConnectionGUID: GRWknmWIRwCb3JQt5AYIiA==
X-CSE-MsgGUID: d0wWlyJjRY65lDo1++i2mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="102462389"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="102462389"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 11:22:25 -0700
X-CSE-ConnectionGUID: UMHtuh12Qq2xSmFyedwcYw==
X-CSE-MsgGUID: FEKEojcXSe+b4PCCA3G+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="254439216"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jul 2026 11:22:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl9g2-00000000V0o-3vn5;
	Sat, 18 Jul 2026 18:22:20 +0000
Date: Sun, 19 Jul 2026 02:21:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/12] ERROR: modpost:
 "vfio_file_iommu_group" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202607190247.rIQ7K8Rj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: e43f03eb172d7e8ecac55bc3f9547c18f436ea82 [0/12] ANDROID: drivers/vfio: Call KVM directly
config: i386-buildonly-randconfig-001-20260716 (https://download.01.org/0day-ci/archive/20260719/202607190247.rIQ7K8Rj-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190247.rIQ7K8Rj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190247.rIQ7K8Rj-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "vfio_file_iommu_group" [arch/x86/kvm/kvm.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
