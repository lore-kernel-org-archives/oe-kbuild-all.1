Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9A2D6E72
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 20:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763671859; cv=none; b=AQhRtoGWXCnLL+Rtljws9TJsxcaZtrmN/tirLETtO98ILJ2CSWDREaN6e3/VIJO1zlBneAffmi4PeYaV/+1PHr6ioVQw/XEdwgltimvXLBs+EgsUIT9LDw/v2bptJ215f9pUaFxmQP+hAsRym8AWZmvQ9pe0BIXMv6RUSyngrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763671859; c=relaxed/simple;
	bh=qbC/CYWBpjtsvGIAp0XgFLCVwxlgqsqo5ZLxFv6vJy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LeST7P3AWBWqlco9kuGr2g53c/bdWeXz8vKaS4Y73Y0lMpgpggNzKRVwtaLQA1ANHpRsKEwvxlsNLRvT9c6h98ttfr8jR78gJ/eK4d8/h4+JjJXdCXgZhWGGNPvBLEvnNqi63LGmCxoEEPPlcKOxbu4ERe9kUQjLqwODD7Sh8wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8b99jPl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8b99jPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763671858; x=1795207858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qbC/CYWBpjtsvGIAp0XgFLCVwxlgqsqo5ZLxFv6vJy4=;
  b=R8b99jPlSi+wQGv0EOywe5XhSEnFy2ekxn5NmOZXur8I4T745JRDd+yi
   TQ/kMyOWvkA6PLl3wBfj0sM3XZJSpDgZJ7Pca23Xt190b5cTZH83HMK5U
   4Z52miR09KPU9SMvUlxnIVLBtjFIe+kDL0M8O/Do1HMcKYUJm1Xew/GKf
   oL6xdjvRiqH97snakB6/ExLezK68QGtvHWfnZ9AA4kK7AQpnCRXZJKrtt
   FayET68C1zck6+10bXmIkaBIzOqSxrRO1CtyKMbW2KXCJj5uNdF5MiUIJ
   RprjWyPc0FWHz7ETQacmj8jKlMRMA8he6pV0EL8tIklcUgZi9CbUBi5U8
   A==;
X-CSE-ConnectionGUID: dmd5MlVbTF+nOXOoCBWKRA==
X-CSE-MsgGUID: uXKpIvJRSMOdVjofNfIiOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69624201"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69624201"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 12:50:57 -0800
X-CSE-ConnectionGUID: oFBs13coQgODFW2RKV4M5A==
X-CSE-MsgGUID: PAUk6HpAS+S/HL9lWwf3EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="190708272"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2025 12:50:57 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMBcE-000000001XP-1OlI;
	Thu, 20 Nov 2025 20:50:54 +0000
Date: Thu, 20 Nov 2025 21:50:23 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 0/1] htmldocs: Warning:
 Documentation/admin-guide/sysctl/kernel.rst references a file that doesn't
 exist: Documentation/filesystems/devpts.rst
Message-ID: <202511202112.eQrjVLGX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   0a4bf073fa3fffa4289af31c9bed4311b7e20589
commit: 42a9a7e807505b485f7c6a7ffb0ffb7dab8e1b51 [0/1] random: always wake up entropy writers after extraction
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511202112.eQrjVLGX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511202112.eQrjVLGX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/sysctl/kernel.rst references a file that doesn't exist: Documentation/filesystems/devpts.rst
   Warning: Documentation/devicetree/bindings/cpu/cpu-topology.txt references a file that doesn't exist: Documentation/devicetree/bindings/riscv/cpus.txt
   Warning: Documentation/devicetree/bindings/timer/ingenic,tcu.txt references a file that doesn't exist: Documentation/mips/ingenic-tcu.txt
   Warning: Documentation/driver-api/gpio/driver.rst references a file that doesn't exist: Documentation/driver-model/design-patterns.txt
   Warning: Documentation/hwmon/inspur-ipsps1.rst references a file that doesn't exist: Documentation/i2c/instantiating-devices
   Warning: Documentation/kernel-hacking/hacking.rst references a file that doesn't exist: Documentation/kbuild/namespaces.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
