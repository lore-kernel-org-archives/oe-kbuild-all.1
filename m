Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D123B61B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765424262; cv=none; b=HhM/XViRhpOfJ+JUd6BhZ6ainKy3R2k5XWbCZAr2kcklGpuzgY9sa1LdkkOAIk2QT99PrZJw+PKK6nKskbQoV3qyA2t08HXW7RBt8i4ZZrz33aDZf/D6iDmkt12a3mQu/09ts+3gHEnMTgXz6pWrP6zi2bWAY+wGCaI03Pw6wgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765424262; c=relaxed/simple;
	bh=PloDeouc4OCbsOBBfF7Y8qbxKqdHqqlgz5TQVHDsxpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbks9BMcOMojNsCkm3ul+ScA8VNaFJ9K0ilMfS4Vg7tivG5JPO3zInV1X0M16B6WKCa0t1Ocf3yLqT4edcZw6Thumh3e1kn1hjGfhX/2L1Gr/DA66pQmKkrGiv7NFUDmbmQFZc/W/BlfFIXpxm9Yaz13rXcYvkp8NDrft4PrRkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAi5VIpy; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAi5VIpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765424259; x=1796960259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PloDeouc4OCbsOBBfF7Y8qbxKqdHqqlgz5TQVHDsxpM=;
  b=cAi5VIpyq5xUKoegsSM0HxswyqwswPR0NjOBWLZka3BorIWKB8CFZfXE
   xVNBXPNI3pf20TENhPlab34iaZ3vmINYmuZ6kvsdn8QGuorJq+iw05jCr
   b0BVUblZCpZVrh5e9JEQ8akVm3PGKSAVguzGhabozwzLSdVmjUNtNBp1v
   AaltczABVuFocLCRiT1gRmcQ7BhRlrXCUgE+Cuq10T2URHmwtDYtk1Reb
   mROklSai6xvdtuRB8GX5yF+OeW0J6giA9yDTX1AZblX4hcuaR4nKjZGyI
   QXe0jMXgeVBBVRFzEJaf1sY9b5EdYhicGqmS2qaYFE05HgrLOaUAS6RTE
   A==;
X-CSE-ConnectionGUID: bfLz22fDRWyTFOoJznnj4A==
X-CSE-MsgGUID: vZS7o8mAT7ueqm9Ws1bb3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78105778"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78105778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:37:39 -0800
X-CSE-ConnectionGUID: oVTDNkrQRhO8Tj/9DZhITg==
X-CSE-MsgGUID: tUuJF3ZmSC+9TdgtbeIMhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196290405"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 10 Dec 2025 19:37:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXUl-000000000tg-3v6R;
	Thu, 11 Dec 2025 03:37:35 +0000
Date: Thu, 11 Dec 2025 04:37:34 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] htmldocs: Warning:
 Documentation/userspace-api/ioasid.rst references a file that doesn't exist:
 Documentation/driver-api/ioasid.rst
Message-ID: <202512110407.7hbhXVFj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31d0ea3bf1bd93e960f341e4da1ff033eacefab2
commit: 0ebb438216c3881f28b16c9e29df4f27e1a4c50f [3/3] ioasid: Add /dev/ioasid for userspace
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110407.7hbhXVFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110407.7hbhXVFj-lkp@intel.com/

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
