Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2182433122B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 11:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769946811; cv=none; b=uhnrnM7ZppCTGd4jQFyyT94yun9zIHhxt76jCRbWmzJ4nVGR9z2s33C4GmitFFog41syfYvRLCFsjftvov5VnepXK0ZSNZcs5RmweFRUsc/o/4eIeqE84YPCrktvajz9YDeqG4lxXbeUmxQI6vb2k0sxLGZ/6cX6uDB0bCJ4mZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769946811; c=relaxed/simple;
	bh=FUA+j6FssjtUCgdnEYcmvcvq4YCJMLLwPRaGqRjrX6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qdVNPSlag8sQTfaOxC+yQ9nYgXPxJLPyklm6b0L+oRECz5eA6saW2WMS26e2Zv+U1D6kANcv7Tac6flRMFRekyTyDBCiS7GVls6cc5gU+p18jx1Z8wHK/1ryQcuKIykIGqO1L6ebUj3dwozJfnmP6czuZsLs0AelWwREhJAM18Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOkPHZsR; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOkPHZsR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769946809; x=1801482809;
  h=date:from:to:cc:subject:message-id;
  bh=FUA+j6FssjtUCgdnEYcmvcvq4YCJMLLwPRaGqRjrX6U=;
  b=JOkPHZsRcwvu4QayIi6+4QZOY0J4aUrvPnwNBKsnkSeJKswyfBr6H3G+
   reQiZjpG5LdexgesunXf8wPOhyTIlgQ7j+uBOR+OQ3sYxZGRE9cefvWU5
   Sn7ENPhXmbKfCXFWxZmEf4AkegXohafQhysUPyCUsLMyhKMj/EBefbpUQ
   mJLbg4vewjol8/Rjh7BtkDvXoSF2qd2yfSstfwylDElCeT2bRjhnbSu1u
   lVRXtXQXygOi9Lb2QVheIolaWdrMAa4p6wxNuQ1ZPXPaztSyroqrxvWpF
   uKKbueU6gfekR3iByEJ+lUeE0wKSm7FSkbi+bGlvH5DhR1d6ENCyqCpkK
   A==;
X-CSE-ConnectionGUID: UaQ4SCNKSUiuv9W2K4SjSQ==
X-CSE-MsgGUID: rsswMKO7RBK7UUro2U+j3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="70848385"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="70848385"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 03:53:29 -0800
X-CSE-ConnectionGUID: fixmZCwQTE+9K2q9+6nLjg==
X-CSE-MsgGUID: ZUu2iuG7SbykVZICg8fu3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="240513104"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Feb 2026 03:53:27 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmW17-000000002wX-0oJC;
	Sun, 01 Feb 2026 11:53:25 +0000
Date: Sun, 01 Feb 2026 12:52:54 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/3] htmldocs:
 Documentation/admin-guide/sysctl/vm.rst:856: WARNING: Title underline too
 short.
Message-ID: <202602011226.gwcnVPui-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8f3dc34debe1467cc2306963037f0db6b36e1729
commit: 7addd5e84ddee5fc52524ae6e0bc4ad3cb1c0c3c [0/3] anolis: mm: page_alloc: add a sysctl to tune the PCP_BATCH_SCALE
reproduce: (https://download.01.org/0day-ci/archive/20260201/202602011226.gwcnVPui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602011226.gwcnVPui-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/admin-guide/media/ipu3.rst:598: WARNING: Footnote [#] is not referenced. [ref.footnote]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/pstore_zone.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/pstore_blk.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/rio_drv.h' failed with return code 2
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/rio.h' failed with return code 2
>> Documentation/admin-guide/sysctl/vm.rst:856: WARNING: Title underline too short.
--
   percpu_pagelist_batch_scale_max
   ============================== [docutils]
>> Documentation/admin-guide/sysctl/vm.rst:856: WARNING: Title underline too short.


vim +856 Documentation/admin-guide/sysctl/vm.rst

   853	
   854	
   855	percpu_pagelist_batch_scale_max
 > 856	==============================
   857	In page allocator, PCP (Per-CPU pageset) is refilled and drained in
   858	batches.  The batch number is scaled automatically to improve page
   859	allocation/free throughput.  But too large scale factor may hurt
   860	latency.  This option sets the upper limit of scale factor to limit
   861	the maximum latency.
   862	
   863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
