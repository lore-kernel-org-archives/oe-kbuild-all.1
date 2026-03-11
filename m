Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759CA126F3B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 21:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265560; cv=none; b=WvjAS2Hgo6cG9mZdN9XFV6+m5RFzZGz4DRGcVOKWWo0+iHiPaWkw3zkXpeLOhwW9Z4fxYHZupjVGwTyYR9A4sgu0SQKdzyq6B3b6WTMG1Fu1b34qyYFm5tQUllCNHLJelCkDv17/YYSs+R8JrR//7bluy0JX46MoR8xqE0YuDsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265560; c=relaxed/simple;
	bh=0KKwWWFePvShq0PX9kmKJM6GqhdfKaeQrJp8EdRwg4Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TziahRTNUv+QzdgVIvphrSNL7nXX0teMoAlCHBTe7WWeudQLqUxaB03eAuyQ0FyR0GR8HiKQOyT7U1NcssLwtV1oeBzVdFypqHPNcYuOefA9Jy+9xhnxAfGF3hfdLaa+7+H0bEc4HLipsoG4Js3z7jovJsrKxbT3EOM/ih0fHn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ME9Lfr/w; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ME9Lfr/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773265558; x=1804801558;
  h=date:from:to:cc:subject:message-id;
  bh=0KKwWWFePvShq0PX9kmKJM6GqhdfKaeQrJp8EdRwg4Y=;
  b=ME9Lfr/wehdPuW4O6WoEFn3EMd34hyRkEVCg02CywVpgoaucBBhWmDER
   fitTWi96VXDun/oOhSzOZr/2+ZuJSjHGQX9yOVHi9y59M5YNupBauN/UA
   nZTY5Zoeb5sZgVv44j838mAicu7/C3FQVqkYSNiDaaZgBrxENUJMheY+f
   42NH3PKy3O3TkPsm+nLB34DeWWUgFoyFhq7NbgwBxgUyito8/oCbDe6vf
   azhxC6JyJHTC/nja09JgS86AIlkG8tT+HUGtl87pqToeTrkV3rHxxstPj
   bQt81NfaDMO7gCpPOHjGLVcvoRvXjPWoVnFZjBRZza2hOBooTgQgMNVZq
   A==;
X-CSE-ConnectionGUID: yfLsuHi4QL6NnDLhFppxNw==
X-CSE-MsgGUID: jo/cQp0/RDKIBDGIDBYing==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="73366166"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="73366166"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 14:45:58 -0700
X-CSE-ConnectionGUID: iricqyc2QSm2Z+MT0ANldg==
X-CSE-MsgGUID: 55mqi9M5SkOKHcUnKQX8RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="217218354"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 11 Mar 2026 14:45:58 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0RNL-000000003Or-3nj3;
	Wed, 11 Mar 2026 21:45:55 +0000
Date: Wed, 11 Mar 2026 22:45:11 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 40/621] htmldocs: Warning:
 arch/arm/xen/enlighten.c references a file that doesn't exist:
 Documentation/devicetree/bindings/arm/xen.txt
Message-ID: <202603112218.stMvgxw9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 196674ef5f8e4dc30614fa50d68be8c457747b40 [40/621] dt-bindings: arm: Convert xen,xen to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260311/202603112218.stMvgxw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603112218.stMvgxw9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/ste-*
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/firmware/sdei.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arc/axs10*
>> Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
