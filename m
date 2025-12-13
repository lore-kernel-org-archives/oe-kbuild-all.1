Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876551DE3DC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 23:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765668100; cv=none; b=SGkKr4khy76wHwXf9A9rEq70fUQdyTBXy08HkrX2gyABUmXloVaCkjqwhmQxyT4YfcPBc6GYZhVZVodBG4/vC1ETSjCDaeNaRtjGmTtLcl8c/qkD/PThrwXFGup942en4+TproYs+dCraZCYeLPba9v1YyKondni1Be6rAHrtMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765668100; c=relaxed/simple;
	bh=aVvHK0RXqRICecxHtwYd8TmqMkU2kN6B8YzdyU/WkCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U6UWQ+z5HWEzOKD334zVLAS+Yunkd7X2t0W3Vz4vQrcHUKUqwvlzFn+adpA4URVglGGK0XApN8/9KcaZtxRP/643yjoahvPO8GlST3PTsPh5qjpkPmTxDYz7Z4dvGcEkt0N/N7u7L2V5Q5jjKfI4Nw1zKbMFOndQa8wBJHy4PBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuOA6W+w; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuOA6W+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765668098; x=1797204098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aVvHK0RXqRICecxHtwYd8TmqMkU2kN6B8YzdyU/WkCg=;
  b=fuOA6W+wNPnOD13CwDe6SVYnt6V8v/HPdLFUcghgBZqrV2JISv4RAhI0
   hO1bJT39PjDumYGCoccR4rQjvRitbFp2/ANm1e7fC8KxUHxw8yJymZA5o
   fvB60ul1rs+6wsjGnH/OmAh25feprLpBHCE+1/r3WQzsOTmG9sOqGzlXg
   9+gdxNCoXG9mit+ZGHuOeT2cUpMA0pxJBLMn2H11aCJqX5ha3xHJVLzn9
   FheyZYYxYdqm1S5xkBqWbbFipf+EwCtFTwTME0mOEftu6Hquz+f/s/P6c
   yLeSoTF+HXMH3azlRzRRYsrGZ8yiKu4OQG7gTGJOj7KnuZjswTBNmrmfV
   Q==;
X-CSE-ConnectionGUID: H8c545D0T42x2WmAlM1MNQ==
X-CSE-MsgGUID: Zh4HoALaSLKMlAchits8tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="77939205"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="77939205"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:21:38 -0800
X-CSE-ConnectionGUID: a1r4pD0MQWKJuFi02L1QnQ==
X-CSE-MsgGUID: wI45rYg3TLidNNlFMCFU9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201898077"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 13 Dec 2025 15:21:37 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUYve-000000002Cu-3nRC;
	Sat, 13 Dec 2025 23:21:34 +0000
Date: Sun, 14 Dec 2025 00:21:25 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/50] htmldocs:
 Documentation/admin-guide/sysctl/vm.rst:856: WARNING: Title underline too
 short.
Message-ID: <202512140054.fxPwQz0c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baolin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 7addd5e84ddee5fc52524ae6e0bc4ad3cb1c0c3c [0/50] anolis: mm: page_alloc: add a sysctl to tune the PCP_BATCH_SCALE
reproduce: (https://download.01.org/0day-ci/archive/20251214/202512140054.fxPwQz0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140054.fxPwQz0c-lkp@intel.com/

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
