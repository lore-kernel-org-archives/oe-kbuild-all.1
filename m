Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A239131E49
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 02:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782094252; cv=none; b=sC1GbNKYb/R9iI6T1qQHAfs/iOGeR7hLYVSbm3LtdBonOgYOjiaeIcvv5mtkrtyRYQAvBs5Li4I2Dl2ngFm9IJdlhiTSiv+KsdWATKWTR7hW1YuD5lWb1CIRf4i9JCooUi4KM4ZfloOO8KWFrFkMkYX7TGP18y/SDESWJRrhz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782094252; c=relaxed/simple;
	bh=0xYF9nbd5QNGJLv8yuuGp/3LfBxhv/PyxvUizuwAEF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A3XVb50KqfqH9wyM6TV/Si3pDLjfzVexzgySGQmiwIlMybYqI+hgdIA7w0SmukL8HEoDwxHedFQdTGjM3lvvNXn5wolUR72o+7lYVZoZuWcuDLWAErKFfxayZUZ3BEDKLoJOaA6gc69Ozv9TSj/8Y0taNvzK245w8I4Hhdjlp9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i951tw+H; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i951tw+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782094251; x=1813630251;
  h=date:from:to:cc:subject:message-id;
  bh=0xYF9nbd5QNGJLv8yuuGp/3LfBxhv/PyxvUizuwAEF8=;
  b=i951tw+HQOXtgvdHD/mLDYTSSP3ul8mMscnuEKmotoC2miuLdZGlUXuh
   VaidmSEAzE+tzjn2oUbspPPUmTr186hpVbjpyaKamNbIijPWcofydHyzd
   a9BLZxDZmKl6LIecJRK85Zoi50Z+VAxgMa2DwyJy6d1KyaFyG/uYKc2xl
   2lbfCsmt7g+Is7DejIsYqRXjgJqVUL5xNZwWDM5o5jc8EmrRzK/+8DSU5
   kbHpe8XQHLkYq7SBBexKJR1J7U7iPIBieAHvNkwy13Qnd7WQuCOlwYveu
   jitS6dtZts8f3AdbyUsuNbLRWkm973c7xoRhJ5UmX/lQQAEbSODQiUPlZ
   Q==;
X-CSE-ConnectionGUID: /5xIQzOuR068yeD/6Ma7xw==
X-CSE-MsgGUID: 9mQGmX4SQ1ugRg5yYomsnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93937067"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="93937067"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 19:10:51 -0700
X-CSE-ConnectionGUID: l5gJzgHQSiiaJ3bsPyTNJw==
X-CSE-MsgGUID: fkjLgr/FSnS8lWlHHZSOng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="287218964"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Jun 2026 19:10:49 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbU7a-000000005zN-1h7d;
	Mon, 22 Jun 2026 02:10:46 +0000
Date: Mon, 22 Jun 2026 04:10:29 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/27] htmldocs: Warning:
 Documentation/userspace-api/ioasid.rst references a file that doesn't exist:
 Documentation/driver-api/ioasid.rst
Message-ID: <202606220410.f8hTF1yA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   adb3ec6f94e47cb5edefdc73edd6eab1dde70fef
commit: 0ebb438216c3881f28b16c9e29df4f27e1a4c50f [0/27] ioasid: Add /dev/ioasid for userspace
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260622/202606220410.f8hTF1yA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606220410.f8hTF1yA-lkp@intel.com/

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
