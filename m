Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D422C2581
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 05:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765688610; cv=none; b=Mgj6zw09SDTYv49XPUN8z3DxQhLo+8modRStkbJf2aj2shlrT+UoHdChT1ru3aMo1OuVUlboNsrZqmUnxEX+8UhEk7FbdUB4fFN6RmXzm9QGPb3bciuawpqtfGDypBogHizpeB+mNr+5q2luwFwVzYPEy9+ZLu73uYvBGl5oCmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765688610; c=relaxed/simple;
	bh=wwwde68DteCaZMQZQ1ZfqJCz3/TKSbGFRW06vV8uIko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DvP+Bq5DegL2igdXOZVRXg0IVEtwNNZfF49TYhD+OXliKWfSvEmLMoj37hW358hvRpVrB7zayryjLWxPi9qQNHVwQRYX60yK4LeKKGX0KhTqe7FICLvbp9IotpFIBPWkvycbJjFkYGeg4IBVT9qumQWmAUu510351Z5zqlm09Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y7kAauUf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y7kAauUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765688608; x=1797224608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wwwde68DteCaZMQZQ1ZfqJCz3/TKSbGFRW06vV8uIko=;
  b=Y7kAauUfozjs7HvqR9xZnX8/MjFRghu46heH15uuFQWxpQk2rLrHvFnS
   SpBu5IC+l4dnuNLtCPNzSpgXIQMzsboCC0rHncrhMqBJShPwNFCZVp//3
   i71GRmWg1yYp++KURDTGBtMyYDf03PiIp5/TO9onFGUq9LWjQ4Bk4XAUH
   NYx2A45IMJfOTGA53QMVhE5S39LeCJ7CUEBcvja6JZirhZV4T/htd68kb
   0zXXG7/pUZpzX3lu4IR/N2bxZja9OuyCGEW98a/PSGB6755opRNucVMAt
   zK6DAuxLgIH/R/OjgYbdvKHhNiIltqS+zI6in78rbY3tRi6O4JYEfpo0Q
   Q==;
X-CSE-ConnectionGUID: 2079IwyBRxmRMzlJJvbNcQ==
X-CSE-MsgGUID: Uweh7Q47SpC0Z3fjVSX+UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="77946495"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="77946495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 21:03:28 -0800
X-CSE-ConnectionGUID: bOjYQI8SSOamHd+rnsDJeQ==
X-CSE-MsgGUID: sjcLk+Z4RbqhY+2xBjBxVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197203042"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 21:03:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUeGT-000000008b1-0lcu;
	Sun, 14 Dec 2025 05:03:25 +0000
Date: Sun, 14 Dec 2025 13:02:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 5/5]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202512141357.ww8ZQAp8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: 8b9c57ce39a5a88dbc923cebe1fdd234239a7f94 [5/5] FROMGIT: xhci: sideband: add initial api to register a secondary interrupter entity
config: i386-randconfig-052-20251212 (https://download.01.org/0day-ci/archive/20251214/202512141357.ww8ZQAp8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141357.ww8ZQAp8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141357.ww8ZQAp8-lkp@intel.com/

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
