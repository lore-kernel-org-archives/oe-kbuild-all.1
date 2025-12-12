Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD14189F43
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765524098; cv=none; b=NhKFsuARIYsmoakYCJSPRlYARF8BtD5VGMn4Ko/qKsmKGxfhlyaiZzeM+OiPwxMCZkva8oQIvTkrVZ3CKqjx0lROc+1eREM7QRs432AcDk2OSGfHIT+ew/LOFzANZTj8fa3BMrge5j0EqGXK2ccS3+/FkL2zKhm1btMWyeMrrVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765524098; c=relaxed/simple;
	bh=7Tg3ym6EMitFPZvkBKmUhTbLO0vx/Y6MNVRCGTXqkVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d2d6o3OoB3fJBCrmVLR3EzITfM2JtjH5EaQLTfCqBugpsfzWCbPQ4BUGUCzW/Drc6YgiXx7VaBs2F30RX79TPeenQaAXsuOvIw5gAfCU+sVO6sSQm+pAReM0eYoixySy8P9dc+DAtayGvUj1uAtzlyjxnST8A6oltH+b1IXLGEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4oWY7m8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4oWY7m8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765524096; x=1797060096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Tg3ym6EMitFPZvkBKmUhTbLO0vx/Y6MNVRCGTXqkVY=;
  b=N4oWY7m8Ob7NWfrLhAzus01HYNfIAcglOKgJuiw07ovbiPf8qKWLFoib
   y7eDAtcktH7jUlL4JGRm1GnkdZk7xMvfN+Gwx3Hyqtev3VWaAOMj2J1ol
   hTcjmLzamr7SfTGLAdmctNx5FTGgl+AXrA7LrgMyGxIJ+JWHjxUuRVSHv
   Szui5OC7cUpfeg6MBqZ4RCqB9h6uUCvcefbAuPj+uMsJZn195HKEfUnB2
   16SXNnd7K3btBcEuhTYOm50jqkO0l/EUKQ54x9XoBUYeywJ+dhxX8AM8N
   R5iZjDEyMyTv/EnwzT8TAgEz8HI327Lz5tqdPSlx8+0cMWYccXHmS9Sr+
   g==;
X-CSE-ConnectionGUID: F5o2u0nLQd23SYn+ldDvyA==
X-CSE-MsgGUID: GEQXTv5ATKSQjRlFVt18hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67251578"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67251578"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 23:21:36 -0800
X-CSE-ConnectionGUID: M3F4QlwKRbia1h7kdBx+TA==
X-CSE-MsgGUID: DYI9Zy4xRpeq4kZxfYzViQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="201487468"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Dec 2025 23:21:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTxT2-000000005iz-3Hrb;
	Fri, 12 Dec 2025 07:21:32 +0000
Date: Fri, 12 Dec 2025 15:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/40]
 drivers/usb/host/xhci-mem.c:68:6: warning: no previous prototype for
 'xhci_segment_free'
Message-ID: <202512121524.YD9TBeaH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Howard,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   dd79c421671d7417fa9ad8465ca823298cd5fa14
commit: 6496f6cfbbd3bf241c6f16c7621db32088a1f073 [0/40] ANDROID: usb: host: export symbols for xhci hooks usage
config: i386-randconfig-052-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121524.YD9TBeaH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121524.YD9TBeaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121524.YD9TBeaH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-mem.c:68:6: warning: no previous prototype for 'xhci_segment_free' [-Wmissing-prototypes]
      68 | void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
         |      ^~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:79:6: warning: no previous prototype for 'xhci_free_segments_for_ring' [-Wmissing-prototypes]
      79 | void xhci_free_segments_for_ring(struct xhci_hcd *xhci,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:100:6: warning: no previous prototype for 'xhci_link_segments' [-Wmissing-prototypes]
     100 | void xhci_link_segments(struct xhci_segment *prev,
         |      ^~~~~~~~~~~~~~~~~~
   drivers/usb/host/xhci-mem.c:2075:5: warning: no previous prototype for 'xhci_check_trb_in_td_math' [-Wmissing-prototypes]
    2075 | int xhci_check_trb_in_td_math(struct xhci_hcd *xhci)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xhci_segment_free +68 drivers/usb/host/xhci-mem.c

    67	
  > 68	void xhci_segment_free(struct xhci_hcd *xhci, struct xhci_segment *seg)
    69	{
    70		if (seg->trbs) {
    71			dma_pool_free(xhci->segment_pool, seg->trbs, seg->dma);
    72			seg->trbs = NULL;
    73		}
    74		kfree(seg->bounce_buf);
    75		kfree(seg);
    76	}
    77	EXPORT_SYMBOL_GPL(xhci_segment_free);
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
