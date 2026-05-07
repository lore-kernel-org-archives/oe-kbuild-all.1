Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBBA39DBD9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144269; cv=none; b=hS3Oz4QdMbMvmJ1yzRCe6L15G0SzlvlF+X5EbQiJ8gBdD3ZFufN5yRo1bElqqXj8PSA+fzFjxHBye05+Kd6A3PP8dHFfbhFJa1ENQSSxHSPVWtu6i0OVkCLjPdXYsMkAGoI/mkJbtU9srj2eVqQwAJnytbuCcNuXqE+RnOQ/dDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144269; c=relaxed/simple;
	bh=+Yq4r9xDlPrRp6OX5y0FoDoKhsRp6aiRAyui6nAYPwA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YtMe8J7mrtJl38oYSF0lem4xO81itzSBOKoQ7WkTgdyygPHrBCItGFZTRMD5vEArzg7maQIcBxy4vTX4RMAQsZLS3d9GnbzIAAxc0EODhDMDVUIDRGJ8opmRT8djeAg8YpCQ472CUBy7lW6y105fA1KS6hFQS5xX33AuI0XFw1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iihHtZLd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iihHtZLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778144263; x=1809680263;
  h=date:from:to:cc:subject:message-id;
  bh=+Yq4r9xDlPrRp6OX5y0FoDoKhsRp6aiRAyui6nAYPwA=;
  b=iihHtZLdhw262rNlt9xwNKjg4/DavjiPsNWriIIqOW/ZAF9mWU+cQzhn
   /8C10Yq7lDaQYFwbiafs+dSAh2XAPfVoPXz1z87N8Iful+ehx8YT8CWE6
   3im5hR5SC+O1Al4TIiOYxyR7rJn+fs1ZQ9dHR18VbDBgTZEJBbx57luN7
   OblOkr75Tag4bR+nupEjuJPaAfKUwXzYfuK/uyrBNEB6aWfcYN/Nsq5l4
   zuPTOoQ8lJuIWll8KM+q1Y+sXHRoRWL1EUG1XhoIcQOCLikk/xlMo5Syv
   NNchlNvnO6AAJgobiTJsrpEmAbuB+izf3pJ9zSW5Rt+aVysR/CQt1PuL/
   Q==;
X-CSE-ConnectionGUID: HJxa5DWuQtWzV13Tox5vCg==
X-CSE-MsgGUID: k8P2DQGrSVCrKjCVfqiRHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79106328"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79106328"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 01:57:36 -0700
X-CSE-ConnectionGUID: KCGUx5XSRLqTlvL6sJPq1A==
X-CSE-MsgGUID: k3vrhmlMSrqWDSIxkRJYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233744831"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 May 2026 01:57:34 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKuY0-000000006nz-0ZFL;
	Thu, 07 May 2026 08:57:32 +0000
Date: Thu, 07 May 2026 10:56:46 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/20] htmldocs: Warning:
 drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't
 exist:
 file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
Message-ID: <202605071012.dsjNzOzU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi nebula_matrix_driver,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7869ad90f786f903dadc68707ecf94fd3e89b98c
commit: 059837f47f887848d0068cb0431354e8e1197e44 [0/20] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260507/202605071012.dsjNzOzU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071012.dsjNzOzU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
