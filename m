Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01A22D3EEC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028055; cv=none; b=DDMeeEzR5pbh4Ng82qpwllZyRZMPU2X+ZqhcI4mkUGpIiVADRhRS8Si9AKrJlfEZ0sEMp018h8RKCDJxjW/t3AV9OzStjjGJf5kurEPjqEJvArgorHiMu+apfSWSIbmufC2emUnEfs72bYS0wzOUbpMFmrBSzn4UoUpN8ejfohk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028055; c=relaxed/simple;
	bh=fwLogRgv5SA5f+CCgKXKbJuqMjGSRjY9rBRVcVbQ/q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4RxZZJlLo+rozM6ydaBK6HvxXGoHA66YKHbmWTIS1HUTrrug5d++WGTvS9H0HMr5AYu3ZEJOHS8H6/0Z1bOtTL94GBvHBOMyoApa3hLvsn9IypYetZXMnRkx/ERpLtwlZJEBXPuRel8+J/qbJpAyYazVAacIXt4dxDidgySGzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR5dS5T6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR5dS5T6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751028054; x=1782564054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fwLogRgv5SA5f+CCgKXKbJuqMjGSRjY9rBRVcVbQ/q4=;
  b=mR5dS5T6sklYkqg6jq4448FRpDyz1dZi6pCPqYfB99iqBDQTaSAgv6EO
   PKEW9l7wm03Ldak+s+9MR5iP8fa8cfEtCbCUC10O2bvwZtP+bdd2XCVwi
   zN3E4lhdwKLdFZlVnGP16+xvDMDbfzEqS2CMjeXOfOhNPyPF2i51wipH7
   mybCx5wBd9k3/EqwyUhoe0OhdaFfW+KhehMnHYWKjdUmXSCx7WtZ9Dx5+
   0QKMT/YZ8PBJiXk/pvnZlSvFb5mT9i8DBW4334Zc4q8NpgJDb5gfH15Bd
   Ris/bJYnJw8DZDupC7xFI9oLwX7IHWzrHm7NuJ+5AUr19rOB56gOprhqr
   g==;
X-CSE-ConnectionGUID: mwnuA7XfR66q+9NXXpJhpw==
X-CSE-MsgGUID: jyWvQcuaRpOBP919TYtpbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="78778286"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="78778286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:40:53 -0700
X-CSE-ConnectionGUID: HeWf7RPBT6mK6hCwd10DZQ==
X-CSE-MsgGUID: VcUtREDPQsuU0pxVk8pWnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153096603"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jun 2025 05:40:52 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV8Nu-0000f9-1i;
	Fri, 27 Jun 2025 12:40:50 +0000
Date: Fri, 27 Jun 2025 14:40:36 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/2]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'intr_num' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202506272012.w0aBh5XW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   0144e2490a70c3551bfb173921278f21d8255d44
commit: c354230ab97feb64813581d381c9f199ed70dd33 [0/2] FROMGIT: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: x86_64-buildonly-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250627/202506272012.w0aBh5XW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506272012.w0aBh5XW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506272012.w0aBh5XW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
>> drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'intr_num' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:346: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'


vim +263 drivers/usb/host/xhci-sideband.c

8b9c57ce39a5a8 Mathias Nyman 2025-04-09  244  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  245  /**
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  246   * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  247   * @sb: sideband instance for this usb device
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  248   * @num_seg: number of event ring segments to allocate
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  249   * @ip_autoclear: IP autoclearing support such as MSI implemented
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  250   *
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  251   * Sets up a xhci interrupter that can be used for this sideband accessed usb
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  252   * device. Transfer events for this device can be routed to this interrupters
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  253   * event ring by setting the 'Interrupter Target' field correctly when queueing
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  254   * the transfer TRBs.
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  255   * Once this interrupter is created the interrupter target ID can be obtained
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  256   * by calling xhci_sideband_interrupter_id()
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  257   *
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  258   * Returns 0 on success, negative error otherwise
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  259   */
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  260  int
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  261  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
c354230ab97feb Wesley Cheng  2025-04-09  262  				 bool ip_autoclear, u32 imod_interval, int intr_num)
8b9c57ce39a5a8 Mathias Nyman 2025-04-09 @263  {
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  264  	int ret = 0;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  265  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  266  	if (!sb || !sb->xhci)
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  267  		return -ENODEV;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  268  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  269  	mutex_lock(&sb->mutex);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  270  	if (sb->ir) {
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  271  		ret = -EBUSY;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  272  		goto out;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  273  	}
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  274  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  275  	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
c354230ab97feb Wesley Cheng  2025-04-09  276  						   num_seg, imod_interval,
c354230ab97feb Wesley Cheng  2025-04-09  277  						   intr_num);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  278  	if (!sb->ir) {
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  279  		ret = -ENOMEM;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  280  		goto out;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  281  	}
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  282  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  283  	sb->ir->ip_autoclear = ip_autoclear;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  284  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  285  out:
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  286  	mutex_unlock(&sb->mutex);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  287  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  288  	return ret;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  289  }
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  290  EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  291  

:::::: The code at line 263 was first introduced by commit
:::::: 8b9c57ce39a5a88dbc923cebe1fdd234239a7f94 FROMGIT: xhci: sideband: add initial api to register a secondary interrupter entity

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
