Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181EB23C4E9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 04:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772770317; cv=none; b=ZYPZperjcCi5DYG40EEVO20K0lnAKvXZMo9jBYOT6wHeSqFgTb9VcjxN2xyDa1u6uYUMnCsls3pl+jutkjLPBJqqzCo85zHUM8NW6KRyTeQgdRh79aGcP9ACKanqyyby25hYrhcd05LhW3QRNDqzoohb0OuhFCQtRNxWdIctUWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772770317; c=relaxed/simple;
	bh=iAlZVufoXy2b4iQYPE/V+bZgjnhOYLQt8OWUXaqThDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GqUCpIZ03U9JAbwsXyYN291y0jog1fb2/+6NpiuClS3HzJf07TyWKepo7pf2lRDO5rifu1aupOP7zmguj45VCWaF3KxfU1DS8GDWo/9DecRjbj2nSUTCDXqKELUJPLaEVV0h9/sHRZwMb+pRzYhG8qgoym0I6CWNefgzyJdWUrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4CBAypz; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4CBAypz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772770315; x=1804306315;
  h=date:from:to:cc:subject:message-id;
  bh=iAlZVufoXy2b4iQYPE/V+bZgjnhOYLQt8OWUXaqThDo=;
  b=h4CBAypzX91ahLDd9c2rswuSFEeDr82h6xGu2fPTIBFlV4Gpn57uxWPM
   itwhcYpq2So16hvH5obAlJtWPxIpZmRGTjwDNg/JboJyMu6VCfHEowLXa
   5I5e+btYnUNSEyGvlZ7Wl2sxSUykXehQuoYCpg4bFCmooiQkLv4DyJ29k
   nLB5m2EwJB2z7vJcrLeApcZE2MJOHRPKx99Scp17UEhN/dFd6Z4hbS8GZ
   GwfcY9PHq2xLsFIZZyv1vUdeWaGDLRej3wifj2m+OvGz6S5G1icbJtnSB
   QUpCjx1UxwAgl60vutNu8ni5i4wkpQZ4Ss091rI40zo4YGz+vbZoD+3in
   A==;
X-CSE-ConnectionGUID: TYVOqkX8RVeG7r626955iw==
X-CSE-MsgGUID: Wfkz81mnQDidBc8Qoy6RQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84508701"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84508701"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 20:11:54 -0800
X-CSE-ConnectionGUID: 0B5PrmLKS32zFZDkD0cjkw==
X-CSE-MsgGUID: X32Q12sVRIKDWrmoQiL5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="216060023"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Mar 2026 20:11:53 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyMXW-000000002Bt-44Fr;
	Fri, 06 Mar 2026 04:11:50 +0000
Date: Fri, 06 Mar 2026 05:11:12 +0100
From: kernel test robot <lkp@intel.com>
To: "Pierre-Henry Moussay" <pierre-henry.moussay@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 3130/4342]
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000
 (microchip,pic64gx-mss-top-sysreg): compatible:2: 'simple-mfd' was expected
Message-ID: <202603060519.TkotroOy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f9cd19e764b782706dbaacc69e502099cb014ba
commit: a3c02b37a6316c5dbb918a836a43ac8a37e7a0be [3130/4342] riscv: dts: microchip: add pic64gx and its curiosity kit
config: riscv-randconfig-2051-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060519.TkotroOy-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060519.TkotroOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060519.TkotroOy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /syscontroller: failed to match any schema with compatible: ['microchip,pic64gx-sys-controller']
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:0: 'microchip,mpfs-mss-top-sysreg' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
>> arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible:2: 'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: syscon@20002000 (microchip,pic64gx-mss-top-sysreg): compatible: ['microchip,pic64gx-mss-top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd'] is too long
   	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
   arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dtb: /soc/syscon@20002000: failed to match any schema with compatible: ['microchip,pic64gx-mss-top-sysreg', 'microchip,mpfs-mss-top-sysreg', 'syscon', 'simple-mfd']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
