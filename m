Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44AE4A99B6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 13:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791637711; cv=none; b=eJQmdmWjGjbWF6rP+s4POFzjpQZXY3xbZUkRkJr4mYH9VgUT8rhBACK6icxZGjnyJUBc3TYpCx/7GmxK7jmRphhqe1LYCV7U8SQpX+M1sxyZ6IaGgjMkG5lyCt1IH3TAmLYnfSAXiBBH1SVjqj9zYvqRNSmVCThRI/OiyiGP+VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791637711; c=relaxed/simple;
	bh=i4IJeaMHT6ncEy+yCFvrXdQXW9QSpMcl3ZKQarClpCI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MgEulYmVcXslMYBucUQKpABDyb95TOy8BcpXnvqFpZw9Xro7VWY+/MexsHTdViOMzAhVDbm2HZujzU2Tj85vBFJBaIM5sVR979hhsjdGh+iHhFdKqjX6HDLiErX3i6tHGYX4zirXVS6tklU7QNxSZmN2V34qA0EdoZ5G9xvYmkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGPIoGuS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGPIoGuS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791637707; x=1823173707;
  h=date:from:to:cc:subject:message-id;
  bh=i4IJeaMHT6ncEy+yCFvrXdQXW9QSpMcl3ZKQarClpCI=;
  b=OGPIoGuS/FLO8UG9d0wNYq0Og9StfbQ5uG6zv1jOxgEFevE1SDZ4mSPZ
   +YcUBZjnux8jlEF48OhLZUn7rAu2JNgjPGiQQvIdwMiJmg5kNL694KVXz
   F5mFBTyBgLzm/vFvh9+jo518mIgFZE0TvKAyDi++jc1L+xFgEk6EskhiB
   gBw0VMFgc6RER2eT7b9kj1Rzh1wMkVc+OJ3zA3FZQuizP3mWXffwaLakl
   uVz7TBgslYJiR+KhJW1UoW3BUQ7xmzZ7ie0s0tBdAH1G/Epd73aoQvBqs
   KqI565hiWLI23+bRteOfAoz8mFHsu03ePLxa/N1cDhL9gkQ7cmf8OeJpS
   Q==;
X-CSE-ConnectionGUID: inJYMY/iSr6hFTLiOe149g==
X-CSE-MsgGUID: dst75hv2SrWZxUxMRLBhYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="316275"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="316275"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 06:08:25 -0700
X-CSE-ConnectionGUID: CnP6lAEMRmecqrFJVkKCeg==
X-CSE-MsgGUID: W2c7D8urQX67lI/Eex3kTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="617511"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 Oct 2026 06:08:23 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFWoH-00000000907-1ohq;
	Sat, 10 Oct 2026 13:08:21 +0000
Date: Sat, 10 Oct 2026 15:07:57 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/195] htmldocs: Warning:
 Documentation/networking/ub/ubl.rst references a file that doesn't exist:
 Documentation/networking/ub/unic.rst
Message-ID: <202610101430.lPrKG1hv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   cf8b9c0b957f45db78a5233576f7c57c3f615feb
commit: 49e41d66f21901dc8bb6e169444f951659b66ae7 [0/195] net: ubl: Add a doc for ubl module
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610101430.lPrKG1hv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101430.lPrKG1hv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
>> Warning: Documentation/networking/ub/ubl.rst references a file that doesn't exist: Documentation/networking/ub/unic.rst
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/004-changelog.6.6.88-4 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
>> Warning: Documentation/networking/ub/ubl.rst references a file that doesn't exist: Documentation/networking/ub/unic.rst
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
   Warning: anolis/changelog/002-changelog.6.6.25-2 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/004-changelog.6.6.88-4 references a file that doesn't exist: Documentation/x86
   Warning: anolis/changelog/006-changelog.6.6.102-6 references a file that doesn't exist: Documentation/x86/64

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
