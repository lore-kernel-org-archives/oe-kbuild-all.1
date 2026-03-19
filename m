Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D76138B140
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 07:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905062; cv=none; b=cs1UmhMTAT0IiZAQ8XBIYd40VPGi3subK68hZNkPOX+n/wRNUrESSRQjrxE9oJZtE3cGd8LqOb6y/qvwCLcXchA7pfd9ZqOGQ28lMR04SHGtfvtEhV7AZqrqBbseNrRLtwrDv3l51wKf3/f194FeAqG9Tmy2mb5MQ4opD79GH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905062; c=relaxed/simple;
	bh=3tgcj0TorhXsSGdxy6XXpDfgbeHNpnaymownd52NgzY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kz7BTJp3m/DJwJOTs3pPTXdoL3zCc6j4G2BawKpcPuQKVUT9CeTZGK9HnqeXbkI31AmyJtTNC6AF0H5rfBcGDNsL2HCVdUy7xPDXz/z8MXh4ZgLqiAsSfx5KQ174EA/KJRuEYI5d5HU8QwBJHgUKPOQujHv/AOApgN0upvAEtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWxQRxSY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWxQRxSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773905060; x=1805441060;
  h=date:from:to:cc:subject:message-id;
  bh=3tgcj0TorhXsSGdxy6XXpDfgbeHNpnaymownd52NgzY=;
  b=hWxQRxSYJXjGld/F1zYLH5VtuV2DDNbE4gKgjZpgFObyBh/uhHTLd6QS
   7aoj8fTLLtnMUSWEnCnGVDD7bn8tJ+AUI4FqsLdZVMLpo8Nr1kuhMxXtE
   vwzXJe0NL0PwhxaTqq4EEItgPexQCxAmGkfaSvbLvPFYGFiVjSBireMxI
   d2UqB0ajAM5dKn6d8jbH2PpbTgZSG85G/VpPBSYBfQzlXtY++vO8u4cZ7
   v9/NavxZwFPHgi3OhoMQeUK2Y8nxzBfaVeVYbCyI10wLjxeYOnqxBZylU
   HAEWy9R7G2cEoj+WOO1WUE+VYAUL5hhMFqJt5Dlzeg72Br7m3V4buXNVM
   w==;
X-CSE-ConnectionGUID: +cXTn0QQTmScAzi0dQHRaA==
X-CSE-MsgGUID: /6M0M+SWR7OLAp5nuNGCRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92353094"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="92353094"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 00:24:19 -0700
X-CSE-ConnectionGUID: gQjLuo28QuyxxBiQTididw==
X-CSE-MsgGUID: cjU5jqWBSVCy3DtG5iTQdQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 19 Mar 2026 00:24:17 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w37jr-000000004nJ-2CnV;
	Thu, 19 Mar 2026 07:24:15 +0000
Date: Thu, 19 Mar 2026 08:23:37 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/4] htmldocs: Warning:
 Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202603190816.pJAnpfMj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7ae03274141ace633a6e590dcce9b01cc2e9c06b
commit: 44bd8d48687633f2db2d10e687152ba61273db47 [0/4] docs: cgroup-v1: Add IOASIDs controller
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603190816.pJAnpfMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603190816.pJAnpfMj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
--
>> Warning: Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/virt/kvm/api.rst references a file that doesn't exist: Documentation/x86/sgx/2.Kernel-internals.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
