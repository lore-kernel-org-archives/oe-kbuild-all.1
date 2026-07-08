Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B063AA1BA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 21:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547499; cv=none; b=RZVCCPWoANQnfj2sorgQ56RNWrBajlKIfvuH9t9U2QkUC1d3F237bYA46BjaLVMSrtT1IL+K75M3L+oQLBGMwBQtUakJ6FJwBvrMxhmad28IqsdGwkgGNja95O5w2H91SgzhbrKefgff9EGleUM5QGaRhofv1IkLmbRa1zcKSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547499; c=relaxed/simple;
	bh=LZlkOrlNoX5LxWIEwXT0hBiU5l1lCplIqc0KHYgzenM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qY/1i/Rpx1/nbp0U7SvlpE71M7KqIadmcoR9RPaqeST6tD/TlVCJGwBPJqH8RTyH+WrQru8UaQ87w9Q6F7rBq1eyQYmaScr5QJyMsWaxsXjXz+pV/55l7yXQp/9D99HvFAnyCX/ZbFEkhUwfPh/bWs0R6jIYcZhg+e7CT2mCo+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GhVPkeXh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GhVPkeXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783547498; x=1815083498;
  h=date:from:to:cc:subject:message-id;
  bh=LZlkOrlNoX5LxWIEwXT0hBiU5l1lCplIqc0KHYgzenM=;
  b=GhVPkeXhBPUvX9UCIrtj+oDPTNhxJ0FRLiF1T8bFFFtlISgj4Y5GP+i7
   V2wsdzdA9q2FfhqEvULnqEV9vZ2ii226CAGIbllOhidgZK2QrHSR8U1I6
   Lp744N4lIUDQ/puJuV/A8ZbrhJfWc3JUAHlZ7btMNEMIJbtznQKkIYIM2
   mpgPKY5y3yPJElJ714W+HkE5E11woU5crQrdscQ0ST/Qs3Vb1JiT+QXd1
   BBNrK6+mkamNK5w5sfufOwZyREQGAcIdBfZys9JvZ34FQSbwlKmxqiVCA
   LSeoJ5kFADXfK8fKwv+92REz7FLPs10HSv6ZhgGLhtT6SMabOXkXCN189
   Q==;
X-CSE-ConnectionGUID: XnEH0DvhRhmeoRlhh/6wCw==
X-CSE-MsgGUID: AO/uSwzfRjylY0U6fi9bkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84320164"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84320164"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 14:51:38 -0700
X-CSE-ConnectionGUID: xKYFd8FGS4ih5mg9tZLYJQ==
X-CSE-MsgGUID: GgfmiQTEShK+eDkUGNMjrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251750194"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2026 14:51:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whaB3-00000000GvB-1Vsi;
	Wed, 08 Jul 2026 21:51:33 +0000
Date: Thu, 09 Jul 2026 05:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'intr_num' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202607090508.c5sbtn7d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wesley,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6417b973d924236b080ef26fbfee42586a7b3704
commit: cca9824fd10fa5cf91be0a83f71a9ced6adc7c2a [1/1] FROMLIST: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: x86_64-buildonly-randconfig-002-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090508.c5sbtn7d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090508.c5sbtn7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090508.c5sbtn7d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
>> drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'intr_num' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:346: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'


vim +263 drivers/usb/host/xhci-sideband.c

