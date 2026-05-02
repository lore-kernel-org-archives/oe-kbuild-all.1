Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757882BF3F3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777740248; cv=none; b=SUXCCVx9iwtH64lAoo2FuKEmXCxQFpBboFaYItwpFTL9ohuepJDHj2DaZ9/O1ZRRFMXjxAtMGRIJQgatnX22R7mHB8PMuvcfOnoT5kKn/KYCq5IaOiO9BOKzPOfW4OxOQUWC13XCTN/tQqoojQssdNFsN9VQF6liQ6Ci62+FHz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777740248; c=relaxed/simple;
	bh=j6gw8lrSGKKNqZMZfGvL43QKf4jGoCJD7j9uKsSu9tg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=px6VaZUOXZAjK0u+g/BochbiKzu7vkMPnKyCJaM5hw+Dhh9Rsm65m5PrxHP7P0B7a+gELvGvH6AwFlHv8Tv8x8JeXs2nEok7/NdiVEl/F9dexDuJdNtcMIg2eHNQzeqH/lWJ2lyBOq3tXGNaos6ovuuT8Aoq+uCk2gcCXaCu/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKOzYDO2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKOzYDO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777740246; x=1809276246;
  h=date:from:to:cc:subject:message-id;
  bh=j6gw8lrSGKKNqZMZfGvL43QKf4jGoCJD7j9uKsSu9tg=;
  b=bKOzYDO2lS21GsfHhg9UhKZiYjDYbv4vqaOp8+LZldyBuR25nR9Eve3N
   SQLjQUpImCkSdXgd2TJX13a7IaLyovfZEuKmGX/8azMb9U0EZ8dfXG7by
   49jPbKjD8i7ee6Pi+LHlhcMLu/pbcEfYipN2WK9GX3ZXOFBqq79QATwP9
   K6TmS/2Y+IVJUB378BVZZcZ+K4Ay0h+QOR6IE9hpa+NBasvbeOh+ahP0H
   G31W95nLwshus8+Nw5Q5G6Nnz7enjKSIQVAdVwbpn3kOidSeUeU3Y4YlL
   QBK3z8VVt3hoIdYOb1T8SwEkQFUOHvWh9H1o/gxKwcm5E3rkBBB30LeA7
   A==;
X-CSE-ConnectionGUID: GwFRiD3uTVa9L8WlpH3lRQ==
X-CSE-MsgGUID: b02GM/RjT/W33uPTzOZFyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77830717"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="77830717"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 09:44:06 -0700
X-CSE-ConnectionGUID: NryiOJ/YSHCsUv/+lOWR1w==
X-CSE-MsgGUID: rLBSrGPYR+m7xsq2OqmXUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="258477511"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2026 09:44:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJDRi-000000005Ix-2B0S;
	Sat, 02 May 2026 16:44:02 +0000
Date: Sat, 02 May 2026 18:43:28 +0200
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 69/69] htmldocs: Warning:
 scripts/pte-size-rename.cocci references a file that doesn't exist:
 Documentation/mm/pte-size-fault-handling.rst
Message-ID: <202605021808.m9OBkd7l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: 3453a5ad954365409373c2762ba237c7e31a623b [69/69] treewide: Rename PAGE_SIZE/SHIFT/MASK to PG_* (cocci)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260502/202605021808.m9OBkd7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021808.m9OBkd7l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
>> Warning: scripts/pte-size-rename.cocci references a file that doesn't exist: Documentation/mm/pte-size-fault-handling.rst
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
