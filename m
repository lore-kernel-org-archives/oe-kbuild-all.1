Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CC1C33
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 01:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709342540; cv=none; b=akxVAXiVw0XoJNcu8iBCWM18fR9V5PerBiNVQe98ctZjfhIUttkZXL1KbXfUR37bEl4dqQpwlXk7N9d4XnwthhahFbqbp2tnZTAj4AmyfBfq43LkNGQo4UnwI2rcJryAqj7nq4eMGWy/eZ755jtCbGkWSCcTEytg5wvgRfcSTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709342540; c=relaxed/simple;
	bh=vJjWwgoYl0owAo3AnnuLiADOM83BOAuP6Z2GS740FaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IhHCc6A6+MbnJou+OhgFQstkY74J1z4oNeFX+HmICemW1I39EkQ/Kqq+uVtYkPVYdRfctN+iUNNBxGvHjJob95q0Nxqip8laKFNciYH8wRk1quMZtzE6qAb4CZg1W4T3xSfW+9njN+KEBSdPmkAH5Xt+Gv/ETzkV7tYY6vBj+Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUqoqw27; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUqoqw27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709342538; x=1740878538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJjWwgoYl0owAo3AnnuLiADOM83BOAuP6Z2GS740FaQ=;
  b=NUqoqw27WmwoEaMkaKgICYX64EclZ8ntL6cnHY+V4jkZRNX/BkIkN/QX
   jMW0FwLC+XbpZ8eBwY/sMagiHDd+tcCtiRnVcgysQZ2RZMkTGcZ2TOEBD
   lmY65Zht1HSUZ/lGsHXFxKslgrfO7gRlnaX98ikXhWcp8PoiO0HG1s0bW
   MVymqIHjRJhZNDxCSoAMjo1xlDVqc7pxZ9RD3WUys00xZB1+JNgGCC16o
   OJu9nBlI30zinu2/+bESCk4g5Nh9JqNnhQp1JYWvkubY7SLY+0ifoHq0V
   S755PEg4MN2WV5LfBMzr1489/okxrQFJec3XfWAw8oyovvD4W44BKpEup
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="7673714"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="7673714"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 17:22:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="39209645"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2024 17:22:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgE4q-000ED7-1S;
	Sat, 02 Mar 2024 01:22:12 +0000
Date: Sat, 2 Mar 2024 09:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/stream 1/505] htmldocs: Warning:
 dist/templates/kernel.template.spec references a file that doesn't exist:
 linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt
Message-ID: <202403020903.H6E6fUPe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/stream
head:   2b873b2992933f043ba28fa9cf5a6ce69b52f668
commit: 5b560cc3c5e58a2fea708845a43517d6d8b4468c [1/505] dist: initial dist file commit
reproduce: (https://download.01.org/0day-ci/archive/20240302/202403020903.H6E6fUPe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403020903.H6E6fUPe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/networking/device_drivers/mellanox/mlx5.rst references a file that doesn't exist: Documentation/trace/ftrase.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/j1939.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/misc-devices/xilinx_sdfec.rst
>> Warning: dist/templates/kernel.template.spec references a file that doesn't exist: linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt
   Warning: drivers/media/v4l2-core/v4l2-fwnode.c references a file that doesn't exist: Documentation/acpi/dsd
   Warning: drivers/net/ethernet/faraday/ftgmac100.c references a file that doesn't exist: Documentation/networking/phy.txt
   Warning: drivers/net/ethernet/pensando/ionic/ionic_if.h references a file that doesn't exist: Documentation/networking/checksum-
   Warning: fs/cifs/cifsfs.c references a file that doesn't exist: Documentation/workqueue.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/kunit/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
