Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A08A1A0BE0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Apr 2026 00:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261808; cv=none; b=LigN0zn0jAx2vrwdk866KaUSp6527DanGpY4EiU4RJ5q+yNl0+sgy6z0aj93nkYH94c1fQUIxg6vNhCLhxO7Mkt1kpvEPX2Q5Zjrst/mOCWOBl/+O37ZOMtkHWpJiKpu3Vg+UfYLzi99tM+quyIJTUwZNFF0aWu8z8nGbZah4HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261808; c=relaxed/simple;
	bh=2ZuAxZKra84U0yan52Lq8/tyvosaSbUH/3SCbzzMkyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ImsQ96qM/nGw8pHjJtDIgATf5GUDqI2ttu1ukvsHl2iN+PZvbF1/bGUXVn2mwUlAp3JfRlff0+Sb4PQiMM94JI8yybWCZDQ0X73dU3WQgENJIbdzL4vxHafG3nNTcVVjK86MRewEVYKIGJvnk8j7lcOlKav2RkSS2lzGDrCk9XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNI5ctbQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNI5ctbQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775261807; x=1806797807;
  h=date:from:to:cc:subject:message-id;
  bh=2ZuAxZKra84U0yan52Lq8/tyvosaSbUH/3SCbzzMkyE=;
  b=PNI5ctbQ5hEWM67ju8VEH1FVSwj38eW6rCCEAynyOiIJC59Boiz4faS6
   Bgmz9l4GQFXFd1xxywqGATEjxUxlf8Fm+ZPYurHQcydPVQanqaTbf//5x
   gr0frZyIZio7GyQDD70WU2WRFd85mltSSFr0PJggDs3FCUAdZcAThKNZr
   aK98eLZV27NK5GgJi6mzYus0luleRoHjr6V19b3s3Tos42ADj8tSNd2+B
   E7KP1jUvBiwjfeDeHBXyLpaoLIKT+7aRvy70L5jzGVT/rKbn3KojpXKD8
   OC7YmolBc8PgcLQD4FmSFBEAAHJRYrj3KXAchRpX6SgQmJ/TEbXJZO660
   Q==;
X-CSE-ConnectionGUID: 3TD4JI1sTsmIPlMA2N/hug==
X-CSE-MsgGUID: ire6PzxFTMq9w9JFfi3RyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="86622808"
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="86622808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 17:16:47 -0700
X-CSE-ConnectionGUID: GpKG+yZFTqmSIyVC5lplVg==
X-CSE-MsgGUID: wCjyIOnNT+6Z2IBUyWXmXQ==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,158,1770624000"; 
   d="scan'208";a="231758203"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 03 Apr 2026 17:16:45 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8ogs-000000009RV-3K6I;
	Sat, 04 Apr 2026 00:16:42 +0000
Date: Sat, 04 Apr 2026 02:16:33 +0200
From: kernel test robot <lkp@intel.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [riscv:for-next 24/45] htmldocs:
 Documentation/arch/riscv/zicfilp.rst:79: WARNING: Inline literal start-string
 without end-string. [docutils]
Message-ID: <202604040216.ea9oBMct-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
head:   c0368008b37da62d634fdd1aa2603f13dc31528a
commit: 8a8f622c329e2e3690b54826370e4a0af45f66ef [24/45] prctl: cfi: change the branch landing pad prctl()s to be more descriptive
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260404/202604040216.ea9oBMct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604040216.ea9oBMct-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/devicetree/dt-object-internal.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,^Documentation/scheduler/sched-pelt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,(Documentation/translations/[
   Using alabaster theme
>> Documentation/arch/riscv/zicfilp.rst:79: WARNING: Inline literal start-string without end-string. [docutils]
   Documentation/core-api/kref:328: ./include/linux/kref.h:72: WARNING: Invalid C declaration: Expected end of definition. [error at 96]
   int kref_put_mutex (struct kref *kref, void (*release)(struct kref *kref), struct mutex *mutex) __cond_acquires(true# mutex)
   ------------------------------------------------------------------------------------------------^
   Documentation/core-api/kref:328: ./include/linux/kref.h:94: WARNING: Invalid C declaration: Expected end of definition. [error at 92]
   int kref_put_lock (struct kref *kref, void (*release)(struct kref *kref), spinlock_t *lock) __cond_acquires(true# lock)


vim +79 Documentation/arch/riscv/zicfilp.rst

    78	
  > 79	Per-task indirect branch tracking state can be monitored and
    80	controlled via the :c:macro:`PR_GET_CFI` and :c:macro:`PR_SET_CFI`
    81	``prctl()` arguments (respectively), by supplying
    82	:c:macro:`PR_CFI_BRANCH_LANDING_PADS` as the second argument.  These
    83	are architecture-agnostic, and will return -EINVAL if the underlying
    84	functionality is not supported.
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
