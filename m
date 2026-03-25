Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D453624B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774422485; cv=none; b=KnV+Ah9S9ARUA3rFFnyhF7sS6yHceKeLTq5nJOaRkQ5Ebk+bzWxu8kGEPgiPIzo5IWs7resjYoftLhkhQAClQDrIiN6klDWqtHbTrUBbEv2FEtqkAkIaqyU4qH14vZ++sJeJ9+F9bg0tMXmXtV8avhHsCoomWEtkDnKTNDrz6L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774422485; c=relaxed/simple;
	bh=uSeMeEIjDnKVGMYe4qzngmMoxrP7yuYrLL81kRuf0sE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t+9UOqMZjFtFd2iNUxttz6BnVMixFcgdCDbnz/KFFQHIw9qNuxzHZgtaMzB4YsxhKfxuH72dn1SFiiHaQG9raMeIBC6IzfB7soX81SpyC9OuWtSsVrSy/YykObJYwVgQGhUHUa75cQY5S1oaCPsJVtHe4ZdzYSKyoxkAFkJeTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdVh0sei; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdVh0sei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774422485; x=1805958485;
  h=date:from:to:cc:subject:message-id;
  bh=uSeMeEIjDnKVGMYe4qzngmMoxrP7yuYrLL81kRuf0sE=;
  b=WdVh0sei8K2KO8AVZb+tpz3xtKeSeFrJ5njBGbu3BNVm+pOfHUMjDsYp
   l89QYbY8jnWO0mfihoOpfRBfWjLeBo4ZaxO7orHlwAyD/UwbM4u5NrxP/
   6k73JV62Jb1p+5rwcBtxsVG9mLtN8XDXmCRmvhUL1LFzFINVpPsSap4Rh
   c2jNtBRHbLCjiGMbXKPDR/Ckyq1LpqKACw+15OjswH1vVwJDnxIgUZ+Ji
   z+lf3h4GUNzvNbjpPY9KdJ2DQcQI7IbQA4s/VdyO5MrU0J9nXiOBMHaKw
   pWOaG9mUhb7i8YlamrxVrvx/EVTC0EMrDaNwQPPdNqIBWoy9K7bLBAs9F
   Q==;
X-CSE-ConnectionGUID: YMzt6wXQS/OTA8yyvCOMhA==
X-CSE-MsgGUID: nJgmgVK1SWSqP+ABk6/mIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86930150"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86930150"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 00:08:03 -0700
X-CSE-ConnectionGUID: tL+LM0KTSLuk0cx8x68meQ==
X-CSE-MsgGUID: 5Fg8ZO2VReamgcenNX8ZEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229061478"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Mar 2026 00:08:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5ILP-000000006O5-07Gy;
	Wed, 25 Mar 2026 07:07:59 +0000
Date: Wed, 25 Mar 2026 15:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 44/44]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202603251540.tnARGRdM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mathias,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: 8b9c57ce39a5a88dbc923cebe1fdd234239a7f94 [44/44] FROMGIT: xhci: sideband: add initial api to register a secondary interrupter entity
config: arm64-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251540.tnARGRdM-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251540.tnARGRdM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251540.tnARGRdM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:345: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'


vim +263 drivers/usb/host/xhci-sideband.c

   244	
   245	/**
   246	 * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
   247	 * @sb: sideband instance for this usb device
   248	 * @num_seg: number of event ring segments to allocate
   249	 * @ip_autoclear: IP autoclearing support such as MSI implemented
   250	 *
   251	 * Sets up a xhci interrupter that can be used for this sideband accessed usb
   252	 * device. Transfer events for this device can be routed to this interrupters
   253	 * event ring by setting the 'Interrupter Target' field correctly when queueing
   254	 * the transfer TRBs.
   255	 * Once this interrupter is created the interrupter target ID can be obtained
   256	 * by calling xhci_sideband_interrupter_id()
   257	 *
   258	 * Returns 0 on success, negative error otherwise
   259	 */
   260	int
   261	xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
   262					 bool ip_autoclear, u32 imod_interval)
 > 263	{
   264		int ret = 0;
   265	
   266		if (!sb || !sb->xhci)
   267			return -ENODEV;
   268	
   269		mutex_lock(&sb->mutex);
   270		if (sb->ir) {
   271			ret = -EBUSY;
   272			goto out;
   273		}
   274	
   275		sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
   276							   num_seg, imod_interval);
   277		if (!sb->ir) {
   278			ret = -ENOMEM;
   279			goto out;
   280		}
   281	
   282		sb->ir->ip_autoclear = ip_autoclear;
   283	
   284	out:
   285		mutex_unlock(&sb->mutex);
   286	
   287		return ret;
   288	}
   289	EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
