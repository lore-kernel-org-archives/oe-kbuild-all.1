Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73D1D5CFB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Sep 2025 23:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759100591; cv=none; b=Ec7FYN3cQOKw1t7qPJXzJYhle3yBCfOS6MybebIfMj0tMRytf8Zb06C4eWrlNrbqp7Iptmpkp3u/hTFifBXhtQIHMAjcm+0x17zvImvQdRniTYHxRGPksKQ9Z9wIZhWVX1pxlLBkSUdcepk/rPrDQLprccNSLdwzgy5yTSibUks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759100591; c=relaxed/simple;
	bh=9QjUWaHRNdGsqrlP8VC+2izrx0ohI5Jf42pZRUzpZyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dqEbdEM0e8Y7/v27Z/e2qKavs4LG8Jqgt0lBajnWTDmUbBycAPAdoLVUqTfqzeX2HEras2dznn8MivvBJssetZzLvHCoh1TlYWECQHN3MGXdIyNOJMZYC1CkiVeVPUC7kYyL+L+CzeBDQ6F3IXWmL6wMFaCI5ae83GNqEbLSVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IR6JlaCu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IR6JlaCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759100589; x=1790636589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9QjUWaHRNdGsqrlP8VC+2izrx0ohI5Jf42pZRUzpZyk=;
  b=IR6JlaCu4Gv8WaEKbAQsbYF9edNvsWsp2GiLRizrVDUtQj4p2Hf6aJtQ
   lN4WjLQOX3AB2xYb6PYPdt5LUlMXXig/aVUd9CZk0yz6pdMbVyYjirg95
   Hd1ukVGVduZ+AXMcYu2mMFAwofQsQoQNKiugqtW0Zy9rneQthVWVCYDtz
   f1iRS5j5HZOmEEu5zGzNOhGo9hmv/JxZMAklFqRAcGsKWMavNKUU02b4M
   xQ5VfZo8DQ9erpHOcVTyGW1K7eZ2LNoeZXcX+CNP/KmAeK2fN4W7+6MSC
   /t+V1bUalTqomtZBaoQ1Dew507JLCIz22BH2xPPgycqA6hwqwc3yj6Tab
   Q==;
X-CSE-ConnectionGUID: xWVOGbFISfS5tWd/lXx8jw==
X-CSE-MsgGUID: cY5qPbK8RQOVvwvvoTUL4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="72709351"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="72709351"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 16:03:09 -0700
X-CSE-ConnectionGUID: t5uB0cmYQV+7S2k/Bm3Clw==
X-CSE-MsgGUID: 9qw92UwQQwWSp/wYOdVO/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="215219791"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 28 Sep 2025 16:03:08 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v30Q5-000000005ir-0vEM;
	Sun, 28 Sep 2025 23:03:05 +0000
Date: Mon, 29 Sep 2025 01:02:32 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 39/39] htmldocs:
 Documentation/admin-guide/sysctl/vm.rst:856: WARNING: Title underline too
 short.
Message-ID: <202509290118.gd7j6aSo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7a713b4060b7b172fcc990942558eb95a41b6a22
commit: 7addd5e84ddee5fc52524ae6e0bc4ad3cb1c0c3c [39/39] anolis: mm: page_alloc: add a sysctl to tune the PCP_BATCH_SCALE
reproduce: (https://download.01.org/0day-ci/archive/20250929/202509290118.gd7j6aSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509290118.gd7j6aSo-lkp@intel.com/

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
