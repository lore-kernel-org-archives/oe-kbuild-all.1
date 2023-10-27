Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4C156C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cpdnk88k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698402385; x=1729938385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z0aZG8X/ZcUClEy6bDLoovqYUnWJp3pwrglbERHR/cw=;
  b=Cpdnk88krnA5dIQWT0DKuxClYeqC8wHOTTujsF+oiemncUeCKcEsXGqA
   hAig/Zf+mEMWVjxTj6C/f8wC9CYNTmRK3YtHLk6ZvkdZvGmDIHRqyehLM
   hD4mvkcDLsTUb8X6PeS/V+3oT4WrBNdNRufvbs7LjCxc97SqYPWE6icw+
   jFUG6Jp7fp4TxjNHhV+29eiq3lHMyX+ZvUJo0fVdVwr3hpg1EVW4XQXi9
   BDsk3SsdLD/mM01hX6mcViOFjHWdFgYSV1CNS4GjE0ZHGkLkkV2+wT19d
   Ht47YkVXkLbKtLDMFSiNk76abNLTBFRB5jlWoGnLYpCfbvrU9batjrpc2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="391624578"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="391624578"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 03:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="759671"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2023 03:25:48 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwK2n-000AjT-1L;
	Fri, 27 Oct 2023 10:26:21 +0000
Date: Fri, 27 Oct 2023 18:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 13548/29903]
 drivers/usb/gadget/function/f_accessory.c:295:23: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202310271828.Xo7v5TtJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   fcdc8d9a71cdda01c736bb52ad5d494e5b0937a3
commit: bb3980554f05c633bc76fd7e4b6d054a85be460d [13548/29903] ANDROID: usb: f_accessory: Avoid bitfields for shared variables
config: x86_64-randconfig-122-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271828.Xo7v5TtJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271828.Xo7v5TtJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271828.Xo7v5TtJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/f_accessory.c:295:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/f_accessory.c:702:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/f_accessory.c:722:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/f_accessory.c:758:23: sparse: sparse: Using plain integer as NULL pointer
>> drivers/usb/gadget/function/f_accessory.c:1408:5: sparse: sparse: symbol 'acc_ctrlrequest_configfs' was not declared. Should it be static?

vim +295 drivers/usb/gadget/function/f_accessory.c

483cb5629ea789 Benoit Goby 2011-12-19  286  
483cb5629ea789 Benoit Goby 2011-12-19  287  /* remove a request from the head of a list */
483cb5629ea789 Benoit Goby 2011-12-19  288  static struct usb_request *req_get(struct acc_dev *dev, struct list_head *head)
483cb5629ea789 Benoit Goby 2011-12-19  289  {
483cb5629ea789 Benoit Goby 2011-12-19  290  	unsigned long flags;
483cb5629ea789 Benoit Goby 2011-12-19  291  	struct usb_request *req;
483cb5629ea789 Benoit Goby 2011-12-19  292  
483cb5629ea789 Benoit Goby 2011-12-19  293  	spin_lock_irqsave(&dev->lock, flags);
483cb5629ea789 Benoit Goby 2011-12-19  294  	if (list_empty(head)) {
483cb5629ea789 Benoit Goby 2011-12-19 @295  		req = 0;
483cb5629ea789 Benoit Goby 2011-12-19  296  	} else {
483cb5629ea789 Benoit Goby 2011-12-19  297  		req = list_first_entry(head, struct usb_request, list);
483cb5629ea789 Benoit Goby 2011-12-19  298  		list_del(&req->list);
483cb5629ea789 Benoit Goby 2011-12-19  299  	}
483cb5629ea789 Benoit Goby 2011-12-19  300  	spin_unlock_irqrestore(&dev->lock, flags);
483cb5629ea789 Benoit Goby 2011-12-19  301  	return req;
483cb5629ea789 Benoit Goby 2011-12-19  302  }
483cb5629ea789 Benoit Goby 2011-12-19  303  

:::::: The code at line 295 was first introduced by commit
:::::: 483cb5629ea7893f94481511e630ae14a5c0d1c0 ANDROID: usb: gadget: f_accessory: Add Android Accessory function

:::::: TO: Benoit Goby <benoit@android.com>
:::::: CC: Todd Kjos <tkjos@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
