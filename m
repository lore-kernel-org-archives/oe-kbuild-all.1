Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D3C3C942B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Oct 2026 06:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791699967; cv=none; b=XIozzWBbfJN2rTVh7rTnYNKA4LDYVZVmF9SDHhii4PuyS7Q1WGiKKao30scq+qJE2UhipnuQkrhVDccwfLAEG89Qo2pMKBq+o0orYulETkSmUNz+5kP/a9qlMJihw1pNNe/4k/XRbng5dB3ajlW3YA2tfUyv9dhAxMM1eIab+dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791699967; c=relaxed/simple;
	bh=mvIn7OjERbFHOPX5YNHsT3hBEWf9cWY7xBgJLVMZOGQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cdXXrZ7PLwITYEoE8AUyHPcX6e+S+gxv6LUgJYPTnJnD5IBkyFzi+xIDYkicLceb9ADQ1HfYv0W4D7ieM0ujDFRDfGT9/kccLn/dx4woT9ihWmKmVRjJs/UHyO2D+MyzA2j6L1XiTWlOxA9o/1t7+4X4lIv3U+KtJHui6i/BDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUFzusQF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUFzusQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791699966; x=1823235966;
  h=date:from:to:cc:subject:message-id;
  bh=mvIn7OjERbFHOPX5YNHsT3hBEWf9cWY7xBgJLVMZOGQ=;
  b=AUFzusQFkoBzZtLM1u3jWHuKQLF/g2wfSqM6xIrCnIar3yx3jUYWwZ3h
   VY9MqmsbSn7cFm0YyRcoWvhNeY0Xjb8W774S+JV0QQQ2eJnJyl1Muopj4
   VPBUCzDW7E/8XqDmQroYLefO2691jRvx5ZZErc6c6Tau+kh0vut08hKBf
   cMBBAqsTy6i6cmJ7NHs5B4mp8jtvrRWSINfavz+2eXuYgalSumfQtaG8D
   kgr2IhuusBUi+lSx0NSpZLJGVtTteCYNSvDnn3CQqPvqtRDK3MnRSEake
   1ePkWk0faqvxgc5Yd8JlHbbq0JP+RTT37J1gXp9MVYTvw349c0SRm7a7i
   g==;
X-CSE-ConnectionGUID: qbLQ+LNeRcuxCcx6ybJ4dQ==
X-CSE-MsgGUID: wTXPqnUCQ4epiywtXoTgnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="535653"
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="535653"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 23:26:06 -0700
X-CSE-ConnectionGUID: YeJE3DQqTGioxDJaRU1DSQ==
X-CSE-MsgGUID: ILYxb9QUQyWPU3Vxh/TZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,151,1787036400"; 
   d="scan'208";a="731427"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Oct 2026 23:26:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFn0T-00000000AMa-3oAd;
	Sun, 11 Oct 2026 06:26:01 +0000
Date: Sun, 11 Oct 2026 14:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-add-OMR-event-ANBZ51468 12/12]
 drivers/bluetooth/btmtk.h:201:13: warning: 'btmtk_fw_get_filename' defined
 but not used
Message-ID: <202610111420.glzwgcDb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-add-OMR-event-ANBZ51468
head:   40555325b1fefd764aa1929b51f304033135bc97
commit: 4e4caa38e378bf8958252dc80dcffc795c97cb92 [12/12] Bluetooth: btmtk: add the function to get the fw name
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20261011/202610111420.glzwgcDb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610111420.glzwgcDb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610111420.glzwgcDb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/btusb.c:28:
>> drivers/bluetooth/btmtk.h:201:13: warning: 'btmtk_fw_get_filename' defined but not used [-Wunused-function]
     201 | static void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/btmtk_fw_get_filename +201 drivers/bluetooth/btmtk.h

   200	
 > 201	static void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
