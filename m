Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D130726980F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765308914; cv=none; b=X5EQuY37ACEi5JkGCG6pFo57kBXeT933ByV6TPTvBq+friU2fYtTMcALp6CcAz9UqrwQudOaAgqQZpGX3xjsbN1wVQP/AUnHD+xgDgbD6bpQ4QRdLYh2Fhuqw8HfK4JnCvimlWEfBxfQb/zi7EqqpVvwamSerj8BoYtrqpVjWwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765308914; c=relaxed/simple;
	bh=XQ2gxOxA3lvamdii1WS0oSV9tmhJV9jPazNDpsddKdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MvYG82A2f0desgtLLcGvSaZ2S9vdFkXFPLhWkwlsxQ4FeFXVirokfE6Stear9cgG/Ne6jMv4IFxIZ3/0NvpI0edC2zPvmyJ8zR3daEjtv2UkoQelva9uhWyzP8M4d/g7m4peBuuj4asSDFDf/PBDUdlTX6b24Pkqft757IK1SK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgS8U1MN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgS8U1MN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765308913; x=1796844913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XQ2gxOxA3lvamdii1WS0oSV9tmhJV9jPazNDpsddKdA=;
  b=JgS8U1MNjUQ/rmZ65dOTm1hbHOCYVG2C+pIcFdaVcgJSMy4kG0ye1+Yt
   Xr9zrDzk6QeGR9Q9jWOev1WJ14aomqsQP6wNsd8j6icrZySyeBOJ3iMPo
   uTXcztDWLnm2nHi8CkKG1VNa75eKj1wMSkvrpiFR/jBF9MIjRplSqD7Vt
   VGxASnbJCHOqaniGbG/u8QWfChXKUYU37TD8hRcsiEZq0DGXid4bknfyY
   4bpmwtYtzwlno5q994DZRRWnDha7aNFPrJYhvByFyRiC0npaYsNQZtRzH
   a/tHmU1UjiTIPWKb3uI73omSyA+AekR9tVrWxlUzQzr3Fw9Y6nkIYDWv+
   Q==;
X-CSE-ConnectionGUID: egW5T3qTQkGBapUEGgrGfA==
X-CSE-MsgGUID: Ra71IXd9S1GNZavQxFWpyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71123449"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="71123449"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 11:35:12 -0800
X-CSE-ConnectionGUID: vb3vJ3qbRQSXZ/dlGwQgnA==
X-CSE-MsgGUID: 8XSwmDpJT7Krr/Xqn37O+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="233715837"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Dec 2025 11:35:10 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT3UK-000000000Lx-2Oqp;
	Tue, 09 Dec 2025 19:35:08 +0000
Date: Tue, 9 Dec 2025 20:34:29 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3398/3398] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist: Documentation/x86/amd_hsmp.rst
Message-ID: <202512092005.eZ34Xp2b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ea8b5fbcdf7f5ce2d966ae6aa4e95e2ebde6cb03
commit: 2970038b4fbf5aee2a666769d676f01dc74fe7c9 [3398/3398] platform/x86: Add AMD system management interface
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092005.eZ34Xp2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092005.eZ34Xp2b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/x86/amd_hsmp.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/perf/hisi-pcie-pmu.rst
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/riscv/kvm/vcpu.c references a file that doesn't exist: Documentation/virtual/kvm/vcpu-requests.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
