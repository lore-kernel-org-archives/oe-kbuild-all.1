Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE96920E702
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 00:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311629; cv=none; b=hUpW+xFcDmPIdRgKg+P3KcnkFSsIxAvV30eEQ3YMEIH01OtFGav7Qr8dtn4GwPffm36uB1sxkt6FcZhm9Rmui3l0K0i9YrTMjNYFExBGn4zZh4TxYYbemeu6EF6Hvcm09OXbJx5Do+7e697AG1kIT+O9zgvIbz+GzG0IeVH1M6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311629; c=relaxed/simple;
	bh=nBP5eoMK+EAlJt5NiF4rhkctIa3ZFXJatAu1IoWrH9s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sqmbAugH4YnmQfUWu3faS7WeM5z5a4ayQ6ab+cPTembzoNO65nge5oY31SDZL2TGIAFMKXtrzCzyV/Md2YAQaNyJzzyUKuJ3NEhVSp9/b36F4bPDxxb9qjApZczvkdxwCuWOrBcXVEo3F8pi4fDfUb9kQj2f3GSzLvPctJJHtN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1hVXbuI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1hVXbuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774311628; x=1805847628;
  h=date:from:to:cc:subject:message-id;
  bh=nBP5eoMK+EAlJt5NiF4rhkctIa3ZFXJatAu1IoWrH9s=;
  b=G1hVXbuI/6xzT/eE9EU3JuRa10iHFSyTWZnUvBSYlL7IpZ+8H1V4Az7W
   KUFZ+BQrWe7B/bSjeXOjeISjf3VN+Ebz8hfFogd1TG6pQROZsJgc9uUgG
   nGc31j3SVS/2+vkPkE5fNxDOYvXXP5/USVMWxW5YLq3ynjN8uVu/caAVP
   BlQLimFajbgVbvjxXnmmkwib5eS6lhfy3EBwgmaxEtl5RKDuNeracO69n
   t6dpcZHIopLwwjYcITRfCgrdCQkgkp5nG0Ta8p2WQe25H73dbENGSFRP6
   NjsOoKcCaAW0xFKMgGNTuLQW9jNkg7Z4RZP/vyeTGybF/YJNBopPG22Hm
   g==;
X-CSE-ConnectionGUID: w5bgmpySSieFbT0VDehbiA==
X-CSE-MsgGUID: JRyOukYmQ16p4NAXmr0VTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92698640"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="92698640"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 17:20:27 -0700
X-CSE-ConnectionGUID: 0Fbp2+l/Qzu8PDdXLPG3ZQ==
X-CSE-MsgGUID: edmUol5HST+DV02tTTLPWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228254250"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Mar 2026 17:20:26 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4pVP-000000003Qr-2T1o;
	Tue, 24 Mar 2026 00:20:23 +0000
Date: Tue, 24 Mar 2026 08:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6430/8143] pcie-mediatek-gen3.c:undefined
 reference to `pci_pwrctrl_power_off_devices'
Message-ID: <202603240810.8hpFk4my-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
commit: a2b2ca0c2477a705822f3f60724883d88000a4ad [6430/8143] Merge branch 'pci/controller/mediatek-gen3'
config: sparc-randconfig-002-20260324 (https://download.01.org/0day-ci/archive/20260324/202603240810.8hpFk4my-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240810.8hpFk4my-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240810.8hpFk4my-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_remove':
>> pcie-mediatek-gen3.c:(.text+0xa2c): undefined reference to `pci_pwrctrl_power_off_devices'
>> sparc-linux-ld: pcie-mediatek-gen3.c:(.text+0xa40): undefined reference to `pci_pwrctrl_destroy_devices'
   sparc-linux-ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_device_power_down':
   pcie-mediatek-gen3.c:(.text+0x129c): undefined reference to `pci_pwrctrl_power_off_devices'
>> sparc-linux-ld: pcie-mediatek-gen3.c:(.text+0x130c): undefined reference to `pci_pwrctrl_power_off_devices'
   sparc-linux-ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_startup_port':
>> pcie-mediatek-gen3.c:(.text+0x1988): undefined reference to `pci_pwrctrl_power_on_devices'
   sparc-linux-ld: drivers/pci/controller/pcie-mediatek-gen3.o: in function `mtk_pcie_probe':
>> pcie-mediatek-gen3.c:(.text+0x1e38): undefined reference to `pci_pwrctrl_create_devices'
   sparc-linux-ld: pcie-mediatek-gen3.c:(.text+0x2088): undefined reference to `pci_pwrctrl_destroy_devices'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
