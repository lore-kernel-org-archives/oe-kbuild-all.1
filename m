Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1BA41F7CD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340160; cv=none; b=twm+wXx51JIyZTfZZVGpTRa0s72B4jo1oxRDIUpQCYtYrvlsQeM3+01A7erD/pQhzFdZt3h6Ctj1FGhkXKTBj9lAF9cibcpqTjJJBVQuCiem1ZwidCTdf7B4kVSeM3qametQlKLgmwwvF8grVJZaC7BkoXfctC+BhYGQ3jct8zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340160; c=relaxed/simple;
	bh=ny9/mbNR0nPQP29e9GF5BCK4u5ZPyuYtmZu6Nw2gMTA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JAoyh6M4bvMhxB+GomJFWmoLU3AeHJjm5D4pSgyu3A3jMSCSwL4UBNVDYJmFNm1vx3hBYsMSTbHMxEnNQXLocbjwbI6AHJcbaWtEHSmWNrsE9x/dvS/jTVl3WiYvMMdgAadtgJExNiEuWBO/ZjyVKK2kjQffuMF8NakW8lqtCTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eu9kmjEF; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eu9kmjEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783340158; x=1814876158;
  h=date:from:to:cc:subject:message-id;
  bh=ny9/mbNR0nPQP29e9GF5BCK4u5ZPyuYtmZu6Nw2gMTA=;
  b=eu9kmjEFoyhkxTIj6cd2JhpocporU35ka70+ltEdpJaV3pgvaAj4Wvsc
   ttkaUMntFK9yz2wtIEK1S/Ru3ULKzDrJzlzkPZ/wuBH5W7IyolJbbKL9D
   TafUZ4VKJXgcqibUoen0aaxUlhe5hqiiCsBcOJpj/CgGaU2p3qOSG4FdD
   JRTCDZpZT7LJZiTt6SWITJgnzLxLJ3yibt8CfLWEZU6xdj+gcjy33ElD+
   1Izay6WQBAruD+7A0aHksZXy4fSfEiICNbniw0N46pBwr1RJYBZtitS+t
   K0IdFhbEaBIDBTB7jYPWKdq8XuF7YxsSFPJjKQ5/rwnZnhHE80XDECHV/
   w==;
X-CSE-ConnectionGUID: 4ioGArFiSuaOtZ1DX3F6CQ==
X-CSE-MsgGUID: AzcEcy27RlGodjhnWwo6Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83744642"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83744642"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 05:15:58 -0700
X-CSE-ConnectionGUID: lqTaxcnQSwqtX6XyAnPwOw==
X-CSE-MsgGUID: WDvaUl58SdKDKgKCdAa5VA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jul 2026 05:15:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgiEq-00000000ELn-3rsw;
	Mon, 06 Jul 2026 12:15:53 +0000
Date: Mon, 06 Jul 2026 20:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 20/66] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/fpga.dtb', needed by
 'arch/hexagon/boot/dts/fpga.dtb.S'.
Message-ID: <202607061933.DX5LVMeR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   29facc8c3b3fe50f4914c90aec24a76217fa35c1
commit: abe97c987224d2686550fd938cd15c284c1132c3 [20/66] hexagon: update build system and Kconfig
config: hexagon-randconfig-r113-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061933.DX5LVMeR-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061933.DX5LVMeR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061933.DX5LVMeR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/fpga.dtb', needed by 'arch/hexagon/boot/dts/fpga.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
