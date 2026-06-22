Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9891DF75B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 01:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782090591; cv=none; b=KQDaQF/YgipVI7m8imZHf255OeNKxylb6z8guihfSRUEqeBVczwS8mOKMCBhHQt73Lw0z9YXeddYAyIVYctVhdRSXxLQ73OJP5m/+fj6jTU/u6GmgmjTvu/dQyLgy051hYoQ4BjI+GS4Vv5YEcd2UHuhLD5y91QAv7bOSGYUh2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782090591; c=relaxed/simple;
	bh=4oEt+j9WdRewbnrwHD3oZUmTtWU7z5eJkaS7e4e8NjY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oB1c9OH39Vz2gYcSqCXPexcqDUaDYK/ugxdjmZaa1TKCjZ9o42kBq2jxxLltQQCy4Pp2manoSzmOweUxOqFXWlSVe6kpKyCpFyhpM2djXKV/6OyVmFsGB36CM8x1ziSj6YLFRMDqis8KmSAc2dGhyc5OyMiZ1AdqZZu8d7k9ptk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOu605vi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOu605vi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782090590; x=1813626590;
  h=date:from:to:cc:subject:message-id;
  bh=4oEt+j9WdRewbnrwHD3oZUmTtWU7z5eJkaS7e4e8NjY=;
  b=DOu605viaOGh36cAJh9HnSyETgCFJUahAGp4JPE9brAO8IL0vGuDrWVY
   rAzoFMuJUFUXYnMUE23ES9sFb3zN8Wz799QI5zL6pIpW2K0gTFiwUw++t
   u6Kv1+O4e4IpKGUI+aELUCWIPjAOQGnD+qO6CLUzSXxWRSlCYeOI3jsLm
   SXiAdtdboc40ZKGx9kcu8/fucDpITQZ5o8PBpUnlu29ev3iBV00r0Ijaf
   MIFtXBOhCRbMSrkHFQiM5uU/cNwo1Ezv+SnJYSOAaqF2eIKBHEExfqZV4
   I22avAjexLOkDiFWDE32kmr4nKQPkFQWb/2KWVdPgPeOhy+dV3mMwr296
   w==;
X-CSE-ConnectionGUID: Nd8NwBwcQo6qsTho/h1/RQ==
X-CSE-MsgGUID: OKk8E5UPTKSOTRlte+m12Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82859149"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="82859149"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 18:09:49 -0700
X-CSE-ConnectionGUID: ZLpEipWRRLqZvovFEre4Zw==
X-CSE-MsgGUID: qXwuGfVhS1yJNfepH0H7Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="248935697"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Jun 2026 18:09:48 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbTAX-000000005yn-40PG;
	Mon, 22 Jun 2026 01:09:45 +0000
Date: Mon, 22 Jun 2026 03:09:32 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/27] htmldocs: Warning:
 Documentation/admin-guide/cgroup-v1/ioasids.rst references a file that
 doesn't exist: Documentation/driver-api/ioasid.rst
Message-ID: <202606220317.OH5SO3zQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   adb3ec6f94e47cb5edefdc73edd6eab1dde70fef
commit: 44bd8d48687633f2db2d10e687152ba61273db47 [0/27] docs: cgroup-v1: Add IOASIDs controller
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260622/202606220317.OH5SO3zQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606220317.OH5SO3zQ-lkp@intel.com/

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
