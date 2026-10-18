Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641CC395240
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 20:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792356870; cv=none; b=leCGyoBxJHjNIzQBieW79O/zCyLWJPb9dN2kUhoyd+yoKNxL1cwclQG7GS2H8vzAEFzcSqomISCoXTsG4k1ZwWS58Q1giM6b6jwnESwR68nzIgcxtuEuI0ZEBQc/HM3GChCDkmsrEy44xWK75mc4D2WWNiGBCR+FPJe8Vg7S2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792356870; c=relaxed/simple;
	bh=Ks/NeqLJixIPwcBikpLlFdNauHkBOct6JCBatQ4HKTs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HIaZ6IKcxjn4sEZMsoaajWcvH726OLVAk+9pafzW08I+0jjt4Wh3mPTZXRwmrPnsYFKwIfNDpdQg7/x0VULyOdIxANsp8roufKCeOpnmRXeA0P1mSxQ1PVpOb2L0cELyn245HaBLRYjdsVGTw/DuD19Gse8+yhfOlkX6TmOC06A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZE6Wx9Qv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZE6Wx9Qv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792356867; x=1823892867;
  h=date:from:to:cc:subject:message-id;
  bh=Ks/NeqLJixIPwcBikpLlFdNauHkBOct6JCBatQ4HKTs=;
  b=ZE6Wx9QvZ+RwFaCdEh/l+VHwXfvugtXLLErIDWWUvEm+CJ0s/fZwSbDI
   PGbHm2XuivHvwhLSHTqCBn8s90ovY6C1/8dAQAOR3g3H1vaB0BXRPm3yo
   c6Qq82n/7TwAjWYpnx1nNFD4aMMpTEgNBEAarIo/afIvZtgMjM0rKKqQa
   +lndOqjARLxqgewojPYzCUwSUPU4ZfOJ7bS70MaXgUDDywMbrgolkZ/S4
   sbVfke49855HIjm4YLhRITdKyHLFX+mZahzok/HcEJBoWecrKbvNTnxrG
   AcEyENi51/Ql5+oF2UMhG0Oc8oJNVybv8o2hCUzvR4cWvOCzv+s8kZYuj
   w==;
X-CSE-ConnectionGUID: rp6CW+UiT1GT9GyaeyGMMg==
X-CSE-MsgGUID: emOPYYZLRAiI4E7gnX2vug==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1039819"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1039819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 13:54:27 -0700
X-CSE-ConnectionGUID: ST3z/ZqcQV65mPqlvqNmog==
X-CSE-MsgGUID: Pfr2vcdVRYi48mlr20CXKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2371355"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2026 13:54:26 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIXtf-000000005HH-1khA;
	Sun, 18 Oct 2026 20:54:23 +0000
Date: Sun, 18 Oct 2026 22:54:03 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 336/336]
 drivers/ufs/core/ufs-mcq.c:608: warning: Function parameter or member 'cmd'
 not described in 'ufshcd_mcq_abort'
Message-ID: <202610182238.t7KYr7lg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   85239205a20932568f405bb06f7dc3187e755674
commit: e3d62e38a9d5dde5e491c5aeefffb35d6d71e8df [336/336] FROMLIST: ufs: mcq: Added ufshcd_mcq_abort()
config: arm64-randconfig-2000-20261018 (https://download.01.org/0day-ci/archive/20261018/202610182238.t7KYr7lg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182238.t7KYr7lg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182238.t7KYr7lg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/ufs/core/ufs-mcq.c:483: warning: Function parameter or member 'hba' not described in 'ufshcd_mcq_sq_cleanup'
   drivers/ufs/core/ufs-mcq.c:483: warning: Function parameter or member 'task_tag' not described in 'ufshcd_mcq_sq_cleanup'
   drivers/ufs/core/ufs-mcq.c:541: warning: Function parameter or member 'utrd' not described in 'ufshcd_mcq_nullify_sqe'
   drivers/ufs/core/ufs-mcq.c:564: warning: Function parameter or member 'hba' not described in 'ufshcd_mcq_sqe_search'
   drivers/ufs/core/ufs-mcq.c:564: warning: Function parameter or member 'hwq' not described in 'ufshcd_mcq_sqe_search'
   drivers/ufs/core/ufs-mcq.c:564: warning: Function parameter or member 'task_tag' not described in 'ufshcd_mcq_sqe_search'
>> drivers/ufs/core/ufs-mcq.c:608: warning: Function parameter or member 'cmd' not described in 'ufshcd_mcq_abort'


vim +608 drivers/ufs/core/ufs-mcq.c

   600	
   601	/**
   602	 * ufshcd_mcq_abort - Abort the command in MCQ.
   603	 * @cmd - The command to be aborted.
   604	 *
   605	 * Returns SUCCESS or FAILED error codes
   606	 */
   607	int ufshcd_mcq_abort(struct scsi_cmnd *cmd)
 > 608	{

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
