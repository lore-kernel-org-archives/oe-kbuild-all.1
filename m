Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB71EA7CB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772031366; cv=none; b=jXab5s4I1CX11v5g+cER++rtYlEmOR/kYjkSoS9bC78ATpzETVhu6DtpBwHJrTtg4m03k0c0uQ/tIkch29x/cAAgvgMe2nw1fe9Ie6InhkWz/74Sakzvgv0LkhcSuPCPkjZSzAsyPF8k0OJpV4bSy4ypcEkw9SHU4kUtkpeorAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772031366; c=relaxed/simple;
	bh=cSKJqJ73WUa6nC0j+Js1mJnlIL1z2CBdezd4P9B3P18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HDIokJtXhnjL8K6VztxVu0fbbPxHmCSsHi1lC9esjIlNTRh+NTXJf1jpbxU9bFvEQdfF1ENRwo/lGYdXxHAIJ4nvoHQf/A4rP6slC1CdJ9zaU6+25FDoKYs5Xh67FyDLX7ikhV3GnhZW01y4sbT2Dw2I9xVvq/UcIO9+5dFmq8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aewD/M4o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aewD/M4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772031364; x=1803567364;
  h=date:from:to:cc:subject:message-id;
  bh=cSKJqJ73WUa6nC0j+Js1mJnlIL1z2CBdezd4P9B3P18=;
  b=aewD/M4ozBjtftla/S/oKq21k0jpiuEi0fvWRXe4Yz+n/P3ECGLVm/P/
   Je/danvbbUSpGzeepbcqi8fAVonxtijb8rRytCqYFuntk8jpfua8UE8fS
   WE9hxpQKtqUB5SUYAII/5mCiJ5JNPnbWPMdO3vdDINDsgJT+1JiNCcAoS
   eoq46MKanAgFwESNAlD5wiqT247Pkkr1+3WG69W0u/6YjcW6s8gfVGpkb
   7RLmUiLpf4h9cvD/W2v8sUndPqpD/k1cT6/sQ3NHaw6a0+eNEPUFEGqxN
   E5/AAxzUkFL4FdYmU4kIcjJqlru+zfA1PEeiaotnBMeM5t0Y2ZvRkt+Vv
   A==;
X-CSE-ConnectionGUID: 2XrNGAMkTdCgImhsLcm+dA==
X-CSE-MsgGUID: OjteiYYxQjek3LbwtfEg3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84163107"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="84163107"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 06:56:04 -0800
X-CSE-ConnectionGUID: Lw7qgr9HSIm50wuHvvgpBg==
X-CSE-MsgGUID: MKqAky2tTr2DKJI8kewK8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="239261314"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Feb 2026 06:56:01 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvGIx-00000000651-1ByD;
	Wed, 25 Feb 2026 14:55:59 +0000
Date: Wed, 25 Feb 2026 22:55:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
Subject: [mripard:drm/state-readout 1/28]
 drivers/gpu/drm/tidss/tidss_dispc.c:484:35: error: 'struct dev_pm_info' has
 no member named 'runtime_status'
Message-ID: <202602252211.jFtAzFya-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/state-readout
head:   c9f24e410ebb9f3bade012825d8cfd87915e9d4d
commit: 6c6ebcaf49db8f44f77d4579bcb3a8f1d5cb804c [1/28] HACK: check if DSS is runtime-active when touching regs
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260225/202602252211.jFtAzFya-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602252211.jFtAzFya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602252211.jFtAzFya-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/clk.h:13,
                    from drivers/gpu/drm/tidss/tidss_dispc.c:8:
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'CH':
>> drivers/gpu/drm/tidss/tidss_dispc.c:484:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     484 |         WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:84:32: note: in definition of macro 'WARN_ON'
      84 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:485:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     485 |                 (dispc->dev->power.runtime_status != RPM_RESUMING) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:84:32: note: in definition of macro 'WARN_ON'
      84 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:486:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     486 |                 (dispc->dev->power.runtime_status != RPM_SUSPENDING));
         |                                   ^
   arch/parisc/include/asm/bug.h:84:32: note: in definition of macro 'WARN_ON'
      84 |         int __ret_warn_on = !!(x);                              \
         |                                ^


vim +484 drivers/gpu/drm/tidss/tidss_dispc.c

   481	
   482	static void CH(struct dispc_device *dispc)
   483	{
 > 484		WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
   485			(dispc->dev->power.runtime_status != RPM_RESUMING) &&
   486			(dispc->dev->power.runtime_status != RPM_SUSPENDING));
   487	}
   488	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
