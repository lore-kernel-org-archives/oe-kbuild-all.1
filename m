Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2395220ED
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Dec 2025 11:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766920823; cv=none; b=MZHy8NeFXE39ZUaW34p0uJS+3ZgHh1wsAx2ZzlhFlL1mRzW2ihMjTB7LD0uM6i2vpKGnyP+L2bjM1I2yPvshFCfclD79juLh5SzO167l4ToswSsaQvswB3bWqX9kUCmfHVxK+Ib3djhTA2QAtrdmUT2BmJb7hjWRMwVeyPli1Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766920823; c=relaxed/simple;
	bh=WekhsMt8YYck/4MZBI1pdd6lbnitR+T6h0LBdIXOERo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WDrsyPxb2/UPO1WHrBGRdvlN8bUggiCbO0YxylrpnbKG9miPSWOhrglaPNCgO/K8YxEOMnbSg9dBLn+gdZpBsu8fNwv8PxW1SNxy2d87MsE+nvam25jVCTC9rRiENsv+PcOU1WTThoZVo3EeAv+s3gQvugCXfioJcwhXpPJN57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdYcaQZq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdYcaQZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766920820; x=1798456820;
  h=date:from:to:cc:subject:message-id;
  bh=WekhsMt8YYck/4MZBI1pdd6lbnitR+T6h0LBdIXOERo=;
  b=CdYcaQZqznYexUfbT41O33ZKiXZKXIHZHBWq7audTAR3yDdnU+ajdnho
   tPUDEKU4GHuTvrgJ1mbC/vYDX1H8PwuWr1l4CR5vw8w9jZzlBKIzQ+H8J
   kYna9NE489hKF4dBsjq48pWcE7gcV7qV7X9gwLFJKcayGUR4wStSxbiG/
   B30JpMu0djWAUF9Xygq11FMwXLyGJi/wVyNfxZa/jxNKDLpPqUuH5eU+a
   TNxVHtPl4cT4RsnvaqeMY1LjkpGFFYgpxRtLG6EvUPPaTzQS9DhZtYyDi
   bbykPWHcgkrkVBoDesRaFjENsw5Bmc2oKKfeYTJdza+9k1QhNefcCjBxS
   w==;
X-CSE-ConnectionGUID: XmJFhyimS9iMKL1YBvZZsQ==
X-CSE-MsgGUID: OfuHj9B4TKmLDBLz5Fzxqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="79296835"
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="79296835"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 03:20:19 -0800
X-CSE-ConnectionGUID: IH8CB2+NT4mObEXQ5UAJNw==
X-CSE-MsgGUID: 0V8NXuF7SdO2qmTHFtJFiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,183,1763452800"; 
   d="scan'208";a="200608173"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Dec 2025 03:20:18 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZooq-000000006RN-0b6T;
	Sun, 28 Dec 2025 11:20:16 +0000
Date: Sun, 28 Dec 2025 19:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 drivers/ub/ubus/services/hotplug/hotplug_msg.c:48:6: warning: no previous
 prototype for 'ubhp_handle_event'
Message-ID: <202512281950.nFNoH9PH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   03c9c649e6f28e26260d276ce755f785b2435da3
commit: 03f481a88c6b72336d8e6cba6f2b71d6f28e2027 [13/13] ub:ubus: Support processing protocol link messages
config: arm64-randconfig-004-20251226 (https://download.01.org/0day-ci/archive/20251228/202512281950.nFNoH9PH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251228/202512281950.nFNoH9PH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512281950.nFNoH9PH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/services/hotplug/hotplug_msg.c:48:6: warning: no previous prototype for 'ubhp_handle_event' [-Wmissing-prototypes]
      48 | void ubhp_handle_event(struct ub_slot *slot, enum hotplug_event event)
         |      ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/ubhp_handle_event +48 drivers/ub/ubus/services/hotplug/hotplug_msg.c

    47	
  > 48	void ubhp_handle_event(struct ub_slot *slot, enum hotplug_event event)
    49	{
    50		bool queued = false;
    51		u32 flag;
    52	
    53		if (!ubhp_confirm_event(slot, event))
    54			return;
    55	
    56		/**
    57		 * get slot if work is queued
    58		 * queue_work: return false if work already exists
    59		 * mod_delayed_work: return true if work exists, with its timer modified
    60		 */
    61		if (event == HPE_BUTTON_PRESSED) {
    62			queued = queue_work(get_rx_msg_wq(UB_MSG_CODE_LINK),
    63					    &slot->button_work);
    64		} else if (event == HPE_PRESENCE_DETECT) {
    65			flag = work_busy(&slot->present_work.work);
    66			if (!(flag & WORK_BUSY_RUNNING))
    67				queued = !mod_delayed_work(
    68						get_rx_msg_wq(UB_MSG_CODE_LINK),
    69						&slot->present_work, 0);
    70		}
    71		if (queued)
    72			ubhp_get_slot(slot);
    73	}
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
