Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A663B1A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 20:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726604618; cv=none; b=lHuc9zXSqlEbRJjzjSGdJTzCFpMUDqka2aHQIJIfNInduZwsqOdbk5R5f0gojFA4yFMLLs3zfqRwUU+P8W6JA8Luj82sPpJ6zhzj4i3m88yIdzSFf+CD267ERSH/3+Kh7JctR/4YMGDwNL3tG4acrfn5d7y8aGVJ6Ss4bWV71K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726604618; c=relaxed/simple;
	bh=RUyiyf6zXGR3OMEpJUx2Ee/25QPdmiZgVPkbS3lzPow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YR6YrLD8mzN+uwbBIDbxUMDORP4ov5QU8PUpPqpo+uVRM1dCMZUa13aXiWHXQqxYfBXJhL31AugNOMCvUkK/gC1J2kuQG0y07EWiKmbMKyrqvQRsx5J/LMzfBJiu4ELm6rNioTjOgt73Xo7Yj9BizJG/B8uNP4ITLR+wIGaCc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Clegy0Vp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Clegy0Vp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726604616; x=1758140616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RUyiyf6zXGR3OMEpJUx2Ee/25QPdmiZgVPkbS3lzPow=;
  b=Clegy0VpQ3rOIwX7Mc/OLFPCttgV5VAA4bpWS4wZq78abipTACnIlW6d
   iP1ewnaFvLErFa6lxRAUcNYXb4xc+KZGqvpYwJMOBkv0GKj+SqjJfwAMi
   WMC0xid6tsQ2n7nK9boK5Sqwfiea3j2/+yJXfQ7qfCz3j8nu/N/HuHOKA
   Omk/NGTHNuuUiLlXgaACKWjVFCeK6CWUHmPfg/qXrbGzC3Hcg5uIf2sF6
   zMFoyCiEsw39MQji3PDGVtoG3CNdkie05i1Oqx1/fh1CDecaTZE9O1E/l
   SvqThUl4c1Gi0bSvbx9ttms80beG4NUH9Za9qYGrjS1Qvhrj08orV1K+G
   g==;
X-CSE-ConnectionGUID: 9rRgZCk+Qd63YMmYu1y12w==
X-CSE-MsgGUID: 59SKbe2MToq+c8yer5T/gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25587358"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25587358"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 13:23:36 -0700
X-CSE-ConnectionGUID: iCRM2EnNTy6X4iYOo9UKhw==
X-CSE-MsgGUID: cpFuFEn0TOGeKKc83RKvmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69415126"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2024 13:23:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqejU-000BVV-2t;
	Tue, 17 Sep 2024 20:23:32 +0000
Date: Wed, 18 Sep 2024 04:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 4378/14977] htmldocs: Warning:
 Documentation/devicetree/bindings/display/imx/ldb.txt references a file that
 doesn't exist: Documentation/devicetree/bindings/clock/imx8qm-lpcg.txt
Message-ID: <202409180443.CHVnTF5e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   3516b574d9cb19c39dc921a07a37c8a2fcaf0009
commit: 0ffaa77a89f0e0eed90d8a67ee7f30bffd913fa8 [4378/14977] dt-bindings: display: imx: ldb: Add i.MXqm LDB compatible string and properties
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409180443.CHVnTF5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180443.CHVnTF5e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/display/imx/ldb.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qm-lpcg.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
