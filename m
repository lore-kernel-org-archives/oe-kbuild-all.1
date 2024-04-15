Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D56823B5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 17:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713202805; cv=none; b=Oex6Zx2HqZ2WqewWZRKdenUWxmZVRkG6YjHWzler1W2EJVVmKSswgnrCBDdkWn2bsUZyAMiOz6yAqjDaRCqaP8CmW2j6taQZpAZOPYKC7p+n5fMp+iXK5oHqqwmTUsGxKaAoRjtpUEra+dLwnpyAI7efPpw5A0+oVhswZu4Bxvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713202805; c=relaxed/simple;
	bh=9brDYzIaqsYtsH5wcsvPK8aOUxc3LchuZWauGBRjhuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1U7GhZ6NZ5cTI2U/gQFe+voKz/DG5d1bE6B8V+qZ79c74KCEnoPZwDrKct8XEvbHiSvGG+Bt/ZgeqVyGOjMxK+uVKn3Ypbxs4TvWO/cuQnHsJCKcu+3Tu1KFzc7QjhkqkA9ynwN31BE1IWW3N2pUUNG1X0tKgTaT4pc4VtJr0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WAPYG6oB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WAPYG6oB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713202803; x=1744738803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9brDYzIaqsYtsH5wcsvPK8aOUxc3LchuZWauGBRjhuY=;
  b=WAPYG6oBQzdjsBtZx6qjmcVQ3BdS49vR/LhcLVUqpD3UMyXzQzfZgDsg
   DvH8eZHntnf6RzifRVWo3K2JNbAwhPQoFL1JVxrknCdYfm8YDakPF5gjj
   cmOEK3Kdyq1T0sqZ6xoHtrYriTYVQTzV3ngovhWRw7iOa/flJIQUsqgRr
   nQYghKZxkD+w4l9h8FnGsaSm2p1u84G27zeHbg3zZPw/dxMTPwm6RtQLY
   Tzsi/Rjp1094lhMXWpgmItJxZ+HyJ5xOj3OkMPnH4K6HflJr5aDpwQlyS
   o+Nbu3hvtDGFP7I5ZIv14wlZbPQJ4SpgpH7qaePkR3eofQ6FbsoGeNQ5p
   Q==;
X-CSE-ConnectionGUID: 5jm2HjRATsKwD/ATfJDT6w==
X-CSE-MsgGUID: BLV9DltETuC51rOZvwDe1Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8441978"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8441978"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 10:40:03 -0700
X-CSE-ConnectionGUID: VUZxhcNMSc2bufoId8F+8Q==
X-CSE-MsgGUID: fbOBHntyQpaysZEUKL2G8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="59427380"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Apr 2024 10:40:02 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwQJC-0004RI-30;
	Mon, 15 Apr 2024 17:39:59 +0000
Date: Tue, 16 Apr 2024 01:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 29/30]
 drivers/usb/gadget/function/android_f_accessory.c:353:23: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202404160148.ddwNDc34-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   bc8dccf0e351f8b1f462250dab685ada42c9463d
commit: 9b03ed2feb9c4cc3f15d44eda080caabb3a6b843 [29/30] ANDROID: usb: gadget: Add Android Accessory Function
config: x86_64-randconfig-121-20240416 (https://download.01.org/0day-ci/archive/20240416/202404160148.ddwNDc34-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160148.ddwNDc34-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160148.ddwNDc34-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/android_f_accessory.c:353:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:786:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:798:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:840:23: sparse: sparse: Using plain integer as NULL pointer
>> drivers/usb/gadget/function/android_f_accessory.c:1392:6: sparse: sparse: symbol '__acc_req_match' was not declared. Should it be static?

vim +353 drivers/usb/gadget/function/android_f_accessory.c

   344	
   345	/* remove a request from the head of a list */
   346	static struct usb_request *req_get(struct acc_dev *dev, struct list_head *head)
   347	{
   348		unsigned long flags;
   349		struct usb_request *req;
   350	
   351		spin_lock_irqsave(&dev->lock, flags);
   352		if (list_empty(head)) {
 > 353			req = 0;
   354		} else {
   355			req = list_first_entry(head, struct usb_request, list);
   356			list_del(&req->list);
   357		}
   358		spin_unlock_irqrestore(&dev->lock, flags);
   359		return req;
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
