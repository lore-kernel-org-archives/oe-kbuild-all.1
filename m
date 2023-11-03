Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9C23DD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVM2xUVO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699001609; x=1730537609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tWFjdkDfi8mzEaen8xJONPq5DwjxosM/XJNco+u4/BE=;
  b=DVM2xUVOZh4hld8WQb8ZAeJeVZLzBd9GdtO+gNaEgqtd+Gu2QVrpyM57
   viqeDhjhemM2dEzHlz5e3utbYwZ6yz0gB690dBlCos2exYIXanisz0651
   kzCMadMtHtF/R4gXpX7Q6K/7m3y4pJdoiZ3OT8ZVZ7MIrm8kuZNhtpLVI
   ypuNXjWsg4p9SmZc5NsN92ceho6rkJG3yLuX6bvcaiBkmMMeguX60LVBb
   z+7VqJArB0PJKJJ9or69JKjlRgc9ku3kSX7xY+Tavf8/phfPxon+0RlET
   QHb/UREGOMZoKWKPxZrxJWY1zmapX+yJzU+9MSepXcbjdUcLIR+kty3fY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="455396667"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="455396667"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 01:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="761551523"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="761551523"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Nov 2023 01:53:27 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qypvh-0002ON-1l;
	Fri, 03 Nov 2023 08:53:25 +0000
Date: Fri, 3 Nov 2023 16:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/2]
 drivers/usb/gadget/udc/core.c:56: warning: Function parameter or member
 'connect_lock' not described in 'DEFINE_MUTEX'
Message-ID: <202311031613.pxoCyik1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2fea3eca9608d8c14fb6963bfe830dfa5985d7de
commit: af9ff24a2317f5e4ab02559f54107926289c5a20 [1/2] BACKPORT: FROMGIT: usb: gadget: udc: core: Invoke usb_gadget_connect only when started
config: x86_64-buildonly-randconfig-004-20231101 (https://download.01.org/0day-ci/archive/20231103/202311031613.pxoCyik1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031613.pxoCyik1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031613.pxoCyik1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/udc/core.c:56: warning: Function parameter or member 'connect_lock' not described in 'DEFINE_MUTEX'


vim +56 drivers/usb/gadget/udc/core.c

    45	
    46	static struct class *udc_class;
    47	static LIST_HEAD(udc_list);
    48	static LIST_HEAD(gadget_driver_pending_list);
    49	static DEFINE_MUTEX(udc_lock);
    50	/**
    51	 * protects udc->vbus, udc->started, gadget->connect, gadget->deactivate related
    52	 * functions. usb_gadget_connect_locked, usb_gadget_disconnect_locked,
    53	 * usb_udc_connect_control_locked, usb_gadget_udc_start_locked, usb_gadget_udc_stop_locked are
    54	 * called with this lock held.
    55	 */
  > 56	static DEFINE_MUTEX(connect_lock);
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
