Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17A730CDA6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770672604; cv=none; b=gIZwWNLyS+HenvLQnvHksb1oKxHRz7r4TMvsu7gvoz7VqauX0Wx2X4m62gwLm1AsBNbwnSRtBhYaCHAXZptckzJ+lUFBZfYs7Ch8Uq8V+IuH6p1Ts30fe8uFVdsxP3FIzPwtN79ZTvQK2FCm4/vETrh+dJarygCwfJn7cHpaVMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770672604; c=relaxed/simple;
	bh=Us+2MHluE3BGP3bFG4N4scT+W4VoLSEALY4nk0TikuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ob6Y9q+rpi/Nm6nA21icxRyU8w3+gEcfxQ3VDK3olBe2jDw9aX2+A5t6R+nh5UBB4SMgtU7TuAxp/Rizt8NtF5OiMvAdXp/63JL7elS69fzn7y1GjKEH5puy1TKHxNb+pAZBIM5cleIUr80osd77cSxBcY5a1oAbpd/5RDhbQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyP3YUKB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyP3YUKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770672603; x=1802208603;
  h=date:from:to:cc:subject:message-id;
  bh=Us+2MHluE3BGP3bFG4N4scT+W4VoLSEALY4nk0TikuA=;
  b=VyP3YUKBI6GtBuEal1mVrOdSceIr2e4hQ8LS0pkBgG6miOtVcDu1Tqsl
   pEx7fwmg1gkbDLNdQzGQr0yz6iM/93JqlF5MQo7XY/a4IS22pN8Xi8SQM
   oab0PltDNXMDxHYwqUKq6AWr5ofNNibXOPWk/m7qykaiYJs+ZnX/rSmvw
   nhV+X2S5nEXmJECxfoHG/+dhjODZh7NUAL32TJw4Dw88fOEYKhH6NRyE3
   MiIV4r1kZEgaO7uAWCnCB3jVY/DSbX1pA8L424hX5Js/opIm+MqCmC+By
   0JOktMS8wMt34/k2PFt2wfoxNZnlGNMxWXP8fPA60mR3GAAbzlO1KsyVE
   A==;
X-CSE-ConnectionGUID: Z0eOfIs4Rtu8kP+71SW/9g==
X-CSE-MsgGUID: 133q2bmGRlu1YlEh3TFVxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75418874"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="75418874"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 13:30:02 -0800
X-CSE-ConnectionGUID: 4EUxd3e+Rc6lTipPDYVsOQ==
X-CSE-MsgGUID: Cfci7JmlT5qR45XyKiHFaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="241786639"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Feb 2026 13:30:01 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpYpS-000000000TR-1z6E;
	Mon, 09 Feb 2026 21:29:58 +0000
Date: Mon, 09 Feb 2026 22:29:51 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] htmldocs: Warning:
 include/uapi/linux/gunyah.h references a file that doesn't exist:
 Documentation/virt/gunyah/vm-manager.rst
Message-ID: <202602092235.YephaU1M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sreenad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3b54985e12634723f50be663b001e0f03e8643e1
commit: c47ab53e5d6f4848cd52e1ba39e3bca4625e1548 [0/2] ANDROID: virt: gunyah: Add gup based demand paging support
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260209/202602092235.YephaU1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092235.YephaU1M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
>> Warning: include/uapi/linux/gunyah.h references a file that doesn't exist: Documentation/virt/gunyah/vm-manager.rst
   Warning: mm/cleancache.c references a file that doesn't exist: Documentation/vm/cleancache.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
>> Warning: include/uapi/linux/gunyah.h references a file that doesn't exist: Documentation/virt/gunyah/vm-manager.rst
   Warning: mm/cleancache.c references a file that doesn't exist: Documentation/vm/cleancache.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
