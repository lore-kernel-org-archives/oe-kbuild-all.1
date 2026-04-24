Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA5E372B24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 09:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022644; cv=none; b=aZldBD+GPHWE1wcH5BqOg+nSQ9yW6ju2chTrfyN+tVyDslEmKa5J5IxB/3IjygWFVE+JQxLpSSBAGzqVz2UOkGivsQmiV27s77WhvK5aZq40K+SlEYzHOxAVXNXB9W8pm5E+qUV9LXrz0QXfQdj6bZNk1R/x0brQSpeRFpV+1sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022644; c=relaxed/simple;
	bh=MfZ9UTz7lh6KsUhjxp70yw8YFDBPTzu0V09nSrNTczk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cowc6FSmfr3HFMd9y7a0kPV4lq5KOylOyN3OgH7geFsQMyEv6qh9clN4zDMBmZklDUryNktENz7zrmXdYewcpjTNmG3KLW7vI8SH7ml0MK0eUgK23jk9cuAs2DRU7R9+y7HP5O2mZ7nxaOp51FugJbfJ4xVMSYQSTEN6W8H/bcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LX11Flnu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LX11Flnu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777022642; x=1808558642;
  h=date:from:to:cc:subject:message-id;
  bh=MfZ9UTz7lh6KsUhjxp70yw8YFDBPTzu0V09nSrNTczk=;
  b=LX11FlnuL999u3rPB6+qxVYD3jkrscf90zENSSU2bKjFJvb3SEW+6Ld2
   FboJ0kKNPtzbcNw16JNRbKY72w1kJb8ukdgK5b8bhKrwBmF2pXxFI8Ii4
   +aVyBY0NEgE2wXeGsgasU2whp+Ozw0Rwujz1mrXbNTx5Q0V6v90I71EUY
   6Gpwo67Ggj+xUeveErWCgyhOIDRxmfW/EtP55o94CqnsFVGekUq44dW5H
   eKKm8Df8xS0MtimhSI97SvxN6CuhF5qV5KSIm6S8R5MLfu+yDu2Lvv+rU
   7flDEJpMN2af3HCjkdYAF2zkGvMKzTPLq3QOh+aEBO7hI01z1xAF8uTgb
   w==;
X-CSE-ConnectionGUID: rWuXsG2JSTiA1AzWVtZhdQ==
X-CSE-MsgGUID: guEZKn8LSoqwVnt1nRv2AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81862630"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81862630"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:24:02 -0700
X-CSE-ConnectionGUID: +yCvXqKzSaeTxaEAlupO0g==
X-CSE-MsgGUID: wsHBmq+AS2agw90g2fKMLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="228342543"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Apr 2026 02:24:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGClS-000000003EX-2Ida;
	Fri, 24 Apr 2026 09:23:58 +0000
Date: Fri, 24 Apr 2026 11:23:57 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/2] htmldocs: Warning:
 Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202604241134.SxzmU6Kf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e5b00516ece60ce220f481acdcb970b904fc28a7
commit: 44bd8d48687633f2db2d10e687152ba61273db47 [0/2] docs: cgroup-v1: Add IOASIDs controller
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260424/202604241134.SxzmU6Kf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241134.SxzmU6Kf-lkp@intel.com/

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
