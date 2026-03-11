Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071D2285056
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 07:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212455; cv=none; b=Mpl1yn/cmwQbLmziKxy8QxLzED/E+Dl4ool0jCSHQZq+NTlH6tTvJVG4VjxX+3/ua/NwK53s7LkX5eEq4A9wWEmYkduX5HTSjrh19YknlTQYn2VFW0l0AAt3bKXUAE98RiBkeEG2a/48Bjsd2OSxNYBPgWt0YPWRJxlCeNbICzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212455; c=relaxed/simple;
	bh=6gQbCCMYFPmMLk7fEIxXv0o3iSBRsgCHviJK1sudt+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ss6xjCGdhgYCKTNQ2jwOqpAcKeFt/ph5OSdSIsjRYRppcWZ6ROtd/Vf4ouryA2lAhoktQnGugSujxR6kS77Z4Ho/VnK5JLNHWXa0qbkJLkm/+hOj6xCc54i6J/CG3dUQPwGokIiqjdY0hpqkjlFwOaJ8xtTpaaBQA5Cq+MUQtJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ep0KL+ow; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ep0KL+ow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773212454; x=1804748454;
  h=date:from:to:cc:subject:message-id;
  bh=6gQbCCMYFPmMLk7fEIxXv0o3iSBRsgCHviJK1sudt+o=;
  b=Ep0KL+owjwrvNmUXHuGboFB/xkcK0eMXMRy0jyZ7NhJCIZsCq4y1xEd9
   1TQ7HBe/eM5gFdKbgNSOCYEj69G/t1Wl8i3wtWbqzZb+IsbrRijk/kuqg
   AHlsi9KqOI+fY5pMrjQqH9LDG2dqFuvH7W0QWCeA5vYfyR/ZBBDMgmVrU
   Z+lm1UqUDjip8cTjovf0FRclsGz8D3zXBOVKvgY5vzsLOrcFaTuPrZ1uM
   NhJqd0tcvflxFE6miwIZf0O66byCinZCL/ayyny4o8h8x/bBzwHkO0vnZ
   yYf41KkP1bzifyUz8hYSOgcfPUxvQCQUZgcQx1WD3ImnmoY5jo3nYYgIF
   g==;
X-CSE-ConnectionGUID: lO5j2tteTtqSQE8Y9kgMCg==
X-CSE-MsgGUID: YFsppMr2QuaPSOFChVgmQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="91842560"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="91842560"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 00:00:53 -0700
X-CSE-ConnectionGUID: YTVdggykTiWm68USJGsYmg==
X-CSE-MsgGUID: Vf1jGj/CRvuKmnyrHcqoag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225327673"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 Mar 2026 00:00:52 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0DYn-000000003HB-0uw5;
	Wed, 11 Mar 2026 07:00:49 +0000
Date: Wed, 11 Mar 2026 08:00:27 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 7/621] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/arc/axs10*
Message-ID: <202603110758.jcvILYR8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: d8d8ca06bbb6c749c20b30d2beed9784dc696a10 [7/621] dt-bindings: arc: Convert snps,arc-sdp to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260311/202603110758.jcvILYR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110758.jcvILYR8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arc/axs10*
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
