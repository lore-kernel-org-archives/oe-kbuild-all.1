Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F56F06B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927235; cv=none; b=Z9/Yykh7C+NBPfMmCgL3YRl9X0uIsjtf4mHFd/FCenHmRU7hjyFbmFLj93dxxYmoo/u4SRLga/KtG6RioDfscEdzhUfVPYlrQQGOL2xasDhe6DtVlgDVwwix1SlvkaTeQJXRMffcjOCPfx9i2ilCsXDxL6mkWb6IkSljpNHOxNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927235; c=relaxed/simple;
	bh=Aif+OmCgDwVaeaKoJKWq/mObokhI9LozaZFbeqMM2Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NXCJlQaP8i+pkUupbUxU3OWK0Hhhqv/Dyn85MGn3jrlE5fnRdCv08rp9B3l9EAxCbBG1qwPOJqh+FXeGpJLYv70DQekwYQqVXD0SHvTZQv0NEN+j1QXiL24Ifx8gsUT8sTNmjHR0UeLjPHB7lawMFd1WYY7Ss7Z6GFtFrLP16vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dh5mulxb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dh5mulxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754927234; x=1786463234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aif+OmCgDwVaeaKoJKWq/mObokhI9LozaZFbeqMM2Hw=;
  b=dh5mulxb0LysndEiXL0cMCrNAUkoNOe2U+nSZV3hAwUhurUQTjjduT1B
   R0Wzfmh5Xi3Kx3EQFKN4ESCxNwuOXruJ1gNQfpcddaH1mjPKtqzbwCBr4
   axxX8fwBqj/ZdrCF7TU+WoczIo/KwKn6RUfriaoCLllwCP2t+fzspD34M
   tZ5vlkrVVtJuka1Npl5zpAdscR90xv9d0ZeH9d2oSRsVFkhPbu6H4n0DG
   pCksqthuUWWy0tfEyN7+Hq0tKjH4ZKmhPoCME3envqqY7gLAqjQVMznbq
   klLrsRLpie1QigybYQ+fWRmuU9gINmishw5oQ/LKnY8FGY/vWy1DX5OqD
   g==;
X-CSE-ConnectionGUID: EwpA/EUERqWHfP39aS8V+w==
X-CSE-MsgGUID: 4afzXR0ISZ2VkkenGbiGkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56896172"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56896172"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 08:47:14 -0700
X-CSE-ConnectionGUID: 467XxheIRF6ARR0baZM5TA==
X-CSE-MsgGUID: aWqd+UWCQDO1VArchTXUIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165577369"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 11 Aug 2025 08:47:13 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulUju-000351-1M;
	Mon, 11 Aug 2025 15:47:10 +0000
Date: Mon, 11 Aug 2025 17:47:06 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 drivers/usb/host/xhci-sideband.c:282: warning: Function parameter or member
 'intr_num' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202508111744.34d5zLO8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f66b79911ed8ccb29c3129f3b35fbb418395f189
commit: f5a5187f7ea13f11dee77d4bd6ab2d4e367cd153 [0/1] FROMLIST: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: x86_64-buildonly-randconfig-2003-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111744.34d5zLO8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111744.34d5zLO8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111744.34d5zLO8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-sideband.c:282: warning: Function parameter or member 'intr_num' not described in 'xhci_sideband_create_interrupter'


vim +282 drivers/usb/host/xhci-sideband.c

