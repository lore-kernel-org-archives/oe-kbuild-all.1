Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6E535CB7C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777025105; cv=none; b=czCMeRn4Tj9m/Hv1XrPPc0SG5lg6MLdw8zzVgdtRpRqehf0MVJGbCazCfhIlJdrnyWvdUYKbqh+JVHjAy9Rzyy3DLnWsKp2E6K5FpqidEl67ydYxFQziU7/MtE4dSEuN+LUsPGtn+jnhdtKp6sjlGJnoQJz4idOL/FZfdRwyLsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777025105; c=relaxed/simple;
	bh=gKErl1PMcURmDnt+Ptn/XlskVzHDoAWCGfg6nqBLQRE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C6TofZWHWm0AWihohU/Wn0K3ne9UOR3nwrNMC09ihbHfQKzuruO8mqIb1fixKnSgCj6hO6Iiy0T58uY4MJCfB0xPdxEA/9M0sllqhfU1fR+WssSVwWrBc7y3QhPxxxkkSTWB1gS3c7n3nnRcTpiBzlEwrwHjBKE8LZ+d9+CdIow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnjuhbXE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnjuhbXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777025103; x=1808561103;
  h=date:from:to:cc:subject:message-id;
  bh=gKErl1PMcURmDnt+Ptn/XlskVzHDoAWCGfg6nqBLQRE=;
  b=YnjuhbXEkgLd+rOsyN7cc+fbNUPUq7qu+9u9GtwwAp+fmJ7pmmzTgYlV
   oOQ4JzpjO6A4DlM9dwU5QFt3ZFjS5YGqd6jmyW+hg/vmJpdAtlofUGFGq
   Fzs6yT2nKD/KEGVj3cm6xQpU4/Ke9s4AotANQiXGkY4hhVLSL9j7F7G4n
   L+OnR9O5lq/M0SB+mblH+4omCFbm0O8DxxWTHqQkfCBufUfNUymyD9vPt
   WGmDIleS9iURDYtv21+bBmDnHtJ/yxrL98G1oe4Y67290yFxbTX61sMuM
   kEgZH2Sk1ykpH4V4qQwg2Mto8D58b6xYPiTQsC2d53+oj4RQQAfgOPpqh
   w==;
X-CSE-ConnectionGUID: L2g0wnZZTlWG2HtgPrSBGg==
X-CSE-MsgGUID: jBy2tH7yQQCefeV7MezBTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="95564944"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="95564944"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 03:05:02 -0700
X-CSE-ConnectionGUID: x0O8R7UuTJenetARbWHslQ==
X-CSE-MsgGUID: 2FfdScz4S0GJ/kNutOt8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="232056309"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 Apr 2026 03:05:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGDP8-000000003Er-3ld8;
	Fri, 24 Apr 2026 10:04:58 +0000
Date: Fri, 24 Apr 2026 12:04:44 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/2] htmldocs: Warning:
 Documentation/userspace-api/ioasid.rst references a file that doesn't exist:
 Documentation/driver-api/ioasid.rst
Message-ID: <202604241105.0YvqqBNo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e5b00516ece60ce220f481acdcb970b904fc28a7
commit: 0ebb438216c3881f28b16c9e29df4f27e1a4c50f [0/2] ioasid: Add /dev/ioasid for userspace
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260424/202604241105.0YvqqBNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241105.0YvqqBNo-lkp@intel.com/

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
