Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3629552F68
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709630024; cv=none; b=E1tQvbPv+RD7UZzakhUi6ZPhpjlRi5HohJnhdhOPgghMEVL/mZyIoCDnKSGLFH1kFwmRRdmM4nZ76wLy55O0UruEYDVVK1mSDxC7kAAqIar2eEUROsAcPvMRxVsK+EdwWNi2oDUjozgSlINjOUgtjTNn8t3+KbjD0jvc+24AJUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709630024; c=relaxed/simple;
	bh=0mCvEy1AokZLhuF6TTshoNg4ZEAGmJNx6bxSpiOQeJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KW/yg6yugLmIC1dFqcqRbIkyEGYj0VmhQDwUtEViXAjNbQhLWFpFyG4yXTZq9YYPI1MXKsQkKxLOosg2GJ93A0jcsWuFqfIOpzYg314cqzfP07esT6eT3qFrltmceJVhUJF4Yo6ozuP3UzA6hWb8ey3D7TTZhnHQJkZkuX/iQcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YohH7ZWO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YohH7ZWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709630023; x=1741166023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0mCvEy1AokZLhuF6TTshoNg4ZEAGmJNx6bxSpiOQeJs=;
  b=YohH7ZWOeQcFXcXOt4vcxVphaIHUufP+cL0CnfYUAYw2HbItynNDSHQq
   aN0YLo33kIxKP0awoGvufx2M1TIC7cmLwKYnV27umc5Eq7Px1P4d4wYBb
   lk1uDvfHF8EYbpPJTi/iTUgoXHjXxiEmLk9SjEpDgkPI788exJccvlDsH
   qDkyMXhgTz2uPavKaSQ2FyUe8OcXMkeeVOUVYlY91afvJd4BRccH15g5a
   +8UonBhLmrITKa0jET3z1lETxkxIpzsdmfUBBmb6ils94LmVnzdQ/Tx8K
   I2kXF24ZLFDyZCWe1+C4M7NZ0NhDw7+RmHuuA6I5Wn5PLhBc3gRaihZKm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4028140"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4028140"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 01:13:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9889010"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Mar 2024 01:13:39 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhQrh-0003Ar-03;
	Tue, 05 Mar 2024 09:13:37 +0000
Date: Tue, 5 Mar 2024 17:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 27135/27434] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/admin-guide/perf/hns3-pmu.rst
Message-ID: <202403051723.xewM7pGO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: 9fccb4c15c116b600044b087443ad679abcb8b8b [27135/27434] MAINTAINERS: Add maintainer for HiSilicon PTT driver
reproduce: (https://download.01.org/0day-ci/archive/20240305/202403051723.xewM7pGO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403051723.xewM7pGO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/kernel-hacking/hacking.rst references a file that doesn't exist: Documentation/kbuild/namespaces.rst
   Warning: Documentation/kernel-hacking/hacking.rst references a file that doesn't exist: Documentation/kbuild/namespaces.rst
   Warning: Documentation/mips/ingenic-tcu.rst references a file that doesn't exist: Documentation/devicetree/bindings/mfd/ingenic,tcu.txt
   Warning: Documentation/networking/device_drivers/mellanox/mlx5.rst references a file that doesn't exist: Documentation/trace/ftrase.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/j1939.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/perf/hns3-pmu.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/misc-devices/xilinx_sdfec.rst
   Warning: dist/templates/kernel.template.spec references a file that doesn't exist: linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt
   Warning: drivers/media/v4l2-core/v4l2-fwnode.c references a file that doesn't exist: Documentation/acpi/dsd

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
