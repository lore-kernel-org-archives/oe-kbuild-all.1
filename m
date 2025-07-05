Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B589211A11
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751739989; cv=none; b=JHLEqjWcYz6XQV0P8JVZPZ7HObUN4Mp7W90bzCx4+ECbBiOFExNX125iuefGlc32mxC4TG559S5+KA1bTriJHNQA8/Fpgg/pSPrH3w8BVL+cEaUTrhOrq+gLMINFWF/K06ybHYUvwjVLd3FGGDqQzGxzNIw+AxyEygIJG9mxmXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751739989; c=relaxed/simple;
	bh=Q9UW36d1bMzWXEdh1EPPYSh0Gw6r/cx4nnU2kAzRjgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KDFtKFxF7A08IX4o+mrEjEjOKH/FYTMc6CGXTBzSPfU7NL2ANyAdqjXf+L5dp6RS9pYQrEu3r7WC9CXMjtyytnN9OjH9rI6Wg9HMLBBVYBWLYZ0O2H92qO5op26Q15AWxPJKTKGJu2nHHJOg479WVp6EcOXfxlR2fAXeRaoBWog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBXDCbAd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBXDCbAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751739988; x=1783275988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q9UW36d1bMzWXEdh1EPPYSh0Gw6r/cx4nnU2kAzRjgY=;
  b=gBXDCbAdRKTKRVMaU9GJltc8V65G4HyqbPC4WZ+mWaFW4pyc91WOn//y
   Qy9sKD9w9zL5P6uwp49DWCbjraanShZQLAptqFhQ43LtB6nQCc15VMstL
   Rkh0iGYApT8YCvuQ7ISmelNNFtPGAXatiKLg8zF+TtwaByiabwD6NEJKD
   AdBmKoZ+bdrH0z20E/nj59gOI86rAG77Bs8bA4i1NU37mYrIfC+g0rR8D
   QWLDGDeUWyGs1bMTkzSqVucDVACIo/7pLjnSo/KD3ugSSxgXpdAjW3jSD
   QBrOGAt1Vz9+rjGfF/6ese5X3xkcr9D3VElu4ojq7Zxd7hyeTZ+q6JUHN
   g==;
X-CSE-ConnectionGUID: JEQFiXI2Q2i3QrdFpSnWyA==
X-CSE-MsgGUID: ifFPHUjNTPugia3s3qmFzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="54117056"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="54117056"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 11:26:27 -0700
X-CSE-ConnectionGUID: jLbOOLgXSU6ncPJH7CLjxQ==
X-CSE-MsgGUID: o5VlskQDQTymYMsg5wMdiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="158883294"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jul 2025 11:26:26 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY7ai-0004ff-0t;
	Sat, 05 Jul 2025 18:26:24 +0000
Date: Sun, 6 Jul 2025 02:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] kismet: WARNING: unmet direct
 dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
Message-ID: <202507060258.O1V1JHRl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   d969457e60e9ea507680a1751a06b04ed0e952fa
commit: ed1b6dfe39ba3a1a37a242d0ef4dfb7b5ec06987 [1/1] vfio/mdev: idxd: add virtual device emulation support
config: x86_64-kismet-CONFIG_IMS_MSI_ARRAY-CONFIG_VFIO_MDEV_IDXD-0-0 (https://download.01.org/0day-ci/archive/20250706/202507060258.O1V1JHRl-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250706/202507060258.O1V1JHRl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060258.O1V1JHRl-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY when selected by VFIO_MDEV_IDXD
   WARNING: unmet direct dependencies detected for IMS_MSI_ARRAY
     Depends on [n]: PCI [=n]
     Selected by [y]:
     - VFIO_MDEV_IDXD [=y] && VFIO [=y] && VFIO_MDEV [=y] && X86_64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
