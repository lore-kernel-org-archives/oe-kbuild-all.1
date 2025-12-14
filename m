Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3D62D249B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 02:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765678362; cv=none; b=FW2a6r3UOlP7l8MnpNrylvysEfIMjS+hU/aR69aAKTP2tqlZArLOMgqSUtDxft16UV2QreHW1L724FvKYvccBYndycyWhHvKvatntHZN0hkH77xYxyBizES+e7x5XPhX/Xr9BOSv/UmHeagfUWMSDVnCHdV7BtTaVoeCbxdxNPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765678362; c=relaxed/simple;
	bh=rpFv55xwIE05cnhxRyxoUbhbxqAATu+snSbB5AkXgkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gMt6NdtoInq7eljSW2Hp9uUkXEkZjp1vc0hK0IqbbKKvfzQv2tMBmuonmUUu7Ul1n+dO8cDBE+Yc8DbFlC1cNrA7a6zQO/a2LULRb8sgSDGCh2e8R+kqgAUrwoyt1ZQAF+RYEwWbHdcoDFe0hSv0oyXi59MJlyf7SM3JZ9rOHfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcABh2m8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcABh2m8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765678361; x=1797214361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rpFv55xwIE05cnhxRyxoUbhbxqAATu+snSbB5AkXgkQ=;
  b=kcABh2m8LJ2haMePHDLyjSNIn3yDK4zNWZImtye9uSILwyk3i1njQNFe
   6RWZafMcTA++RNgzCQINzCULZODU0yeMvMlbWlxkB0twlbS0QQZjFXo2c
   KoFoJbpy/lZuNilv69TK5Y27XfFtrY1+CaKsBw2NsEYhizwxXA++/EV4b
   Fk7bfGoIng4KaUn7SvEC4Gz29X7GvZp0EHqCYym0d3KxR+bHAOYAnI5MV
   /PUsw8fOdFiV0WjFi4WXcxHbp12VR61fa4apUfmix4xViwr+cVSsv3pXS
   7+pm0olZBOjt/D9JkEBau0rgyFSLWU5JF7cl0b2FHn7Tn0s9QeIt3MxKg
   g==;
X-CSE-ConnectionGUID: s12yr/JyTneVqnE96yV5Vg==
X-CSE-MsgGUID: DeiYC0olRkeEOTen0bsDdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="66802238"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="66802238"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:12:40 -0800
X-CSE-ConnectionGUID: jq09lzFhTY+/tqPS1+xlXQ==
X-CSE-MsgGUID: aCFCA2mYTF60MAnruu1Z7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201929334"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Dec 2025 18:12:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUbbB-000000008T5-0Xlp;
	Sun, 14 Dec 2025 02:12:37 +0000
Date: Sun, 14 Dec 2025 10:11:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/18]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'intr_num' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202512141001.TXrOFLyt-lkp@intel.com>
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
commit: c354230ab97feb64813581d381c9f199ed70dd33 [0/18] FROMGIT: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: i386-randconfig-014-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141001.TXrOFLyt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141001.TXrOFLyt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141001.TXrOFLyt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
>> drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'intr_num' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:346: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'


vim +263 drivers/usb/host/xhci-sideband.c

8b9c57ce39a5a88 Mathias Nyman 2025-04-09  244  
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  245  /**
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  246   * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  247   * @sb: sideband instance for this usb device
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  248   * @num_seg: number of event ring segments to allocate
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  249   * @ip_autoclear: IP autoclearing support such as MSI implemented
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  250   *
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  251   * Sets up a xhci interrupter that can be used for this sideband accessed usb
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  252   * device. Transfer events for this device can be routed to this interrupters
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  253   * event ring by setting the 'Interrupter Target' field correctly when queueing
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  254   * the transfer TRBs.
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  255   * Once this interrupter is created the interrupter target ID can be obtained
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  256   * by calling xhci_sideband_interrupter_id()
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  257   *
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  258   * Returns 0 on success, negative error otherwise
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  259   */
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  260  int
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  261  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
c354230ab97feb6 Wesley Cheng  2025-04-09  262  				 bool ip_autoclear, u32 imod_interval, int intr_num)
8b9c57ce39a5a88 Mathias Nyman 2025-04-09 @263  {
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  264  	int ret = 0;
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  265  
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  266  	if (!sb || !sb->xhci)
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  267  		return -ENODEV;
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  268  
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  269  	mutex_lock(&sb->mutex);
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  270  	if (sb->ir) {
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  271  		ret = -EBUSY;
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  272  		goto out;
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  273  	}
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  274  
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  275  	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
c354230ab97feb6 Wesley Cheng  2025-04-09  276  						   num_seg, imod_interval,
c354230ab97feb6 Wesley Cheng  2025-04-09  277  						   intr_num);
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  278  	if (!sb->ir) {
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  279  		ret = -ENOMEM;
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  280  		goto out;
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  281  	}
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  282  
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  283  	sb->ir->ip_autoclear = ip_autoclear;
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  284  
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  285  out:
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  286  	mutex_unlock(&sb->mutex);
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  287  
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  288  	return ret;
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  289  }
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  290  EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
8b9c57ce39a5a88 Mathias Nyman 2025-04-09  291  

:::::: The code at line 263 was first introduced by commit
:::::: 8b9c57ce39a5a88dbc923cebe1fdd234239a7f94 FROMGIT: xhci: sideband: add initial api to register a secondary interrupter entity

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