fb897bf907b803 Wesley Cheng  2024-02-01  263  
1415683defb2a1 Mathias Nyman 2023-02-06  264  /**
1415683defb2a1 Mathias Nyman 2023-02-06  265   * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
1415683defb2a1 Mathias Nyman 2023-02-06  266   * @sb: sideband instance for this usb device
1415683defb2a1 Mathias Nyman 2023-02-06  267   * @num_seg: number of event ring segments to allocate
1415683defb2a1 Mathias Nyman 2023-02-06  268   * @ip_autoclear: IP autoclearing support such as MSI implemented
1415683defb2a1 Mathias Nyman 2023-02-06  269   *
1415683defb2a1 Mathias Nyman 2023-02-06  270   * Sets up a xhci interrupter that can be used for this sideband accessed usb
1415683defb2a1 Mathias Nyman 2023-02-06  271   * device. Transfer events for this device can be routed to this interrupters
1415683defb2a1 Mathias Nyman 2023-02-06  272   * event ring by setting the 'Interrupter Target' field correctly when queueing
1415683defb2a1 Mathias Nyman 2023-02-06  273   * the transfer TRBs.
1415683defb2a1 Mathias Nyman 2023-02-06  274   * Once this interrupter is created the interrupter target ID can be obtained
1415683defb2a1 Mathias Nyman 2023-02-06  275   * by calling xhci_sideband_interrupter_id()
1415683defb2a1 Mathias Nyman 2023-02-06  276   *
1415683defb2a1 Mathias Nyman 2023-02-06  277   * Returns 0 on success, negative error otherwise
1415683defb2a1 Mathias Nyman 2023-02-06  278   */
1415683defb2a1 Mathias Nyman 2023-02-06  279  int
1415683defb2a1 Mathias Nyman 2023-02-06  280  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
f5a5187f7ea13f Wesley Cheng  2023-05-09  281  				 int intr_num, bool ip_autoclear)
1415683defb2a1 Mathias Nyman 2023-02-06 @282  {
1415683defb2a1 Mathias Nyman 2023-02-06  283  	int ret = 0;
1415683defb2a1 Mathias Nyman 2023-02-06  284  
1415683defb2a1 Mathias Nyman 2023-02-06  285  	if (!sb)
1415683defb2a1 Mathias Nyman 2023-02-06  286  		return -ENODEV;
1415683defb2a1 Mathias Nyman 2023-02-06  287  
1415683defb2a1 Mathias Nyman 2023-02-06  288  	mutex_lock(&sb->mutex);
1415683defb2a1 Mathias Nyman 2023-02-06  289  	if (sb->ir) {
1415683defb2a1 Mathias Nyman 2023-02-06  290  		ret = -EBUSY;
1415683defb2a1 Mathias Nyman 2023-02-06  291  		goto out;
1415683defb2a1 Mathias Nyman 2023-02-06  292  	}
1415683defb2a1 Mathias Nyman 2023-02-06  293  
1415683defb2a1 Mathias Nyman 2023-02-06  294  	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
f5a5187f7ea13f Wesley Cheng  2023-05-09  295  			num_seg, intr_num);
1415683defb2a1 Mathias Nyman 2023-02-06  296  	if (!sb->ir) {
1415683defb2a1 Mathias Nyman 2023-02-06  297  		ret = -ENOMEM;
1415683defb2a1 Mathias Nyman 2023-02-06  298  		goto out;
1415683defb2a1 Mathias Nyman 2023-02-06  299  	}
1415683defb2a1 Mathias Nyman 2023-02-06  300  
1415683defb2a1 Mathias Nyman 2023-02-06  301  	sb->ir->ip_autoclear = ip_autoclear;
fb897bf907b803 Wesley Cheng  2024-02-01  302  	/* skip events for secondary interrupters by default */
fb897bf907b803 Wesley Cheng  2024-02-01  303  	sb->ir->skip_events = true;
1415683defb2a1 Mathias Nyman 2023-02-06  304  
1415683defb2a1 Mathias Nyman 2023-02-06  305  out:
1415683defb2a1 Mathias Nyman 2023-02-06  306  	mutex_unlock(&sb->mutex);
1415683defb2a1 Mathias Nyman 2023-02-06  307  
1415683defb2a1 Mathias Nyman 2023-02-06  308  	return ret;
1415683defb2a1 Mathias Nyman 2023-02-06  309  }
1415683defb2a1 Mathias Nyman 2023-02-06  310  EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
1415683defb2a1 Mathias Nyman 2023-02-06  311  

:::::: The code at line 282 was first introduced by commit
:::::: 1415683defb2a1f23ea70f1038bf6f4ddc715018 FROMLIST: xhci: sideband: add initial api to register a sideband entity

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
