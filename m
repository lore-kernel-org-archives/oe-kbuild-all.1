Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D1202C29
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773229617; cv=none; b=nX5TrBeQrpezQOJqtJLoqzIOM95hiRI+YAAKXDPghJa0lACU+7iYxzxuNxqucHtmxPK/G2lU5h7U/P9dSW8+2WnsB8hJJsJEHr4vzuHBJewvEMMy/R9N38LPtPkxBMXyUO/A2+YOuw9sJxhXo2kn/0X6FjtAecpgINMrdG1pIyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773229617; c=relaxed/simple;
	bh=g3bdKAOGIkfJ7MRc1j7WStTfx+ckTI/LH+HFzNYWYrM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IissRCQq2Teo3gJmhb2WBCC/7SpzJd7tMg1l/PAFBreT/1kNCK1Yxqe7acNnR958GUOAw16MSgsF6LPaoeo80ycpENVWBAMyhx3PcR2ZLhFNnKNkn336joECUJ0Ay/RhCDAfo8yumumtyielJeQ5VCR/O7asbN5BvrNGui9v1Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYyAbnGw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYyAbnGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773229616; x=1804765616;
  h=date:from:to:cc:subject:message-id;
  bh=g3bdKAOGIkfJ7MRc1j7WStTfx+ckTI/LH+HFzNYWYrM=;
  b=ZYyAbnGwv8/qmJXNSXe39/U7xQVnWbmU4YXXRQr5dPNY66IQgPJbvo+R
   7HGcZtevUTRjpFqi2iFvIvlAI4n0RTgl7+aqIU6ZTLvGRVIQBxC8MPVnr
   n1Kv5LrWYaO9XaVqsBV5BAFJ1Ho7xlLhC54+CGPdiVmMfsYBSAVxARLWo
   o11SWpd89IXZUfz3OzS0C2HfSi4ppHE2tnv71eO1lEfTbVOpdh2i+svHR
   Kan76AQldXoCX/VH7Gwlb41Q8se8whTrm4zTyqCibs2ven4LU1ZBUO5Ke
   ehOg7w0d3bYdntoZ/Qgm9mEnqtKqvxhZx3UB40IIsAO82m1s3cnVl/qex
   Q==;
X-CSE-ConnectionGUID: i2rcYGs3Q7iEJ31fHvcrUA==
X-CSE-MsgGUID: 0hkmxu49SCaGpCm/6P/dUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74204622"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74204622"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 04:46:55 -0700
X-CSE-ConnectionGUID: NIJ8et94T1GHmn6dhpC0kA==
X-CSE-MsgGUID: QvL4N0byTRyPw2peHtw6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="224601633"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 04:46:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0I1b-000000003Jx-2YP8;
	Wed, 11 Mar 2026 11:46:51 +0000
Date: Wed, 11 Mar 2026 12:46:29 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 14/621] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/arm/firmware/sdei.txt
Message-ID: <202603111213.wk0KeDIQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: aae4a37ab1cf3e4915fea1069a1dbb447f7d34a1 [14/621] dt-bindings: arm: Convert firmware/arm,sdei-1.0 to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260311/202603111213.wk0KeDIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111213.wk0KeDIQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arm/firmware/sdei.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/arc/axs10*
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
