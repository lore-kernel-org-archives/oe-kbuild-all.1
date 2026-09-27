Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064FF3B71A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 05:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790487083; cv=none; b=kuf0gXqa+6JWG+11Q3mAKHyYIKxWycVG3o28HKwr6bYp75P/aEmV4y/ZNoY2qobz7iCR72pkCqScggeYuWIIJUX1ncy9L/LtYyGicUg9wdghFYfp5Dzy6O9+nrBYXSiNwz822TnvlsP0NwrlJyzAQ8YDS/sbF/4kd3d67uinYX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790487083; c=relaxed/simple;
	bh=nYQdxm/Zxim5NzLIIbL64bajnsMw38zbqrWhzi4r8O4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i4KolAQYWVT6JjtMzdQpfpiJuqw59s+aVmoVdPJtowk3gyo5W7DOV+L2dggXJ8OLJ0U4ftgu/2zsrugjBJvPk2MnixRYFGpBXNZSgYP1AwudWgDObP7YYydmlFMdoAkvSRvMfEOJGj3m5WlvY6ciIo8nIjg3/IdXeHm8s5K0R60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7J9lpA9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7J9lpA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790487080; x=1822023080;
  h=date:from:to:cc:subject:message-id;
  bh=nYQdxm/Zxim5NzLIIbL64bajnsMw38zbqrWhzi4r8O4=;
  b=K7J9lpA9AQ37T7nYV2NhrgihWunRUhp4CouMhCDum7Y6Ai8yqxo1A9E1
   v8HdmQbyMGtWW9auAZOBvSBMUz1cUwFaUutMCFZitIQkAkE94/BdoCeOl
   zY/xrAkXDRm8Fl7kdkilrCfEHT7jNmRYgtS4FB3Lcrn+XiY0v1zcNbQp5
   xezEOYMB3c/c+UKx83t/DvXDlXcoJatyaRW1U0ehSCEZTeGBY0ZyQf2fg
   W0ESEGEdsnl8NKMFUuaEvhTUZwopbqpEjruy83sAsp050r58ZdP1oL7jr
   psbMbh8hyIo+RAaUdY7rr3ZekxpwPLqV9atSY9OU4MgPjdxC8sbwsnx8y
   w==;
X-CSE-ConnectionGUID: qCzITPP7SEykZpKlttkFbw==
X-CSE-MsgGUID: r3oLJHzLQPOxhcnuamivhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="90258703"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="90258703"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 22:31:19 -0700
X-CSE-ConnectionGUID: jgnqX+5NTWaGQ92S3VtmmQ==
X-CSE-MsgGUID: yLA4dXROTVa7Dl98aKkdHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="273839557"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Sep 2026 22:31:18 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAhTo-00000000MRN-09KY;
	Sun, 27 Sep 2026 05:31:16 +0000
Date: Sun, 27 Sep 2026 13:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:scsi-thread-safety 32/65] Warning:
 drivers/scsi/fcoe/fcoe_ctlr.c:2170 function parameter 'fip' not described in
 'fcoe_ctlr_disc_stop_locked'
Message-ID: <202609271344.pkhfkrGp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bvanassche/linux scsi-thread-safety
head:   67ad293ba84284eaa5d8a5c335c59cf3ac091dc5
commit: 62a0320b1ca4528c88d0c7b8d0e236df16d5658d [32/65] scsi: fcoe: Enable lock context analysis
config: parisc-randconfig-1001-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271344.pkhfkrGp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271344.pkhfkrGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271344.pkhfkrGp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/fcoe/fcoe_ctlr.c:2170 function parameter 'fip' not described in 'fcoe_ctlr_disc_stop_locked'
>> Warning: drivers/scsi/fcoe/fcoe_ctlr.c:2170 function parameter 'fip' not described in 'fcoe_ctlr_disc_stop_locked'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
