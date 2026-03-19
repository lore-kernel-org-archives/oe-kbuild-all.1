Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A7130F7F3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773907521; cv=none; b=ksxz7A2fPn7tbym8TEbaZ9uxfqGh9QqjMCgPgy6fARBzoQGqntX2aBY8Au4NpDBDVsJu9pbEsbB+KefWRseR/uqTW7wN8MH7UOp5kX5an8qaXqR4kvYPy0q1oBy5r+N1XxhmjgQ3iVXj4Vj4qg5mfyuvfaTfH2YSg6DdSNwM2wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773907521; c=relaxed/simple;
	bh=WEGeJbIGEeCsSDbvrIuja0FpPfOOznKQkAbkfCYHJBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eO6B9RyyalLB7FaRf5+FJ/F0Kd+L6+CYRoO0cpnjprZAn+KVIpgBPzVPIWldWZmQ88Nj1wKBcghczM0PmFsEypxUEuHLUCF2OQKFaCJwvlrDa5Wva1hyK+54tJhKyHx/HdZ13+VmXy6Ejo5lTH85FnzUKlKiLi6QGsv+4eMf7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOV6KchX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOV6KchX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773907520; x=1805443520;
  h=date:from:to:cc:subject:message-id;
  bh=WEGeJbIGEeCsSDbvrIuja0FpPfOOznKQkAbkfCYHJBk=;
  b=IOV6KchXYKoFepQqsyCgjdyCh9/4DcNqNsIwgBTwQtZcGsFfECcDVFdU
   81OUrb6tpiodJg0YABdma+SXQVgSRbCjvFuMih+9t6b1VRxRKfMKJhsAx
   8GfUQ9pWtJufNS1rkO7tgvNQqfJcGpkdyHz6TgFCgDaWbLBaJOXkJijQV
   qPPbPiXcePYYcjQdL0zvhsx+k5WfdaXIP01l8+3obudIH0XKmwHMYyOyK
   QT5I5Qp5UDO/WBojaAjXqQIGb+x8S05LVV05vL8pYrqXwBFJZfo4QRaSK
   dqDjVJXb1gshK27/0smRffOx8OJOwQ5sw3yV1QNSOZX8nfLLWY8erJ1tb
   w==;
X-CSE-ConnectionGUID: 330Z3fl2SUC0VLnLQEeVow==
X-CSE-MsgGUID: JjkrPgopSz6nJfSad55NKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85291801"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="85291801"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 01:05:19 -0700
X-CSE-ConnectionGUID: TQ9U72JeS9W95h8j4bMYpg==
X-CSE-MsgGUID: oELaJ79DR0uoweG/ekDt7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="247227289"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 19 Mar 2026 01:05:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w38NX-000000004nZ-3CI5;
	Thu, 19 Mar 2026 08:05:15 +0000
Date: Thu, 19 Mar 2026 09:04:49 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/4] htmldocs: Warning:
 Documentation/userspace-api/ioasid.rst references a file that doesn't exist:
 Documentation/driver-api/ioasid.rst
Message-ID: <202603190804.pQsEByBk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7ae03274141ace633a6e590dcce9b01cc2e9c06b
commit: 0ebb438216c3881f28b16c9e29df4f27e1a4c50f [0/4] ioasid: Add /dev/ioasid for userspace
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603190804.pQsEByBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190804.pQsEByBk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
--
   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
