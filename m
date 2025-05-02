Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70BE231846
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178612; cv=none; b=a3iMwaNRBmdO4SLYw4VFpSPxTFf8M4Uef104cGa2nLqKCj0danZ1HJVU42zZaJfYgnDkXWd/jPskHMg1c8reUhBobzxBYy1I49mhUH+YtXrNwZ8Nub0idtiOgg/5IlW2kGoETTTILnvea3ZU4321ak54yx+xT8+bcxaQojV9flQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178612; c=relaxed/simple;
	bh=qO5Uzrf4EcWUBp68VsfzP2cwci35gHFejxNmBHPXlpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rG8UCpk/nPDh9cyIFIXIpi4q8yV5v2M8is4iphPrulcJ0FDoupYuSQl57pxT9GQxpq0eocBmG9ESCDN9tgA3qD7h5SC89eur8gg4puEX3juSaqeHSvnS8cHyQfi2K00fPVCjAsnn6xO1t/nN8FyWZzsey/TieDq1WkFBOLFjK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqNLqiV4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqNLqiV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746178610; x=1777714610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qO5Uzrf4EcWUBp68VsfzP2cwci35gHFejxNmBHPXlpw=;
  b=EqNLqiV4EBKE0YomNpbuQkMPFEEh+fIEseUNv1ns4WuHIMshmuDP3kF4
   aetTy0t7K526tWJ1Ey7hT5o1wuDTp5dDjEnJVMBFVvO3sEI6foTcEpBmU
   LYoqQRtlhTOD2N2OXZDHsh5jCi0wMJuR4TNLqLtRjgulXjvtJUMkNYnd1
   lPaNG/6DVyTzLLpfv0cUwCHBWM2EXS31MCGs5GG4BcjwHgvNrHsb+Nd2V
   8hRi1UoHBGlQmNwlXu4Kx9nHGIE3h0kfI4kEn/1YaVQmc3PoaYaiNf/yR
   35Dp1QPWzOnSSdfVsHnU02dHj4IbTkvdJUEaHmWII3vFd0RCO0xH/Vlxx
   Q==;
X-CSE-ConnectionGUID: bHdMis7ERoC0xrcbz032qw==
X-CSE-MsgGUID: CAr4qBJvQZWzDsrU0RuKBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59221028"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="59221028"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:36:47 -0700
X-CSE-ConnectionGUID: GyzI4gIgSUmLH4cFY4xw0w==
X-CSE-MsgGUID: 1BkqQ91nTsK5J39c28Uq0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134497643"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 May 2025 02:36:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAmp0-0004ev-1J;
	Fri, 02 May 2025 09:36:42 +0000
Date: Fri, 2 May 2025 17:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: Convert v3,v360epc-pci to DT schema
Message-ID: <202505021641.QEim367T-lkp@intel.com>
References: <20250502013447.3416581-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502013447.3416581-1-robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus linus/master v6.15-rc4 next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-PCI-Convert-v3-v360epc-pci-to-DT-schema/20250502-093635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250502013447.3416581-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: PCI: Convert v3,v360epc-pci to DT schema
reproduce: (https://download.01.org/0day-ci/archive/20250502/202505021641.QEim367T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021641.QEim367T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pci/v3-v360epc-pci.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
