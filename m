Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA54279DC3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765423420; cv=none; b=bgorHOZKxo/S7x5FR35Ny9ojpXuZnHINdfHsDdizuoV2alOjLiJ4T0dn3ML3xc1rGe3Hz/5wCWzJXMY3pMMg+XyD+HrlL2lujUyMYxr8IGiN3RvKyXlnAzrmd0dxSHsIsr7p2TC18UbaHqGAnKFrFgJN2cMLeZ16Z6ui9eS2Ew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765423420; c=relaxed/simple;
	bh=m9xSjZs9daXsmjhc1C9lXCeyMldcvhIHaM7pL4dpt80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NpRkpGLl1YiylZARS8YU/UOFKKat1xbnDeVFUOk34cs2I1Of+vCxACdhYnNy9vh16P6LzGosSwNDFFOrf8TsAkvfVMAHSiXRXrnBWHZ+YCiH5DiiJJXn2v/ubq9buUeX/MyhCTCygv8EotE3kNtyrLN0ioxpGpkBetyf2dMpMcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQLZSKrz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQLZSKrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765423419; x=1796959419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9xSjZs9daXsmjhc1C9lXCeyMldcvhIHaM7pL4dpt80=;
  b=RQLZSKrzjbRMjs9gnXqmjl9v7r2HTU7Crx97EUTyjuqYZy7ouBIsQkzN
   w3x3kDN3TRsxnTJ79zdOksJlm8jx50XyICmQL7VC/Ilf8L5tIy1J42Ipy
   XTNaeCsLOoXvQ/2p7x4SdNavR32pr0/GXq9qEwVHppkED2y1sqDEfTahc
   UDdYfiltPg3tOtbYAj29mGd+3UAQSjm2/SEAFIViLcyRETmkl7LDFFogr
   +z2xIdyBNZ+Tuf9VfpTRWbkWSAS0N/0YS2Cx1gklCqlfsxhXvebn/dqZ0
   N3dKzl2S5OfkEoHEz5gui1ybM89VochSexGinGtJKLQKbbUDK2YJBRHs+
   w==;
X-CSE-ConnectionGUID: MQ1VMpXRSuO2Ye0echFOEA==
X-CSE-MsgGUID: nXSCFWQqTzCwvcVuILHcdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67338872"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67338872"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:23:39 -0800
X-CSE-ConnectionGUID: ILqkfc+tTgusauypMFZtsQ==
X-CSE-MsgGUID: o6BMqnbFSky/a8qj3jKKUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196576233"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Dec 2025 19:23:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXHD-000000000tU-3J8b;
	Thu, 11 Dec 2025 03:23:35 +0000
Date: Thu, 11 Dec 2025 04:22:50 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] htmldocs: Warning:
 Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202512110423.vhKAHlXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31d0ea3bf1bd93e960f341e4da1ff033eacefab2
commit: 44bd8d48687633f2db2d10e687152ba61273db47 [3/3] docs: cgroup-v1: Add IOASIDs controller
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110423.vhKAHlXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110423.vhKAHlXu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