7b946a32948f90 Mathias Nyman 2023-02-06  244  
7b946a32948f90 Mathias Nyman 2023-02-06  245  /**
7b946a32948f90 Mathias Nyman 2023-02-06  246   * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
7b946a32948f90 Mathias Nyman 2023-02-06  247   * @sb: sideband instance for this usb device
7b946a32948f90 Mathias Nyman 2023-02-06  248   * @num_seg: number of event ring segments to allocate
7b946a32948f90 Mathias Nyman 2023-02-06  249   * @ip_autoclear: IP autoclearing support such as MSI implemented
7b946a32948f90 Mathias Nyman 2023-02-06  250   *
7b946a32948f90 Mathias Nyman 2023-02-06  251   * Sets up a xhci interrupter that can be used for this sideband accessed usb
7b946a32948f90 Mathias Nyman 2023-02-06  252   * device. Transfer events for this device can be routed to this interrupters
7b946a32948f90 Mathias Nyman 2023-02-06  253   * event ring by setting the 'Interrupter Target' field correctly when queueing
7b946a32948f90 Mathias Nyman 2023-02-06  254   * the transfer TRBs.
7b946a32948f90 Mathias Nyman 2023-02-06  255   * Once this interrupter is created the interrupter target ID can be obtained
7b946a32948f90 Mathias Nyman 2023-02-06  256   * by calling xhci_sideband_interrupter_id()
7b946a32948f90 Mathias Nyman 2023-02-06  257   *
7b946a32948f90 Mathias Nyman 2023-02-06  258   * Returns 0 on success, negative error otherwise
7b946a32948f90 Mathias Nyman 2023-02-06  259   */
7b946a32948f90 Mathias Nyman 2023-02-06  260  int
7b946a32948f90 Mathias Nyman 2023-02-06  261  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
cca9824fd10fa5 Wesley Cheng  2023-05-09  262  				 bool ip_autoclear, u32 imod_interval, int intr_num)
7b946a32948f90 Mathias Nyman 2023-02-06 @263  {
7b946a32948f90 Mathias Nyman 2023-02-06  264  	int ret = 0;
7b946a32948f90 Mathias Nyman 2023-02-06  265  
7b946a32948f90 Mathias Nyman 2023-02-06  266  	if (!sb || !sb->xhci)
7b946a32948f90 Mathias Nyman 2023-02-06  267  		return -ENODEV;
7b946a32948f90 Mathias Nyman 2023-02-06  268  
7b946a32948f90 Mathias Nyman 2023-02-06  269  	mutex_lock(&sb->mutex);
7b946a32948f90 Mathias Nyman 2023-02-06  270  	if (sb->ir) {
7b946a32948f90 Mathias Nyman 2023-02-06  271  		ret = -EBUSY;
7b946a32948f90 Mathias Nyman 2023-02-06  272  		goto out;
7b946a32948f90 Mathias Nyman 2023-02-06  273  	}
7b946a32948f90 Mathias Nyman 2023-02-06  274  
7b946a32948f90 Mathias Nyman 2023-02-06  275  	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
cca9824fd10fa5 Wesley Cheng  2023-05-09  276  						   num_seg, imod_interval,
cca9824fd10fa5 Wesley Cheng  2023-05-09  277  						   intr_num);
7b946a32948f90 Mathias Nyman 2023-02-06  278  	if (!sb->ir) {
7b946a32948f90 Mathias Nyman 2023-02-06  279  		ret = -ENOMEM;
7b946a32948f90 Mathias Nyman 2023-02-06  280  		goto out;
7b946a32948f90 Mathias Nyman 2023-02-06  281  	}
7b946a32948f90 Mathias Nyman 2023-02-06  282  
7b946a32948f90 Mathias Nyman 2023-02-06  283  	sb->ir->ip_autoclear = ip_autoclear;
7b946a32948f90 Mathias Nyman 2023-02-06  284  
7b946a32948f90 Mathias Nyman 2023-02-06  285  out:
7b946a32948f90 Mathias Nyman 2023-02-06  286  	mutex_unlock(&sb->mutex);
7b946a32948f90 Mathias Nyman 2023-02-06  287  
7b946a32948f90 Mathias Nyman 2023-02-06  288  	return ret;
7b946a32948f90 Mathias Nyman 2023-02-06  289  }
7b946a32948f90 Mathias Nyman 2023-02-06  290  EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
7b946a32948f90 Mathias Nyman 2023-02-06  291  

:::::: The code at line 263 was first introduced by commit
:::::: 7b946a32948f90b198e3e51c824576458ceda3a4 FROMLIST: xhci: sideband: add initial api to register a secondary interrupter entity

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Neill Kapron <nkapron@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
