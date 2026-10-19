Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457CA490BFC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398583; cv=none; b=aLVuxqT9jkUgwF9bcdZmXsZ3GEuPtD47XwEy3EsdVmIcSE1JCGK3VMQNM/00kEwtGgHfgNv3BcEvGjCua/NUWDrzsKbw7ZCfFEdqpNzbdGWIwgNO4+xpe82928RiWQt3jE60PXk3RtmUm8u3xs0fpq3Q7EpW7I/0QXZGm5Ktz+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398583; c=relaxed/simple;
	bh=ChI+XLOX6GCkfRrKIWIKLPx7GObgh6IX/ZXqBlXILq8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lvBXvQaZfsW07WAf7LHOHVdYvDaWOIQYFbTMdgN6PXcTMZI4xRI+FxsJUTp5kDDtT9vCF3CQvZI3bYorp4WBeWqUPfayKXZZU2wcz/bAS80oqTv8oyii856mwYgdM0s1FRcrxWjbNSD7cUIBnoSRANOtJSfghhatP5pXfEZbOz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/hepEyf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/hepEyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792398583; x=1823934583;
  h=date:from:to:cc:subject:message-id;
  bh=ChI+XLOX6GCkfRrKIWIKLPx7GObgh6IX/ZXqBlXILq8=;
  b=B/hepEyf7dy5G+5c0E1acaYZ4SOO01jOoMi7jneklmReuCFf5lnr6Ww8
   SQRcUVHMJqvuKZTTJJuqnpYTKa8NrOvgorVUX54GXHw25AyEEKa34el0e
   fFcOIoB7sz69AmwjQ/GqQkXEEpNFM11MytSwXeN1U+UVxSgBapFGZRN82
   XWyqAJVFzjmMZRvMiJQOJ3anNTkNyET4M7V5/7HTBNzpmreeBZ2ns9xKs
   67AwrNfBrOVFlOY1LZP4M2y6an3sNdTQvV92r4LGBMySue+f5qaTAGp5m
   boPhsKFZWx+qE5LbnosUXmybRTj+jCOwtwxcSr8HI7ZJIVz5ScLLE24u2
   g==;
X-CSE-ConnectionGUID: itEbWXSKQsGqy0bvUa3DDw==
X-CSE-MsgGUID: 8JJ0xfsjTFC+/vwA4vaKNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1178074"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1178074"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:29:42 -0700
X-CSE-ConnectionGUID: sPvkl7Q6TQOzmHt1XeVMoQ==
X-CSE-MsgGUID: b1XKMoubQUCiYpgaO9PFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2899872"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2026 01:29:41 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIikU-000000005YF-2i1p;
	Mon, 19 Oct 2026 08:29:38 +0000
Date: Mon, 19 Oct 2026 10:29:33 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/usb/host/xhci-sideband.c:282: warning: Function parameter or member
 'intr_num' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202610191020.B0c6CeKX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wesley,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   150617c4d667a241e52441e855befac0c5d6702b
