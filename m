Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BAD1D016D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 17:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726335436; cv=none; b=Xrm/hlAbCthBYIzg1KxI3fHfPs7pmFyKFKULosR1FEHP+Aihj71V8JTNQUbEdnFX+QxWmiX8WW/HT4XmCVkhRzfpSeiVnwAPbjOubtBVsvk2RhYsba6eQ0Kfiwmjuzr+EgI0PonyIyxJcE/lv1aXQBjcOKxFJLwdMMn9a651JQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726335436; c=relaxed/simple;
	bh=tQepsSFds9tkIKsX2klhF6tRQeyDy2Z/IJ2EJAwkRhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VfTCP61g0qgU4uevgSy32p5uhPMg07IRoszdOM1u4n0IYbDlmME91/8bxnJjqq75viHu867GEoB2/hcCjOsMrcSxUo4ozAIurBUfGK1mjm05WmmJy+CZXD0iUNNubSTeKFts9QTUxoiWCYkYCKRDKg6jGowrHrZR+Nhj7RasLKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUTbEi4q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUTbEi4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726335435; x=1757871435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQepsSFds9tkIKsX2klhF6tRQeyDy2Z/IJ2EJAwkRhA=;
  b=lUTbEi4qYMEZShbcSINtiWQqailK3mjnuENQtSpRpTbNVQ7TduMl5f4j
   Sd20QX76RQvEoOqiRgwDwoGSZ+ia33cBWS4z7I3jPBsweoAyYtGY+ENrz
   7pDrNRtFpgLVJGI5sb4kSdCyVbPvhlV9uNkn1787pgtaNdSNfQbDGnHkc
   w9CnV2mqnw6/O9MmbQ8UD1hAWVQ2aGDDnZLj4kT7VtPy/EZEBooX6esgh
   ilaIOo5BaMGKnBHreidw7Sn96USNKFyDlXHtW7homJ2folkMTP1Nwev+v
   HGahNJnivu8UvA22/p3OYr+Va+QMAbqOG5GDYiYXAUjY2twwL/wom8DCR
   A==;
X-CSE-ConnectionGUID: 6tV2vQ8CQyucheFrntESeA==
X-CSE-MsgGUID: 6mqq1SC+SqmkDo3+8U44eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="29118807"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="29118807"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 10:37:14 -0700
X-CSE-ConnectionGUID: O9XI3Na8SfCpGIXXHa9vrw==
X-CSE-MsgGUID: lXIOcvOoR7+g+QLIp80sdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="68392876"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Sep 2024 10:37:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spWhq-000816-20;
	Sat, 14 Sep 2024 17:37:10 +0000
Date: Sun, 15 Sep 2024 01:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-partner_predev 10096/13796]
 drivers/usb/gadget/function/android_f_accessory.c:353:23: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202409150108.HnmnK9ju-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   9b5dbabe32a282b68d3599efbbccd7ff6996d9c2
commit: 8851a623b7a1a9456fc1e66855ad369c3f7f6483 [10096/13796] ANDROID: usb: gadget: Add Android Accessory Function
config: arm-randconfig-r121-20240914 (https://download.01.org/0day-ci/archive/20240915/202409150108.HnmnK9ju-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240915/202409150108.HnmnK9ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150108.HnmnK9ju-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/android_f_accessory.c:353:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:786:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:798:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:840:23: sparse: sparse: Using plain integer as NULL pointer
>> drivers/usb/gadget/function/android_f_accessory.c:1392:6: sparse: sparse: symbol '__acc_req_match' was not declared. Should it be static?
   drivers/usb/gadget/function/android_f_accessory.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

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
