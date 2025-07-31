Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B642B1E9B0B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 22:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754000167; cv=none; b=Z9U5g1OL4nvw04RPWJ3gJabQ14o8CK0zpx+UO+tSx5EmBQ4GZPkUvqVfORSGD++5S8nJmvCs6ggK1LXhQMUBLIgQ9JrbXyBOLdFkjh44SifBPhkMuMODV4gU2cZluMPR3vx87h//eBp1DYutvsyMUMRCjYWqqAF9CghNx+RlrxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754000167; c=relaxed/simple;
	bh=p4gQRLrJEzDENCGX+6PwwG7LgWI8yPkF/zXr7rnUouo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GoUfTEjIP7STcEYs+kGjiugIjFFnt1ONsBBXK/VoL4cUOW6012jx26ASfsG4SACsSrdMPEYcEG3DrUFEPadTTyjCZyneZeQiKEwl4KYRZDQxNYkSU36auyAOBBQAAfy99LZLY8/W83jeYOkC2xHjzGPoaZxq/AmPrQgOudS3boo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6YFpFxC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6YFpFxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754000164; x=1785536164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p4gQRLrJEzDENCGX+6PwwG7LgWI8yPkF/zXr7rnUouo=;
  b=J6YFpFxChZtTaXtDFlFB0epBmXxVGxO/0J1qtP1kheP+K+kfTxidtQ3o
   tgHYlAnCxCKzvngRiyOJ269SbKzksGqhfCPFB2okh+9RIr2xcKE+5jZpv
   GPs1CNvas3pp4iKtaQe7YtGkft48pesdox/mVhssb9hBrDAEkYbGuvf/R
   QtHvd32D4N1jD3+1jzH8gbzxwFnwCwNXFNly2sC0nwCO1dPoP0NogXzz+
   fNsVuCsZM3ohwVT5g+78osg+6pYRdstZgiLQYyx+e1WvwAtUG/jUF+qnG
   1jgKDYpchWGXJcOS+G1V4t9P4XWgCOUSDlCgyOvCyYNwxucTN7K0oVPOP
   A==;
X-CSE-ConnectionGUID: Np9EQEVnRlG7Sl/JxG13CA==
X-CSE-MsgGUID: 8xz65du4SKS1WkiL3j3SWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66611752"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="66611752"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 15:16:04 -0700
X-CSE-ConnectionGUID: 0WPhnesnQVCGZIh8UR/wFQ==
X-CSE-MsgGUID: uUDMwRffRTiHqZiumUOJGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163753622"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 31 Jul 2025 15:16:02 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhbZA-00016B-0U;
	Thu, 31 Jul 2025 22:16:00 +0000
Date: Fri, 1 Aug 2025 00:15:59 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1] htmldocs:
 Warning: Documentation/userspace-api/ioasid.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202508010045.jtxhcyWK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   6e920c19ef4a8f89209c5ac5530a793323f633b5
commit: 0ebb438216c3881f28b16c9e29df4f27e1a4c50f [0/1] ioasid: Add /dev/ioasid for userspace
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508010045.jtxhcyWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010045.jtxhcyWK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