commit: f5a5187f7ea13f11dee77d4bd6ab2d4e367cd153 [1/1] FROMLIST: usb: host: xhci-mem: Allow for interrupter clients to choose specific index
config: x86_64-randconfig-2001-20261018 (https://download.01.org/0day-ci/archive/20261019/202610191020.B0c6CeKX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191020.B0c6CeKX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191020.B0c6CeKX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-sideband.c:282: warning: Function parameter or member 'intr_num' not described in 'xhci_sideband_create_interrupter'


vim +282 drivers/usb/host/xhci-sideband.c

fb897bf907b8037 Wesley Cheng  2024-02-01  263  
1415683defb2a1f Mathias Nyman 2023-02-06  264  /**
1415683defb2a1f Mathias Nyman 2023-02-06  265   * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
1415683defb2a1f Mathias Nyman 2023-02-06  266   * @sb: sideband instance for this usb device
1415683defb2a1f Mathias Nyman 2023-02-06  267   * @num_seg: number of event ring segments to allocate
1415683defb2a1f Mathias Nyman 2023-02-06  268   * @ip_autoclear: IP autoclearing support such as MSI implemented
1415683defb2a1f Mathias Nyman 2023-02-06  269   *
1415683defb2a1f Mathias Nyman 2023-02-06  270   * Sets up a xhci interrupter that can be used for this sideband accessed usb
1415683defb2a1f Mathias Nyman 2023-02-06  271   * device. Transfer events for this device can be routed to this interrupters
1415683defb2a1f Mathias Nyman 2023-02-06  272   * event ring by setting the 'Interrupter Target' field correctly when queueing
1415683defb2a1f Mathias Nyman 2023-02-06  273   * the transfer TRBs.
1415683defb2a1f Mathias Nyman 2023-02-06  274   * Once this interrupter is created the interrupter target ID can be obtained
1415683defb2a1f Mathias Nyman 2023-02-06  275   * by calling xhci_sideband_interrupter_id()
1415683defb2a1f Mathias Nyman 2023-02-06  276   *
1415683defb2a1f Mathias Nyman 2023-02-06  277   * Returns 0 on success, negative error otherwise
1415683defb2a1f Mathias Nyman 2023-02-06  278   */
1415683defb2a1f Mathias Nyman 2023-02-06  279  int
1415683defb2a1f Mathias Nyman 2023-02-06  280  xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
f5a5187f7ea13f1 Wesley Cheng  2023-05-09  281  				 int intr_num, bool ip_autoclear)
1415683defb2a1f Mathias Nyman 2023-02-06 @282  {
1415683defb2a1f Mathias Nyman 2023-02-06  283  	int ret = 0;
1415683defb2a1f Mathias Nyman 2023-02-06  284  
1415683defb2a1f Mathias Nyman 2023-02-06  285  	if (!sb)
1415683defb2a1f Mathias Nyman 2023-02-06  286  		return -ENODEV;
1415683defb2a1f Mathias Nyman 2023-02-06  287  
1415683defb2a1f Mathias Nyman 2023-02-06  288  	mutex_lock(&sb->mutex);
1415683defb2a1f Mathias Nyman 2023-02-06  289  	if (sb->ir) {
1415683defb2a1f Mathias Nyman 2023-02-06  290  		ret = -EBUSY;
1415683defb2a1f Mathias Nyman 2023-02-06  291  		goto out;
1415683defb2a1f Mathias Nyman 2023-02-06  292  	}
1415683defb2a1f Mathias Nyman 2023-02-06  293  
1415683defb2a1f Mathias Nyman 2023-02-06  294  	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
f5a5187f7ea13f1 Wesley Cheng  2023-05-09  295  			num_seg, intr_num);
1415683defb2a1f Mathias Nyman 2023-02-06  296  	if (!sb->ir) {
1415683defb2a1f Mathias Nyman 2023-02-06  297  		ret = -ENOMEM;
1415683defb2a1f Mathias Nyman 2023-02-06  298  		goto out;
1415683defb2a1f Mathias Nyman 2023-02-06  299  	}
1415683defb2a1f Mathias Nyman 2023-02-06  300  
1415683defb2a1f Mathias Nyman 2023-02-06  301  	sb->ir->ip_autoclear = ip_autoclear;
fb897bf907b8037 Wesley Cheng  2024-02-01  302  	/* skip events for secondary interrupters by default */
fb897bf907b8037 Wesley Cheng  2024-02-01  303  	sb->ir->skip_events = true;
1415683defb2a1f Mathias Nyman 2023-02-06  304  
1415683defb2a1f Mathias Nyman 2023-02-06  305  out:
1415683defb2a1f Mathias Nyman 2023-02-06  306  	mutex_unlock(&sb->mutex);
1415683defb2a1f Mathias Nyman 2023-02-06  307  
1415683defb2a1f Mathias Nyman 2023-02-06  308  	return ret;
1415683defb2a1f Mathias Nyman 2023-02-06  309  }
1415683defb2a1f Mathias Nyman 2023-02-06  310  EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
1415683defb2a1f Mathias Nyman 2023-02-06  311  

:::::: The code at line 282 was first introduced by commit
:::::: 1415683defb2a1f23ea70f1038bf6f4ddc715018 FROMLIST: xhci: sideband: add initial api to register a sideband entity

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
