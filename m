Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6857B225760
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738826564; cv=none; b=qC0ZKqfaHY2zRzYu9uzv/YoXDlHa5KrDQOSOux1+H7Gvq6R3fRG70zTSYe7buOisCpxFRTnUp209hK4RpedWoilp4lWZ/5FW4qRT+EjxaQ/joGb3dL/qB/MQ5yZfjuHW6klae3vZybkO+JMWNfMrcAZDRdfheAGDOTARL5zHdFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738826564; c=relaxed/simple;
	bh=vAWtDx7qjlDXveYxiypE6jwkBdH+iA+cNdeshoSN3BU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iaaW0ubGqoAk5YSTkis2Ajjb6tD19fwmTH8WrhbVEQlP1FeR+fuOUPEqa6VXle0st8n00kcRsiaDHi8Da29BYtfmEK1iCvJzF69zdFl5HCzqKehte0Gly6k9rQae0MPashAEtP1G7+i3LYayzTqbvTB7xPubjTIn4kzohIZLqag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nuoa7Ke+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nuoa7Ke+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738826563; x=1770362563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vAWtDx7qjlDXveYxiypE6jwkBdH+iA+cNdeshoSN3BU=;
  b=Nuoa7Ke+nyZtSp4cDm0FbHeGErH0EGj0NXvU45euPrTVh7WbouWfTeJI
   Gt/FaYAPVPLmxvmtDiRUkjiPpoQAS5glTthwivQ9zPzsnswfEqooQc0sb
   n01C2vbi7YUdWtwP0zDlurVOhu9fk58rlzW/GNCdzwt3NwppuXF3GXrTp
   Xey1cSP4ApReBzofRWjUTBefpNxekViq/++dPvxfvs114OUsEfFBFBIEc
   +papiaWSm+d0nOo8vmBnWgcNFw9GH2FQW+6DH0rjZYUlKJoPCGgQ03ch3
   hUSDQPs1Q+nKi1gSpN2G095WjEmCSlCC7Vwc3d9in3e9T1Cj2OtzpEyp8
   Q==;
X-CSE-ConnectionGUID: woEY7zsRSrKuAWPTZah7eg==
X-CSE-MsgGUID: 5x8I5jlERtiZEGElsBC9xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27019028"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="27019028"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 23:22:42 -0800
X-CSE-ConnectionGUID: VKzg9d3aTaygUhnzO3tk7Q==
X-CSE-MsgGUID: HkznuidoQ4C7aF/Se0icZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116089891"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Feb 2025 23:22:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfwDe-000wZ1-0z;
	Thu, 06 Feb 2025 07:22:38 +0000
Date: Thu, 6 Feb 2025 15:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'intr_num' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202502061502.2kehJfT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6550429f8dbead9ef7fc53fbabc5c985b491a9eb
commit: cca9824fd10fa5cf91be0a83f71a9ced6adc7c2a [0/3] FROMLIST: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250206/202502061502.2kehJfT0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061502.2kehJfT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061502.2kehJfT0-lkp@intel.com/

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
