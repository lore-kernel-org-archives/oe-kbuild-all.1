Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF952C0299
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 22:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777586984; cv=none; b=YYrhAU3RjO4t8isPwW5ZL3j0RALXBw/fmQ7haASC2yQQjEn6b8OPUzPuo4dzx8PUnPYF9Kbuqn1kpFVgsoxg3eeM3RQSf1rqm1qhHApML5I9/NH7JNGtOld04fiAGijNHEedlty+tbmqBbnEDfVrOsFpCj1cAqDxGwwmvZz5h4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777586984; c=relaxed/simple;
	bh=/QtQtIuCPHadoiTfoJrIK2mnvxHR52TXqTEGB144wbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZRwRdCGoOqAEwrU3cvBFcm/Xx4fPRuCxUTJ2P1HMq52crpHuqQWfElDlqojQwXoZ8jIG4HeR2YCpwVWOrM1aJvBf6Nmkh0AYcAJM2KYYmql1C8XUaWS14A7A23EjmfzqnPdUj5znn8/K/Z6xULPPKLv2I0MG5qvvE5j2k9Ftx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LU7WxzhG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LU7WxzhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777586983; x=1809122983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/QtQtIuCPHadoiTfoJrIK2mnvxHR52TXqTEGB144wbs=;
  b=LU7WxzhGa5+QqiOGuoXCweWmI8tPKYyKx6sZvbH4RkvJv5FKF465/nwM
   MtltIqGHPqzjmfRWW+gk8ZxK0wuig1eM1gQOtQ80ikYEThIjHnTIx5ZLH
   xRQoyigc/QGdZmUmkGRlnXc+LrQc1buQVMXoGMYKPCJJvavzacQIKsCJ6
   6KO5NuAA5SScgc2rMRbpQwIhS/EgP/nA+IY19gCr0IO/adq3qnGMGSLH6
   lC9bywu702qPUiR3EPJN1U57U3AQlclIxFQbVl/DSHN0/RGuOK98xRDNv
   ctSSzJ7A/QwypssQcSrCcwMvCpue5yFaTpnJYbccWs/gqv9blJUrrDoT6
   Q==;
X-CSE-ConnectionGUID: 2tMPvySDQq6qLV6hiqqYCA==
X-CSE-MsgGUID: j6G2O8HFQqirqRwFI6+Exg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82409375"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="82409375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 15:09:42 -0700
X-CSE-ConnectionGUID: A8KO9CubQf6yCZ71HDqnbg==
X-CSE-MsgGUID: Yta4wQvXTemTKcCET4zxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="234598631"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2026 15:09:42 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIZZi-000000004u9-3KWR;
	Thu, 30 Apr 2026 22:09:38 +0000
Date: Fri, 1 May 2026 00:09:17 +0200
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/2] drm/amdgpu: Wire up DRM memory stats reporting
Message-ID: <202605010043.PsAdcldT-lkp@intel.com>
References: <20260429130653.73854-3-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429130653.73854-3-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip next-20260430]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-Allow-drivers-to-report-standardized-memory-stats/20260430-153342
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260429130653.73854-3-tvrtko.ursulin%40igalia.com
patch subject: [RFC 2/2] drm/amdgpu: Wire up DRM memory stats reporting
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260501/202605010043.PsAdcldT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605010043.PsAdcldT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
>> Warning: include/drm/drm_drv.h references a file that doesn't exist: Documentation/gpu/drm-memory-info.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
