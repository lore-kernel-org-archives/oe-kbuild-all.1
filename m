Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B2116190B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724257372; cv=none; b=EJnJBcA4sP0BvwfFj9nz7IUDLFkvYM0OZ7BCXliXELlfJqotdnag7wuStV4Cfc3uKB/IJteVchJ5AgQ9SdjMm+PMi8MxcSVVT1fFTFnSMCuEFV/FRx508SU25UPgOs0K++U/b8Ke08nBBpCvJc4dLFSg8xKU5Rvs0+XZUls4Ll0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724257372; c=relaxed/simple;
	bh=l9lCtjCQ/ngDB6gbu6bx8+Kn/lSuq0HhWLoSNxrBwOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8R8k+jhNrVKNYp02xVHydbEcncA4XYXmFEoyoq4GdyyhoWSX7TiGgUVSD+BF6/oGvwCxwkJQQXNlM+Z8rcobA2YOQfN2XdWfAoGkU9V/GtWmNz1ZPDUUvt3zOU9hniGo9qzKwvb87/5L4SycACYjgu0w6dtyj2cS9+Jaroe1oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqTHyrm/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqTHyrm/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724257369; x=1755793369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l9lCtjCQ/ngDB6gbu6bx8+Kn/lSuq0HhWLoSNxrBwOE=;
  b=ZqTHyrm/LyRhDR6xv5YCEci8pFHL55SGeKsnyyKFPtnYbr2suLjv3CNu
   fyqQTkFgViI+YCdFZzZYjAT/TfjbdxaNgkO2uVHg96kyeEKUKU8KEO7mh
   K3JoZO/WV7OQeaww1Hav+LJEMk5sYFcSId6qh2tnPJ5if0FtXsp9BFJ3S
   rCnyceUq0JSNqsN6DOHgArVCdm9cvzVUdPEA8TUBPcBqdnHU4kO8RxWts
   IvfLvI+Z1FE7AWroMzxDDt7rb8aWLoQwRixe7C7LDDKYXC7OrhXPy4hWR
   r8ve10PzdGPN36AkSQAuLP9wM03ulycB3gUny/WGrNJfdClHk00s2460I
   g==;
X-CSE-ConnectionGUID: cjROW9ElSjeZ8pby23ZZXw==
X-CSE-MsgGUID: vTPvO+vlRY6zW+G6OUd28w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22436511"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22436511"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 09:22:49 -0700
X-CSE-ConnectionGUID: 85n+GK/ZSPe/56y4nkb2mw==
X-CSE-MsgGUID: 71JfDEZRQsGOlkAjMWBo3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="84306610"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Aug 2024 09:22:48 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgo6g-000Bgm-2h;
	Wed, 21 Aug 2024 16:22:46 +0000
Date: Thu, 22 Aug 2024 00:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 6826/7904] htmldocs: Warning:
 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references
 a file that doesn't exist:
 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
Message-ID: <202408220005.69Vmwm7r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yong,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   965c5bcac1fe560c973001599bd2364659dc788c
commit: 45506ac6c1c6ad0246636b623288e414c9dbefff [6826/7904] UPSTREAM: dt-bindings: iommu: mediatek: Convert IOMMU to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20240822/202408220005.69Vmwm7r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408220005.69Vmwm7r-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>> Warning: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-mdp.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/media/mediatek-vcodec.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/devicetree/bindings/usb/dwc3-st.txt references a file that doesn't exist: Documentation/devicetree/bindings/usb/generic.txt
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
