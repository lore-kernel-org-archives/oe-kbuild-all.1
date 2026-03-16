Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8D838E5FB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 20:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773692931; cv=none; b=HPCuc0ISXtCzJb091byt/u0u0J+xApsHO1JJcZuspDbS+N1WTnxRsxXIn0gbjx7k+cSBnqrW+fLOG943FYyAv4pUSl7ebHl0wdnrZRIC1S0uo3NynfzupVHAt52tUD8XUVA7B4/IREqJzJUxG5/UMBrB67LoSibSsPNb7dkFfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773692931; c=relaxed/simple;
	bh=gA8MET4jmBu3R8biRafB8ig/ZQs3aBBQfNcMFwcaeRw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dcl3122grN+E+tUlIG7+ZEeFhZihMJCK1JnX+4qPlcECEhW+A3di2wMkpHkN2hOAXwAM2DK996rEflQCVcojdxLOu9Z3jO8A5lhgkPHtM4K9Ts/pXdoh+odHMJQHt2qfXeFWiCVQ29P5tzc5JGO9TSYcu7yZOA1XN+NeGqTUl4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJOXzka8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJOXzka8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773692930; x=1805228930;
  h=date:from:to:cc:subject:message-id;
  bh=gA8MET4jmBu3R8biRafB8ig/ZQs3aBBQfNcMFwcaeRw=;
  b=VJOXzka8YDSUBQfzPil7WNqLQvbKT8xofsPrvVTDHRsQTPHYGZjg0SBm
   dVpfDwwFsYI92vPgqFwfDJJgVWvBaVXMw1GMi2jdc+PToZo+7f3uo6fmc
   NVkVgVsTs7wmAyeDlmGg/Kbf0mGuKUjNWHp1cGXYqfZixJdqdPSfpURjE
   vG+3VgfDDHhjKG/kdmIHGaQw8FtW2seaNRR8xtWQhKXz7BiBHsSdF6SR2
   hT/lhRmht6fPEKt9ReQ76IU7t9L9whgR2q5FZcIyaVYv0mKkdzpkhLHvX
   hyK4m9pEdEZi7qUEYETBJ4UFkyf2EvGi+2dVOhd5Vrc047637hxjx/0T2
   Q==;
X-CSE-ConnectionGUID: pJfDxwVuRg6WlUarV9Kmtg==
X-CSE-MsgGUID: 4gai+wW5RVWCXuNXFBhwlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78321956"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78321956"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 13:28:50 -0700
X-CSE-ConnectionGUID: UPbAElJ6T1yFI0ZM08VqAA==
X-CSE-MsgGUID: 8URuJdrMR1GJ0kFY2M52Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="222244438"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 13:28:49 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2EYP-000000004HR-3uUe;
	Mon, 16 Mar 2026 20:28:45 +0000
Date: Mon, 16 Mar 2026 21:28:40 +0100
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [sashal:ai-review-prompts 9/13] htmldocs: Warning:
 drivers/of/ai-review/dt-bindings.md references a file that doesn't exist:
 Documentation/devicetree/bindings/gpio/vendor,device.yaml
Message-ID: <202603162121.92l86y1G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git ai-review-prompts
head:   d184712fd9e150ba9bf9ab95428e342308ba9761
commit: 37b6473651afa20483dc3c46ceea263989d527ac [9/13] drivers: add AI review guides for driver subsystems
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260316/202603162121.92l86y1G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603162121.92l86y1G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
>> Warning: drivers/of/ai-review/dt-bindings.md references a file that doesn't exist: Documentation/devicetree/bindings/gpio/vendor,device.yaml
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
