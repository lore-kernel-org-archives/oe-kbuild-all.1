Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F482222A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782219750; cv=none; b=J+lAMfVR2epvT56kksD54NV8XTdgKrceWinfz0AsIF9pRSSCOlpcdgIHRi70YPHdeV42zwHgna3ONc0QTi/EyBiAxWXT5Q5oeJ7P+q1llg0GCV84/x/HetJhJpNKlgdcN0hiAPNYSeeohvWqqf1pVTl2iWASFo1peb3gJ5X/g3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782219750; c=relaxed/simple;
	bh=s0tsEWPcRpHtN3JLmP7oWnhDiZoe1k8QxKFmPDeCxjg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G7BTH5GBpjc6ufWPNRkHrrFt8q8H4rk+G1BW1+y6/uArePJ+LeZsslUcaQ4P3Vt3p5IyyOZanN7PxQBEyZzi00ssShaeYtnlNzo9pjWEzAa0ASU+i8HXOIk5MGcMz7fT+0ceUdhh1wa9Ol8evcOk0Zc4ndHDnW5nttIvqxB4tAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBXAmYwG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBXAmYwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782219749; x=1813755749;
  h=date:from:to:cc:subject:message-id;
  bh=s0tsEWPcRpHtN3JLmP7oWnhDiZoe1k8QxKFmPDeCxjg=;
  b=OBXAmYwGVRP5jm9z7NZnS7xNK/Yv8c5Xj1I7ot2if4O8BvotJQyFoT6Y
   b/lCfHi1C8Bqo0A4S5V+DajOdJte8o0G9AkvUShYnYVruv2+WVbp26EF8
   RUvoGUl+XlGYQBcCwW8kOYZydyXO0BYQY6/ED0bc44XCz+KRQbkG1p2vH
   GSBNDTkc9lTlBLTMG0by/GWQgbVuShOV3JlqbIHav0dmtXdOIuz1vccpH
   XvmadnAGntCBf6wgVtlxpUtbIO/4QjfUNR9GDRgzG/9QLG3cIUwmNymrP
   xdesExVNuI/JNArhMuECOR+CLwInryJzYp+VgRMLHD+wsfjOIdbMBLnWW
   Q==;
X-CSE-ConnectionGUID: CtaxZY9eQTeFQeqP/gzp4Q==
X-CSE-MsgGUID: R0haK1TcTiCDoL/1BIqZYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="94077522"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94077522"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 06:02:28 -0700
X-CSE-ConnectionGUID: BrLQEK1qSI+dkIKe6oFSxQ==
X-CSE-MsgGUID: 5pMYlSfVTm2vbusdBMcjew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="253391940"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 23 Jun 2026 06:02:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc0lk-000000002XZ-0PFA;
	Tue, 23 Jun 2026 13:02:24 +0000
Date: Tue, 23 Jun 2026 21:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v2 10/18] ERROR: modpost:
 "init_net" [drivers/nvme/target/nvmet.ko] undefined!
Message-ID: <202606232007.c1vSPlvn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v2
head:   3d482734f1581168bb7973032424df660ce14955
commit: 56136fea189403be018d8adc4e368c22c976a823 [10/18] nvmet: make discovery subsystem dynamic
config: xtensa-randconfig-001-20260622 (https://download.01.org/0day-ci/archive/20260623/202606232007.c1vSPlvn-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606232007.c1vSPlvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606232007.c1vSPlvn-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux: section mismatch in reference: try_to_run_init_process+0x24 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
>> ERROR: modpost: "init_net" [drivers/nvme/target/nvmet.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
