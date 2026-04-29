Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AB039F166
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 23:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777506009; cv=none; b=uO/cAi/LD2Ip5qTYHsrdzffEs2UvSgDmLwWS56h+mMdXeBkey7gprlID7+75qD2TwK5N2AxtD07jjn0jE61lYUef0ONx6zwUdbHked+IA1CI7jXN9iTXbiO/ojiW20yPBvmFcurGWvdQak4UCD9WR9DYDvXftM7yRoZdRipNmfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777506009; c=relaxed/simple;
	bh=8DutFobvQaBDZuapNTTnnnVmpaXtxyzed+1FMM6VAaA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l3PAUUr+Iv5lgnhp/y3NST5DnPyU0RftJWlfyL5HNyh0iOcxMs130L5s7Bf5hgU62J2SPmCurq1QFTt/AzU1xSRHJH995BfyS3Mm6+GCrUNQlFwUcUWryhXQ19FD6VYR8PDARW0+o+R32in0fuq8XsqcBB3Cm/r4CSsKWyLNsTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPdDAMmU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPdDAMmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777506009; x=1809042009;
  h=date:from:to:cc:subject:message-id;
  bh=8DutFobvQaBDZuapNTTnnnVmpaXtxyzed+1FMM6VAaA=;
  b=DPdDAMmUEcqEtufQwdE0ODiDpOfrCm0bWI0gPmpEI/vItyzOhaM2PKzA
   51fOErC9sC0OuBVsdajTs8AAo5Q+2tl++TRGSETeWhsjOt6I9TzkRr8eD
   9KzwZ2tPLc74a2kI2S8KmKKcELvcOy8w9QHGHJsOJvdgbw6S55odNpJFU
   OG3pljXeWr5g2ZUEW8w4j0KrpYo0Fg10w0zqzMjcR+KzFP9JykkU361ln
   i6JiANThZ+hi2Dax2EcTKtop6qzVINTK5pjzCwHl1p8Bn1Aow9dYo81ZJ
   HyalIyfVlP0GqKn1iZb9dsO1jv894FpQCfLwkcBqOOXx3I2O2uhNE2Ghl
   A==;
X-CSE-ConnectionGUID: KbOIDf5PQw69AKm8flBo0A==
X-CSE-MsgGUID: 7v8QfpfsTVmJLCxk6qetug==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78366636"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78366636"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 16:40:08 -0700
X-CSE-ConnectionGUID: WEwoOfGHQ3ePm5tRKvw1Mw==
X-CSE-MsgGUID: oDJLsV/BTCKpH0ZYx929KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="272533552"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2026 16:40:06 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIEVf-00000000Bei-3WG0;
	Wed, 29 Apr 2026 23:40:03 +0000
Date: Thu, 30 Apr 2026 07:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_mark_userns 9/11] kernel/nscommon.c:149:2:
 error: call to undeclared function 'fsnotify_ns'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202604300731.ubiUcSJH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fan_mark_userns
head:   f2a3e4bb97217a9bed53d32a78ddd22353868118
commit: 4dcba799f789519dcdfd1892e990ec313c3f4539 [9/11] fanotify: add support for watching the namespaces tree
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604300731.ubiUcSJH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300731.ubiUcSJH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300731.ubiUcSJH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/nscommon.c:149:2: error: call to undeclared function 'fsnotify_ns'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     149 |         fsnotify_ns(mask, owner_userns, ns->ns_id,
         |         ^
   kernel/nscommon.c:149:2: note: did you mean 'fsnotify_mnt'?
   include/linux/fsnotify_backend.h:1042:20: note: 'fsnotify_mnt' declared here
    1042 | static inline void fsnotify_mnt(__u32 mask, struct mnt_namespace *ns, struct vfsmount *mnt)
         |                    ^
   1 error generated.


vim +/fsnotify_ns +149 kernel/nscommon.c

   147	
   148		/* Report child namespace events to owner userns watchers */
 > 149		fsnotify_ns(mask, owner_userns, ns->ns_id,
   150			    to_ns_common(owner_userns)->ns_id);
   151	}
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
