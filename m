Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496FC1E507
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 16:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713371649; cv=none; b=gLffQktCx1SqpPnuIuk8ipfPf7tmMWQEiczwcY5xyVj538GbFmP3dEc2C+iDERIZfK13oC7nUNtqXC+2A+NAMToXlPFSksITdlkeQcERol0cINQgobOTRxw77S9R7dpoPGjTMMsXE7eku9+GKI0gl0vZ944Cu1Bv7ACD2Nw4hrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713371649; c=relaxed/simple;
	bh=NCQfeTYwHFXnAjsPXDEExTEbTeX78CyETB6L8qjucdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IqqeRGZGIVIj/WQ2enPdfCGcM4cpiKKAQeuEdCaCo7GuZaOU43ngYOvILqsaHEOwx4sfCcJK1w37D1q191peBeX8c0vbDhjvsNI5PmgrG90BO33iREoN8Je4wNfCOcQyifiFCNp4iGoAeno2xl7aAWTSocQ0oMycUSEnXxuJbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HAHB1Ybh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HAHB1Ybh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713371649; x=1744907649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NCQfeTYwHFXnAjsPXDEExTEbTeX78CyETB6L8qjucdI=;
  b=HAHB1YbhBclY740HxZ/faD5YtIGTzifNlsHY6ZfOG8JjohLkrL5snpoe
   75XZbQi0LoqqPKL4wjpuB5YwVdI6ZcYS0PO3hW4HLXU/XV6c61wA7m0/7
   j/N92sT+vEoF04+G/frbmFlaz6wRX71ocRPPpLe4xp2qO6VpV2psNDIr1
   LCxkPLTlC/jZJgo7rfZOC/603QU5r6g2Un7W+m4mhuNEMTVxBtQFJs7CF
   4f48Zf7/wWeQN5B3533RUEqgEAWDgF5RdYn/YMFHaYwAh0Kv6NUwtN4cb
   for2w+WOPQ0e1+RqVp+IcYdlznjk0SIk0e0+qQBqCndaHXIT278BF1Rke
   g==;
X-CSE-ConnectionGUID: P/SVUxcnSEOqPiBbgZZqnQ==
X-CSE-MsgGUID: 7Uf1tnDNSM+h93PFDWS9pA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20022994"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="20022994"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 09:34:08 -0700
X-CSE-ConnectionGUID: 0UNan2+6S7WBILdKCnU7Yw==
X-CSE-MsgGUID: zgOmh6+FTqSBf/CL6ABrTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="22692163"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2024 09:34:06 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx8EV-0006nf-3B;
	Wed, 17 Apr 2024 16:34:03 +0000
Date: Thu, 18 Apr 2024 00:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 1487/18115] htmldocs: Warning:
 Documentation/devicetree/bindings/display/imx/ldb.txt references a file that
 doesn't exist: Documentation/devicetree/bindings/clock/imx8qm-lpcg.txt
Message-ID: <202404180032.IQCJ1vuW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   de69f223c019fed2a465c014575b3b3d22b4c3fd
commit: 944162ca37deadfbb41913efa217df224440a82b [1487/18115] dt-bindings: display: imx: ldb: Add i.MXqm LDB compatible string and properties
reproduce: (https://download.01.org/0day-ci/archive/20240418/202404180032.IQCJ1vuW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404180032.IQCJ1vuW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/display/imx/ldb.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qm-lpcg.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mfd/da90*.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
