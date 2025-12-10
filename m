Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5823D2FE59F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 03:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765336967; cv=none; b=NryAYh3SmyHJflUfxI+izoLblMsxYbmI373rXC8tXFdFQRvv13AAb5uW+KUAhKOZnlMaw4CDYd6yAODGMEfGtNmWJ4wYgb0Bt4XU7XHIrT+tVGY/5Z4HvSA91pzPGdSi7/B43selGimzhaVEd+lvqAurzW5/XPmVGslqDolgKc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765336967; c=relaxed/simple;
	bh=8qpiSWJv+JgVXgUAXpH0ChxocPR/8GgbOA5Lq7KDJzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DOY4I8dzAC6zzjdPh6RYkI5glkfJH/H3zDgRvg8WzJkM9B1RBwMV0RJK732nyuhqdItiiK1xIl4+r4t42XpMISXagFTZRFeud+hIH3mmbNq6iieuBttcxML4nBj4KrXU9cgpmLznPcz0MNZnHyLt7a6UZCW7+uo66JIsT5sdHDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+u4bxWF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+u4bxWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765336963; x=1796872963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8qpiSWJv+JgVXgUAXpH0ChxocPR/8GgbOA5Lq7KDJzg=;
  b=M+u4bxWFvjzQpydGyfCvPZL631DideSm83sp4k9uU13QjBwAe0Zg/9Vd
   0oBOkggHnHnEGyIF7xdWjyqKdKN+q3I05gJtPI/UUXf0EjVLU97kH+Ted
   crar1zoKHy5BrW5k6AVRGUj8URfVzmnn0Mkyb1qbmfq5Jq2XKhz46HcVH
   opoIpDpUY1hOca9Wi71BI39//YEc3VcCi9lr11xH+IlpItMVrPPQtlW9v
   otF2QocVxwzF7ymQKdk37T299rWnENtVu+xoJf4R6buRKvunbGlBgTBRP
   0lRwXVUaA6GNbXSNJTCtcXdwRaYx5MrK6ojtbUkRr/ByBL41ugR4lT9NX
   w==;
X-CSE-ConnectionGUID: ImJLpV9aQwSUXJhDaZmPqQ==
X-CSE-MsgGUID: OtWEa7pbTt+jUGzU5+RkNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84716882"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="84716882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 19:22:39 -0800
X-CSE-ConnectionGUID: 395KXk4cTiy7/3R9hlo44Q==
X-CSE-MsgGUID: /HC+bDp2SsG+4saBjnp4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
   d="scan'208";a="227056218"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2025 19:22:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTAmh-000000002bs-0e5a;
	Wed, 10 Dec 2025 03:22:35 +0000
Date: Wed, 10 Dec 2025 11:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Praveen K Paladugu <prapal@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Anatol Belski <anbelski@linux.microsoft.com>,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>,
	Stansialv Kinsburskii <skinsburskii@linux.miscrosoft.com>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: drivers/hv/mshv_common.c:210:6: warning: no previous prototype for
 'hv_sleep_notifiers_register'
Message-ID: <202512101158.wX3OJDwh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9b47175e9131118e6f221cc8fb81397d62e7c91
commit: f0be2600ac55a5845d536c56787daca50dbcb2a1 mshv: Use reboot notifier to configure sleep state
date:   4 days ago
config: arm64-randconfig-001-20251210 (https://download.01.org/0day-ci/archive/20251210/202512101158.wX3OJDwh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512101158.wX3OJDwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512101158.wX3OJDwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/mshv_common.c:210:6: warning: no previous prototype for 'hv_sleep_notifiers_register' [-Wmissing-prototypes]
     210 | void hv_sleep_notifiers_register(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hv_sleep_notifiers_register +210 drivers/hv/mshv_common.c

   209	
 > 210	void hv_sleep_notifiers_register(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
