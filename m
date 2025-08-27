Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6673279357
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 17:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756315025; cv=none; b=iY3y05312Ul1S7qX16BwJ2dL5gFjHaqTHGH4H4sqtdDHjlUglgA+oDy0C0blSy6TSN0X2kRXq57wkvxKOnYJSBYbiIJseh3q6ZcvGDLvzRcgfVnMjpM3yOxQCXPahKeCbllymBss4CKKRmPCtR3AUVp5Sw6x4xaY9wyNMWaDHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756315025; c=relaxed/simple;
	bh=x7yXqalWGwdb2iaWy8fnP12eW5fhdQHHz9k9oaHYF5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b2mujO5pFMJn7W1yz5IsHCh8yuPa9nEde/EfS2tGe5l7WARO5KldM8PoIe858Kv/sD3qb7b/J3XtKvKRp1PZJOY2h8/JrROPt2IIsdLvn/RQmwQvzceSlCl6xMA0hOLWOsAppb4UaYnKmtNb3Gr6CpSo6QGZlSvYn0ll00cxX7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLwhGWTW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLwhGWTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756315024; x=1787851024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7yXqalWGwdb2iaWy8fnP12eW5fhdQHHz9k9oaHYF5I=;
  b=nLwhGWTWI7QpTIjIVNK27q2/rdlabtlhPtdkeKbr7O7hNrX1EbBsUPua
   ZZBHFOUq2bhXbcqCjJsEX/qfsy3XRQdl/ay/Sv6wp4MsmQD1hgzyyYgW+
   BwgWvMrBom/12xMjWsQIyi5eE6bHq9tNAo4gR+UdOgsMwZuOoThkvlgeb
   prXQgniLzSsSZyBjuU6Fhvf8xdqW+pPj6J0meGrEbFjV3rvXmoVvtOyUD
   mxq/dXLwGFxA+b46vL0YaeVrFLiN6c5UhG9tpgynUg+m5K16FO4fwQgqu
   XokUDGKUODitVq7YAUgPFNwQr8Yk8U5Np0j+D8tp8OUj49j689K5SE/tt
   A==;
X-CSE-ConnectionGUID: oEJ+SSTLTKyhg5E0fpQHew==
X-CSE-MsgGUID: iQPextZWQSa+S69+6mxCzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58641563"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58641563"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 10:17:03 -0700
X-CSE-ConnectionGUID: Ph96KUSCSG2Q80PjCsTJHw==
X-CSE-MsgGUID: uhSdIO9TQk+Yx1e3AhJfHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174279672"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 27 Aug 2025 10:17:02 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urJlc-0002gB-04;
	Wed, 27 Aug 2025 17:17:00 +0000
Date: Wed, 27 Aug 2025 19:16:05 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 5/5] htmldocs: Warning:
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file
 that doesn't exist: Documentation/ioctl/ioctl-number.txt
Message-ID: <202508271948.MhyLYg7e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   ec0924f318b78f9cf68f73a94e22131d79f88bc0
commit: 64e8e83b98611ae1073a82656af3222b9037d4b2 [5/5] anolis: drivers: support for xsc drivers from Yunsilicon Technology
reproduce: (https://download.01.org/0day-ci/archive/20250827/202508271948.MhyLYg7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271948.MhyLYg7e-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
>> Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
